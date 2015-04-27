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
    


module acl_fp_convert_with_rounding_8(clock, resetn, dataa, result, valid_in, valid_out, stall_in, stall_out, enable);
    // Latency = 4.
    parameter UNSIGNED = 1;
    parameter ROUNDING_MODE = 0;
    parameter HIGH_CAPACITY = 1;
    // Rounding mode values are:
    // 0 - round to nearest even
    // 1 - round to nearest with ties away from zero
    // 2 - round towards zero (truncation)
    // 3 - round up
    // 4 - round down
    input clock;    
    input enable, resetn;
    input [31:0] dataa;
    output [7:0] result;
    input valid_in, stall_in;
    output stall_out, valid_out;

    // STAGE 0 - extract input data into format we can work with.
    wire sign_0;
    wire [7:0] exp_0;
    wire [22:0] man_0;
    wire [23:0] implied_man_0;

    assign {sign_0, exp_0, man_0} = dataa;
    assign implied_man_0 = (|exp_0) ? {1'b1, man_0} : 24'd0;

    // STAGE 1
    reg sign_c1;
    reg [10:0] man_c1;
    reg [8:0] shift_amount_c1;
    reg [7:0] exp_c1;
    reg valid_c1;
    wire stall_c1;
    wire enable_c1;
    assign stall_out = stall_c1 & valid_c1;
    assign enable_c1 = (HIGH_CAPACITY == 1) ? (~stall_c1 | ~valid_c1) : enable;

    always @( posedge clock or negedge resetn)
    begin
      if( ~resetn )
      begin
        sign_c1 <= 1'bx;
        man_c1 <= 11'dx;
        shift_amount_c1 <= 9'dx;
        exp_c1 <= 8'dx;
        valid_c1 <= 1'b0;
      end
      else if (enable_c1)
      begin
        sign_c1 <= sign_0;
        valid_c1 <= valid_in;
        if (UNSIGNED == 1)
        begin
          man_c1 <= {implied_man_0[23:14], |implied_man_0[13:0]};
          shift_amount_c1 <= 9'd134 - exp_0;
        end
        else
        begin
          man_c1 <= {1'b0, implied_man_0[23:15], |implied_man_0[14:0]};
          shift_amount_c1 <= 9'd133 - exp_0;
        end
        exp_c1 <= exp_0;
      end
    end

    // STAGE 2
    reg sign_c2;
    reg [10:0] extended_mantissa_c2;
    reg [2:0] shift_amount_c2;
    reg valid_c2;
    wire stall_c2;
    wire enable_c2 = (HIGH_CAPACITY == 1) ? (~stall_c2 | ~valid_c2) : enable;
    assign stall_c1 = stall_c2 & valid_c2;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        sign_c2 <= 1'bx;
        extended_mantissa_c2 <= 11'dx;
        shift_amount_c2 <= 3'dx;
        valid_c2 <= 1'b0;
      end
      else if (enable_c2)
      begin
        sign_c2 <= sign_c1;
        valid_c2 <= valid_c1;
        shift_amount_c2 <= (shift_amount_c1[2:0]) & {3{(~(&exp_c1)) & ~shift_amount_c1[8]}};
        
        // Now handle the corner cases of NaN and INF. Make it maximum positive or negative integer depending on the sign.
        // Then handle overflow and regular shifting.
        if ((UNSIGNED == 1) && (exp_c1 == 8'hff))
          extended_mantissa_c2 <= {8'hff, 3'd0};
        else if ((UNSIGNED == 0) && (exp_c1 == 8'hff))
          extended_mantissa_c2 <= {8'h7f + sign_c1, 3'd0};
        else if (shift_amount_c1[8])
          extended_mantissa_c2 <= {(UNSIGNED == 0) ? 8'h7f + sign_c1 : 8'hff, 3'd0}; // Overflow/Saturation.
        else if (|shift_amount_c1[7:4])
        begin
          // Shift by more than 16+
          sign_c2 <= sign_c1 & (|man_c1);
          extended_mantissa_c2 <= {10'd0, |man_c1};
        end
        else if (|shift_amount_c1[3])
        begin
          // Shift by 8+
          extended_mantissa_c2 <= {8'd0, man_c1[10:9], |man_c1[8:0]};
        end
        else
          extended_mantissa_c2 <= man_c1;
      end
    end

    // STAGE 3
    reg [10:0] extended_mantissa_c3;
    reg valid_c3;
    reg sign_c3;
    wire stall_c3;
    wire enable_c3 = (HIGH_CAPACITY == 1) ? (~valid_c3 | ~stall_c3) : enable;
    assign stall_c2 = valid_c3 & stall_c3;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        extended_mantissa_c3 <= 35'dx;
        sign_c3 <= 1'bx;
        valid_c3 <= 1'b0;
      end
      else if (enable_c3)
      begin
        valid_c3 <= valid_c2;
        sign_c3 <= sign_c2;
        case (shift_amount_c2)
           3'b111: extended_mantissa_c3 <= {7'd0, extended_mantissa_c2[10:8], |extended_mantissa_c2[7:0]};
           3'b110: extended_mantissa_c3 <= {6'd0, extended_mantissa_c2[10:7], |extended_mantissa_c2[6:0]};
           3'b101: extended_mantissa_c3 <= {5'd0, extended_mantissa_c2[10:6], |extended_mantissa_c2[5:0]};
           3'b100: extended_mantissa_c3 <= {4'd0, extended_mantissa_c2[10:5], |extended_mantissa_c2[4:0]};
           3'b011: extended_mantissa_c3 <= {3'd0, extended_mantissa_c2[10:4], |extended_mantissa_c2[3:0]};
           3'b010: extended_mantissa_c3 <= {2'd0, extended_mantissa_c2[10:3], |extended_mantissa_c2[2:0]};
           3'b001: extended_mantissa_c3 <= {1'd0, extended_mantissa_c2[10:2], |extended_mantissa_c2[1:0]};
           3'b000: extended_mantissa_c3 <= extended_mantissa_c2;
        endcase
      end
    end

    // STAGE 4
    reg [8:0] result_c4;
    reg valid_c4;
    wire stall_c4;
    wire enable_c4 = (HIGH_CAPACITY == 1) ? (~valid_c4 | ~stall_c4) : enable;
    assign stall_c3 = valid_c4 & stall_c4;   
    assign stall_c4 = stall_in;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        result_c4 <= 9'dx;
        valid_c4 <= 1'b0;
      end
      else if (enable_c4)
      begin
        valid_c4 <= valid_c3;
        case(ROUNDING_MODE)
          2:
          begin // 2 is round to zero
            if (UNSIGNED == 0)
            begin
              result_c4 <= ({9{sign_c3}} ^ (extended_mantissa_c3[10:3])) + sign_c3;
            end
            else
            begin
              result_c4 <= (sign_c3) ? 8'd0 : extended_mantissa_c3[10:3];
            end
          end        
          4:
          begin // 4 is round down
            if (|extended_mantissa_c3[2:0])
            begin
              if (UNSIGNED == 0)
              begin
                result_c4 <= (sign_c3) ? (({9{sign_c3}} ^ (extended_mantissa_c3[10:3] + 1'b1)) + 1'b1) :  extended_mantissa_c3[10:3];
              end
              else
              begin
                result_c4 <= (sign_c3) ? 8'd0 : extended_mantissa_c3[10:3];
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c4 <= ({9{sign_c3}} ^ extended_mantissa_c3[10:3]) + sign_c3;
              else
                result_c4 <= {8{~sign_c3}} & extended_mantissa_c3[10:3];
            end
          end
          3:
          begin // 3 is round up
            if (|extended_mantissa_c3[2:0])
            begin
              if (UNSIGNED == 0)
              begin
                result_c4 <= (sign_c3) ? (({9{sign_c3}} ^ extended_mantissa_c3[10:3]) + 1'b1) :  (extended_mantissa_c3[10:3] + 1'b1);
              end
              else
              begin
                result_c4 <= (sign_c3) ? 8'd0 : extended_mantissa_c3[10:3] + 1'b1;
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c4 <= ({9{sign_c3}} ^ extended_mantissa_c3[10:3]) + sign_c3;
              else
                result_c4 <= {8{~sign_c3}} & extended_mantissa_c3[10:3];
            end
          end        
          1:
          begin // 1 is round to nearest with ties rounded away from zero.
            if (extended_mantissa_c3[2])
            begin
              if (UNSIGNED == 0)
              begin
                result_c4 <= ({9{sign_c3}} ^ (extended_mantissa_c3[10:3] + 1'b1)) + sign_c3;
              end
              else
              begin
                result_c4 <= (sign_c3) ? 8'd0 : extended_mantissa_c3[10:3] + 1'b1;
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c4 <= ({9{sign_c3}} ^ extended_mantissa_c3[10:3]) + sign_c3;
              else
                result_c4 <= {8{~sign_c3}} & extended_mantissa_c3[10:3];
            end
          end

          default:
          begin // 0 and default are round to nearest even
            if ((extended_mantissa_c3[3:0] == 4'hc) | (extended_mantissa_c3[2] & (|extended_mantissa_c3[1:0])))
            begin
              if (UNSIGNED == 0)
              begin
                result_c4 <= ({9{sign_c3}} ^ (extended_mantissa_c3[10:3] + 1'b1)) + sign_c3;
              end
              else
              begin
                result_c4 <= (sign_c3) ? 8'd0 : extended_mantissa_c3[10:3] + 1'b1;
              end
            end
            else
            begin
              if (UNSIGNED == 0)
                result_c4 <= ({9{sign_c3}} ^ extended_mantissa_c3[10:3]) + sign_c3;
              else
                result_c4 <= {8{~sign_c3}} & extended_mantissa_c3[10:3];
            end
          end
        endcase
      end
    end   
    
    // handle saturation here too, just in case rounding went over the limit of the expected range.
    assign result = (UNSIGNED == 1) ? ({8{result_c4[8]}} | result_c4) : ((result_c4[8] ^ result_c4[7]) ? {result_c4[8], {7{~result_c4[8]}}} : result_c4[7:0]);
    assign valid_out = valid_c4;
   
endmodule
