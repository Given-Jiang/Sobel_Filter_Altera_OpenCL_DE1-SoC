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
    


module acl_fp_fptosi( clock, enable, resetn, dataa, result);
    // NOTE: infinities and NaNs are not handled
    input clock;    
    input enable, resetn;
    input [31:0] dataa;
    output [31:0] result;

    // STAGE 0
    wire sign_0;
    wire [7:0] exp_0;
    wire [22:0] man_0;
    wire [23:0] implied_man_0;

    assign {sign_0, exp_0, man_0} = dataa;
    assign implied_man_0 = {1'b1, man_0};

    // STAGE 1
    reg sign_1;
    reg [30:0] man_1;
    reg [7:0] shift_amount_1;

    always @( posedge clock or negedge resetn)
    begin
        if( ~resetn ) begin
            sign_1 <= 1'b0;
            man_1 <= 31'd0;
            shift_amount_1 <= 8'd0;
        end
        else if (enable)
	      begin
            sign_1 <= sign_0;

            if( exp_0 < 8'd127 )
            begin
                man_1 <= 31'd0;
                shift_amount_1 <= 8'd0;
            end
            else
            begin
                man_1 <= {implied_man_0, 7'd0};
                shift_amount_1 <= exp_0 - 8'd127;
            end
        end
    end

    // STAGE 2
    reg sign_2;
    reg [30:0] result_2;

    always @( posedge clock or negedge resetn)
    begin
	      if (~resetn)
	      begin
		        sign_2 <= 1'b0;
		        result_2 <= 31'd0;
	      end
	      else if (enable)
        begin
            sign_2 <= sign_1;

            case( shift_amount_1 )
                8'd00: result_2 <= man_1[30:30];
                8'd01: result_2 <= man_1[30:29];
                8'd02: result_2 <= man_1[30:28];
                8'd03: result_2 <= man_1[30:27];
                8'd04: result_2 <= man_1[30:26];
                8'd05: result_2 <= man_1[30:25];
                8'd06: result_2 <= man_1[30:24];
                8'd07: result_2 <= man_1[30:23];
                8'd08: result_2 <= man_1[30:22];
                8'd09: result_2 <= man_1[30:21];
                8'd10: result_2 <= man_1[30:20];
                8'd11: result_2 <= man_1[30:19];
                8'd12: result_2 <= man_1[30:18];
                8'd13: result_2 <= man_1[30:17];
                8'd14: result_2 <= man_1[30:16];
                8'd15: result_2 <= man_1[30:15];
                8'd16: result_2 <= man_1[30:14];
                8'd17: result_2 <= man_1[30:13];
                8'd18: result_2 <= man_1[30:12];
                8'd19: result_2 <= man_1[30:11];
                8'd20: result_2 <= man_1[30:10];
                8'd21: result_2 <= man_1[30:9];
                8'd22: result_2 <= man_1[30:8];
                8'd23: result_2 <= man_1[30:7];
                8'd24: result_2 <= man_1[30:6];
                8'd25: result_2 <= man_1[30:5];
                8'd26: result_2 <= man_1[30:4];
                8'd27: result_2 <= man_1[30:3];
                8'd28: result_2 <= man_1[30:2];
                8'd29: result_2 <= man_1[30:1];
                8'd30: result_2 <= man_1[30:0];
                default: result_2 <= {31{1'b1}};    // overflow
            endcase
        end
    end

    // STAGE 3
    reg [31:0] result_3;

    always @( posedge clock or negedge resetn)
    begin
        if (~resetn)
		        result_3 <= 32'd0;
	      else if (enable)
	      begin
            if( sign_2 )
                result_3 <= ~({1'b0, result_2}) + 32'd1;
            else
                result_3 <= {1'b0, result_2};
        end
    end

    assign result = result_3;
endmodule

