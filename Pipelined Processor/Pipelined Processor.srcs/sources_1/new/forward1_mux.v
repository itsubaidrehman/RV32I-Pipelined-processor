`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 12:55:11 PM
// Design Name: 
// Module Name: forward1_mux
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


module forward1_mux #
(    
     parameter WIDTH = 8
)(
     input  [WIDTH-1:0] RD1E, 
     input  [WIDTH-1:0] ResultW, 
     input  [WIDTH-1:0] ALUResultM,
     input  [1:0]       ForwardAE,
     output [WIDTH-1:0] SrcAE
);
     assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);
endmodule
