`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:16:34 AM
// Design Name: 
// Module Name: InstrMem
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


module InstrMem (
  input wire rst,
  input wire [31:0] PCF,
  output reg [31:0] instr
    );
  
    reg [31:0] instr_mem_reg [31:0];
    //assign RD = (~rst) ? {32{1'b0}} : instr_mem_reg[A[31:0]];  // not instr_mem_reg[A] ??
    always @(*)
      begin
        if (rst)
        instr = 0;
        else
        instr = instr_mem_reg[PCF[31:2]];

      end
    
    initial
      begin
        //@00000000
        //0062E3B3
        //0062F433
        instr_mem_reg[0] <= 32'hFFC4A303;
        //instr_mem_reg[1] <=  32'h0062E3B3;
        //instr_mem_reg[2] <= 32'h0062F433;
        instr_mem_reg[1] <= 32'h0064A423;
        instr_mem_reg[2] <= 32'h0062E233;
        instr_mem_reg[3] <= 32'hFE420AE3;
      end
endmodule

