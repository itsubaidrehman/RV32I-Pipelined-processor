`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 09:12:12 AM
// Design Name: 
// Module Name: PCTarget
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

module PCTarget (
  input      [31:0] PCE, 
  input      [31:0] ImmExtE,
  output reg [31:0] PCTargetE
);
  
  always @(*)
    begin
      PCTargetE =  PCE + ImmExtE;
    end
endmodule
