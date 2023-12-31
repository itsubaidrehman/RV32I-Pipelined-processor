`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 02:15:00 AM
// Design Name: 
// Module Name: register_fetch
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

module register_fetch (
  input      clk, 
  input      rst,
  input      [31:0] instr, 
  input      [31:0] PCF, 
  input      [31:0] PCPlus4F,
  output reg [31:0] instrD, 
  output reg [31:0] PCD, 
  output reg [31:0] PCPlus4D
);
  
  always @(posedge clk)
    begin 
      if (rst)
        begin
          instrD <= 0;
          PCD <= 0;
          PCPlus4D <= 0;
        end
      else
        begin
          instrD <= instr;
          PCD <= PCF;
          PCPlus4D <= PCPlus4F;
        end
      
    end
    endmodule
