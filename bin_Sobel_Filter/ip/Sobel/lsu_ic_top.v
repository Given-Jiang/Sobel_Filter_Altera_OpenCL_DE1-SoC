// This is the top level of token ring interconnect for global memory access.
// It has two modes: default (with data reordering block) and sw-dimm-partition (without data reordering; slow switch between banks).

module lsu_ic_top (
  clk,
  resetn,
  // from LSUs
  i_rd_byteenable,
  i_rd_address, 
  i_rd_request,          
  i_rd_burstcount,  
  i_wr_byteenable,
  i_wr_address, 
  i_wr_request,          
  i_wr_burstcount,
  i_wr_writedata,  
  // from MEM
  i_avm_waitrequest,
  i_avm_readdata, 
  i_avm_readdatavalid,        
  // to MEM                
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  // to LSUs
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_readdata,
  o_avm_readdatavalid,
  o_avm_writeack
);


parameter  AWIDTH = 32;                        // memory address width     
parameter  SHIFT = 10;                         // for address permutation 
parameter  ENABLE_PERMUTE = 1;                 // enable address permutation
parameter  MWIDTH_BYTES = 64;                  // memory bus width 
parameter  BURST_CNT_W = 5;                    // max burst number width
parameter  NUM_RD_PORT = 2;                    // number of read ports
parameter  NUM_WR_PORT = 2;                    // number of write ports
parameter  NUM_DIMM = 1;                       // number of physical banks
parameter  RETURN_DATA_FIFO_DEPTH = 512;       // data reordering FIFO depth per bank
// parameter MAX_MEM_DELAY is used as Read ID/burstcount FIFO depth, to generate o_avm_readdatavalid
// Almost-full threshold is set to (MAX_MEM_DELAY - NUM_RD_PORT*2-5); stall is generated to read ring when the threshold is hit
// It selects (NUM_RD_PORT*2+6) as depth when this number is greater than 512, to gurantee a positive Almost-full threshold
parameter  MAX_MEM_DELAY = ((NUM_RD_PORT*2+6) > 512)? (NUM_RD_PORT*2+6) : 512;  
parameter  ENABLE_REORDER = 0;                 // set it to 0 in SW_DIMM_PARTITION mode
parameter  DISABLE_ROOT_FIFO = 0;              // disable root fifo if token ring's root FIFO is merged in iface
parameter  ENABLE_READ_FAST = NUM_RD_PORT<10;  // if set to 1, read latency is decreased, lower Fmax
parameter  ENABLE_DUAL_RING = 1;
parameter  ENABLE_MULTIPLE_WR_RING = 0;        // enable N write rings; N == number of banks
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;   // number of LSUs 
parameter  ROOT_FIFO_DEPTH = 512;              // Token root FIFO depth
parameter  NUM_REORDER = 1;                    // Number of reordering blocks for burst interleaved mode
parameter  DEVICE =  "Stratix V";              // Device name
parameter  ENABLE_LAST_WAIT = 0;               // A temperary fix for global const_cache, which needs avm_waitrequest == 0 to send load request in some cases
localparam RD_ROOT_FIFO_DEPTH = MAX_MEM_DELAY; // Read only root FIFO depth
localparam MWIDTH=8*MWIDTH_BYTES;
localparam ID_WIDTH = $clog2(NUM_ID);
localparam NUM_DIMM_W = $clog2(NUM_DIMM);         
localparam MAX_BURST = 2 ** (BURST_CNT_W-1);
localparam ROOT_FIFO_AW = (ROOT_FIFO_DEPTH >= (5+NUM_WR_PORT*2+MAX_BURST))? $clog2(ROOT_FIFO_DEPTH) : $clog2(5+NUM_WR_PORT*2+MAX_BURST); 
localparam ROOT_RD_FIFO_AW = $clog2(RD_ROOT_FIFO_DEPTH); 
localparam LOG2BYTES = $clog2(MWIDTH_BYTES);
localparam PAGE_ADDR_WIDTH = AWIDTH - LOG2BYTES;

// avoid modelsim compile error
localparam P_NUM_RD_PORT   = (NUM_RD_PORT > 0)?   NUM_RD_PORT   : 1;   
localparam P_NUM_WR_PORT   = (NUM_WR_PORT > 0)?   NUM_WR_PORT   : 1;   

input  clk;
input  resetn;
// from LSU
input  [MWIDTH_BYTES-1:0] i_rd_byteenable [P_NUM_RD_PORT];
input  [AWIDTH-1:0] i_rd_address [P_NUM_RD_PORT]; 
input  i_rd_request [P_NUM_RD_PORT];          
input  [BURST_CNT_W-1:0] i_rd_burstcount [P_NUM_RD_PORT];  
input  [MWIDTH_BYTES-1:0] i_wr_byteenable [P_NUM_WR_PORT]; 
input  [AWIDTH-1:0] i_wr_address [P_NUM_WR_PORT];
input  i_wr_request [P_NUM_WR_PORT];         
input  [BURST_CNT_W-1:0] i_wr_burstcount [P_NUM_WR_PORT];
input  [MWIDTH-1:0] i_wr_writedata [P_NUM_WR_PORT];
// from MEM
input  i_avm_waitrequest [NUM_DIMM];             
input  [MWIDTH-1:0] i_avm_readdata [NUM_DIMM];            
input  i_avm_readdatavalid [NUM_DIMM];                   
// to MEM                
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-NUM_DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
// to LSU
output  o_rd_waitrequest [P_NUM_RD_PORT]; 
output  o_wr_waitrequest [P_NUM_WR_PORT]; 
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 
output  logic o_avm_writeack [P_NUM_WR_PORT];

integer i, j;
genvar z;
wire[ID_WIDTH-1:0] o_id [NUM_DIMM];
wire [PAGE_ADDR_WIDTH-1:0] ci_avm_rd_addr [P_NUM_RD_PORT];
wire [PAGE_ADDR_WIDTH-1:0] ci_avm_wr_addr [P_NUM_WR_PORT];
wire [PAGE_ADDR_WIDTH-NUM_DIMM_W-1:0] co_avm_address [NUM_DIMM];


// help timing; reduce the high fanout of global reset from iface
reg [1:0]     sync_rst_MS /* synthesis syn_preserve = 1 */ ;
wire          sync_rst;
assign sync_rst = sync_rst_MS[1];

always @(posedge clk or negedge resetn) begin
  if(!resetn) sync_rst_MS <= 2'b11;
  else sync_rst_MS <= {sync_rst_MS[0], 1'b0};
end

`ifdef GEN_ACCESS_CNT        
  // This part is used to trace the number of requests received from LSUs and sent to global memory
  // for simulation or signalTap mem access analysis
  // add /* synthesis syn_noprune syn_preserve = 1 */ for signalTap
  logic [31:0] i_receive_cnt [NUM_ID]; // num of requests received from LSUs
  logic [31:0] o_return_to_lsu_cnt [NUM_ID]; // returned to LSUs
  logic [8:0]  err_cnt_lsu [NUM_ID];
  logic [0:NUM_ID-1] err_lsu;  
  logic [31:0] o_rd_to_mem_cnt, i_return_cnt; 
  logic [8:0] err_cnt_global;  
  logic [31:0] sum_receive [NUM_RD_PORT];
  logic [31:0] sum_return [NUM_RD_PORT];

    
  debug_io_cnt #(.WIDTH(6)) globl_mem_io_checker (        
    .rst(!resetn),
    .clk(clk),
    .i_0(((o_avm_read[0] & !i_avm_waitrequest[0])? o_avm_burstcount[0] : 0) + ((o_avm_read[1] & !i_avm_waitrequest[1])? o_avm_burstcount[1] : 0)),
    .i_1(i_avm_readdatavalid[0] + i_avm_readdatavalid[1] + 6'd0),
    .o_cnt_0(o_rd_to_mem_cnt),
    .o_cnt_1(i_return_cnt),
    .o_mismatch_cnt(err_cnt_global)
  );            
  generate

    always @(posedge clk) begin
      for(i=0; i<NUM_ID; i=i+1) err_lsu[i] <= |err_cnt_lsu[i];
    end

    for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_LSU_IO_CNT
      assign sum_receive[z] = (z==0)? i_receive_cnt[0] : i_receive_cnt[z] + sum_receive[z-1];
      assign sum_return[z]  = (z==0)? o_return_to_lsu_cnt[0] : o_return_to_lsu_cnt[z] + sum_return[z-1];
      
      debug_io_cnt #(.WIDTH(6)) lsu_io_checker (        
        .rst(!resetn),
        .clk(clk),
        .i_0(((i_rd_request[z] & !o_rd_waitrequest[z])? i_rd_burstcount[z] : 0)),
        .i_1(o_avm_readdatavalid[z] + 0),
        .o_cnt_0(i_receive_cnt[z]),
        .o_cnt_1(o_return_to_lsu_cnt[z]),
        .o_mismatch_cnt(err_cnt_lsu[z])
      );    
    end  
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : GEN_WR_LSU_IO_CNT
      debug_io_cnt #(.WIDTH(6)) lsu_io_checker (        
        .rst(!resetn),
        .clk(clk),
        .i_0((i_wr_request[z] & !o_wr_waitrequest[z]) + 6'd0),
        .i_1(o_avm_writeack[z] + 6'd0),
        .o_cnt_0(i_receive_cnt[z+NUM_RD_PORT]),
        .o_cnt_1(o_return_to_lsu_cnt[z+NUM_RD_PORT]),
        .o_mismatch_cnt(err_cnt_lsu[z+NUM_RD_PORT])
      );    
    end    
  endgenerate
`endif


generate
  if(ENABLE_PERMUTE && ENABLE_REORDER && NUM_DIMM > 1) begin : GEN_ENABLE_ADDR_PERMUTE
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : PERMUTE_RD_ADDR
      assign ci_avm_rd_addr[z] = {i_rd_address[z][SHIFT], i_rd_address[z][AWIDTH-1:SHIFT+1], i_rd_address[z][SHIFT-1:LOG2BYTES]};
    end
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : PERMUTE_WR_ADDR
      assign ci_avm_wr_addr[z] = {i_wr_address[z][SHIFT], i_wr_address[z][AWIDTH-1:SHIFT+1], i_wr_address[z][SHIFT-1:LOG2BYTES]};    
    end
  end
  else begin : GEN_DISABLE_ADDR_PERMUTE
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : PERMUTE_RD_ADDR
      assign ci_avm_rd_addr[z] = i_rd_address[z][AWIDTH-1:LOG2BYTES];
    end
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : PERMUTE_WR_ADDR
      assign ci_avm_wr_addr[z] = i_wr_address[z][AWIDTH-1:LOG2BYTES];
    end
  end
  for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_PAD_O_ADDR
    assign o_avm_address[z] = {co_avm_address[z], {LOG2BYTES{1'b0}}};
  end  
  if(ENABLE_REORDER == 0 && NUM_DIMM > 1) begin : GEN_SW_DIMM         
    lsu_swdimm_token_ring #(
      .AWIDTH(PAGE_ADDR_WIDTH),        
      .MWIDTH_BYTES(MWIDTH_BYTES),      
      .BURST_CNT_W (BURST_CNT_W),       
      .NUM_RD_PORT(NUM_RD_PORT), 
      .NUM_WR_PORT(NUM_WR_PORT), 
      .MAX_MEM_DELAY(MAX_MEM_DELAY),
      .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO),
      .ENABLE_READ_FAST(ENABLE_READ_FAST),
      .NUM_DIMM(NUM_DIMM),       
      .ROOT_FIFO_AW(ROOT_FIFO_AW),
      .RD_ROOT_FIFO_AW(ROOT_RD_FIFO_AW),
      .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
      .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
      .ENABLE_DUAL_RING(1),
      .DEVICE(DEVICE)
    )lsu_ic (
      .clk                (clk                ),
      .reset              (sync_rst           ),
      .i_rd_byteenable    (i_rd_byteenable    ),
      .i_rd_address       (ci_avm_rd_addr     ),
      .i_rd_request       (i_rd_request       ),
      .i_rd_burstcount    (i_rd_burstcount    ),
      .i_wr_byteenable    (i_wr_byteenable    ),
      .i_wr_address       (ci_avm_wr_addr     ),
      .i_wr_request       (i_wr_request       ),
      .i_wr_burstcount    (i_wr_burstcount    ),
      .i_wr_writedata     (i_wr_writedata     ),
      .i_avm_waitrequest  (i_avm_waitrequest  ),
      .i_avm_readdata     (i_avm_readdata     ),
      .i_avm_return_valid (i_avm_readdatavalid),   
      .o_id               (o_id),
      .o_avm_byteenable   (o_avm_byteenable   ),
      .o_avm_address      (co_avm_address     ),
      .o_avm_read         (o_avm_read         ),
      .o_avm_write        (o_avm_write        ),
      .o_avm_burstcount   (o_avm_burstcount   ),
      .o_avm_writedata    (o_avm_writedata    ),
      .o_rd_waitrequest   (o_rd_waitrequest   ),
      .o_wr_waitrequest   (o_wr_waitrequest   ),
      .o_avm_readdata     (o_avm_readdata     ),
      .o_avm_readdatavalid(o_avm_readdatavalid),
      .o_avm_writeack     (o_avm_writeack     )
    );   
  end
  else begin : GEN_SIMPLE    
    lsu_token_ring #(
      .AWIDTH(PAGE_ADDR_WIDTH),        
      .MWIDTH_BYTES(MWIDTH_BYTES),      
      .BURST_CNT_W (BURST_CNT_W),       
      .NUM_RD_PORT(NUM_RD_PORT), 
      .NUM_WR_PORT(NUM_WR_PORT), 
      .NUM_DIMM(NUM_DIMM),     
      .RETURN_DATA_FIFO_DEPTH(RETURN_DATA_FIFO_DEPTH),
      .PIPELINE_RD_RETURN(0),  
      .MAX_MEM_DELAY(MAX_MEM_DELAY),    
      .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
      .ENABLE_READ_FAST(ENABLE_READ_FAST),
      .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO),
      .ROOT_FIFO_AW(ROOT_FIFO_AW),  
      .RD_ROOT_FIFO_AW(ROOT_RD_FIFO_AW),
      .ENABLE_DATA_REORDER(ENABLE_REORDER),
      .NUM_REORDER(NUM_REORDER),
      .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
      .ENABLE_DUAL_RING(1),
      .DEVICE(DEVICE)
    )lsu_ic (
      .clk                (clk                ),
      .reset              (sync_rst           ),
      .i_rd_byteenable    (i_rd_byteenable    ),
      .i_rd_address       (ci_avm_rd_addr     ),
      .i_rd_request       (i_rd_request       ),
      .i_rd_burstcount    (i_rd_burstcount    ),
      .i_wr_byteenable    (i_wr_byteenable    ),
      .i_wr_address       (ci_avm_wr_addr     ),
      .i_wr_request       (i_wr_request       ),
      .i_wr_burstcount    (i_wr_burstcount    ),
      .i_wr_writedata     (i_wr_writedata     ),
      .i_avm_waitrequest  (i_avm_waitrequest  ),
      .i_avm_readdata     (i_avm_readdata     ),
      .i_avm_return_valid (i_avm_readdatavalid),       
      .o_avm_byteenable   (o_avm_byteenable   ),
      .o_avm_address      (co_avm_address     ),
      .o_avm_read         (o_avm_read         ),
      .o_avm_write        (o_avm_write        ),
      .o_avm_burstcount   (o_avm_burstcount   ),
      .o_avm_writedata    (o_avm_writedata    ),
      .o_rd_waitrequest   (o_rd_waitrequest   ),
      .o_wr_waitrequest   (o_wr_waitrequest   ),
      .o_avm_readdata     (o_avm_readdata     ),
      .o_avm_readdatavalid(o_avm_readdatavalid),
      .o_avm_writeack     (o_avm_writeack     )
    );   
  end  
