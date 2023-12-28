`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:22:04 AM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    input        clk, 
    input        rst,
    input        regWriteW,
    input  [4:0] A1,
    input  [4:0] A2,
    input  [4:0] RdW,         //A3
    input  [31:0] ResultW,
    output [31:0] RD1, RD2
    );
  
    reg [31:0] registers [31:0];
  
    assign RD1 = (rst) ? 32'h00000000 : registers[A1];
    assign RD2 = (rst) ? 32'h00000000 : registers[A2];
    
    always @(posedge clk)
        begin
            if (rst)
            begin
            registers[RdW] <= 0;
            end
            else if (regWriteW && (|RdW))   //|RdW will avoid writting to x0 or (RdW!==00000)
            begin
            registers[RdW] <= ResultW;
            end
        end
  
//  initial begin
//        registers[4] = 32'd14;//32'h00000005;
//        registers[5] = 32'h00000006;
//        registers[6] = 32'd10;//32'h00000004;
//        registers[9] = 32'h00000020;
        
//    end

endmodule
