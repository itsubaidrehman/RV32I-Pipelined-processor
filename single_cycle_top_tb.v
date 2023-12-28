`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 03:05:18 AM
// Design Name: 
// Module Name: single_cycle_top_tb
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


module testbench ();
    
    reg clk=1'b1,rst;

    single_cycle single_cycle_tb (
                                .clk(clk),
                                .rst(rst)
    );

//    initial begin
//        $dumpfile("Single Cycle.vcd");
//        $dumpvars(0);
//    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
        $finish;
    end
endmodule
