`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 01:23:00 AM
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(
  input wire [31:7] instr,      //[24:0]
  input wire [2:0] immSrcD,
  output reg [31:0] immExtD
    );
  
    //assign immExt = (immSrc == 1'b1) ? ({{20{in[31]}},in[31:25],in[11:7]}):
                                            //{{20{in[31]}},in[31:20]};
    always @ (*) 
    begin
    casex (immSrcD)
    
    3'b000:  immExtD = {{20{instr[31]}}, instr[31:20]};                            // I?type
    3'b001:  immExtD = {{20{instr[31]}}, instr[31:25], instr[11:7]};                  // S?type (stores)
    3'b010:  immExtD = {{20{instr[31]}}, instr[7],  instr[30:25], instr[11:8], 1'b0};   // B?type (branches)
    3'b011:  immExtD = {{12{instr[31]}}, instr[19:12],  instr[20], instr[30:21], 1'b0}; // J?type (branches)
    //3'b100:  ImmExtD = {Imm[31:12],12'b000000000000};                           // U?type
    default: immExtD = 32'dx;  
    
    endcase
    end
                                                   

//assign immExt = (instr[31]) ? ({{20{1'b1}},instr[31:20]}):
//                                     {{{20{1'b0}},instr[31:20]}};
endmodule











//assign immExt = (immSrc == 2'b00) ? {{20{instr[31]}},instr[31:20]} : 
//                  (immSrc == 2'b01) ? ({{20{instr[31]}},instr[31:25],instr[11:7]}) : 
//                  {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};

