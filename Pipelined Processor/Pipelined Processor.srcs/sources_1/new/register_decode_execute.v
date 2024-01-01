`timescale 1ns / 1ps



module register_decode_execute(
  input            clk,
  input            rst,
  input     [31:0] RD1,
  input     [31:0] RD2,
  input     [31:0] PCD,
  input     [4:0]  RdD,Rs1D, Rs2D,
  input     [31:0] ImmExtD,
  input     [31:0] PCPlus4D,
  input            MemWriteD,
  input            ALUSrcD,
  input            RegWriteD,
  input            BranchD, 
  input            ZeroE,
  input            JumpD, //PCSrc
  input      [1:0] ResultSrcD,
  input      [4:0] ALUControlD,
  input      [2:0] funct3, //ImmSrcD
  output reg [31:0] RD1E,
  output reg [31:0] RD2E,
  output reg [31:0] PCE,
  output reg [4:0]  RdE, Rs1E, Rs2E,
  output reg [31:0] ImmExtE,
  output reg [31:0] PCPlus4E,
  output reg       MemWriteE,
  output reg       ALUSrcE,
  output reg       PCSrcE,
  output reg       RegWriteE,
  output reg       BranchE,
  output reg       JumpE, //PCSrc
  output reg [1:0] ResultSrcE,
  output reg [4:0] ALUControlE,
  output reg [2:0] funct3E //ImmSrcE


    );
    
    
    
  
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
            Rs1E        <= 0;
            Rs2E        <= 0;
            funct3E     <= 0;
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
            Rs1E        <= Rs1D;
            Rs2E        <= Rs2D;
            RdE         <= RdD;
            funct3E     <= funct3;
           
        end
        
    end
    
    always @(*) begin    //this is a combinational block, so block assignment should be used
        PCSrcE = (ZeroE && BranchE) || JumpE;
    end
  
endmodule
