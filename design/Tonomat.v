`timescale 1ns / 1ps

module Tonomat(
    input RON1 , RON5 , RON10 ,
    input CLK , RESET ,
    output reg PRODUS , R1 , R5
    );
    
    reg [3:0] current_state , next_state;
    
    always@(posedge CLK, posedge RESET)
    begin
        if(RESET)
            current_state <= 0;
        else
            current_state <= next_state;
    end
    
    always@(current_state, RON1, RON5, RON10)
    begin
        case(current_state)
        0:
        begin
           if(RON1)
               next_state = 1;
           else if(RON5)
               next_state = 12;
           else if(RON10)
               next_state = 11;
           else 
               next_state = current_state;    
            
        end
        1: 
        begin
            if(RON1)
               next_state = 2;
           else if(RON5)
               next_state = 9;
           else if(RON10)
               next_state = 10;
           else 
               next_state = current_state;
        end
        2: 
        begin
            if(RON1)
               next_state = 3;
           else if(RON5)
               next_state = 4;
           else if(RON10)
               next_state = 8;
           else 
               next_state = current_state;
        end
        3: next_state = 0;
        4: next_state = 5;
        5: next_state = 6;
        6: next_state = 7;
        7: next_state = 0;
        8: next_state = 5;
        9: next_state = 6;
        10: next_state = 6;
        11: next_state = 7;
        12 : next_state = 7;
        endcase 
    end
    
    always@(current_state)
    begin
        case(current_state)
        0: 
        begin
            PRODUS = 0;
            R1 = 0;
            R5 = 0;
        end
        1: 
        begin
            PRODUS = 0;
            R1 = 0;
            R5 = 0;
        end
        2: 
        begin
            PRODUS = 0;
            R1 = 0;
            R5 = 0;
        end
        3: 
        begin
            PRODUS = 1;
            R1 = 0;
            R5 = 0;
        end
        4: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 0;
        end
        5: 
        begin
            PRODUS = 0;
            R1 = 1;
            R5 = 0;
        end
        6: 
        begin
            PRODUS = 0;
            R1 = 1;
            R5 = 0;
        end
        7: 
        begin
            PRODUS = 0;
            R1 = 1;
            R5 = 0;
        end
        8: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 1;
        end
        9: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 0;
        end
        10: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 1;
        end
        11: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 1;
        end
        12: 
        begin
            PRODUS = 1;
            R1 = 1;
            R5 = 0;
        end
        endcase 
    end
endmodule

