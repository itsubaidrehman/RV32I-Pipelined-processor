`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:46:21 AM
// Design Name: 
// Module Name: pcTarget
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


module pcTarget (
  input wire [31:0] PC, immExt,
  output reg [31:0] PCTarget
);
  
  always @(*)
    begin
      PCTarget =  PC + immExt;
    end
endmodule