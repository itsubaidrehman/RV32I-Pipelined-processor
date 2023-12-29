`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 02:57:32 AM
// Design Name: 
// Module Name: register_decode_execute
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


module register_decode_execute(
  input            clk,
  input            rst,
  input     [31:0] RD1,
  input     [31:0] RD2,
  input     [31:0] PCD,
  input     [31:0] RdD,
  input     [31:0] ImmExtD,
  input     [31:0] PCPlus4D,
  input            MemWriteD,
  input            ALUSrcD,
  input            RegWriteD,
  input            BranchD,
  input            JumpD, //PCSrc
  input      [1:0] ResultSrcD,
  input      [4:0] ALUControlD,
  input      [2:0] ImmSrcD,
  output reg [31:0] RD1E,
  output reg [31:0] RD2E,
  output reg [31:0] PCE,
  output reg [31:0] RdE,
  output reg [31:0] ImmExtE,
  output reg [31:0] PCPlus4E,
  output reg       MemWriteE,
  output reg       ALUSrcE,
  output reg       RegWriteE,
  output reg       BranchE,
  output reg       JumpE, //PCSrc
  output reg [1:0] ResultSrcE,
  output reg [4:0] ALUControlE,
  output reg [2:0] ImmSrcE


    );
    
    reg PCSrcE;
    wire ZeroE;
  
  always @(posedge clk) begin
        if (rst) begin
            RegWriteE   <= 0;
            MemWriteE   <= 0;
            JumpE       <= 0;
            BranchE     <= 0;
            ALUSrcE     <= 0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 5'b00000;
            PCE         <= 32'd0;
            ImmExtE     <= 32'd0;
            PCPlus4E    <= 32'd0;
            RD1E        <= 32'd0;
            RD2E        <= 32'd0;
            
            RdE         <= 5'd0;
            
        end
        
        else begin
            RegWriteE   <= RegWriteD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUSrcE     <= ALUSrcD;
            ResultSrcE  <= ResultSrcD;
            ALUControlE <= ALUControlD;
            PCE         <= PCD;
            ImmExtE     <= ImmExtD;
            PCPlus4E    <= PCPlus4D;
            RD1E        <= RD1;
            RD2E        <= RD2;
            
            RdE         <= RdD;
           
        end
        
    end
    
    always @(*) begin    //this is a combinational block, so block assignment should be used
        PCSrcE = (ZeroE && BranchE) || JumpE;
    end
  
endmodule
