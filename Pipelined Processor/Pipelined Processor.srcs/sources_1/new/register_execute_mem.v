`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 09:44:21 AM
// Design Name: 
// Module Name: register_execute_mem
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


module register_execute_mem(
  input             clk, rst,
  input             RegWriteE,
  input      [1:0]  ResultSrcE,
  input             MemWriteE,
  input      [31:0] ALUResult,
  input      [31:0] WriteDataE,
  input      [31:0] PCPlus4E,
  input      [4:0]  RdE,
  output reg        RegWriteM,
  output reg [1:0]  ResultSrcM,
  output reg        MemWriteM,
  output reg [31:0] ALUResultM,
  output reg [31:0] WriteDataM,
  output reg [31:0] PCPlus4M,
  output reg [4:0]  RdM
         

    );
    always @(posedge clk) begin
        if (rst) begin
           RegWriteM  <= 0;
           MemWriteM  <= 0;
           ResultSrcM <= 2'b00;
           ALUResultM <= 32'd0;
           WriteDataM <= 32'd0;
           RdM        <= 5'd0;
           PCPlus4M   <= 32'd0;
        end
        else begin
           RegWriteM  <= RegWriteE;
           MemWriteM  <= MemWriteE;
           ResultSrcM <= ResultSrcE;
           ALUResultM <= ALUResult;
           WriteDataM <= WriteDataE;
           RdM        <= RdE;
           PCPlus4M   <= PCPlus4E;
        end
    end
endmodule
