`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 12:56:12 PM
// Design Name: 
// Module Name: forward2_mux
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


module forward2_mux #
(
     parameter WIDTH = 8
) (
     input  [WIDTH-1:0] RD2E,
     input  [WIDTH-1:0] ResultW,
     input  [WIDTH-1:0] ALUResultM,
     input  [1:0]       ForwardBE,
     output [WIDTH-1:0] WriteDataE
);
     assign WriteDataE = ForwardBE[1] ? ALUResultM : (ForwardBE[0] ? ResultW : RD2E);
endmodule
