// (C) 1992-2014 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    


module acl_fp_custom_fptoint(clock, resetn, data, result, valid_in, valid_out, stall_in, stall_out, enable);

  input clock, resetn;
  input [31:0] data;
  output [31:0] result;
  input valid_in, stall_in, enable;
  output valid_out, stall_out;
  
  parameter HIGH_CAPACITY = 1;
  parameter HIGH_LATENCY = 0;
  parameter SIGNED_INT = 1;
  
  // Cycle 1 - Determine how much to shift data by.
  reg [4:0] c1_shift;
  reg [31:0] c1_integer;
  reg c1_sign;
  reg c1_valid;
  reg [8:0] c1_exp_diff;

  wire c1_stall;  
  wire c1_enable = (HIGH_CAPACITY == 1) ? (~c1_valid | ~c1_stall) : enable;
  assign stall_out = c1_valid & c1_stall;
  
  always@(*)
    if (SIGNED_INT == 1)
       c1_exp_diff = 9'd157 - {1'b0, data[30:23]};
    else
       c1_exp_diff = 9'd158 - {1'b0, data[30:23]};
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c1_valid <= 1'b0;
      c1_shift <= 5'dx;
      c1_integer <= 32'dx;
      c1_sign <= 1'bx;      
    end
    else if (c1_enable)
    begin
      c1_valid <= valid_in;
      c1_shift <= c1_exp_diff[8] ? 5'd0 : c1_exp_diff[4:0];
        
      if (SIGNED_INT == 1)
      begin
        if (c1_exp_diff[8]) // Maximum value as returned by CPU. Note that for +/-infinity it returns a maximum negative number.
          c1_integer <= 32'h80000000;
        else if (|c1_exp_diff[7:5])
          c1_integer <= 32'd0;
        else
          c1_integer <= {1'b0, 1'b1, data[22:0], 7'd0};
      end
      else
      begin
        if (&data[30:23])
        begin
          // For unsigned values, the result of an infinity is zero on a CPU (both for positive and negative inf).
          c1_integer <= 32'd0;
        end
        else if (c1_exp_diff[8])
        begin
          // For unsigned values, set the maximum value to 0xffffffff, although the behaviour outside of representable range is not specified.
          c1_integer <= 32'hffffffff;
        end
        else if (|c1_exp_diff[7:5])
          c1_integer <= 32'd00000000;
        else
          c1_integer <= {1'b1, data[22:0], 8'd0};
      end
      c1_sign <= data[31];      
    end
  end
  
  // Cycle 2 - shift by 24, 16, 8, or 0 to the right.
  reg [2:0] c2_shift;
  reg [31:0] c2_integer;
  reg c2_sign;
  reg c2_valid;  
  wire c2_stall;  
  wire c2_enable = (HIGH_CAPACITY == 1) ? (~c2_valid | ~c2_stall) : enable;
  assign c1_stall = c2_valid & c2_stall;
  
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c2_valid <= 1'b0;
      c2_shift <= 3'dx;
      c2_integer <= 32'dx;
      c2_sign <= 1'bx;      
    end
    else if (c2_enable)
    begin
      c2_valid <= c1_valid;
      c2_shift <= c1_shift[2:0];
      case(c1_shift[4:3])
        2'b11: c2_integer <= {24'd0, c1_integer[31:24]};
        2'b10: c2_integer <= {16'd0, c1_integer[31:16]};
        2'b01: c2_integer <= {8'd0, c1_integer[31:8]};
        2'b00: c2_integer <= c1_integer;
      endcase
      c2_sign <= c1_sign;      
    end
  end

  // Cycle 3 - shift by 6, 4, 2 or 0 to the right.
  reg c3_shift;
  reg [31:0] c3_integer;
  reg c3_sign;
  reg c3_valid;  
  wire c3_stall;  
  wire c3_enable = (HIGH_CAPACITY == 1) ? (~c3_valid | ~c3_stall) : enable;
  assign c2_stall = c3_valid & c3_stall;
  
  generate
  if (HIGH_LATENCY == 1)
  begin
    always@(posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        c3_valid <= 1'b0;
        c3_shift <= 1'dx;
        c3_integer <= 32'dx;
        c3_sign <= 1'bx;      
      end
      else if (c3_enable)
      begin
        c3_valid <= c2_valid;
        c3_shift <= c2_shift[0];
        case(c2_shift[2:1])
          2'b11: c3_integer <= {6'd0, c2_integer[31:6]};
          2'b10: c3_integer <= {4'd0, c2_integer[31:4]};
          2'b01: c3_integer <= {2'd0, c2_integer[31:2]};
          2'b00: c3_integer <= c2_integer;
        endcase
        c3_sign <= c2_sign;      
      end
    end
  end
  else
  begin
    always@(*)
    begin
      c3_valid <= c2_valid;
      c3_shift <= c2_shift[0];
      case(c2_shift[2:1])
        2'b11: c3_integer <= {6'd0, c2_integer[31:6]};
        2'b10: c3_integer <= {4'd0, c2_integer[31:4]};
        2'b01: c3_integer <= {2'd0, c2_integer[31:2]};
        2'b00: c3_integer <= c2_integer;
      endcase
      c3_sign <= c2_sign;      
    end  
  end
  endgenerate

  // Cycle 4 - shift by 1 or 0 to the right. Also, account for the sign in the signed mode.
  reg [31:0] c4_integer;
  reg c4_valid;  
  wire c4_stall;  
  wire c4_enable = (HIGH_CAPACITY == 1) ? (~c4_valid | ~c4_stall) : enable;
  assign c3_stall = c4_valid & c4_stall;
  reg [31:0] c4_intermediate;
  
  always@(*)
  begin
    if (c3_shift)
      c4_intermediate = {1'b0, c3_integer[31:1]};
    else
      c4_intermediate = c3_integer;
  end
      
  always@(posedge clock or negedge resetn)
  begin
    if (~resetn)
    begin
      c4_valid <= 1'b0;
      c4_integer <= 32'dx;
    end
    else if (c4_enable)
    begin
      c4_valid <= c3_valid;
      if (c3_sign)
        c4_integer <= (c4_intermediate ^ 32'hffffffff) + 1'b1;
      else
        c4_integer <= c4_intermediate;
    end
  end

  assign c4_stall = stall_in;
  assign valid_out = c4_valid;
  assign result = c4_integer;
endmodule