endgenerate
endmodule

// This is a basic block in token ring. It has two sets of input signals: one set is from a LSU; and the other is from the previous lsu_ic_token it connects to.
// The output is registered. It selects the input based on if it owns token. 
// Token is passed to the next lsu_ic_token block if it owns th token and the LSU it serves has no active request.  

module lsu_ic_token (
  clk,
  reset,
  i_token,
  i_id,  
  i_avm_waitrequest, // backpressure from root FIFO
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,  
  i_avm_write,
  i_avm_burstcount,
  o_avm_waitrequest_0, 
  o_avm_waitrequest_1,
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,
  o_avm_write,
  o_avm_burstcount,
  o_id,
  o_index,
  o_token,
  o_active,
  // write
  i_avm_writedata,
  o_avm_writedata
);      

parameter AWIDTH=32;           
parameter NUM_DIMM = 1;         
parameter MWIDTH_BYTES=64;     
parameter BURST_CNT_W=6;   
parameter READ = 1; 
parameter START_ACTIVE = 0;
parameter ID_WIDTH = 1;
parameter FIFO_DEPTH = 64;  
parameter ENABLE_LAST_WAIT = 0;
parameter ENABLE_DATA_REORDER = 0;
parameter DEVICE =  "Stratix V";


localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = (READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE);
localparam DIMM_W = $clog2(NUM_DIMM);

input                            clk;  
input                            reset;   
input                            i_token;
input      [ID_WIDTH-1:0]        i_id [2];
input                            i_avm_waitrequest     [NUM_DIMM];     
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [2];     
input      [AWIDTH-1:0]          i_avm_address         [2];     
input                            i_avm_read            [2];     
input                            i_avm_write           [2];    
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [2];      
output     reg                   o_avm_waitrequest_0   [NUM_DIMM];     
output     reg                   o_avm_waitrequest_1;  
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;   
output     reg                   o_avm_read;               
output     reg                   o_avm_write;          
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
input      [MWIDTH-1:0]          i_avm_writedata[2];
output     [MWIDTH-1:0]          o_avm_writedata;
output     [ID_WIDTH-1:0]        o_id;
output     reg                   o_token;
output                           o_active;
output     reg [ID_WIDTH-1:0]    o_index;


integer i;
genvar z;
reg                              active;
wire      [REQ_WIDTH-1:0]        i_req [2];              
reg       [REQ_WIDTH-1:0]        request_dout;
wire      [0:NUM_DIMM-1]         backpressure;  
wire                             backpressure_stall;  
wire                             pass_token;

assign o_active = active;  
assign backpressure_stall = |backpressure;
  
always @(posedge clk) begin
  request_dout <= active? i_req[1] : i_req[0];      
end

always @(posedge clk or posedge reset) begin 
  if(reset) begin
    for(i=0; i<NUM_DIMM; i=i+1) o_avm_waitrequest_0[i] <= 1'b0;
    o_avm_waitrequest_1 <= !START_ACTIVE;             
    o_avm_read <= 1'b0;
    o_avm_write <= 1'b0;
    active <= START_ACTIVE;
    o_token <= 1'b0;
    o_index <= '0;
  end    
  else begin       
    o_token <= 1'b0;      
    if(ENABLE_LAST_WAIT) begin
      if(i_token) begin
        active <= 1'b1; 
        o_index <= i_id[1];
      end   
      else if(active) begin
        o_token <= pass_token;
        active <= !pass_token;
        if(pass_token) o_index <= '0;
      end
    end
    else begin
      if(pass_token) begin
        active <= 1'b0;
        o_token <= active | i_token;
        o_index <= '0;
      end
      else if(i_token)  begin
        active <= 1'b1;
        o_index <= i_id[1];
      end
    end
    o_avm_waitrequest_0  <= i_avm_waitrequest; // pass backpressure to the next node
    o_avm_waitrequest_1 <= !active & (!i_token | ENABLE_LAST_WAIT == 0) | backpressure_stall | pass_token & active;               
    o_avm_read  <= active & !o_avm_waitrequest_1 & i_avm_read[1] | i_avm_read[0];  
    o_avm_write <= active & !o_avm_waitrequest_1 & i_avm_write[1] | i_avm_write[0];  
  end
end

generate
  if(NUM_DIMM > 1 & !ENABLE_DATA_REORDER & READ) begin : GEN_MULTIPLE_STALL
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
      assign backpressure[z] = i_avm_waitrequest[z] & i_avm_address[1][AWIDTH-1:AWIDTH-DIMM_W] == z;      
    end
  end
  else begin : GEN_SINGLE_STALL
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
      assign backpressure[z] = i_avm_waitrequest[z];
    end
  end
  if(READ) begin : ENABLE_READ    
    assign pass_token = !i_avm_read[1] | backpressure_stall;
    assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_id[0]};
    assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_id[1]};  
    assign {o_avm_address, o_avm_burstcount, o_id} = request_dout;
    assign o_avm_byteenable = {MWIDTH_BYTES{1'b1}};    
  end
  else begin : ENABLE_WRITE        
    assign pass_token = !i_avm_write[1];
    assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0]} ;
    assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1]} ;                                                 
    assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;    
  end
endgenerate
endmodule


// A group of the basic unit lsu_ic_token

module lsu_n_token (
  clk,
  reset,
  i_token,
  i_id,
  i_ext_address, 
  i_ext_read,        
  i_ext_burstcount,
  o_ext_waitrequest,    
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,        
  i_avm_write,
  i_avm_burstcount,
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,      
  o_avm_write,  
  o_avm_burstcount,
  o_id,
  o_token,
  o_active,
  // write
  i_avm_writedata,
  o_avm_writedata
);

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;                             
parameter NUM_PORT = 10; 
parameter START_ID = 0;
parameter READ = 1;   
parameter ENABLE_FAST = 0;
parameter OPEN_RING = 0;  
parameter START_ACTIVE = 0;   
parameter NUM_DIMM = 1;    
parameter ENABLE_DATA_REORDER = 0;
parameter ROOT_FIFO_AW = 8;  
parameter ROOT_FIFO_THRESH = (NUM_PORT+START_ID)*2;
parameter ENABLE_LAST_WAIT = 0;                               
parameter ID_WIDTH = (NUM_PORT+START_ID == 1 )? 1 : $clog2(NUM_PORT+START_ID);
parameter SINGLE_STALL = 0;


localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH = READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE;
localparam ROOT_FIFO_DEPTH = 2 ** ROOT_FIFO_AW;
localparam NUM_DIMM_INT = SINGLE_STALL? 1 : NUM_DIMM;


input                            clk;  
input                            reset;   
// from another open ring part
input      [ID_WIDTH-1:0]        i_id;
input                            i_token;
input      [AWIDTH-1:0]          i_ext_address;
input                            i_ext_read;        
input      [BURST_CNT_W-1:0]     i_ext_burstcount; 
output                           o_ext_waitrequest     [NUM_DIMM];     
// from LSUs
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [NUM_PORT];     
input      [AWIDTH-1:0]          i_avm_address         [NUM_PORT];     
input                            i_avm_read            [NUM_PORT];     
input                            i_avm_write           [NUM_PORT];     
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [NUM_PORT];  
// to LSUs
output                           o_avm_waitrequest     [NUM_PORT];   
output                           o_token;
output                           o_active              [NUM_PORT];   
// from memory
input                            i_avm_waitrequest     [NUM_DIMM];       
// to memory 
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output                           o_avm_read;  
output                           o_avm_write;                
output     [BURST_CNT_W-1:0]     o_avm_burstcount;
output     [ID_WIDTH-1:0]        o_id;
// write
input     [MWIDTH-1:0]           i_avm_writedata [NUM_PORT];
output    [MWIDTH-1:0]           o_avm_writedata;

genvar z, z0;  
wire [ID_WIDTH-1:0]     ci_id             [NUM_PORT][2];            
wire [MWIDTH_BYTES-1:0] ci_byteenable     [NUM_PORT][2];      
wire [AWIDTH-1:0]       ci_address        [NUM_PORT][2];      
wire                    ci_read           [NUM_PORT][2];   
wire                    ci_write          [NUM_PORT][2];   
wire [BURST_CNT_W-1:0]  ci_burstcount     [NUM_PORT][2];       
wire                    ci_token          [NUM_PORT];
wire                    ci_waitrequest    [NUM_PORT][NUM_DIMM_INT]; 
wire                    co_waitrequest_0  [NUM_PORT][NUM_DIMM_INT]; 
wire                    co_waitrequest_1  [NUM_PORT]; 
wire [MWIDTH-1:0]       co_readdata       [NUM_PORT];
wire                    co_return_valid   [NUM_PORT][2];
wire [MWIDTH_BYTES-1:0] co_byteenable     [NUM_PORT];
wire [AWIDTH-1:0]       co_address        [NUM_PORT];
wire                    co_read           [NUM_PORT];
wire                    co_write          [NUM_PORT];
wire [BURST_CNT_W-1:0]  co_burstcount     [NUM_PORT];
wire [ID_WIDTH-1:0]     co_id             [NUM_PORT];
wire                    co_token          [NUM_PORT];
wire [ID_WIDTH-1:0]     co_index          [NUM_PORT];
wire [MWIDTH-1:0]       ci_writedata      [NUM_PORT][2];    
wire [MWIDTH-1:0]       co_writedata      [NUM_PORT];        

generate  
    if(ENABLE_FAST) begin : GEN_ENABLE_FAST        
      wire i_avm_wait_int [NUM_DIMM_INT]; 
      if(NUM_DIMM_INT > 1) begin
        assign i_avm_wait_int = i_avm_waitrequest;          
      end
      else  begin
        assign i_avm_wait_int[0] = i_avm_waitrequest[0];        
      end
      lsu_n_fast #(
         .AWIDTH(AWIDTH),       
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .BURST_CNT_W(BURST_CNT_W),
         .NUM_PORT(NUM_PORT),
         .START_ID(START_ID),      
         .ID_WIDTH(ID_WIDTH),
         .OPEN_RING(OPEN_RING),
         .NUM_DIMM(NUM_DIMM_INT),
         .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
         .START_ACTIVE(START_ACTIVE|!OPEN_RING),
         .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),               
         .READ(READ)
       ) lsu_n_fast (
        .clk              (clk),
        .reset            (reset),
        .i_ext_read       (1'b0), 
        .i_avm_write      (i_avm_write),
        .i_token          (i_token),
        .i_avm_address    (i_avm_address),
        .i_avm_read       (i_avm_read),
        .i_avm_burstcount (i_avm_burstcount),
        .o_avm_waitrequest(o_avm_waitrequest),
        .i_avm_waitrequest(i_avm_wait_int),
        .o_avm_address    (o_avm_address),
        .o_avm_read       (o_avm_read),
        .o_avm_burstcount (o_avm_burstcount),
        .o_token          (o_token),
        .o_id             (o_id)
      );           
    end
    else begin : GEN_DISABLE_FAST 
      assign o_avm_byteenable   = co_byteenable  [NUM_PORT-1];
      assign o_avm_address      = co_address     [NUM_PORT-1];
      assign o_avm_read         = co_read        [NUM_PORT-1];
      assign o_avm_write        = co_write       [NUM_PORT-1];
      assign o_avm_burstcount   = co_burstcount  [NUM_PORT-1];  
      assign o_id               = co_id          [NUM_PORT-1];
      assign o_token            = co_token       [NUM_PORT-1];
      assign o_avm_writedata    = co_writedata   [NUM_PORT-1];    
      if(NUM_DIMM_INT > 1) begin
        assign ci_waitrequest[NUM_PORT-1] = i_avm_waitrequest;  
        assign o_ext_waitrequest = co_waitrequest_0[0]; 
      end
      else  begin
        assign ci_waitrequest[NUM_PORT-1][0] = i_avm_waitrequest[0];      
        assign o_ext_waitrequest[0] = co_waitrequest_0[0][0];    
      end                  
                
      for(z=0; z<NUM_PORT; z=z+1) begin : GEN_IC
        if(z==0) begin   
          assign ci_token[z] = OPEN_RING? i_token : co_token [NUM_PORT - 1]; 
          assign ci_read       [z][0] = OPEN_RING? i_ext_read : 1'b0;                
          assign ci_write      [z][0] = 1'b0;
          assign ci_id         [z][0] = i_id;
          assign ci_byteenable [z][0] = '1;      
          assign ci_address    [z][0] = i_ext_address;      
          assign ci_burstcount [z][0] = i_ext_burstcount;    
          assign ci_read       [z][1] = i_avm_read [0];        
          assign ci_write      [z][1] = i_avm_write[0];            
          assign ci_id         [z][1] = START_ID;
          assign ci_byteenable [z][1] = i_avm_byteenable [0];      
          assign ci_address    [z][1] = i_avm_address    [0];      
          assign ci_burstcount [z][1] = i_avm_burstcount [0]; 
          assign ci_writedata  [z][1] = i_avm_writedata  [0];        
        end
        else begin
          assign ci_token[z] = co_token [z-1]; 
          assign ci_read       [z][0] = co_read          [z-1];   
          assign ci_write      [z][0] = co_write         [z-1]; 
          assign ci_id         [z][0] = co_id            [z-1];
          assign ci_byteenable [z][0] = co_byteenable    [z-1];
          assign ci_address    [z][0] = co_address       [z-1];        
          assign ci_burstcount [z][0] = co_burstcount    [z-1];   
          assign ci_writedata  [z][0] = co_writedata     [z-1];            
          assign ci_id         [z][1] = START_ID+z;
          assign ci_byteenable [z][1] = i_avm_byteenable [z];      
          assign ci_address    [z][1] = i_avm_address    [z];      
          assign ci_read       [z][1] = i_avm_read       [z];      
          assign ci_write      [z][1] = i_avm_write      [z];      
          assign ci_burstcount [z][1] = i_avm_burstcount [z];      
          assign ci_writedata  [z][1] = i_avm_writedata  [z];            
        end           
        assign o_avm_waitrequest[z] = co_waitrequest_1[z];   
        if(z < NUM_PORT - 1)  assign ci_waitrequest[z] = co_waitrequest_0[z+1];           
              
        lsu_ic_token #(
          .AWIDTH(AWIDTH),
          .START_ACTIVE(z==0 & (START_ACTIVE|!OPEN_RING)),
          .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
          .MWIDTH_BYTES(MWIDTH_BYTES),
          .READ(READ),   
          .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT & (z == NUM_PORT - 1)),
          .ID_WIDTH(ID_WIDTH),
          .NUM_DIMM(NUM_DIMM_INT),
          .BURST_CNT_W(BURST_CNT_W)
        ) ic (
          .clk(clk),                      
          .reset(reset), 
          .i_token(ci_token[z]),
          .i_id(ci_id[z]),                    
          .i_avm_waitrequest(ci_waitrequest[z]),          
          .i_avm_byteenable(ci_byteenable[z]),         
          .i_avm_address(ci_address[z]),            
          .i_avm_read(ci_read[z]),            
          .i_avm_write(ci_write[z]),             
          .i_avm_burstcount(ci_burstcount[z]),      
          .i_avm_writedata(ci_writedata[z]),   
          .o_avm_writedata(co_writedata[z]),    
          .o_avm_waitrequest_0(co_waitrequest_0[z]),        
          .o_avm_waitrequest_1(co_waitrequest_1[z]),        
          .o_avm_byteenable(co_byteenable[z]),         
          .o_avm_address(co_address[z]),            
          .o_avm_read(co_read[z]),          
          .o_avm_write(co_write[z]),            
          .o_avm_burstcount(co_burstcount[z]),    
          .o_token(co_token[z]),    
          .o_index(co_index[z]),
          .o_active(o_active[z]),
          .o_id(co_id[z])
        );        
      end // end GEN_MULTIPLE_PORT   
      `ifdef SIM_ONLY
          reg burst_done;
          reg [BURST_CNT_W-1:0] cnt;
          reg [AWIDTH-1:0]  R_address;
          reg error;         
          if(READ == 0) begin : GEN_WRITE_DEBUG
            always @(posedge clk or posedge reset) begin
              if(reset) begin
                cnt <= 1;
                burst_done <= 1'b0;  
                error <= 1'b0; 
              end
              else begin                
                if(o_avm_write) begin
                  R_address <= o_avm_address;
                  cnt <= (cnt == o_avm_burstcount)? 1 : cnt + 1;
                  burst_done <= cnt == o_avm_burstcount;
                  error <= (R_address != o_avm_address) & !burst_done;
                  if(error) begin
                    $display("write ring error");
                    $stop;
                  end
                end
              end      
            end      
          end
        `endif   
    end
