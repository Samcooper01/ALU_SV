`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2024 09:24:56 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

logic [3:0]opcode;
logic [15:0]operand1;
logic [15:0]operand2;
logic clk;
logic [15:0]result;

ALU iDUT(.opcode(opcode), .operand1(operand1), .operand2(operand2), .result(result));

initial begin
    clk = 0;
    result = 0;
    opcode = 0;
    operand1 = 0;
    operand2 = 0;

    #5
    opcode = 4'd0;
    operand1 = 16'd100;
    operand2 = 16'd100;
    #5
    if(result == 16'd200) begin
         $display("Test 1 Passed: 100 + 100 = 200");
    end
    #5
    opcode = 4'd1;
    operand1 = 16'd100;
    operand2 = 16'd50;
    #5
    if(result == 16'd50) begin
         $display("Test 2 Passed: 100 - 50 = 50");
    end
    #5
    opcode = 4'd1;
    operand1 = 16'd50;
    operand2 = 16'd100;
    #5
    if(result == 16'hffce) begin
         $display("Test 3 Passed: 50 - 100 = 65,486");
    end
    #5
    opcode = 4'd2;
    operand1 = 16'hFFFF;
    operand2 = 16'h0012;
    #5
    if(result == 16'hFF12) begin
        $display("Test 4 Passed: 0xFFFF << 0x12 = 0xFF12"); 
    end
    #5
    opcode = 4'd3;
    operand1 = 16'd40;
    operand2 = 16'd40;
    #5
    if(result == 16'd1600) begin
        $display("Test 5 Passed: 40 * 40 = 1600");
    end
    #5
    opcode = 4'd4;
    operand1 = 16'd1600;
    operand2 = 16'd40;
    #5
    if(result == 16'd40) begin
        $display("Test 6 Passed: 1600 / 40 = 40");
    end
    #5
    opcode = 4'd4;
    operand1 = 16'd1600;
    operand2 = 16'd0;
    #5
    if(result == 16'd0) begin
        $display("Test 7 Passed: 1600 / 0 = 0");
    end
    #5
    
    
    $stop();
    

end

endmodule
