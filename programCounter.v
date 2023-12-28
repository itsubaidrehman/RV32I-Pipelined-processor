`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:38:17 AM
// Design Name: 
// Module Name: programCounter
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

module programCounter(
    input wire clk, rst,
    input [31:0] PC_Next,
    output reg [31:0] PC
    );
    //reg [31:0] pc_register;
    always @(posedge clk)
        begin
            if (!rst)
            PC <= 0;
            else
            PC <= PC_Next;
        end
    
    
endmodule
