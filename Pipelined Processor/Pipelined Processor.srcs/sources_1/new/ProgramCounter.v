`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:15:30 AM
// Design Name: 
// Module Name: ProgramCounter
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

module ProgramCounter(
    input wire clk, rst,
    input [31:0] PCFbar,
    output reg [31:0] PC
    );
    //reg [31:0] pc_register;
    always @(posedge clk)       //non-blocking because of seq circuit
        begin
            if (rst)  //active high reset
            PC <= 0;
            else
            PC <= PCFbar;
        end
    
    
endmodule