endgenerate

endmodule



// This block is used for load ring.
// The datapath for load ring is much narrower compared with store ring
// In most cases, it does not need a group of 2-to-1 MUX to pipeline the selected request.
// Instead, a N-to-1 one clock cycle delay MUX is enough.
// It is optional, enabled by setting lsu_ic_top.ENABLE_READ_FAST

module lsu_n_fast (
  clk,
  reset,
  i_token,
  i_ext_id,
  i_ext_address,
  i_ext_read,        
  i_ext_burstcount,
  o_ext_waitrequest,  
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,        
  i_avm_write,        
  i_avm_burstcount,
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,       
  o_avm_write,    
  o_avm_request,
  o_avm_burstcount,
  o_id,
  o_token,
  // write
  i_avm_writedata,
  o_avm_writedata
);

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;                             
parameter NUM_PORT = 10; 
parameter NUM_DIMM = 2;
parameter START_ID = 0;
parameter READ = 1;   
parameter ENABLE_DATA_REORDER = 0;
parameter OPEN_RING = 0;  
parameter START_ACTIVE = 0;
parameter ID_WIDTH = (NUM_PORT+START_ID == 1 )? 1 : $clog2(NUM_PORT+START_ID);
parameter ENABLE_LAST_WAIT = 0;

localparam MWIDTH=8*MWIDTH_BYTES;
localparam DIMM_W = $clog2(NUM_DIMM);
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W + ID_WIDTH;          
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH = READ? REQ_WIDTH_READ : REQ_WIDTH_WRITE;


input                            clk;  
input                            reset;   
// from another open ring part
input      [ID_WIDTH-1:0]        i_ext_id;
input      [AWIDTH-1:0]          i_ext_address;
input                            i_ext_read;        
input      [BURST_CNT_W-1:0]     i_ext_burstcount;
// from LSUs
input                            i_token;
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [NUM_PORT];     
input      [AWIDTH-1:0]          i_avm_address         [NUM_PORT];     
input                            i_avm_read            [NUM_PORT];     
input                            i_avm_write           [NUM_PORT];   
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [NUM_PORT];  
// to LSUs
output    reg                    o_avm_waitrequest     [NUM_PORT];   
output    reg                    o_token;
// from memory
input                            i_avm_waitrequest [NUM_DIMM];     
// to another open ring
output    reg                    o_ext_waitrequest [NUM_DIMM]; // delayed i_avm_waitrequest
// to memory 
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output                           o_avm_read;
output                           o_avm_write;               
output                           o_avm_request;  
output     [BURST_CNT_W-1:0]     o_avm_burstcount;
output     [ID_WIDTH-1:0]        o_id;
// write
input     [MWIDTH-1:0]           i_avm_writedata [NUM_PORT];
output    [MWIDTH-1:0]           o_avm_writedata;

integer i;
genvar z, z0;
wire i_avm_request  [NUM_PORT];   
wire [ID_WIDTH-1:0] i_id [NUM_PORT];      
wire [REQ_WIDTH-1:0] i_req [NUM_PORT];  
wire [REQ_WIDTH-1:0] ext_req;     
reg  active;
reg  [ID_WIDTH-1:0]  ptr;    
wire [REQ_WIDTH-1:0] request_dout;
wire [0:NUM_DIMM-1] backpressure_stall [NUM_PORT];
wire backpressure [NUM_PORT]; 
reg  avm_read [NUM_PORT];
reg  avm_write [NUM_PORT];
reg  avm_request [NUM_PORT];
wire avm_read_wire;
wire avm_write_wire;
wire avm_request_wire;                
reg  avm_read_p;        
reg  avm_write_p;       
reg  avm_request_p;     
reg  [BURST_CNT_W-1:0] wr_cnt; 
reg  wr_burst_done;
wire pass_token;


assign avm_read_wire    = active & !o_avm_waitrequest[ptr] & i_avm_read[ptr];       
assign avm_write_wire   = active & !o_avm_waitrequest[ptr] & i_avm_write[ptr];      
assign avm_request_wire = active & !o_avm_waitrequest[ptr] & i_avm_request[ptr];   
assign ext_req = {i_ext_address, i_ext_burstcount, {MWIDTH{1'b0}}, {MWIDTH_BYTES{1'b1}}, i_ext_id};   

always @(posedge clk or posedge reset) begin 
  if(reset) begin 
    avm_read_p    <= 1'b0;
    avm_write_p   <= 1'b0;
    avm_request_p <= 1'b0;         
     for(i=0; i<NUM_DIMM; i=i+1) begin
      o_ext_waitrequest[i] <= 1'b0;
    end
    for(i=0; i<NUM_PORT; i=i+1) begin
      avm_read[i] <= 0;
      avm_write[i] <= 0;
      avm_request[i] <= 0;
    end    
  end
  else begin  
    avm_read_p    <= avm_read_wire;      
    avm_write_p   <= avm_write_wire;    
    avm_request_p <= avm_request_wire;  
    for(i=0; i<NUM_DIMM; i=i+1) begin
      o_ext_waitrequest[i] <= i_avm_waitrequest[i];
    end
    
    for(i=0; i<NUM_PORT; i=i+1) begin
      if(active & i==ptr) begin
        avm_read[i]    <=  avm_read_wire;  
        avm_write[i]   <=  avm_write_wire;  
        avm_request[i] <=  avm_request_wire;
      end
      else if(i>0) begin
        avm_read[i]  <= avm_read[i-1];
        avm_write[i] <= avm_write[i-1];
        avm_request[i] <= avm_request[i-1];
      end
      else begin
        avm_read[0]  <= i_ext_read;
        avm_write[0] <= 1'b0;
        avm_request[0] <= i_ext_read;
      end
    end
  end
end


generate
if(ENABLE_LAST_WAIT) begin : GEN_ENABLE_LAST_WAIT  
  always @(posedge clk or posedge reset) begin 
    if(reset) begin
      ptr <= 0;
      active <= START_ACTIVE;
      o_avm_waitrequest[0] <= !START_ACTIVE;
      for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;      
      o_token <= 1'b0;
    end
    else begin
      o_token <= 1'b0;    
      if(i_token) active <= 1'b1;        
      if(pass_token) begin           
        if(ptr == NUM_PORT-1) begin if (!o_avm_waitrequest[NUM_PORT-1] | !active & !i_token) ptr <= '0;end
        else if(active) ptr <= ptr + 1'b1;
        if(ptr == NUM_PORT-1 & !o_avm_waitrequest[NUM_PORT-1]) begin
          o_token <= active;
          active <= !OPEN_RING; 
        end
      end 
      
      for(i=0; i<NUM_PORT; i=i+1) begin
        if(i==ptr) o_avm_waitrequest[i] <= !active & !i_token | backpressure[i] | ((ptr < NUM_PORT - 1)? !i_avm_request[i] : !i_avm_request[i] & !o_avm_waitrequest[i]);     
        else o_avm_waitrequest[i] <= 1'b1;
      end
    end 
  end  
end
else begin : GEN_DISABLE_LAST_WAIT
  always @(posedge clk or posedge reset) begin 
    if(reset) begin
      ptr <= 0;
      active <= START_ACTIVE;
      o_avm_waitrequest[0] <= !START_ACTIVE;
      for(i=1; i<NUM_PORT; i=i+1) o_avm_waitrequest[i] <= 1'b1;
      o_token <= 1'b0;
    end
    else begin
      o_token <= 1'b0;    
      if(i_token) active <= 1'b1;       
      if(pass_token) begin
        if(ptr == NUM_PORT - 1) begin
          o_token <= active | i_token;
          active <= !OPEN_RING; 
          ptr <= '0;
        end
        else if(active) ptr <= ptr + 1'b1;
      end         
      
      for(i=0; i<NUM_PORT; i=i+1) begin
        if(i==ptr) o_avm_waitrequest[i] <= !active & !i_token | backpressure[i] | pass_token;     
        else o_avm_waitrequest[i] <= 1'b1;
      end
    end 
  end
end
  
for(z=0; z<NUM_PORT; z=z+1) begin : GEN_STALL
  if(NUM_DIMM > 1 & !ENABLE_DATA_REORDER) begin : GEN_MULTIPLE_DIMM
    for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_
      assign backpressure_stall[z][z0] = i_avm_waitrequest[z0] & i_avm_address[z][AWIDTH-1:AWIDTH-DIMM_W] == z0;   
    end
  end
  else begin : GEN_SINGLE_DIMM
    for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_
      assign backpressure_stall[z][z0] = i_avm_waitrequest[z0];
    end
  end
  assign backpressure[z] = |backpressure_stall[z];
  assign i_avm_request[z] = i_avm_read[z] | i_avm_write[z];
end
if(READ) begin : ENABLE_READ    
  assign pass_token = !i_avm_request[ptr] | backpressure[ptr];
  for(z=0; z<NUM_PORT; z=z+1) begin : GEN_I_DATA  
    assign i_id[z] = START_ID + z;
    assign i_req[z] = {i_avm_address[z], i_avm_burstcount[z], i_id[z]};   
    assign {o_avm_address, o_avm_burstcount, o_id} = request_dout;
    assign o_avm_byteenable = {MWIDTH_BYTES{1'b1}};    
  end
end
else begin : ENABLE_WRITE 
  assign pass_token = active & (!i_avm_request[ptr] | backpressure[ptr] & wr_burst_done);
  for(z=0; z<NUM_PORT; z=z+1) begin : GEN_I_DATA         
    assign i_id[z] = START_ID + z;      
    assign i_req[z] = {i_avm_address[z], i_avm_burstcount[z], i_avm_writedata[z], i_avm_byteenable[z], i_id[z]};                     
    assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;        
  end
  always @(posedge clk or posedge reset) begin 
    if(reset) begin 
      wr_cnt <= 1;
      wr_burst_done <= 1'b1;
    end    
    else begin
      if(avm_write_wire) begin
        wr_cnt <= (wr_cnt == i_avm_burstcount[ptr])? 1 : wr_cnt + 1'b1;     
        if(!o_avm_waitrequest[ptr] & wr_cnt == i_avm_burstcount[ptr] & backpressure[ptr])  wr_burst_done <= 1'b1;  // make sure that token is not passed to the next LSU until the burst write is fully processed for the current one       
        else wr_burst_done <= 1'b0;                   
      end
      else if(!backpressure[ptr] &  i_token) begin
        wr_burst_done  <= 1'b0;
      end
    end
  end // end always
end

reg  [REQ_WIDTH-1:0] R_req;
assign request_dout = R_req;
assign o_avm_read = avm_read_p;
assign o_avm_write = avm_write_p;
assign o_avm_request = avm_request_p;
always @(posedge clk) begin
  R_req <= i_req[ptr];  // N-to-1 MUX
end

endgenerate

endmodule



// the top MUX that selects requests between load and store

module lsu_ic_hybrid (
  clk,
  reset,
  i_id,  
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,   
  i_avm_write, 
  i_avm_burstcount,
  i_avm_readdata, 
  i_avm_return_valid,  
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,
  o_avm_write,
  o_avm_burstcount,
  o_avm_readdata, 
  o_avm_readdatavalid, 
  o_id,  
  // write
  i_avm_writedata,
  o_avm_writedata
);      

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;   
parameter ID_WIDTH = 1;
parameter FIFO_DEPTH = 64;  
parameter FIFO_AF_THRESH = FIFO_DEPTH - 8;
parameter PIPELINE_RD_RETURN = 0;                  
parameter UNBALANCE = 0;
parameter DEVICE =  "Stratix V";


localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W;
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = REQ_WIDTH_WIDER;

input                            clk;  
input                            reset;   
input      [ID_WIDTH-1:0]        i_id [2];
input                            i_avm_waitrequest;     
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [2];     
input      [AWIDTH-1:0]          i_avm_address         [2];     
input                            i_avm_read            [2];     
input                            i_avm_write           [2];   
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [2];     
input      [MWIDTH-1:0]          i_avm_readdata;     
input                            i_avm_return_valid;     
output                           o_avm_waitrequest     [2];     
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output                           o_avm_read;          
output                           o_avm_write;
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
output     [MWIDTH-1:0]          o_avm_readdata;     
output                           o_avm_readdatavalid   [2];     
input     [MWIDTH-1:0]           i_avm_writedata [2];
output    [MWIDTH-1:0]           o_avm_writedata;
output    [ID_WIDTH-1:0]         o_id;


generate

if(UNBALANCE) begin : GEN_UNBALANCE
  lsu_ic_unbalance #(
     .AWIDTH(AWIDTH),
     .MWIDTH_BYTES(MWIDTH_BYTES),
     .BURST_CNT_W(BURST_CNT_W),
     .ID_WIDTH(ID_WIDTH),
     .FIFO_DEPTH(FIFO_DEPTH),
     .FIFO_AF_THRESH(FIFO_AF_THRESH),
     .PIPELINE_RD_RETURN(PIPELINE_RD_RETURN),
     .DEVICE(DEVICE)
   ) lsu_ic_unbalance (
    .clk                (clk),
    .reset              (reset),
    .i_id               (i_id),
    .i_avm_waitrequest  (i_avm_waitrequest),
    .i_avm_byteenable   (i_avm_byteenable),
    .i_avm_address      (i_avm_address),
    .i_avm_read         (i_avm_read),
    .i_avm_write        (i_avm_write),
    .i_avm_burstcount   (i_avm_burstcount),
    .i_avm_readdata     (i_avm_readdata),
    .i_avm_return_valid (i_avm_return_valid),
    .o_avm_waitrequest  (o_avm_waitrequest),
    .o_avm_byteenable   (o_avm_byteenable),
    .o_avm_address      (o_avm_address),
    .o_avm_read         (o_avm_read),
    .o_avm_write        (o_avm_write),
    .o_avm_burstcount   (o_avm_burstcount),
    .o_avm_readdata     (o_avm_readdata),
    .o_avm_readdatavalid(o_avm_readdatavalid),
    .i_avm_writedata    (i_avm_writedata),
    .o_avm_writedata    (o_avm_writedata),
    .o_id               (o_id)
  );  
end
else begin : GEN_NORMAL
  wire [REQ_WIDTH-1:0]             i_req [2];
  wire                             i_avm_request [2];
  wire                             switch;
  reg                              wr_port;  
  wire [BURST_CNT_W-1:0]           wr_burstcount;
  wire                             rd_en;
  wire [AWIDTH-1:0]                fin_avm_address ;
  wire [BURST_CNT_W-1:0]           fin_avm_burstcount ;
  wire [MWIDTH-1:0]                fin_avm_data ;
  wire [MWIDTH_BYTES-1:0]          fin_avm_byteenable ;
  wire [ID_WIDTH-1:0]              fin_id;
  reg  [REQ_WIDTH-1:0]             fin ;
  reg                              fin_valid;      
  wire                             valid_request;        
  reg                              o_avm_request;         
  reg                              avm_read, avm_write;
  reg  [0:1]                       avm_waitrequest;
  reg  [REQ_WIDTH-1:0]             request_dout;
  
  assign rd_en = !o_avm_request |  i_avm_waitrequest === 1'b0; // "===" is used to avoid 'X' propagation in datapath when i_avm_waitrequest from other module is 'x'
  assign switch = !i_avm_request[wr_port];
  assign valid_request = fin_valid | i_avm_request[wr_port];
  
  assign i_avm_request[0] = i_avm_read[0];
  assign i_avm_request[1] = i_avm_write[1];
  assign o_avm_waitrequest[0] = avm_waitrequest[0];
  assign o_avm_waitrequest[1] = avm_waitrequest[1];
  assign o_avm_read = avm_read;
  assign o_avm_write = avm_write;
  assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0]};
  assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1]};
  assign {fin_avm_address, fin_avm_burstcount, fin_avm_data, fin_avm_byteenable, fin_id} = fin;                                                
  assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout;           
    
  always @(posedge clk) begin
    if(i_avm_request[wr_port] & !avm_waitrequest[wr_port]) fin <= i_req[wr_port];    
    if(rd_en & valid_request) request_dout <= fin_valid? fin : i_req[wr_port];      
  end
  
  always @(posedge clk or posedge reset) begin 
    if(reset) begin
      wr_port <= 1'b0;     
      avm_read <= 1'b0;      
      avm_write <= 1'b0;               
      fin_valid <= 1'b0;        
      o_avm_request <= 1'b0;
      avm_waitrequest <= 2'b0;
    end    
    else begin       
      if(!rd_en & i_avm_request[wr_port] & !avm_waitrequest[wr_port]) fin_valid <= 1'b1;
      else if(rd_en) fin_valid <= 1'b0;
      if(rd_en) begin
        avm_read <= valid_request & !wr_port;  
        avm_write <= valid_request & wr_port;  
        o_avm_request <= valid_request;  
      end  
      
      if(!rd_en & valid_request) avm_waitrequest[wr_port] <= 1'b1;
      else if(!switch) avm_waitrequest[wr_port] <= 1'b0;   
      else begin 
        wr_port <= !wr_port;
        avm_waitrequest[wr_port] <= 1'b1;
        avm_waitrequest[!wr_port] <= 1'b0;
      end
    end 
  end 
