module mux2 #(parameter WIDTH = 8)
             (input  logic [7:0] d0, d1, 
              input  logic             s, 
              output logic [7:0] y);

  //assign statement 
  assign y = (s == 1'b0) ? d0 : d1;
endmodule

module mux3 #(parameter WIDTH = 8)
             (input  logic [7:0] d0, d1, d2,
              input  logic [1:0]       s, 
              output logic [7:0] y);

  //assign statement 
  assign y = (s == 2'b00) ? d0 :((s == 2'b01) ? d1 : d2);
  
endmodule