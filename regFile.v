`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:43:03 AM
// Design Name: 
// Module Name: regFile
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
module regFile(
    input wire clk, we3, rst,
    input wire [4:0] A1, A2, A3,
    input wire [31:0] WD3,
    output [31:0] RD1, RD2
    );
  
    reg [31:0] registers [31:0];
  
    assign RD1 = (~rst) ? 32'h00000000 : registers[A1];
    assign RD2 = (~rst) ? 32'h00000000 : registers[A2];
    
    always @(posedge clk)
        begin
            if (we3)
            begin
            registers[A3] = WD3;
            end
        end
  
  initial begin
        registers[4] = 32'd14;//32'h00000005;
        registers[5] = 32'h00000006;
        registers[6] = 32'd10;//32'h00000004;
        registers[9] = 32'h00000020;
        
    end

endmodule