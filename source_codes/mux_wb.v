`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 10:16:48 AM
// Design Name: 
// Module Name: mux_wb
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

module mux_wb #
(
     parameter WIDTH = 8
) (
     input  [WIDTH-1:0] ALUResultW,
     input  [WIDTH-1:0] ReadDataW,
     input  [WIDTH-1:0] PCPlus4W,
     input  [1:0]       ResultSrcW,
     output [WIDTH-1:0] ResultW
);
     assign ResultW = ResultSrcW[1] ? PCPlus4W : (ResultSrcW[0] ? ReadDataW : ALUResultW);
endmodule
