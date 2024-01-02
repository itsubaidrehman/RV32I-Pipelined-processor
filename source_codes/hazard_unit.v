`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 02:40:51 PM
// Design Name: 
// Module Name: hazard_unit
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

module hazard_unit (
    input      [4:0] Rs1E,
    input      [4:0] Rs2E,
    input      [4:0] RdM,
    input      [4:0] RdW,
    input      [4:0] Rs1D,
    input      [4:0] Rs2D,
    input      [4:0] RdE,
    input      [1:0] ResultSrcE,
    input            RegWriteM,
    input            RegWriteW,
    input            PCSrcE,
    output reg       StallF,
    output reg       StallD,
    output reg       FlushE,
    output reg       FlushD,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
);
    reg lwStall;
    //Forward to solve data hazards when possible
    always @(*) begin
        if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 0) ) begin  //forward from mem stage
            ForwardAE = 2'b10;
        end
        else if ( ((Rs1E == RdW) && RegWriteW) && (Rs1E != 0) ) begin
            ForwardAE = 2'b01;                 //forward from wb stage
        end
        else begin
            ForwardAE = 2'b00;
        end
        
    end

    always @ (*) begin
        if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 0) ) begin
            ForwardBE = 2'b10;
        end
        else if ( ((Rs2E == RdW) && RegWriteW) && (Rs2E != 0) ) begin
            ForwardBE = 2'b01;
        end
        else begin
            ForwardBE = 2'b00;
        end
        
    end

    always @ (*) begin
        
        lwStall = (ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE)));
        StallD  = lwStall;    //Stall when a load hazard occurs
        FlushE  = lwStall | PCSrcE;   //Flush when a branch is taken or a load introduces a bubble
        StallF  = lwStall;    //Stall when a load hazard occurs
        FlushD  = PCSrcE;  //Flush when a branch is taken or a load introduces a bubble
    end

endmodule
