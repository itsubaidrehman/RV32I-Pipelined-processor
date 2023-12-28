`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 04:10:02 AM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input wire zero,
    input wire [6:0] op,
    output reg regWrite, aluSrc, memWrite, resultSrc, branch,
    output pcSrc,
    output reg [1:0] immSrc, aluOp
    );
    always @(*)
        begin
            case(op)
            7'b0000011 :
                begin 
                regWrite = 1; immSrc = 0; aluSrc = 1; memWrite = 0; resultSrc = 1; branch = 0; aluOp = 0; 
                
                end
            7'b0100011 :
                begin 
                regWrite = 0; immSrc = 2'b01; aluSrc = 1; memWrite = 1; resultSrc = 0; branch = 0; aluOp = 0; 
                    
                end
            
            7'b0110011 :
                begin 
                regWrite = 1; immSrc = 0; aluSrc = 0; memWrite = 0; resultSrc = 0; branch = 0; aluOp = 2'b10; 
                    
                end
            
            7'b1100011 :
                begin 
                regWrite = 0; immSrc = 2'b10; aluSrc = 0; memWrite = 0; resultSrc = 0; branch = 1; aluOp = 2'b01; 
                    
                end
            default : 
                begin
                regWrite = 0; immSrc = 0; aluSrc = 0; memWrite = 0; resultSrc = 1; branch = 0; aluOp = 0;
                end
            endcase
        
        end
    
    //wire pcSrc;
    assign pcSrc = zero & branch;
endmodule
