`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 10:49:09 AM
// Design Name: 
// Module Name: main
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


module main(
input clk, rst,

output wire [31:0] checkx1,
output wire [31:0] checkx2,
output wire [31:0] checkx3,
output wire [31:0] checkx4,
output wire [31:0] checkx5,
output wire [31:0] checkx6,
output wire [31:0] DM0,
output wire [31:0] instr

    );
        //wire [31:0] instr;
        wire [31:0] PCF, PCFbar;
        wire [31:0] PCPlus4F, instrD, PCD, PCPlus4D, SrcAE;
        wire [4:0]  A1, A2, RdD, RdW, RdE, RdM, Rs1E, Rs2E, Rs1D, Rs2D;
        wire [6:0]  OP;
        wire [2:0]  funct3, funct3E;
        wire        funct7; wire funct5;
        wire        WE3;
        wire        RegWriteW;
        wire        RegWriteD;
        wire        MemWriteD;
        wire        JumpD;
        wire        BranchD;
        wire        ALUSrcD;
        wire        ZeroE;
        wire        RegWriteE;
        wire        MemWriteE, JumpE, BranchE, ALUSrcE, PCSrcE;
    
        wire [24:0] Imm;
        wire [6:0]  funct77;
        wire [31:0] ResultW, RD1, RD2;
        wire [31:0] ImmExtD;
        wire [2:0]  ImmSrcD;
        wire [1:0]  ResultSrcD, ResultSrcE, ResultSrcM, ResultSrcW;
        wire [4:0]  ALUControlD, ALUControlE;
        wire [31:0] RD1E, RD2E, PCE, ImmExtE, PCPlus4E;
        wire [31:0] PCTargetE;
        wire [31:0] SrcBE;
        wire [31:0] ALUResult, ALUResultM, ALUResultW;
        wire [31:0] WriteDataM, PCPlus4M, PCPlus4W;
        wire        CarryOut, RegWriteM, MemWriteM;
        wire [31:0] ReadData, ReadDataW, WriteDataE;
        wire [1:0]  ForwardAE, ForwardBE;
         wire        StallF, StallD, FlushE, FlushD;
        
        
        muxPC mux1 (
        .PCPlus4F(PCPlus4F), 
        .PCTargetE(PCTargetE), 
        .PCSrcE(PCSrcE),
        .PCFbar(PCFbar)
        );
        
        ProgramCounter pc (
        .clk(clk), 
        .rst(rst),
        .PCFbar(PCFbar),
        .PCF(PCF)
        );
        
        InstrMem instr_mem (
        .rst(rst),
        .PCF(PCF),
        .instr(instr)
        );
        
        PCAdder pcadder (
        .PCF(PCF), 
        .PCPlus4F(PCPlus4F)
        );
        
        register_fetch reg1 (
        .clk(clk), 
        .rst(rst),
        .instr(instr), 
        .PCF(PCF), 
        .PCPlus4F(PCPlus4F),
        .instrD(instrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D)
        );
        
        Instruction_Fetch iff (
        .instrD(instrD),
        .A1(A1),
        .A2(A2),
        .RdD(RdD),
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .OP(OP),
        .funct3(funct3),
        .funct7(funct7),
        .Imm(Imm),
        .funct77(funct77)
        );
        
        SignExtend sign_extend (
        .instr(instr),      //[24:0]
        .ImmSrcD(ImmSrcD),
        .ImmExtD(ImmExtD)
                );
        
        RegFile reg_file (
        .A1(A1),
        .A2(A2),
        .RdW(RdW),
        .ResultW(ResultW),
        .clk(clk),
        .RegWriteW(RegWriteW),
        .rst(rst),
        .RD1(RD1),
        .RD2(RD2),
        
        .checkx1  (checkx1  ),
        .checkx2  (checkx2  ),
        .checkx3  (checkx3  ),
        .checkx4  (checkx4  ),
        .checkx5  (checkx5  ),
        .checkx6  (checkx6  )

        
        );
                
        register_decode_execute reg2 (
        
        .PCD(PCD),
        .ImmExtD(ImmExtD),
        .PCPlus4D(PCPlus4D),
        .RD1(RD1),
        .RD2(RD2),
        .RdD(RdD),
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .funct3(funct3),
        .rst(rst),
        .clk(clk),
        .RegWriteD(RegWriteD),
        .MemWriteD(MemWriteD),
        .JumpD(JumpD),
        .BranchD(BranchD),
        .ALUSrcD(ALUSrcD),
        .ZeroE(ZeroE),
        .ResultSrcD(ResultSrcD),
        .ALUControlD(ALUControlD),
        .RegWriteE(RegWriteE),
        .MemWriteE(MemWriteE),
        .JumpE(JumpE),
        .BranchE(BranchE),
        .ALUSrcE(ALUSrcE),
        .PCSrcE(PCSrcE),
        .ResultSrcE(ResultSrcE ),
        .ALUControlE(ALUControlE),
        .PCE(PCE),
        .ImmExtE(ImmExtE),
        .PCPlus4E(PCPlus4E),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .funct3E(funct3E),
        .RdE(RdE),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E)
                
        );
                
        ALU alu (
        .SrcAE(SrcAE ),    //.SrcAE(SrcAE
        .SrcBE(SrcBE),
        .ALUControlE(ALUControlE),
        .funct3E(funct3E),
        .ALUResult(ALUResult),
        .CarryOut(CarryOut),
        .ZeroE(ZeroE)
        
        );
        
        PCTarget pcTarget (
        .PCE(PCE), 
        .ImmExtE(ImmExtE),
        .PCTargetE(PCTargetE)
        );
        
         mux_execute mux2 (
         .ALUSrcE(ALUSrcE),
         .WriteDataE(WriteDataE),
         .ImmExtE(ImmExtE),
         .SrcBE(SrcBE)
         
         );
         
         register_execute_mem reg3 (
         .WriteDataE(WriteDataE),
         .ALUResult(ALUResult ),
         .PCPlus4E(PCPlus4E  ),
         .RdE(RdE),
         .clk(clk),
         .rst(rst),
         .RegWriteE(RegWriteE ),
         .MemWriteE(MemWriteE ),
         .ResultSrcE(ResultSrcE),
         .ALUResultM(ALUResultM),
         .WriteDataM(WriteDataM),
         .PCPlus4M(PCPlus4M  ),
         .RdM(RdM),
         .RegWriteM(RegWriteM ),
         .MemWriteM(MemWriteM ),
         .ResultSrcM(ResultSrcM)
         );
        
        Data_Mem data_mem (
        .WriteDataM(WriteDataM),
        .ALUResultM(ALUResultM),
        .clk(clk),
        .MemWriteM(MemWriteM),
        .rst(rst),
        .ReadData(ReadData)
        
        );
        
        register_mem_wb reg4 (
        .ALUResultM(ALUResultM),
        .ReadData(ReadData),
        .PCPlus4M(PCPlus4M),
        .RdM(RdM),
        .rst(rst),
        .clk(clk),
        .RegWriteM(RegWriteM ),
        .ResultSrcM(ResultSrcM),
        .ALUResultW(ALUResultW),
        .ReadDataW (ReadDataW ),
        .PCPlus4W(PCPlus4W),
        .RdW(RdW),
        .ResultSrcW(ResultSrcW),
        .RegWriteW(RegWriteW)
        
        );
        
        
        
        mux_wb #(32) mux3 (
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .PCPlus4W(PCPlus4W),
        .ResultSrcW(ResultSrcW),
        .ResultW(ResultW)
        );
        
        
        controller cu (
        .OP(OP),
        .funct77(funct77),
        .funct3(funct3),
        .funct7(funct7),
        .MemWriteD(MemWriteD),
        .ALUSrcD(ALUSrcD),
        .RegWriteD(RegWriteD),
        .BranchD(BranchD),
        .JumpD(JumpD),
        .ResultSrcD(ResultSrcD),
        .ALUControlD(ALUControlD),
        .ImmSrcD(ImmSrcD)
        );
        
        
        forward1_mux #(32) muxxx (
                .RD1E(RD1E),
                .ResultW(ResultW),
                .ALUResultM(ALUResultM),
                .ForwardAE(ForwardAE ),
                .SrcAE(SrcAE)
            );
        
        forward2_mux #(32) muxxxxx (
                .RD2E(RD2E),
                .ResultW(ResultW),
                .ALUResultM(ALUResultM),
                .ForwardBE (ForwardBE),
                .WriteDataE(WriteDataE)
            );
            
        hazard_unit i_hu (
            .Rs1E(Rs1E),
            .Rs2E(Rs2E),
            .RdM(RdM),
            .RdW(RdW),
            .Rs1D(Rs1D),
            .Rs2D(Rs2D),
            .RdE(RdE),
            .ResultSrcE(ResultSrcE),
            .RegWriteM(RegWriteM),
            .RegWriteW(RegWriteW),
            .PCSrcE(PCSrcE),
            .StallF(StallF),
            .StallD(StallD),
            .FlushE(FlushE),
            .FlushD(FlushD),
            .ForwardAE(ForwardAE ),
            .ForwardBE(ForwardBE )
         );
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
    
     
endmodule
