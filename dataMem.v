`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:48:14 AM
// Design Name: 
// Module Name: dataMem
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

module dataMem(
    input wire clk, we, rst,
    input wire [31:0] A, WD,
    output [31:0] RD
    );
  
    reg [31:0] data_register [1023:0];
    
    
    assign RD = (~rst) ? 32'h00000000 : data_register[A];
  
    always @(posedge clk)
    begin
    if (we)
    data_register[A] <= WD;
    end
    
    //if you want to read everytime then
    //assign RD = (~rst) ? 32'h00000000 : data_register[A];
    initial
        begin
        //@00000000
        //0062E3B3
        //0062F433
        data_register[28] <= 10;
        data_register[11] <= 32'h00000008;
//        instr_mem_reg[1] <=  32'h0062E3B3;
//        instr_mem_reg[2] <= 32'h0062F433;
        end
    
endmodule
