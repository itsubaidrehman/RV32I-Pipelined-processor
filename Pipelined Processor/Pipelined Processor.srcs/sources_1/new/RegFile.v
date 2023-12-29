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
    input        RegWriteW,
    input  [4:0] A1,
    input  [4:0] A2,
    input  [4:0] RdW,         //A3
    input  [31:0] ResultW,
    output reg [31:0] RD1, RD2
    );
  
    reg [31:0] registers [31:0];
    integer i;
    
    always @(*) begin
            registers[28] = 32'd6;
            registers[22] = 32'd4;
            registers[18] = 32'd6;
    
            
            RD1 = registers[A1];
            RD2 = registers[A2];
    
//            checkx1 = Registers[1];
//            checkx2 = Registers[2];
//            checkx3 = Registers[3];
//            checkx4 = Registers[19];
//            checkx5 = Registers[5];
//            checkx6 = Registers[6];
            
        end
  
//    assign RD1 = (rst) ? 32'h00000000 : registers[A1];
//    assign RD2 = (rst) ? 32'h00000000 : registers[A2];
    
   always @(negedge clk) begin
            if (rst) begin
                for(i = 0; i < 32;i = i + 1) begin
                    registers[i] <= 32'd0;
                end
    
            end else if (RegWriteW && (|RdW)) begin    //|RdW, avoid writing at x0
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
