module acl_fp_convert_to_internal_double(  clock, resetn, data,
          mantissa, exponent, sign,
          valid_in, valid_out, stall_in, stall_out,
          enable);
    parameter HIGH_CAPACITY = 1;
    parameter HIGH_LATENCY = 1;    
    parameter FLUSH_DENORMS = 0;
    parameter FINITE_MATH_ONLY = 1;
    
    input clock, resetn;
    input [63:0] data;
    output [55:0] mantissa;
    output [11:0] exponent;
    output sign;
    
    input enable, valid_in, stall_in;
    output valid_out, stall_out;
    
    // This module aligns two floating point input values such that their exponents are equal,
    // permitting a proper addition of the two numbers.
    // The alignment includes a conversion from 32-bit format to internal representation.
    
    reg c1_valid;
    wire c1_enable;
    wire c1_stall;
    
    // Cycle 1 - Convert from 64-bit representation to internal format
    assign c1_enable = (HIGH_CAPACITY ? (~c1_stall | ~c1_valid) : enable);
    assign stall_out = c1_stall & c1_valid;
    
    reg [55:0] c1_mantissa;
    reg [11:0] c1_exponent;
    reg c1_sign;
    
    generate
    if (HIGH_LATENCY == 1)
    begin
      always @(posedge clock or negedge resetn)
      begin
        if (~resetn)
        begin
          c1_mantissa <= 56'dx;
          c1_exponent <= 12'dx;
          c1_sign <= 1'bx;
          c1_valid  <= 1'b0;
        end
        else if (c1_enable)
        begin
          c1_valid <= valid_in;
          if ((FLUSH_DENORMS) && (data[62:52] == 11'd0))
            c1_mantissa <= 27'd0;
          else
            c1_mantissa <= {|data[62:52],data[51:0],3'd0};

          if (FINITE_MATH_ONLY == 0)
            c1_exponent <= {&data[62:52], data[62:52]};
          else
            c1_exponent <= {1'b0, data[62:52]};
          c1_sign <= data[63];
        end
      end
    end
    else
    begin
      always @(*)
      begin
        c1_valid <= valid_in;
        if ((FLUSH_DENORMS) && (data[62:52] == 11'd0))
          c1_mantissa <= 27'd0;
        else
          c1_mantissa <= {|data[62:52],data[51:0],3'd0};
        if (FINITE_MATH_ONLY == 0)
          c1_exponent <= {&data[62:52], data[62:52]};
        else
          c1_exponent <= {1'b0, data[62:52]};
        c1_sign <= data[63];
      end
    end
    endgenerate
    
    assign c1_stall = stall_in;
    assign valid_out = c1_valid;
    assign mantissa = c1_mantissa;
    assign exponent = c1_exponent;
    assign sign = c1_sign;    
endmodule
