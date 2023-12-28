`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 04:30:21 AM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
input wire [1:0] aluOp,
input wire [6:0] op, funct7,
input wire [2:0] funct3,
output reg [2:0] aluControl
    );
    
    always @(*)
        begin
            case ({aluOp, funct3, op[5], funct7[5]})
                7'b0000000 : aluControl = 3'b000;  //add
                7'b0100000 : aluControl = 3'b001;  //subtract
                7'b1000000 : aluControl = 3'b000;  //add
                7'b1000001 : aluControl = 3'b000;  //add
                7'b1000010 : aluControl = 3'b000;  //add
                7'b1000011 : aluControl = 3'b001;  //subtract
                7'b1001000 : aluControl = 3'b101;  //set less than 1
                7'b1011000 : aluControl = 3'b011;  //or
                7'b1011100 : aluControl = 3'b010;  //and
            default : aluControl = 0;
            endcase
        end
endmodule
