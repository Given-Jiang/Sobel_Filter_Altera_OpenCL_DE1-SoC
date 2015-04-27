module no_reset
(
   output reg       reset
);

initial  // Power up condition 
    reset = 0;

always@* reset = 0;


  
endmodule

