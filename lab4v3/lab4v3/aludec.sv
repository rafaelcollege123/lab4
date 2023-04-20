module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5, 
              input  logic [1:0] ALUOp,
              output logic [2:0] ALUControl);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction

  always_comb
    case(ALUOp)
    
         2'b00: ALUControl = 3'b000;  // lw/add
        2'b01:    ALUControl = 3'b001;               // branch if equal subtract
            
        2'b10: begin                  // bitwise operations
            case (funct3)
                3'b000: ALUControl = (RtypeSub != 1) ? 3'b000 : 3'b001;// add:sub
                
                3'b110: ALUControl = 3'b011; //OR
                3'b010: ALUControl  = 3'b101; //SLT
                3'b111: ALUControl = 3'b010;  //AND
                
                default: ALUControl = 3'b000; // pass-through
            endcase
        end
        default: ALUControl = 3'bxxx; // pass-through
    endcase
endmodule