end
endgenerate

endmodule 



module lsu_ic_unbalance (
  clk,
  reset,
  i_id,  
  i_avm_waitrequest, 
  i_avm_byteenable,
  i_avm_address, 
  i_avm_read,   
  i_avm_write, 
  i_avm_burstcount,
  i_avm_readdata, 
  i_avm_return_valid,  
  o_avm_waitrequest, 
  o_avm_byteenable,
  o_avm_address, 
  o_avm_read,
  o_avm_write,
  o_avm_burstcount,
  o_avm_readdata, 
  o_avm_readdatavalid, 
  o_id,  
  // write
  i_avm_writedata,
  o_avm_writedata
);      

parameter AWIDTH=32;            // Address width (32-bits for Avalon)
parameter MWIDTH_BYTES=64;      // Width of the global memory bus (bytes)
parameter BURST_CNT_W=6;   
parameter ID_WIDTH = 1;
parameter FIFO_DEPTH = 64;  
parameter FIFO_AF_THRESH = FIFO_DEPTH - 8;
parameter PIPELINE_RD_RETURN = 0;
parameter DEVICE =  "Stratix V";


localparam FIFO_AW = $clog2(FIFO_DEPTH);
localparam MWIDTH=8*MWIDTH_BYTES;
localparam REQUEST_FIFO_AW = 8;
localparam REQUEST_FIFO_DEPTH = 2**REQUEST_FIFO_AW;
localparam REQ_WIDTH_READ  = AWIDTH + BURST_CNT_W;
localparam REQ_WIDTH_WRITE = AWIDTH + BURST_CNT_W + MWIDTH + MWIDTH_BYTES + ID_WIDTH;
localparam REQ_WIDTH_WIDER = (REQ_WIDTH_WRITE >  REQ_WIDTH_READ)?  REQ_WIDTH_WRITE : REQ_WIDTH_READ;
localparam REQ_WIDTH = REQ_WIDTH_WIDER + 1;

input                            clk;  
input                            reset;   
input      [ID_WIDTH-1:0]        i_id [2];
input                            i_avm_waitrequest;     
input      [MWIDTH_BYTES-1:0]    i_avm_byteenable      [2];     
input      [AWIDTH-1:0]          i_avm_address         [2];     
input                            i_avm_read            [2];     
input                            i_avm_write           [2];   
input      [BURST_CNT_W-1:0]     i_avm_burstcount      [2];     
input      [MWIDTH-1:0]          i_avm_readdata;     
input                            i_avm_return_valid;     
output                           o_avm_waitrequest     [2];     
output     [MWIDTH_BYTES-1:0]    o_avm_byteenable;           
output     [AWIDTH-1:0]          o_avm_address;              
output     reg                   o_avm_read;          
output     reg                   o_avm_write;
output     [BURST_CNT_W-1:0]     o_avm_burstcount;           
output     reg [MWIDTH-1:0]      o_avm_readdata;     
output     reg                   o_avm_readdatavalid   [2];     
input     [MWIDTH-1:0]           i_avm_writedata [2];
output    [MWIDTH-1:0]           o_avm_writedata;
output    [ID_WIDTH-1:0]         o_id;

wire [REQ_WIDTH-1:0]             i_req [2];                
wire                             i_avm_request [2];
reg                              R_i_waitrequest, port_to_fifo;
reg  [BURST_CNT_W-1:0]           wr_cnt;
reg                              wr_finish;
reg                              wr_port; 
reg  [BURST_CNT_W-1:0]           cnt;
wire                             rd_enable;
wire                             fifo_stall;
reg                              R_rd_fifo, port_valid;
wire                             rd_fifo;
wire                             port;  
wire [BURST_CNT_W-1:0]           burst_cnt;
wire                             fifo_empty, fifo_af;
wire                             o_avm_read_en;     
reg  [REQ_WIDTH-1:0]             request_dout;

assign i_avm_request[0] = i_avm_read[0] | i_avm_write[0];
assign i_avm_request[1] = i_avm_read[1] | i_avm_write[1];
assign fifo_stall = !i_avm_return_valid;
assign rd_enable = cnt == burst_cnt & !(R_rd_fifo & burst_cnt > 1);    
assign i_req[0] = {i_avm_address[0], i_avm_burstcount[0], i_avm_writedata[0], i_avm_byteenable[0], i_id[0], i_avm_read[0]} ;
assign i_req[1] = {i_avm_address[1], i_avm_burstcount[1], i_avm_writedata[1], i_avm_byteenable[1], i_id[1], i_avm_read[1]} ;                                                       
assign {o_avm_address, o_avm_burstcount, o_avm_writedata, o_avm_byteenable, o_id} = request_dout[REQ_WIDTH-1:1];         


assign o_avm_waitrequest[0] = wr_port | i_avm_request[1] | R_i_waitrequest;
assign o_avm_waitrequest[1] = R_i_waitrequest; // port [1] has priority

always @(posedge clk) begin    
  o_avm_readdata <= i_avm_readdata;  
  request_dout <= i_avm_request[1]? i_req[1] : i_req[0];
  port_to_fifo <= i_avm_request[1]; 
end


always @(posedge clk or posedge reset) begin 
  if(reset) begin
    wr_port <= 1'b1;
    wr_cnt <= 1;
    wr_finish <= 1'b1;
    R_i_waitrequest <= 1'b0;
    o_avm_read <= 1'b0;                 
    o_avm_write <= 1'b0;
  end    
  else begin   
    R_i_waitrequest <= i_avm_waitrequest | fifo_af;    
    if(i_avm_request[1]) begin
      if(i_avm_write[1]) begin
        wr_cnt <= (wr_cnt == i_avm_burstcount[1])? 1 : wr_cnt + 1'b1;
        wr_finish <= wr_cnt == i_avm_burstcount[1];
      end
      wr_port <= 1'b1;
    end    
    else if(wr_finish & i_avm_request[0]) begin
      wr_port <= 1'b0;
    end   
    o_avm_read  <= i_avm_read[1] | i_avm_read[0] & !o_avm_waitrequest[0];    
    o_avm_write <= i_avm_write[1] | i_avm_write[0] & !o_avm_waitrequest[0];    
  end 
end   
                               

// read back
always @(posedge clk or posedge reset) begin
  if(reset) begin
    cnt <= 0;    
    R_rd_fifo <= 1'b0;   
    port_valid <= 1'b0;
    o_avm_readdatavalid[0] <= 1'b0;
    o_avm_readdatavalid[1] <= 1'b0;                       
  end
  else begin        
    R_rd_fifo <= rd_fifo & !fifo_empty;
    
    if(rd_fifo & !fifo_empty) port_valid <= 1'b1;
    else if(cnt == burst_cnt & i_avm_return_valid & fifo_empty) port_valid <= 1'b0; 
    
    if(rd_fifo & !fifo_empty) begin cnt <= 1; end
    else if(i_avm_return_valid & cnt < burst_cnt) cnt <= cnt + 1;       
    
    o_avm_readdatavalid[0] <= i_avm_return_valid === 1'b1 & !port;
    o_avm_readdatavalid[1] <= i_avm_return_valid === 1'b1 &  port; 
  end
end
   
  
generate
if(PIPELINE_RD_RETURN) begin : GEN_PIPELINE_RETURN
  assign rd_fifo = i_avm_return_valid & cnt == burst_cnt |  !port_valid;
  scfifo #(
    .add_ram_output_register ( "ON"),
    .intended_device_family ( DEVICE),
    .lpm_numwords (FIFO_DEPTH),  
    .lpm_widthu (FIFO_AW),
    .lpm_showahead ( "OFF"),
    .lpm_type ( "scfifo"),
    .lpm_width (1+BURST_CNT_W),  
    .almost_full_value(FIFO_AF_THRESH),
    .overflow_checking ( "OFF"),
    .underflow_checking ( "ON"),
    .use_eab ( "ON")
  ) burst_cnt_fifo (
    .clock (clk),
    .data ({port_to_fifo, o_avm_burstcount}), 
    .wrreq (o_avm_read),
    .rdreq (rd_fifo),  
    .empty (fifo_empty), 
    .q ({port, burst_cnt}),
    .almost_full (fifo_af), 
    .aclr (reset)
  );    
end
else begin : GEN_DISABLE_PIPELINE_RD_RETURN
  assign fifo_af  = 1'b0;
end
endgenerate


endmodule 


// This module is a token ring that includes the following major sub-blocks
// [1] read ring / write ring, connected to LSUs
// [2] one root FIFO per bank; root FIFO buffers memory access requests and generate backpressure
// [3] data reordering block - optional


module lsu_token_ring (
  clk,
  reset,
  // from LSU
  i_rd_byteenable,
  i_rd_address, 
  i_rd_request,          
  i_rd_burstcount,  
  i_wr_byteenable,
  i_wr_address, 
  i_wr_request,          
  i_wr_burstcount,
  i_wr_writedata,  
  // from MEM
  i_avm_waitrequest,     
  i_avm_readdata, 
  i_avm_return_valid,    
  // to MEM                
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  o_id,
  // to kernel
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_writeack,
  o_avm_readdata,
  o_avm_readdatavalid
);


parameter AWIDTH = 32;            
parameter MWIDTH_BYTES = 64;     
parameter BURST_CNT_W = 5;          
parameter NUM_RD_PORT = 2;
parameter NUM_WR_PORT = 2;
parameter START_ID = 0;
parameter ENABLE_READ_FAST = 0;
parameter DEVICE =  "Stratix V";
parameter DISABLE_ROOT_FIFO = 0;
parameter ROOT_FIFO_AW = 8;               // Token root FIFO address width; FIFO depth = 2**ROOT_FIFO_AW
parameter RD_ROOT_FIFO_AW = 7; 
parameter ENABLE_LAST_WAIT = 0;
parameter MAX_MEM_DELAY = 128; 
parameter RETURN_DATA_FIFO_DEPTH = 128;   // Read data reordering FIFO depth
parameter PIPELINE_RD_RETURN = 0;
parameter ENABLE_DATA_REORDER = 0;
parameter NUM_DIMM = 2;
parameter ENABLE_DUAL_RING = 0;
parameter ENABLE_MULTIPLE_WR_RING = 0;
parameter NUM_REORDER = 1;

localparam MWIDTH=8*MWIDTH_BYTES;
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;
localparam DISABLE_WR_RING = NUM_WR_PORT==0; 
localparam ENABLE_MULTIPLE_WR_RING_INT = ENABLE_MULTIPLE_WR_RING & ENABLE_DUAL_RING & !DISABLE_WR_RING & NUM_DIMM > 1;
localparam WR_ENABLE = NUM_WR_PORT > 0;
localparam RD_ID_WIDTH = (NUM_RD_PORT==1)?  1 : $clog2(NUM_RD_PORT);
localparam WR_ID_WIDTH = (NUM_WR_PORT==1)?  1 : $clog2(NUM_WR_PORT);
localparam ID_WIDTH = (RD_ID_WIDTH > WR_ID_WIDTH)? RD_ID_WIDTH : WR_ID_WIDTH;
localparam WR_RING_ID_WIDTH = ENABLE_DUAL_RING? WR_ID_WIDTH : ID_WIDTH;
localparam DIMM_W = $clog2(NUM_DIMM);
localparam MAX_BURST = 2 ** (BURST_CNT_W-1);
localparam WR_WIDTH = AWIDTH - DIMM_W + BURST_CNT_W + MWIDTH + MWIDTH_BYTES;
localparam ROOT_FIFO_DEPTH = 2 ** ROOT_FIFO_AW;
localparam RD_ROOT_FIFO_DEPTH = 2 ** RD_ROOT_FIFO_AW;
localparam NUM_REORDER_INT = (NUM_REORDER > NUM_RD_PORT)? NUM_RD_PORT : NUM_REORDER;
localparam PENDING_CNT_W = $clog2(RETURN_DATA_FIFO_DEPTH);
localparam RD_WIDTH = (NUM_REORDER == 1)? 1 :$clog2(NUM_RD_PORT%NUM_REORDER + NUM_RD_PORT/NUM_REORDER +1);

