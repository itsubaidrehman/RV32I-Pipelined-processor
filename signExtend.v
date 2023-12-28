`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 12:45:33 AM
// Design Name: 
// Module Name: signExtend
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

module signExtend(
  input wire [31:7] instr,      //[24:0]
  input wire [1:0] immSrc,
  output wire [31:0] immExt
    );
  
    //assign immExt = (immSrc == 1'b1) ? ({{20{in[31]}},in[31:25],in[11:7]}):
                                            //{{20{in[31]}},in[31:20]};
  assign immExt = (immSrc == 2'b00) ? {{20{instr[31]}},instr[31:20]} : 
                  (immSrc == 2'b01) ? ({{20{instr[31]}},instr[31:25],instr[11:7]}) : 
                  {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};

//assign immExt = (instr[31]) ? ({{20{1'b1}},instr[31:20]}):
//                                     {{{20{1'b0}},instr[31:20]}};
endmodule
