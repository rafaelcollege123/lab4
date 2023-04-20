
module maindec(input  logic [6:0] op,
               output logic [1:0] ResultSrc,
               output logic       MemWrite,
               output logic       Branch, ALUSrc,
               output logic       RegWrite, Jump,
               output logic [1:0] ImmSrc,
               output logic [1:0] ALUOp);

  logic [10:0] controls;

  //assing the control signals values form the control
  

  always_comb
    case(op)
    
     
     7'b0000011:begin
        //controls = 11'b10010001000;
        assign RegWrite  = 0;
        assign ImmSrc    = 00;
        assign ALUSrc    = 1;
        assign MemWrite  = 0;
        assign ResultSrc = 00;
        assign Branch    = 1;
        assign ALUOp     = 00;
        assign Jump      = 1;
       end
      
    7'b0100011: begin
     controls = 11'b00111xx0000; // sw
        assign RegWrite  = 0;
        assign ImmSrc    = 00;
        assign ALUSrc    = 0;
        assign MemWrite  = 1'bx;
        assign ResultSrc = 2'b1x;
        assign Branch    = 1;
        assign ALUOp     = 01;
        assign Jump      = 0;
       end
      
    7'b0110011: controls = 11'b1xx00000100; // R-type 
      
    7'b1100011: controls = 11'b01000xx1010; // beq
      
    7'b0010011: controls = 11'b10010000100; // I-type ALU
      
    7'b1101111: controls = 11'b111x0100xx1; // jal
      
    default:    controls = 11'b00000000000; 
     
     /*7'b0000011: controls = 11'b10010001000; // lw
      
    7'b0100011: controls = 11'b00111000000; // sw
      
    7'b0110011: controls = 11'b10000000100; // R-type 
      
    7'b1100011: controls = 11'b01000001010; // beq
      
    7'b0010011: controls = 11'b10010000100; // I-type ALU
      
    7'b1101111: controls = 11'b11100100001; // jal
      
    default:    controls = 11'b00000000000; */
    endcase
    
    assign RegWrite  = controls[10];
    assign ImmSrc    = controls[9:8];
    assign ALUSrc    = controls[7];
    assign MemWrite  = controls[6];
    assign ResultSrc = controls[5:4];
    assign Branch    = controls[3];
    assign ALUOp     = controls[2:1];
    assign Jump      = controls[0];
endmodule