// avoid modelsim compile error
localparam P_NUM_RD_PORT = (NUM_RD_PORT > 0)? NUM_RD_PORT : 1;   
localparam P_NUM_WR_PORT = (NUM_WR_PORT > 0)? NUM_WR_PORT : 1;   

input  clk;
input  reset;
// from LSU
input  [MWIDTH_BYTES-1:0] i_rd_byteenable [P_NUM_RD_PORT];
input  [AWIDTH-1:0] i_rd_address [P_NUM_RD_PORT]; 
input  i_rd_request [P_NUM_RD_PORT];          
input  [BURST_CNT_W-1:0] i_rd_burstcount [P_NUM_RD_PORT];  
input  [MWIDTH_BYTES-1:0] i_wr_byteenable [P_NUM_WR_PORT]; 
input  [AWIDTH-1:0] i_wr_address [P_NUM_WR_PORT];
input  i_wr_request [P_NUM_WR_PORT];         
input  [BURST_CNT_W-1:0] i_wr_burstcount [P_NUM_WR_PORT];
input  [MWIDTH-1:0] i_wr_writedata [P_NUM_WR_PORT];
// from MEM
input  i_avm_waitrequest [NUM_DIMM];   
input  [MWIDTH-1:0] i_avm_readdata [NUM_DIMM];            
input  i_avm_return_valid [NUM_DIMM];                         
// to MEM                
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
output  [ID_WIDTH-1:0] o_id [NUM_DIMM];
// to kernel
output  o_rd_waitrequest [P_NUM_RD_PORT]; 
output  o_wr_waitrequest [P_NUM_WR_PORT]; 
output  reg o_avm_writeack [P_NUM_WR_PORT];
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 

integer i, j;
wire rd_o_token;
wire [RD_ID_WIDTH-1:0] rd_o_id;
wire [AWIDTH-1:0] rd_address;       
wire rd_request;
wire rd_waitrequest [NUM_DIMM]; 
wire rd_root_af [NUM_DIMM];
wire [BURST_CNT_W-1:0] rd_burstcount;                   
wire ic_read [P_NUM_WR_PORT];       
wire ic_write [P_NUM_RD_PORT];      
wire [MWIDTH_BYTES-1:0] wr_byteenable;
wire [AWIDTH-1:0] wr_address;
wire wr_read;
wire wr_write;
wire wr_request;
wire [BURST_CNT_W-1:0] wr_burstcount;
wire [WR_ID_WIDTH-1:0] wr_id;
wire [MWIDTH-1:0] wr_writedata;
wire [WR_WIDTH-1:0] wr_fin [NUM_DIMM];
wire [WR_WIDTH-1:0] wr_fout [NUM_DIMM];
wire wr_fifo_empty [NUM_DIMM];
wire wr_root_af [NUM_DIMM];
wire wr_wr_root_en [NUM_DIMM];
wire rd_wr_root_en [NUM_DIMM];
reg  wr_out_en [NUM_DIMM];
wire rd_fifo_empty [NUM_DIMM];
wire wr_rd_root_en [NUM_DIMM];
wire rd_rd_root_en [NUM_DIMM];                   
reg  rd_out_en [NUM_DIMM];
wire [RD_ID_WIDTH-1:0] fout_id[NUM_DIMM];
wire wr_dimm_en [NUM_DIMM];
wire [AWIDTH-DIMM_W-1:0] top_rd_address [NUM_DIMM];        
wire [BURST_CNT_W-1:0] top_rd_burstcount [NUM_DIMM];
wire [RD_ID_WIDTH-1:0] fout_rd_id [NUM_DIMM];  
wire [0:NUM_DIMM-1] id_af;      
wire [RD_WIDTH-1:0]rd_bank[NUM_DIMM];
logic [0:NUM_DIMM-1] data_af;          
wire [MWIDTH-1:0] rd_data [NUM_DIMM][P_NUM_RD_PORT]; 
reg  [MWIDTH-1:0] R_avm_readdata [P_NUM_RD_PORT];           
reg  R_avm_readdatavalid [P_NUM_RD_PORT];  
wire rd_data_valid [NUM_DIMM][P_NUM_RD_PORT];           
wire [0:NUM_DIMM-1] v_rd_data_en [P_NUM_RD_PORT]; 
wire [AWIDTH-DIMM_W-1:0] wr_ring_o_addr [NUM_DIMM];
wire [BURST_CNT_W-1:0] wr_ring_o_burstcount [NUM_DIMM];
wire [MWIDTH-1:0] wr_ring_o_writedata [NUM_DIMM];
wire [MWIDTH_BYTES-1:0] wr_ring_o_byteenable [NUM_DIMM]; 
reg  [PENDING_CNT_W-1:0] max_pending [NUM_DIMM];
reg  [BURST_CNT_W-1:0] wr_cnt [NUM_DIMM];
logic [0:NUM_DIMM-1] wr_done, wr_en, error_0, error_1;            
logic [0:NUM_DIMM-1] debug_bubble;                                                        
  
