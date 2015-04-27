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
    


module acl_merge_node_priority_encoder_workgroup(clock, resetn, merge_block_selector,
merge_node_valid_in_0_staging_reg, merge_node_valid_in_1_staging_reg,
valid_in_0, valid_in_1, merge_stalled_by_successors, is_merge_data_to_local_regs_valid,
workgroup_size);

parameter WORKGROUP_SIZE_BITS = 10;

input clock, resetn;
input merge_node_valid_in_0_staging_reg, merge_node_valid_in_1_staging_reg;
input	valid_in_0, valid_in_1, merge_stalled_by_successors;
input [WORKGROUP_SIZE_BITS-1:0] workgroup_size;
output merge_block_selector, is_merge_data_to_local_regs_valid;

reg [WORKGROUP_SIZE_BITS-1:0] in_count;

reg choose_0;
reg choose_1;

assign merge_block_selector = choose_1 ? 1'b1 : (choose_0 ? 1'b0 : ((merge_node_valid_in_1_staging_reg | valid_in_1) ? 1'b1 : 1'b0));
assign is_merge_data_to_local_regs_valid = 
     ~merge_block_selector & merge_node_valid_in_0_staging_reg |
      merge_block_selector & merge_node_valid_in_1_staging_reg |
     ~merge_block_selector & valid_in_0 | merge_block_selector & valid_in_1;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		in_count <= {WORKGROUP_SIZE_BITS{1'b0}};
		choose_0 <= 1'b0;
		choose_1 <= 1'b0;
	end
	else
	begin
		if (is_merge_data_to_local_regs_valid && !merge_stalled_by_successors) 
		begin
			if (in_count == workgroup_size - 2'b01) 
			begin 
				in_count <= {WORKGROUP_SIZE_BITS{1'b0}};
				choose_0 <= 1'b0; 
				choose_1 <= 1'b0;
			end
			else
			begin
				in_count <= in_count + 1'b1;
				choose_0 <= ~merge_block_selector;
				choose_1 <=  merge_block_selector;
			end
		end
	end
end

endmodule

