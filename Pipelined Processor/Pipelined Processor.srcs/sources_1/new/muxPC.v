`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 02:04:46 AM
// Design Name: 
// Module Name: muxPC
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


module muxPC(
input wire [31:0] PCPlus4F, PCTargetE, input wire PCSrcE,
output reg [31:0] PCFbar

    );
    
    always @(*) 
    begin
    PCFbar = (PCSrcE) ? PCTargetE : PCPlus4F;
    end
endmodule