assign wr_request = wr_read | wr_write;
genvar z, z0;
generate  
  if(NUM_ID == 1) begin : GEN_SINGLE_PORT          
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
      assign o_avm_byteenable[z]    = (NUM_RD_PORT == 1)? '1 : i_wr_byteenable[0];  
      assign o_avm_address[z]       = (NUM_RD_PORT == 1)? i_rd_address[0][AWIDTH-DIMM_W-1:0]  : i_wr_address[0][AWIDTH-DIMM_W-1:0];
      assign o_avm_burstcount[z]    = (NUM_RD_PORT == 1)? i_rd_burstcount[0] : i_wr_burstcount[0];                  
      assign o_avm_writedata[z]     = i_wr_writedata[0];   
      assign o_id[z]                = START_ID;       
    end    
    assign o_avm_read[0]       = (NUM_RD_PORT == 1)? i_rd_request[0] & !i_rd_address[0][AWIDTH-1] : 1'b0;
    assign o_avm_write[0]      = (NUM_RD_PORT == 1)? 1'b0 : i_wr_request[0] & !i_wr_address[0][AWIDTH-1];       
    assign o_avm_read[1]       = (NUM_RD_PORT == 1)? i_rd_request[0] & i_rd_address[0][AWIDTH-1] : 1'b0;
    assign o_avm_write[1]      = (NUM_RD_PORT == 1)? 1'b0 : i_wr_request[0] & i_wr_address[0][AWIDTH-1];                
    assign o_rd_waitrequest[0] = i_avm_waitrequest[0] & !i_rd_address[0][AWIDTH-1] | i_avm_waitrequest[1] & i_rd_address[0][AWIDTH-1];
    assign o_wr_waitrequest[0] = i_avm_waitrequest[0] & !i_wr_address[0][AWIDTH-1] | i_avm_waitrequest[1] & i_wr_address[0][AWIDTH-1];
    assign rd_burstcount = i_rd_burstcount[0];     
    assign rd_o_id       = 1'b0;     
    assign rd_request    = (o_avm_read[0] | o_avm_read[1]) & !o_rd_waitrequest[0];    
    assign rd_address    = i_rd_address[0];                
    
  end
  else begin : GEN_MULTIPLE_PORT
    for(z=0; z<NUM_WR_PORT; z=z+1) begin : GEN_WR_DUMMY
      assign ic_read[z] = 1'b0;  
    end
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DUMMY
      assign ic_write[z] = 1'b0;  
    end
    
    if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD      
      lsu_n_token #(
         .AWIDTH(AWIDTH),       
         .MWIDTH_BYTES(MWIDTH_BYTES),
         .BURST_CNT_W(BURST_CNT_W),
         .NUM_PORT(NUM_RD_PORT),
         .START_ID(START_ID),      
         .OPEN_RING(!DISABLE_WR_RING & !ENABLE_DUAL_RING),
         .SINGLE_STALL((DISABLE_WR_RING | ENABLE_DUAL_RING) & ENABLE_DATA_REORDER), // wr_root_af is from the single ID FIFO; sw-dimm-partion has N ID FIFOs         
         .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),         
         .START_ACTIVE(1),
         .ENABLE_FAST(ENABLE_READ_FAST),
         .NUM_DIMM(NUM_DIMM),
         .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),
         .READ(1)
       ) rd_ring (
        .clk              (clk),
        .reset            (reset),
        .i_ext_read       (1'b0), 
        .i_avm_write      (ic_write),
        .i_token          (),
        .i_avm_address    (i_rd_address),
        .i_avm_read       (i_rd_request),
        .i_avm_burstcount (i_rd_burstcount),
        .i_avm_waitrequest(rd_waitrequest),
        .o_avm_waitrequest(o_rd_waitrequest),        
        .o_avm_address    (rd_address),
        .o_avm_read       (rd_request),
        .o_avm_burstcount (rd_burstcount),
        .o_token          (rd_o_token),
        .o_id             (rd_o_id)
      ); 
      
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_RD_SET  
        assign rd_rd_root_en[z] = !rd_out_en[z] | !i_avm_waitrequest[z] & !wr_en[z];          
        assign o_avm_read[z] = rd_out_en[z] & !wr_en[z];                            
  
        if(NUM_DIMM > 1) assign wr_rd_root_en[z] = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
        else assign wr_rd_root_en[z] = rd_request;        
  
        always @(posedge clk or posedge reset) begin
          if(reset)  rd_out_en[z] <= 1'b0;
          else if(rd_rd_root_en[z]) rd_out_en[z] <= !rd_fifo_empty[z] & !data_af[z];            
        end
        scfifo #(
          .add_ram_output_register ( "ON"),
          .intended_device_family (DEVICE),
          .lpm_numwords (RD_ROOT_FIFO_DEPTH),  
          .lpm_showahead ( "OFF"), 
          .lpm_type ( "scfifo"),
          .lpm_width (AWIDTH-DIMM_W+BURST_CNT_W),
          .lpm_widthu (RD_ROOT_FIFO_AW),  
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON"), 
          .almost_full_value(RD_ROOT_FIFO_DEPTH-5-NUM_RD_PORT*2)  
        ) rd_fifo (
          .clock (clk),
          .data ({rd_address[AWIDTH-DIMM_W-1:0],rd_burstcount}),
          .wrreq (wr_rd_root_en[z]),
          .rdreq (rd_rd_root_en[z] & !data_af[z]),  
          .empty (rd_fifo_empty[z]),
          .q ({top_rd_address[z],top_rd_burstcount[z]}),  
          .almost_full (rd_root_af[z]),
          .aclr (reset)
        );
       // wr_root_af to ring pipelined nodes  
       assign rd_waitrequest[z] = id_af[z]; 
      end            
    end //end if(NUM_RD_PORT > 0) begin : GEN_ENABLE_RD    
    else begin : GEN_DISABLE_RD
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DI
        assign o_avm_read[z] = 1'b0;
      end
    end // end GEN_DISABLE_RD   
    
    if(!DISABLE_WR_RING) begin : GEN_ENABLE_WRITE_RING   
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_WR_ROOT_FIFOS       
        assign o_avm_writedata[z] = wr_fout[z][MWIDTH-1:0];    
        assign {o_avm_byteenable[z], o_avm_address[z], o_avm_burstcount[z]} = o_avm_write[z]? wr_fout[z][WR_WIDTH-1:MWIDTH] : {{MWIDTH_BYTES{1'b1}},top_rd_address[z], top_rd_burstcount[z]}; 
        assign o_avm_write[z] = wr_out_en[z] & wr_en[z];
        
        assign rd_wr_root_en[z] = !wr_out_en[z] | !i_avm_waitrequest[z] & wr_en[z];   
        assign wr_done[z] = o_avm_write[z] & !i_avm_waitrequest[z] & wr_cnt[z] == wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH];       
       
        `ifdef SIM_ONLY // check bubble or error
          reg  [AWIDTH-DIMM_W-1:0] R_addr; 
          reg  not_wr_empty, not_rd_empty;
          reg  freeze_read, freeze_write;
          assign debug_bubble[z] = !i_avm_waitrequest[z] & (!o_avm_write[z] & not_wr_empty) & (!o_avm_read[z] & not_rd_empty); // check if there is switch bubble
          always @(posedge clk) begin 
            if(o_avm_write[z]) R_addr <= o_avm_address[z];
            not_wr_empty <= !wr_fifo_empty[z];
            not_rd_empty <= !rd_fifo_empty[z];     
            freeze_read <= i_avm_waitrequest[z] & o_avm_read[z];
            freeze_write <= i_avm_waitrequest[z] & o_avm_write[z];
            error_0[z] <= R_addr !== o_avm_address[z] & wr_cnt[z] < wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH] & wr_cnt[z] != 1 & (o_avm_read[z] | o_avm_write[z]) ; // switch to rd when wr has not finished
            error_1[z] <= freeze_read & !o_avm_read[z] | freeze_write & !o_avm_write[z] | o_avm_read[z] & o_avm_write[z];  // output request changes during i_avm_waitrequest                            
          end
        `endif

        always @(posedge clk or posedge reset) begin
          if(reset)  begin
            wr_out_en[z] <= 1'b0;
            wr_cnt[z] <= 1;   
            wr_en[z] <= 1'b0;
          end
          else begin                            
            if(rd_wr_root_en[z]) wr_out_en[z] <= !wr_fifo_empty[z];              
            if(o_avm_write[z] & !i_avm_waitrequest[z]) wr_cnt[z] <= (wr_cnt[z] == wr_fout[z][MWIDTH+BURST_CNT_W-1:MWIDTH])? 1 : wr_cnt[z] + 1'b1;
            if(wr_done[z]) wr_en[z] <= !wr_fifo_empty[z]; 
             else if((!wr_fifo_empty[z] | wr_out_en[z]) & !(i_avm_waitrequest[z] & o_avm_read[z])) wr_en[z] <= 1'b1;    
          end        
        end    
        
        scfifo #(
          .add_ram_output_register ( "ON"),
          .intended_device_family (DEVICE),
          .lpm_numwords (ROOT_FIFO_DEPTH),  
          .lpm_showahead ( "OFF"), 
          .lpm_type ( "scfifo"),
          .lpm_width (WR_WIDTH),
          .lpm_widthu (ROOT_FIFO_AW),  
          .overflow_checking ( "OFF"),
          .underflow_checking ( "ON"),
          .use_eab ( "ON"), 
          .almost_full_value(ROOT_FIFO_DEPTH-5-NUM_WR_PORT*2)  
        ) wr_fifo (
          .clock (clk),
          .data (wr_fin[z]),
          .wrreq (wr_wr_root_en[z]),
          .rdreq (rd_wr_root_en[z]),  
          .empty (wr_fifo_empty[z]),
          .q (wr_fout[z]),  
          .almost_full (wr_root_af[z]),
          .aclr (reset)
        );
      end // end GEN_WR_ROOT_FIFOS z-loop
      
      if(ENABLE_MULTIPLE_WR_RING_INT) begin : GEN_MULTIPLE_WR_RING
        wire [AWIDTH-DIMM_W-1:0] wr_ring_i_addr [NUM_WR_PORT];                     
        wire wr_ring_i_write [NUM_DIMM] [NUM_WR_PORT];        
        wire wr_ring_o_waitrequest [NUM_DIMM][NUM_WR_PORT];
        wire [0:NUM_DIMM-1] v_wr_stall [NUM_WR_PORT];    
        wire [0:NUM_DIMM-1] wr_accept [NUM_WR_PORT];            
        wire [WR_RING_ID_WIDTH-1:0] wr_o_id [NUM_DIMM];
        
        for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_STALL
          assign o_wr_waitrequest[z0] = |v_wr_stall[z0];
          assign wr_ring_i_addr[z0] = i_wr_address[z0][AWIDTH-DIMM_W-1:0];              
        end     
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
          wire wr_i_waitrequest [1];        
          assign wr_i_waitrequest[0] = wr_root_af[z];
          for(z0=0; z0<NUM_WR_PORT; z0=z0+1) begin : GEN_WR_ENABLE
            assign wr_ring_i_write[z][z0] = i_wr_request[z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;  
            assign v_wr_stall[z0][z] = wr_ring_o_waitrequest[z][z0] & i_wr_address[z0][AWIDTH-1:AWIDTH-DIMM_W] == z;
            assign wr_accept[z0][z] = wr_dimm_en[z] & wr_o_id[z] == z0;    
          end    
          lsu_n_token #(
             .AWIDTH(AWIDTH - DIMM_W),
             .MWIDTH_BYTES(MWIDTH_BYTES),
             .BURST_CNT_W(BURST_CNT_W),
             .NUM_PORT(NUM_WR_PORT),  
             .ID_WIDTH(WR_RING_ID_WIDTH),
             .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),            
             .OPEN_RING(0),
             .START_ACTIVE(1),
             .NUM_DIMM(1),
             .ENABLE_LAST_WAIT(0),
             .START_ID(0), 
             .READ(0)
           ) wr_ring (
            .clk              (clk),
            .reset            (reset),   
            .i_token          (1'b0),    
            .i_id             (),          
            .i_ext_address    (),
            .i_ext_read       (1'b0), 
            .i_ext_burstcount (),
            .o_ext_waitrequest(),
            .i_avm_byteenable (i_wr_byteenable),
            .i_avm_address    (wr_ring_i_addr),
            .i_avm_read       (ic_read),
            .i_avm_write      (wr_ring_i_write[z]),
            .i_avm_writedata  (i_wr_writedata),
            .i_avm_burstcount (i_wr_burstcount),
            .i_avm_waitrequest(wr_i_waitrequest), 
            .o_avm_waitrequest(wr_ring_o_waitrequest[z]),  
            .o_avm_byteenable (wr_ring_o_byteenable[z]),
            .o_avm_address    (wr_ring_o_addr[z]),
            .o_avm_read       (),
            .o_avm_write      (wr_dimm_en[z]),
            .o_avm_burstcount (wr_ring_o_burstcount[z]),
            .o_id             (wr_o_id[z]),     
            .o_token          (),         
            .o_avm_writedata  (wr_ring_o_writedata[z])
          );   
          assign wr_fin[z] = {   
            //wr_o_id[z],    
            wr_ring_o_byteenable[z],
            wr_ring_o_addr[z],               
            wr_ring_o_burstcount[z],
            wr_ring_o_writedata[z]            
          };
          assign wr_wr_root_en[z] = wr_dimm_en[z];                    
        end        
        // ------------------
        // Generate write ACK                
        // ------------------
        always @(posedge clk or posedge reset) begin
          if(reset) begin   
            for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= 1'b0;
          end
          else begin
            for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= |wr_accept[i];
          end  
        end // end always
      end
      else begin : GEN_SINGLE_WR_RING   
        lsu_n_token #(
           .AWIDTH(AWIDTH),
           .MWIDTH_BYTES(MWIDTH_BYTES),
           .BURST_CNT_W(BURST_CNT_W),
           .NUM_PORT(NUM_WR_PORT),  
           .ID_WIDTH(WR_RING_ID_WIDTH),
           .ENABLE_DATA_REORDER(ENABLE_DATA_REORDER),
           .OPEN_RING(NUM_RD_PORT > 0 & !ENABLE_DUAL_RING), 
           .START_ACTIVE(NUM_RD_PORT == 0 | ENABLE_DUAL_RING),
           .NUM_DIMM(NUM_DIMM),
           .ENABLE_LAST_WAIT(0),
           .START_ID(0), 
           .READ(0)
         ) wr_ring (
          .clk              (clk),
          .reset            (reset),   
          .i_token          (1'b0),    
          .i_id             (),      
          .i_ext_address    (),
          .i_ext_read       (1'b0), 
          .i_ext_burstcount (rd_burstcount),
          .o_ext_waitrequest(),
          .i_avm_byteenable (i_wr_byteenable),
          .i_avm_address    (i_wr_address),
          .i_avm_read       (ic_read),
          .i_avm_write      (i_wr_request),
          .i_avm_writedata  (i_wr_writedata),
          .i_avm_burstcount (i_wr_burstcount),
          .i_avm_waitrequest(wr_root_af), 
          .o_avm_waitrequest(o_wr_waitrequest),  
          .o_avm_byteenable (wr_byteenable),
          .o_avm_address    (wr_address),
          .o_avm_read       (wr_read),
          .o_avm_write      (wr_write),
          .o_avm_burstcount (wr_burstcount),
          .o_id             (wr_id),     
          .o_token          (),         
          .o_avm_writedata  (wr_writedata)
        );  
        for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_
          assign wr_fin[z] = {      
            //wr_id, 
            wr_byteenable,
            wr_address[AWIDTH-DIMM_W-1:0],               
            wr_burstcount,
            wr_writedata            
          };
          if(NUM_DIMM > 1) assign wr_wr_root_en[z] = wr_request & wr_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
          else assign wr_wr_root_en[z] = wr_request;      
        end         
        // ------------------
        // Generate write ACK                
        // ------------------
        always @(posedge clk or posedge reset) begin
          if(reset) begin   
            for(i=0; i<NUM_WR_PORT; i=i+1) o_avm_writeack[i] <= 1'b0;
          end
          else begin
            for(i=0; i<NUM_WR_PORT; i=i+1)  o_avm_writeack[i] <= wr_write & wr_id == i;                     
          end  
        end // end GEN_SINGLE_WR_RING        
      end  
    end // end GEN_ENABLE_WRITE_RING          
    else begin
      for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_   
        assign o_avm_write[z] = 1'b0;
        assign wr_en[z] = 1'b0;    
        assign {o_avm_byteenable[z], o_avm_address[z], o_avm_burstcount[z]} = {{MWIDTH_BYTES{1'b1}},top_rd_address[z], top_rd_burstcount[z]};      
      end
    end
  end  // end MULTIPLE PORTS
  wire [DIMM_W:0] to_avm_port_num;
  if(NUM_DIMM > 1) assign to_avm_port_num = rd_address[AWIDTH-1:AWIDTH-DIMM_W];
  else assign to_avm_port_num = 1'b0;         
      
  if(ENABLE_DATA_REORDER & NUM_RD_PORT > 0) begin : GEN_DATA_REORDER        
    lsu_rd_back_n #(
      .NUM_DIMM (NUM_DIMM),
      .NUM_RD_PORT (NUM_RD_PORT),
      .NUM_REORDER(NUM_REORDER_INT),
      .BURST_CNT_W (BURST_CNT_W),
      .MWIDTH (MWIDTH),
      .DATA_FIFO_DEPTH(RETURN_DATA_FIFO_DEPTH),
      .MAX_MEM_DELAY (MAX_MEM_DELAY),
      .PIPELINE (PIPELINE_RD_RETURN),
      .DEVICE (DEVICE)
    ) lsu_rd_back (
      .clk                (clk),
      .reset              (reset),
      .i_to_avm_port_num  (to_avm_port_num),
      .i_to_avm_burstcount(rd_burstcount),
      .i_to_avm_id        (rd_o_id),
      .i_to_avm_valid     (rd_request),   
      .i_data             (i_avm_readdata),
      .i_data_valid       (i_avm_return_valid),
      .o_data             (o_avm_readdata),
      .o_data_valid       (o_avm_readdatavalid),
      .o_rd_bank          (rd_bank),
      .o_id_af            (id_af[0])
    );   
    if(NUM_DIMM > 1) assign id_af[1:NUM_DIMM-1] = '0;      
    reg  [PENDING_CNT_W-1:0] pending_rd [NUM_DIMM];                  
    reg  [0:NUM_DIMM-1] R_o_avm_read;
    reg  [BURST_CNT_W-1:0]  R_o_avm_burstcnt [NUM_DIMM];   
    always @(posedge clk) begin
      for(i=0; i<NUM_DIMM; i=i+1) R_o_avm_burstcnt[i] <= o_avm_burstcount[i];                
    end
    always @(posedge clk or posedge reset) begin
      if(reset) begin
        for(i=0; i<NUM_DIMM; i=i+1) begin
          pending_rd[i] <= '0;
          max_pending[i] <= '0;
          data_af[i] <= 1'b0;      
          R_o_avm_read[i] <= 1'b0;            
        end                    
      end
      else begin        
        for(i=0; i<NUM_DIMM; i=i+1) begin    
          R_o_avm_read[i] <= o_avm_read[i] & !i_avm_waitrequest[i];          
          pending_rd[i] <= pending_rd[i] + (R_o_avm_burstcnt[i] & {BURST_CNT_W{R_o_avm_read[i]}}) - rd_bank[i];          
          data_af[i] <= pending_rd[i] >= (RETURN_DATA_FIFO_DEPTH - MAX_BURST * 5);
          `ifdef SIM_ONLY
            if(max_pending[i] < pending_rd[i]) max_pending[i] <= pending_rd[i];
          `endif          
        end
      end
    end          
  end
  else if(NUM_RD_PORT > 0) begin : GEN_DISABLE_DATA_REORDER    
    for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_RD_DOUT
      assign o_avm_readdata[z] = R_avm_readdata[z];  
      assign o_avm_readdatavalid[z] = R_avm_readdatavalid[z];  
    end
    always @(posedge clk) begin
      for(i=0; i<NUM_RD_PORT; i=i+1)  begin                       
        for(j=0; j<NUM_DIMM; j=j+1) if(rd_data_valid[j][i]) R_avm_readdata[i] <= rd_data[j][0];
        R_avm_readdatavalid[i] <= |v_rd_data_en[i];
      end      
    end
    
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_VALID
      wire to_avm_valid; 
      wire [MWIDTH-1:0] i_data [1];
      wire i_data_valid [1];
      assign data_af[z] = 1'b0;      
      for(z0=0; z0<NUM_RD_PORT; z0=z0+1)  begin : GEN_
        assign v_rd_data_en[z0][z] = rd_data_valid[z][z0]; 
      end     
      assign i_data[0] = i_avm_readdata[z];
      assign i_data_valid[0] = i_avm_return_valid[z];
      if(NUM_DIMM > 1) assign to_avm_valid = rd_request & rd_address[AWIDTH-1:AWIDTH-DIMM_W] == z;
      else assign to_avm_valid = rd_request;
      lsu_rd_back #(  
        .NUM_DIMM (1), // NUM_DIMM == 1 : reordering is disabled
        .NUM_RD_PORT (NUM_RD_PORT),
        .BURST_CNT_W (BURST_CNT_W),
        .MWIDTH (MWIDTH),
        .MAX_MEM_DELAY(MAX_MEM_DELAY),
        .PIPELINE (0),
        .DEVICE (DEVICE)
      ) lsu_rd_back(
        .clk                (clk),
        .reset              (reset),
        .i_to_avm_port_num  (),
        .i_to_avm_burstcount(rd_burstcount),
        .i_to_avm_id        (rd_o_id),
        .i_to_avm_valid     (to_avm_valid),
        .i_data             (i_data),   
        .i_data_valid       (i_data_valid),
        .o_id_af            (id_af[z]),
        .o_data             (rd_data[z]),        
        .o_data_valid       (rd_data_valid[z])      
      ); 
    end
  end
endgenerate
endmodule



// This module is used for sw-dimm-partiton. 
// It has two features: 
// [1] data reordering is disabled 
// [2] each load LSU has a counter to make sure bank switch is allowed to happen only when all the previous requests have returned.

module lsu_swdimm_token_ring (
  clk,
  reset,
  // from LSU
  i_rd_byteenable,
  i_rd_address, 
  i_rd_request,          
  i_rd_burstcount,  
  i_wr_byteenable,
  i_wr_address, 
  i_wr_request,          
  i_wr_burstcount,
  i_wr_writedata,  
  // from MEM
  i_avm_waitrequest,
  i_avm_readdata, 
  i_avm_return_valid,        
  // to MEM  
  o_id,              
  o_avm_byteenable,          
  o_avm_address,              
  o_avm_read,        
  o_avm_write,             
  o_avm_burstcount,
  o_avm_writedata,
  // to kernel
  o_rd_waitrequest,
  o_wr_waitrequest,
  o_avm_readdata,
  o_avm_readdatavalid,
  o_avm_writeack
);


parameter AWIDTH = 32;            
parameter MWIDTH_BYTES = 64;     
parameter BURST_CNT_W = 5;          
parameter NUM_RD_PORT = 2;
parameter NUM_WR_PORT = 2;
parameter NUM_DIMM = 1;
parameter DISABLE_ROOT_FIFO = 0;
parameter MAX_MEM_DELAY = 64;
parameter ENABLE_READ_FAST = 0;
parameter DEVICE =  "Stratix V";
parameter ROOT_FIFO_AW = 8;               // Token root FIFO address width; FIFO depth = 2**ROOT_FIFO_AW
parameter RD_ROOT_FIFO_AW = 7; 
parameter ENABLE_DUAL_RING = 0;   
parameter ENABLE_MULTIPLE_WR_RING = 0;
parameter ENABLE_LAST_WAIT = 0;


localparam MWIDTH=8*MWIDTH_BYTES;
localparam NUM_ID = NUM_RD_PORT+NUM_WR_PORT;
localparam NUM_DIMM_W = $clog2(NUM_DIMM);
localparam RD_ID_WIDTH = (NUM_RD_PORT==1)?  1 : $clog2(NUM_RD_PORT);
localparam WR_ID_WIDTH = (NUM_WR_PORT==1)?  1 : $clog2(NUM_WR_PORT);
localparam ID_WIDTH = (RD_ID_WIDTH > WR_ID_WIDTH)? RD_ID_WIDTH : WR_ID_WIDTH;
localparam CNT_WIDTH = 8;
// avoid modelsim compile error
localparam P_NUM_RD_PORT   = (NUM_RD_PORT > 0)?   NUM_RD_PORT   : 1;   
localparam P_NUM_WR_PORT   = (NUM_WR_PORT > 0)?   NUM_WR_PORT   : 1;   
   

input  clk;
input  reset;
// from LSU
input  [MWIDTH_BYTES-1:0] i_rd_byteenable [P_NUM_RD_PORT];
input  [AWIDTH-1:0] i_rd_address [P_NUM_RD_PORT]; 
input  i_rd_request [P_NUM_RD_PORT];          
input  [BURST_CNT_W-1:0] i_rd_burstcount [P_NUM_RD_PORT];  
input  [MWIDTH_BYTES-1:0] i_wr_byteenable [P_NUM_WR_PORT]; 
input  [AWIDTH-1:0] i_wr_address [P_NUM_WR_PORT];
input  i_wr_request [P_NUM_WR_PORT];         
input  [BURST_CNT_W-1:0] i_wr_burstcount [P_NUM_WR_PORT];
input  [MWIDTH-1:0] i_wr_writedata [P_NUM_WR_PORT];
// from MEM
input  i_avm_waitrequest [NUM_DIMM];             
input  [MWIDTH-1:0] i_avm_readdata [NUM_DIMM];            
input  i_avm_return_valid [NUM_DIMM];                   
// to MEM                
output  [ID_WIDTH-1:0] o_id [NUM_DIMM];
output  [MWIDTH_BYTES-1:0] o_avm_byteenable [NUM_DIMM];            
output  [AWIDTH-NUM_DIMM_W-1:0] o_avm_address [NUM_DIMM];                
output  o_avm_read [NUM_DIMM];                   
output  o_avm_write [NUM_DIMM];                          
output  [BURST_CNT_W-1:0] o_avm_burstcount [NUM_DIMM];  
output  [MWIDTH-1:0] o_avm_writedata [NUM_DIMM];  
// to kernel
output  o_rd_waitrequest [P_NUM_RD_PORT]; 
output  o_wr_waitrequest [P_NUM_WR_PORT]; 
output  [MWIDTH-1:0] o_avm_readdata [P_NUM_RD_PORT];     
output  o_avm_readdatavalid [P_NUM_RD_PORT]; 
output  o_avm_writeack [P_NUM_WR_PORT];

integer i, j;
wire  i_read  [P_NUM_RD_PORT];  
wire  to_lsu_rd_waitrequest [P_NUM_RD_PORT];
wire  avm_read [NUM_DIMM]; 

// dimm switch guard
wire [0:NUM_RD_PORT-1] rd_accept;
wire [0:NUM_RD_PORT-1] switch_wait;
reg  [CNT_WIDTH-1:0] pending_rd [P_NUM_RD_PORT];      
reg  [0:NUM_RD_PORT-1] pending_af; 
reg  [NUM_DIMM_W-1:0] pending_dimm_num [P_NUM_RD_PORT];           
reg  [0:NUM_RD_PORT-1]  wait_rd;

// read back data
wire id_af [NUM_DIMM]; 
wire ring_i_stall [NUM_DIMM]; 
reg  [MWIDTH-1:0] rd_data [NUM_DIMM];                   
      

wire avm_writeack [NUM_DIMM][P_NUM_WR_PORT];
wire [0:NUM_DIMM-1] v_avm_writeack [P_NUM_WR_PORT];
reg [0:NUM_DIMM-1] R_valid;

always @(posedge clk) begin
  for(i=0; i<NUM_DIMM; i=i+1) rd_data[i] <= i_avm_readdata[i];
  for(i=0; i<NUM_RD_PORT; i=i+1) begin
    if(rd_accept[i]) pending_dimm_num[i] <= i_rd_address[i][AWIDTH-1:AWIDTH-NUM_DIMM_W];
  end
end   

genvar z, z0;
generate    
  for(z=0; z<NUM_RD_PORT; z=z+1) begin : GEN_MERGE_RD        
    assign i_read[z] = i_rd_request[z] & !switch_wait[z];        
    assign o_rd_waitrequest[z] = to_lsu_rd_waitrequest[z] | switch_wait[z];           
    assign rd_accept[z] = i_rd_request[z] & !o_rd_waitrequest[z];    
    assign switch_wait[z] = wait_rd[z] & pending_dimm_num[z] !== i_rd_address[z][AWIDTH-1:AWIDTH-NUM_DIMM_W] | pending_af[z];// may not need pending_af    
  end
endgenerate

lsu_token_ring #(
   .AWIDTH(AWIDTH),
   .MWIDTH_BYTES(MWIDTH_BYTES),
   .BURST_CNT_W(BURST_CNT_W),
   .NUM_RD_PORT(NUM_RD_PORT),
   .NUM_WR_PORT(NUM_WR_PORT),
   .NUM_DIMM(NUM_DIMM),
   .DEVICE(DEVICE),  
   .MAX_MEM_DELAY(MAX_MEM_DELAY),     
   .ENABLE_LAST_WAIT(ENABLE_LAST_WAIT),    
   .ENABLE_DUAL_RING(ENABLE_DUAL_RING),
   .ENABLE_MULTIPLE_WR_RING(ENABLE_MULTIPLE_WR_RING),
   .ROOT_FIFO_AW(ROOT_FIFO_AW),
   .RD_ROOT_FIFO_AW(RD_ROOT_FIFO_AW),
   .ENABLE_READ_FAST(ENABLE_READ_FAST),
   .DISABLE_ROOT_FIFO(DISABLE_ROOT_FIFO)
 ) lsu_token_ring (
  .clk              (clk),
  .reset            (reset),
  .i_rd_byteenable  (i_rd_byteenable),
  .i_rd_address     (i_rd_address),
  .i_rd_request     (i_read),
  .i_rd_burstcount  (i_rd_burstcount),
  .i_wr_byteenable  (i_wr_byteenable),
  .i_wr_address     (i_wr_address),
  .i_wr_request     (i_wr_request),
  .i_wr_burstcount  (i_wr_burstcount),
  .i_wr_writedata   (i_wr_writedata),
  .i_avm_waitrequest(i_avm_waitrequest),
  .i_avm_readdata   (i_avm_readdata),
  .i_avm_return_valid(i_avm_return_valid),
  .o_avm_byteenable (o_avm_byteenable),
  .o_avm_address    (o_avm_address),
  .o_avm_read       (o_avm_read),
  .o_avm_write      (o_avm_write),
  .o_avm_burstcount (o_avm_burstcount),
  .o_avm_writedata  (o_avm_writedata),
  .o_avm_readdata   (o_avm_readdata),
  .o_avm_readdatavalid(o_avm_readdatavalid),
  .o_id             (o_id),
  .o_avm_writeack   (o_avm_writeack),
  .o_rd_waitrequest (to_lsu_rd_waitrequest),
  .o_wr_waitrequest (o_wr_waitrequest)
);


// ----------------------------
// Generate read pending count   
// ----------------------------   
always @(posedge clk or posedge reset) begin
  if(reset) begin
    for(i=0; i<NUM_RD_PORT; i=i+1)  begin
      pending_rd[i] <= 0;
      wait_rd[i] <= 1'b0;
      pending_af[i] <= 1'b0;
    end
  end
  else begin          
    for(i=0; i<NUM_RD_PORT; i=i+1) begin
      pending_af[i] <= pending_rd[i][CNT_WIDTH-1];
      case({rd_accept[i], o_avm_readdatavalid[i]})         
        2'b01: begin pending_rd[i] <= pending_rd[i] - 1'b1;                       wait_rd[i] <= pending_rd[i] > 1; end   
        2'b10: begin pending_rd[i] <= pending_rd[i] + i_rd_burstcount[i];         wait_rd[i] <= 1'b1; end
        2'b11: begin pending_rd[i] <= pending_rd[i] + i_rd_burstcount[i] - 1'b1;  wait_rd[i] <= 1'b1; end
      endcase           
    end       
  end  
end

endmodule




// Burst interleaved style needs to handle two problems:
//  1) Data is returned in a different bank order than the order in which
//     the banks were issued.
//  2) Multiple data words arrive in the same cycle (from different banks).
//
// This module solves the problem by storing data from different banks in seperate RAMs, and 
// only one RAM's data is sent to LSUs in every clock cycle according to the request order that is buffered.
// Considering the memory bandwidth is data_width x N banks, and one data reordering block sends 
// data_width bits per clock cycle, it might not saturate the available bandwidth. Therefore, 
// module lsu_rd_back_n allows multiple data reordering blocks to be instantiated by setting the
// parameter NUM_REORDER.

module lsu_rd_back_n (
  clk,
  reset,
  // from LSU to MEM  
  i_to_avm_port_num,
  i_to_avm_burstcount,
  i_to_avm_id,
  i_to_avm_valid,  
  // from MEM to LSU
  i_data,
  i_data_valid,
  // to Kernel LSUs
  o_data,
  o_data_valid,
  // ID FIFO status
  o_id_af,
  // data FIFO status, used to stall input requests from LSUs
  o_rd_bank
);

parameter NUM_DIMM = 1;
parameter NUM_RD_PORT = 1;
parameter ID_WIDTH = $clog2(NUM_RD_PORT);  
parameter BURST_CNT_W = 1;
parameter MWIDTH = 512;
parameter MAX_MEM_DELAY = 64; 
parameter DATA_FIFO_DEPTH = 64; 
parameter PIPELINE = 0;
parameter NUM_REORDER = 2;
parameter DEVICE =  "Stratix V";

localparam REMAINDER = NUM_RD_PORT%NUM_REORDER;
localparam NUM_PORT_PER = NUM_RD_PORT/NUM_REORDER;
localparam NUM_PORT_LAST = NUM_PORT_PER + REMAINDER;
localparam NUM_DIMM_W = $clog2(NUM_DIMM);       
localparam PORT_FIFO_WIDTH = NUM_DIMM_W + BURST_CNT_W + ID_WIDTH;
localparam MAX_BURST = 2**(BURST_CNT_W-1);
localparam THRESHOLD = DATA_FIFO_DEPTH - MAX_BURST * 4;
localparam FIFO_AW = $clog2(DATA_FIFO_DEPTH);
localparam P_ID_WIDTH = (ID_WIDTH == 0)? 1 : ID_WIDTH;
localparam PORT_NUM_DEPTH = MAX_MEM_DELAY;
localparam PORT_NUM_AW = $clog2(PORT_NUM_DEPTH);
localparam P_NUM_DIMM_W = (NUM_DIMM_W == 0)? 1 :NUM_DIMM_W;
localparam RD_WIDTH = (NUM_REORDER == 1)? 1 :$clog2(NUM_PORT_LAST+1);
parameter  FIFO_AF_THRESH = PORT_NUM_DEPTH - 5 - 2*NUM_RD_PORT;



input clk;
input reset;
input [P_NUM_DIMM_W-1:0] i_to_avm_port_num;
input [BURST_CNT_W-1:0] i_to_avm_burstcount;
input [P_ID_WIDTH-1:0] i_to_avm_id;
input i_to_avm_valid;
input [MWIDTH-1:0] i_data [NUM_DIMM];
input i_data_valid [NUM_DIMM];
output reg [MWIDTH-1:0] o_data [NUM_RD_PORT] /* synthesis syn_preserve = 1 */;   
output reg o_data_valid  [NUM_RD_PORT];
output [RD_WIDTH-1:0] o_rd_bank [NUM_DIMM];
output o_id_af;

genvar z, z0;
generate
  if(NUM_REORDER == 1) begin : GEN_SINGLE_REORDER
    wire [NUM_DIMM-1:0] rd_bank;
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_RD
      assign o_rd_bank[z][0] = rd_bank[z];
    end
    lsu_rd_back #(
      .NUM_DIMM (NUM_DIMM),
      .NUM_RD_PORT (NUM_RD_PORT),
      .BURST_CNT_W (BURST_CNT_W),
      .ID_WIDTH(ID_WIDTH),
      .MWIDTH (MWIDTH),    
      .DATA_FIFO_DEPTH(DATA_FIFO_DEPTH),
      .MAX_MEM_DELAY (MAX_MEM_DELAY),
      .PIPELINE (PIPELINE),
      .DEVICE (DEVICE)
    ) lsu_rd_back (
      .clk                (clk),
      .reset              (reset),
      .i_to_avm_port_num  (i_to_avm_port_num),
      .i_to_avm_burstcount(i_to_avm_burstcount),
      .i_to_avm_id        (i_to_avm_id),
      .i_to_avm_valid     (i_to_avm_valid),   
      .i_data             (i_data),
      .i_data_valid       (i_data_valid),
      .o_data             (o_data),
      .o_data_valid       (o_data_valid),
      .o_id_af            (o_id_af),
      .o_rd_bank          (rd_bank) 
    );       
  end
  else begin : GEN_N_REORDER
    wire [0:NUM_REORDER-1] i_group_en;
    wire [NUM_DIMM-1:0] id_af;
    wire [NUM_REORDER-1:0] af; 
    wire [NUM_DIMM-1:0] rd_bank [NUM_REORDER];      
    wire goup_i_data_en [NUM_REORDER][NUM_DIMM];   
    wire [0:NUM_REORDER-1] o_group_en [NUM_DIMM];    
    wire [MWIDTH-1:0] group_o_data [NUM_REORDER][NUM_RD_PORT];
    wire group_o_data_en [NUM_REORDER][NUM_RD_PORT];    
    logic [RD_WIDTH-1:0] sum [NUM_DIMM];
    integer i, j;
    // bit add
    always @(*) begin      
      for(i=0; i<NUM_DIMM; i=i+1) begin
        sum[i] = '0;     
        for(j=0; j<NUM_REORDER; j=j+1) begin          
          sum[i] += rd_bank[j][i];
        end
      end
    end 
    assign o_rd_bank = sum;  
    for(z=0; z<NUM_REORDER; z=z+1) begin : GEN_DATA_REORDER         
      if(z < NUM_REORDER-1) begin        
        assign i_group_en[z] = i_to_avm_id >= z*NUM_PORT_PER & i_to_avm_id < (z+1)*NUM_PORT_PER;
        for(z0=0; z0<NUM_PORT_PER; z0=z0+1) begin :  GEN_
          assign o_data[z*NUM_PORT_PER+z0] = group_o_data[z][z*NUM_PORT_PER+z0];
          assign o_data_valid[z*NUM_PORT_PER+z0] = group_o_data_en[z][z*NUM_PORT_PER+z0];
        end
      end
      else begin
        assign i_group_en[z] = i_to_avm_id >= z*NUM_PORT_PER & i_to_avm_id < NUM_RD_PORT; 
        for(z0=0; z0<NUM_PORT_LAST; z0=z0+1) begin :  GEN_
          assign o_data[z*NUM_PORT_PER+z0] = group_o_data[z][z*NUM_PORT_PER+z0];
          assign o_data_valid[z*NUM_PORT_PER+z0] = group_o_data_en[z][z*NUM_PORT_PER+z0];
        end
      end
      for(z0=0; z0<NUM_DIMM; z0=z0+1) begin : GEN_DATA_VALID 
        assign goup_i_data_en[z][z0] = i_data_valid[z0] & o_group_en[z0][z];
      end      
      assign o_id_af = |{af, id_af};
      
      lsu_rd_back #(
        .NUM_DIMM (NUM_DIMM),
        .NUM_RD_PORT (NUM_RD_PORT),
        .BURST_CNT_W (BURST_CNT_W),
        .ID_WIDTH(ID_WIDTH),
        .MWIDTH (MWIDTH),
        .DATA_FIFO_DEPTH(DATA_FIFO_DEPTH),
        .MAX_MEM_DELAY (MAX_MEM_DELAY),
        .PIPELINE (PIPELINE),
        .DEVICE (DEVICE)
      ) lsu_rd_back (
        .clk                (clk),
        .reset              (reset),
        .i_to_avm_port_num  (i_to_avm_port_num),
        .i_to_avm_burstcount(i_to_avm_burstcount),
        .i_to_avm_id        (i_to_avm_id),
        .i_to_avm_valid     (i_group_en[z] & i_to_avm_valid),   
        .i_data             (i_data),
        .i_data_valid       (goup_i_data_en[z]),
        .o_data             (group_o_data[z]),
        .o_data_valid       (group_o_data_en[z]),
        .o_id_af            (af[z]),
        .o_rd_bank          (rd_bank[z]) 
      );       
    end // end GEN_DATA_REORDER
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_GROUP_INFO_FIFO
      wire [BURST_CNT_W-1:0] rd_burstcount;
      reg  [BURST_CNT_W-1:0] cnt;
      wire rd_group_info, empty;
      reg  fout_valid;      
      assign rd_group_info = !fout_valid | i_data_valid[z] & rd_burstcount == cnt;
      
      always @(posedge clk or posedge reset) begin
        if(reset) begin
          fout_valid <= 1'b0;
          cnt <= '0;
        end
        else begin
          if(rd_group_info & !empty) fout_valid <= 1'b1;
          else if(i_data_valid[z] & empty & rd_burstcount == cnt)   fout_valid <= 1'b0;  
          if(rd_group_info & !empty)cnt <= 1;
          else if(i_data_valid[z] & cnt < rd_burstcount) cnt <= cnt + 1;   
        end
      end
      
      scfifo #(
        .add_ram_output_register ( "ON"),
        .intended_device_family ( DEVICE),
        .lpm_numwords (PORT_NUM_DEPTH),  
        .lpm_widthu (PORT_NUM_AW),
        .lpm_showahead ( "OFF"),
        .lpm_type ( "scfifo"),
        .lpm_width (NUM_REORDER+BURST_CNT_W),
        .almost_full_value(FIFO_AF_THRESH),
        .overflow_checking ( "OFF"),
        .underflow_checking ( "ON"),
        .use_eab ( "ON")
      ) group_info_fifo (
        .clock (clk),
        .data ({i_group_en, i_to_avm_burstcount}), 
        .wrreq (i_to_avm_valid & i_to_avm_port_num == z),
        .rdreq (rd_group_info),  
        .empty (empty), 
        .almost_full(id_af[z]), 
        .q ({o_group_en[z], rd_burstcount}),
        .aclr (reset)
      ); 
    end // end GEN_GROUP_INFO_FIFO      
  end
