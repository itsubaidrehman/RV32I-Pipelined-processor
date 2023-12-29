`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 10:05:51 AM
// Design Name: 
// Module Name: Data_Mem
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

module Data_Memo(
    input      [31:0] WriteDataM,
    input      [31:0] ALUResultM,
    input             clk,
    input             MemWriteM,
    input             rst,
    output reg [31:0] ReadData,
    output reg [31:0] DM0
);

    reg [31:0] data_mem [255:0];   //2D array for data memory
    integer i;

    always @(*) begin                     //asynchronous read from Data Memory
        ReadData = data_mem[ALUResultM];
    end

    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 255;i = i + 1) begin
                data_mem[i] <= 32'd0;
            end
        end else if (MemWriteM) begin
            data_mem[ALUResultM] <= WriteDataM; 
        end
    end    
    
endmodule
