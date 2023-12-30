`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:16:34 AM
// Design Name: 
// Module Name: InstrMem
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


module InstrMem (
  input wire rst,
  input wire [31:0] PCF,
  output reg [31:0] instr
    );
  
    reg [31:0] instr_mem_reg [255:0];  //256 locations for instr, each instr of 32 bits
    //assign RD = (~rst) ? {32{1'b0}} : instr_mem_reg[A[31:0]];  // not instr_mem_reg[A] ??
    always @(*)
      begin
        if (rst)
        instr = 0;
        else
        instr = instr_mem_reg[PCF[31:2]];

      end
      
          initial
            begin
            instr_mem_reg[0] <= 32'h01450513;  //addi x10, x10, 20
            instr_mem_reg[1] <= 32'h00a58593;  //addi x11, x11, 10
            instr_mem_reg[2] <= 32'h00060613;  //addi x12, x12, 0
            instr_mem_reg[3] <= 32'h00068693;  //addi x13, x13, 0
            instr_mem_reg[4] <= 32'h00170713;  //addi x14, x14, 1
            instr_mem_reg[5] <= 32'h01f78793;  //addi x15, x15, 31
            instr_mem_reg[6] <= 32'h02d61c63;  //bne x12, x13, 56
            instr_mem_reg[7] <= 32'h40b508b3;  //sub x17, x10, x11
            instr_mem_reg[8] <= 32'h00f8d8b3;
            instr_mem_reg[9] <= 32'h00e8c8b3;
            instr_mem_reg[10] <= 32'h00d89a63;
            instr_mem_reg[11] <= 32'h00a68833;
            instr_mem_reg[12] <= 32'h00b68533;
//            010685b3
//            fed680e3
//            00d59663
//            00160613
//            fcd68ae3
//            40b50533
//            fcd686e3
//            00a688b3
//            01142023
            end
      
//      //D:\RV32I-Pipelined-processor\Pipelined Processor\Pipelined Processor.srcs\sources_1\new
//      initial begin
//              //prefer absolute paths in simulators
//              $readmemh("D:\RV32I-Pipelined-processor\Pipelined Processor\Pipelined Processor.srcs\sources_1\new\imstruction.mem", instr_mem_reg);
//          end


endmodule

