.model small
.stack 100h
.data     
.code
main proc
    
    mov ah, 1   ; Set the value of the AH register to 1 to indicate a character input function
    int 21h     ; Call interrupt 21h to read a character from standard input (keyboard)
    mov bx, ax  ; Move the ASCII code of the input character to the BX register
    
    mov ah, 1   ; Set the value of the AH register to 1 again to read the second character
    int 21h     ; Call interrupt 21h to read the second character from standard input
                ; This character will be stored in the AX register
    
    add bx, ax  ; Add the ASCII codes of the two characters and store the result in the BX register
    sub bx, 48  ; Subtract 48 from the result to convert the ASCII code of the two-digit number to its numeric value
                ; 48 is the ASCII code for '0'
    mov dx, bx  ; Move the numeric value of the two-digit number to the DX register
    mov ah, 2   ; Set the value of the AH register to 2 to indicate a print function
    int 21h     ; Call interrupt 21h to display the result on standard output (console)
    
    mov ah, 4CH ; Set the value of the AH register to 4Ch to indicate a program termination function
    int 21h     ; Call interrupt 21h to terminate the program
    
main endp
end main
