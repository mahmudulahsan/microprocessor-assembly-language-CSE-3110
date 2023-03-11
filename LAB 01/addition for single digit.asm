 .model small
 .stack 100h
 .data
    A DW 2
    B DW 4
    C DW ?
 MAIN PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AX, A  
    ADD AX, B
    MOV C, AX
    ADD C, 48  
    
    MOV DX, C
    MOV AH, 2
    INT 21H
    
 main endp
    end main                                                            