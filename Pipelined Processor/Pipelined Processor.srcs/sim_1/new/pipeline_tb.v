`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 12:36:57 PM
// Design Name: 
// Module Name: pipeline_tb
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

module pipeline_tb ();
    reg clk;
    reg rst;

    main i_riscv (
        .clk(clk),
        .rst(rst)
    );
    
    initial clk=0;
    always #5 clk=~clk;

    initial begin
        rst = 1;
        #20
        rst = 0;
    end
 
endmodule
