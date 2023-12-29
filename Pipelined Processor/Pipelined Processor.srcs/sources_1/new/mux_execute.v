`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 09:14:39 AM
// Design Name: 
// Module Name: mux_execute
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

module mux_execute(
  input             ALUSrcE,
  input      [31:0] Rd2E,
  input      [31:0] ImmExtE,
  output reg [31:0] SrcBE
  
);
  
  always @(*)
    begin
      SrcBE = ALUSrcE ? ImmExtE : Rd2E;
    end
    
endmodule
