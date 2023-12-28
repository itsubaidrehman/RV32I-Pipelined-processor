`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:51:51 AM
// Design Name: 
// Module Name: controlUnit
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



//`include "ALU_Decoder.v"
//`include "Main_Decoder.v"




module controlUnit(
    input wire [1:0] aluOp,
    input wire [6:0] op, funct7,
    input wire [2:0] funct3,
    output [2:0] aluControl,
    input wire zero,
    //input wire [6:0] op,
    output regWrite, aluSrc, memWrite, resultSrc, branch, pcSrc,
    output [1:0] immSrc//, aluOp
    );
    
    alu_decoder alu_decoder (
        .aluOp(aluOp), .op(op), .funct7(funct7), .funct3(funct3), .aluControl(aluControl)
    );
    
    main_decoder main_decoder (
        .zero(zero), .op(op), .regWrite(regWrite), .aluSrc(aluSrc), .memWrite(memWrite), .resultSrc(resultSrc), .branch(branch),
        .immSrc(immSrc), .aluOp(aluOp), .pcSrc(pcSrc)
    );
endmodule