`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2024 09:22:40 PM
// Design Name: 
// Module Name: ALU
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

typedef enum {
    Add,
    Sub,
    Lshf,
    Mul,
    Div
} OpCode;


module ALU(
    input logic [3:0]opcode,
    input logic [15:0]operand1,
    input logic [15:0]operand2,
    output logic [15:0]result
    );
    
    always_comb begin
        case(opcode)
            Add:    result = operand1 + operand2;
            Sub:    result = operand1 - operand2;
            Mul:    result = operand1 * operand2;
            Lshf:   result = (operand1 << 8) + operand2[7:0];
            Div: begin //If div by 0 then result == 0
                if(operand2 == 0) begin
                    result = 16'h0000;
                end else begin
                    result = operand1 / operand2;            
                end
            end
        endcase
    end
    
endmodule
