`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:21:01 AM
// Design Name: 
// Module Name: PCAdder
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


module PCAdder (
  input   [31:0] PCF, 
  output  [31:0] PCPlus4F
);


    assign PCPlus4F = PCF + 4;
    
endmodule
