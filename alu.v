`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 12:02:57 AM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Gate level ALU
//module alu
//    #(parameter N = 32)
//    (
//    input wire [N-1:0] a, b,
//    input wire [2:0] aluControl,
//    output wire [N-1:0] result,
//    output wire z, c, v, n
//    );
//    wire [N-1 :0] andout, orout;
//    assign andout = a & b;
//    assign orout = a | b;
    
//    wire [N-1 :0] block1;
//    assign block1 = aluControl[0] ? ~b : b;
    
//    wire [N-1 :0] sum; wire cout;
//    assign {cout, sum} = a + block1 + aluControl[0];
    
//    assign result = (aluControl == 2'b00) ? sum : (aluControl == 2'b01) ? sum :
//                    (aluControl == 2'b10) ? andout : orout;
                    
//    assign z = ~(& result);
//    assign n = result[31] ? 1 : 0;
//    assign c = ((~aluControl[1]) & cout);
//    assign v =  (~(aluControl[1]) & (sum[31] ^ a[31]) & (aluControl[0] ^ a[31] ^ b[31])); 
     

//endmodule


module alu(A,B,Result,ALUControl,OverFlow,Carry,Zero,Negative);

    input [31:0]A,B;
    input [2:0]ALUControl;
    output Carry,OverFlow,Zero,Negative;
    output [31:0]Result;

    wire Cout;
    wire [31:0]Sum;

    assign Sum = (ALUControl[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign {Cout,Result} = (ALUControl == 3'b000) ? Sum :
                           (ALUControl == 3'b001) ? Sum :
                           (ALUControl == 3'b010) ? A & B :
                           (ALUControl == 3'b011) ? A | B :
                           (ALUControl == 3'b101) ? {{32{1'b0}},(Sum[31])} :
                           {33{1'b0}};
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALUControl[0] ^ B[31] ^ A[31])) &
                      (~ALUControl[1]));
    assign Carry = ((~ALUControl[1]) & Cout);
    assign Zero = &(~Result);
    assign Negative = Result[31];

endmodule