endgenerate


endmodule



// This module does data reordering for load LSUs
// Need to handle the two problems:
//  1) Data is returned in a different bank order than the order in which
//     the banks were issued.
//  2) Multiple data words arrive in the same cycle (from different banks).

module lsu_rd_back (
  clk,
  reset,
  // from LSU to MEM  
  i_to_avm_port_num,
  i_to_avm_burstcount,
  i_to_avm_id,
  i_to_avm_valid,  
  // from MEM to LSU
  i_data,
  i_data_valid,
  // to Kernel LSUs
  o_data,
  o_data_valid,
  // read data FIFO
  o_rd_bank,
  // ID FIFO status
  o_id_af
);

parameter NUM_DIMM = 1;
parameter NUM_RD_PORT = 1;
parameter ID_WIDTH = $clog2(NUM_RD_PORT);  
parameter BURST_CNT_W = 1;
parameter MWIDTH = 512;
parameter MAX_MEM_DELAY = 64; 
parameter DATA_FIFO_DEPTH = 64; 
parameter PIPELINE = 0;
parameter DEVICE =  "Stratix V";


localparam NUM_DIMM_W = $clog2(NUM_DIMM);       
localparam PORT_FIFO_WIDTH = NUM_DIMM_W + BURST_CNT_W + ID_WIDTH;
localparam MAX_BURST = 2**(BURST_CNT_W-1);
localparam THRESHOLD = DATA_FIFO_DEPTH - MAX_BURST * 4;
localparam FIFO_AW = $clog2(DATA_FIFO_DEPTH);
localparam P_ID_WIDTH = (ID_WIDTH == 0)? 1 : ID_WIDTH;
localparam PORT_NUM_DEPTH = MAX_MEM_DELAY;
localparam PORT_NUM_AW = $clog2(PORT_NUM_DEPTH);
localparam P_NUM_DIMM_W = (NUM_DIMM_W == 0)? 1 :NUM_DIMM_W;

parameter  FIFO_AF_THRESH = PORT_NUM_DEPTH - 5 - 2*NUM_RD_PORT;


input clk;
input reset;
input [P_NUM_DIMM_W-1:0] i_to_avm_port_num;
input [BURST_CNT_W-1:0] i_to_avm_burstcount;
input [P_ID_WIDTH-1:0] i_to_avm_id;
input i_to_avm_valid;
input [MWIDTH-1:0] i_data [NUM_DIMM];
input i_data_valid [NUM_DIMM];
output reg [MWIDTH-1:0] o_data [NUM_RD_PORT] /* synthesis syn_preserve = 1 */;   
output reg o_data_valid  [NUM_RD_PORT];
output reg [NUM_DIMM-1:0] o_rd_bank;
output o_id_af;


integer i;
genvar z;
wire [PORT_FIFO_WIDTH-1:0] fin, fout;
wire rd_port_num;
wire port_num_empty;
wire [P_NUM_DIMM_W-1:0] port_num;
wire [BURST_CNT_W-1:0] rd_burstcount;
reg  [BURST_CNT_W-1:0] cnt;
wire [ID_WIDTH-1:0] return_id;
wire [NUM_DIMM-1:0] rd_data_en, data_empty;
wire [MWIDTH-1:0] data_out [NUM_DIMM];
reg  R_rd_port_num;
reg  [P_NUM_DIMM_W-1:0] R_port_num;
reg  [ID_WIDTH-1:0] R_id;
reg  [MWIDTH-1:0] data_to_ic;
reg  data_to_ic_en;
reg  [BURST_CNT_W-1:0] R_o_avm_burstcnt;
reg  port_num_valid;
reg  data_out_valid;
reg  [0:NUM_RD_PORT-1] data_id_en [NUM_RD_PORT];
wire id_af;
wire [0:NUM_DIMM-1] data_overflow;

      
assign o_id_af = id_af;

// to avoid 'X' in datapath in simulation
initial begin
  for(i=0; i<NUM_RD_PORT; i=i+1) begin   
    data_id_en[i] = 0;
    o_data_valid[i] = 0;
  end
end

always @(posedge clk) begin
  R_port_num <= port_num;
  R_id <= return_id; // return_id is aligned with port_num; R_id ~ R_port_num
  data_to_ic <= (NUM_DIMM == 1)? i_data[0] : data_out[R_port_num]; 
  R_o_avm_burstcnt <= i_to_avm_burstcount;     
  `ifdef SIM_ONLY
  if(data_overflow) begin
    $display("data overflow");
    $stop;
  end
  `endif
end   

always @(posedge clk or posedge reset) begin
  if(reset) begin
    data_to_ic_en <= 1'b0;
    R_rd_port_num <= 1'b0;
    port_num_valid <= 1'b0;
    data_out_valid <= 1'b0;
    o_rd_bank <= 0; 
  end
  else begin
    data_out_valid <= !data_empty[port_num];
    data_to_ic_en <= data_out_valid;
    R_rd_port_num <= rd_port_num & !port_num_empty;
    if(NUM_DIMM == 1)begin
      if(rd_port_num & !port_num_empty) port_num_valid <= 1'b1;
      else if(i_data_valid[0] & port_num_empty & rd_burstcount == cnt)   port_num_valid <= 1'b0;     
      if(rd_port_num & !port_num_empty)cnt <= 1;
      else if(i_data_valid[0] & cnt < rd_burstcount) cnt <= cnt + 1;          
    end
    else begin 
      if(rd_port_num & !port_num_empty) port_num_valid <= 1'b1;
      else if(!data_empty[port_num] & port_num_empty & rd_burstcount == cnt)   port_num_valid <= 1'b0;  
      if(rd_port_num & !port_num_empty)cnt <= 1;
      else if(!data_empty[port_num] & cnt < rd_burstcount) cnt <= cnt + 1;   
    end       
    
    for(i=0; i<NUM_DIMM; i=i+1)  begin 
      o_rd_bank[i] <= rd_data_en[i] & !data_empty[i];      
    end           
  end
end

generate
  if(PIPELINE) begin : GEN_PENDING_DATA
    always @(posedge clk) begin
      o_data[NUM_RD_PORT-1] <= data_to_ic; 
      for(i=0; i<NUM_RD_PORT-1; i=i+1) begin
        o_data[i] <= o_data[i+1];
      end
    end
    always @(posedge clk or posedge reset) begin
      if(reset) begin
        for(i=0; i<NUM_RD_PORT; i=i+1) begin
          o_data_valid[i] <= 1'b0;
          data_id_en[i] <= 0;
        end
      end
      else begin     
        if(NUM_RD_PORT > 1) begin     
          for(i=0; i<NUM_RD_PORT; i=i+1) begin          
            data_id_en[NUM_RD_PORT-1][i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : (data_out_valid & R_id == i);// data_id_en[0] is aligned with data_to_ic
            if(i<NUM_RD_PORT-1) data_id_en[i] <= data_id_en[i+1];
            o_data_valid[i] <= data_id_en[i][i];
          end
        end
        else begin
          data_id_en[0][0] <=  (NUM_DIMM == 1)? i_data_valid[0] : data_out_valid;            
          o_data_valid[0] <= data_id_en[0][0];
        end
      end
    end
  end // end GEN_PENDING_DATA
  else begin : GEN_FAST_DATA
    always @(posedge clk) begin
      for(i=0; i<NUM_RD_PORT; i=i+1) begin
        o_data[i] <= (NUM_DIMM == 1)? i_data[0] : data_to_ic;
      end
    end
    always @(posedge clk or posedge reset) begin
     if(reset) begin
        for(i=0; i<NUM_RD_PORT; i=i+1) begin
          o_data_valid[i] <= 1'b0;
          data_id_en[i] <= 0;
       end
      end
      else begin  
        if(NUM_RD_PORT > 1) begin           
         for(i=0; i<NUM_RD_PORT; i=i+1)  begin // data_id_en[0] is aligned with data_to_ic
            data_id_en[0][i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : (data_out_valid & R_id == i);// data_id_en[0] is aligned with data_to_ic
            o_data_valid[i] <= (NUM_DIMM == 1)? (i_data_valid[0] & return_id == i) : data_id_en[0][i];
         end
        end
        else begin
          data_id_en[0][0] <=  (NUM_DIMM == 1)? i_data_valid[0] : data_out_valid;            
          o_data_valid[0] <= (NUM_DIMM == 1)? i_data_valid[0] : data_id_en[0][0];
        end      
      end
    end
  end
 
  
  if(NUM_DIMM == 1) begin : GEN_SINGLE_DIMM
    assign rd_port_num = !port_num_valid | i_data_valid[0] & (rd_burstcount == cnt);
    assign fin = (ID_WIDTH == 0)? i_to_avm_burstcount : {i_to_avm_burstcount, i_to_avm_id};   
    assign return_id = fout[P_ID_WIDTH-1:0];  
    assign rd_burstcount = fout[PORT_FIFO_WIDTH-1:ID_WIDTH];  
  end
  else begin : GEN_MULTIPLE_DIMM
    assign rd_port_num = !port_num_valid | !data_empty[port_num] & (rd_burstcount == cnt);
    assign fin = (ID_WIDTH == 0)? {i_to_avm_port_num[NUM_DIMM_W-1:0], i_to_avm_burstcount} : {i_to_avm_port_num[NUM_DIMM_W-1:0], i_to_avm_burstcount, i_to_avm_id};
    assign return_id = fout[P_ID_WIDTH-1:0];  
    assign rd_burstcount = fout[ID_WIDTH+BURST_CNT_W-1:ID_WIDTH];    
    assign port_num = fout[PORT_FIFO_WIDTH-1:PORT_FIFO_WIDTH-NUM_DIMM_W];    
    
    for(z=0; z<NUM_DIMM; z=z+1) begin : GEN_DATA_FIFO
      assign rd_data_en[z] = port_num == z[NUM_DIMM_W-1:0];             
      
      scfifo #(
        .add_ram_output_register ( "ON"),
        .intended_device_family ( DEVICE),
        .lpm_numwords (DATA_FIFO_DEPTH),  
        .lpm_widthu (FIFO_AW),
        .lpm_showahead ( "OFF"),
        .lpm_type ( "scfifo"),
        .lpm_width (MWIDTH),
        .overflow_checking ( "OFF"),
        .underflow_checking ( "ON"),
        .use_eab ( "ON")
      ) return_data_fifo (
        .clock (clk),
        .data (i_data[z]), 
        .wrreq (i_data_valid[z]),
        .rdreq (rd_data_en[z]),  
        .empty (data_empty[z]), 
        .q (data_out[z]),
        .full(data_overflow[z]),
        .aclr (reset)
      );    
    end
  end
endgenerate


scfifo #(
  .add_ram_output_register ( "ON"),
  .intended_device_family ( DEVICE),
  .lpm_numwords (PORT_NUM_DEPTH),  
  .lpm_widthu (PORT_NUM_AW),
  .lpm_showahead ( "OFF"),
  .lpm_type ( "scfifo"),
  .lpm_width (PORT_FIFO_WIDTH),
  .almost_full_value(FIFO_AF_THRESH),
  .overflow_checking ( "OFF"),
  .underflow_checking ( "ON"),
  .use_eab ( "ON")
) port_num_fifo (
  .clock (clk),
  .data (fin), 
  .wrreq (i_to_avm_valid),
  .rdreq (rd_port_num),  
  .empty (port_num_empty), 
  .almost_full(id_af),
  .q (fout),
  .aclr (reset)
);       
endmodule


module debug_io_cnt #(
  parameter WIDTH = 1
)(        
  input rst,
  input clk,
  input [WIDTH-1:0] i_0,
  input [WIDTH-1:0] i_1,
  output reg [31:0] o_cnt_0,
  output reg [31:0] o_cnt_1,
  output reg        o_mismatch,
  output reg [15:0] o_mismatch_cnt
);            

always @(posedge clk or posedge rst) begin
  if(rst) begin
    o_cnt_0        <= '0;             
    o_cnt_1        <= '0;             
    o_mismatch_cnt <= '0;        
    o_mismatch <= '0;     
  end
  else begin       
    o_cnt_0    <= o_cnt_0 + i_0;        
    o_cnt_1    <= o_cnt_1 + i_1;        
    if(o_cnt_0 == o_cnt_1) o_mismatch_cnt <= '0;   
    else if(!(&o_mismatch_cnt)) o_mismatch_cnt <= o_mismatch_cnt + 1;
    o_mismatch <= |o_mismatch_cnt;
  end
end
endmodule

