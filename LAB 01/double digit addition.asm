.model small
.stack 100h
.data
msg1 db "Enter first number: $"
msg2 db 0ah, 0dh, "Enter second number: $"
msg3 db 0ah, 0dh, "Enter third number: $"

a db 0
b db 0

.code
main proc
    mov ax, @data   ; Set the value of the AX register to the starting address of the data segment
    mov ds, ax      ; Move the value of AX to the DS register to set the data segment

    mov ah, 9       ; Set the value of the AH register to 9 to indicate a string output function
    lea dx, msg1    ; Load the offset of the first message into the DX register
    int 21h         ; Call interrupt 21h to display the message on standard output (console)

    mov ah, 1       ; Set the value of the AH register to 1 to indicate a character input function
    int 21h         ; Call interrupt 21h to read a character from standard input (keyboard)
    mov a, al       ; Move the value of AL to the variable a

    mov ah, 9       ; Set the value of the AH register to 9 to indicate a string output function
    lea dx, msg2    ; Load the offset of the second message into the DX register
    int 21h         ; Call interrupt 21h to display the message on standard output (console)

    mov ah, 1       ; Set the value of the AH register to 1 to indicate a character input function
    int 21h         ; Call interrupt 21h to read a character from standard input (keyboard)
    mov b, al       ; Move the value of AL to the variable b

    add al, a       ; Add the value of a to the value of AL
    mov ah, 0       ; Set the value of the AH register to 0
                    ; This clears the register from any garbage value
    aaa             ; Adjust the result of the addition operation to convert the sum to binary-coded decimal (BCD)

    add al, 48      ; Add 48 to the value of AL to convert it to the ASCII code of the corresponding digit
    add ah, 48      ; Add 48 to the value of AH to convert it to the ASCII code of the corresponding digit

    mov bx, ax      ; Move the value of AX to the BX register

    mov ah, 9       ; Set the value of the AH register to 9 to indicate a string output function
    lea dx, msg3    ; Load the offset of the third message into the DX register
    int 21h         ; Call interrupt 21h to display the message on standard output (console)

    mov ah, 2       ; Set the value of the AH register to 2 to indicate a character output function
    mov dl, bh      ; Move the value of BH to the DL register
    int 21h         ; Call interrupt 21h to display the high digit of the sum on standard output (console)

    mov ah, 2       ; Set the value of the AH register to 2 to indicate a character output function
    mov dl, bl      ; Move the value of BL to the DL register
    int 21h         ; Call interrupt 21h to display the low digit of the sum on standard output (console)

    mov ah, 4ch     ; Set the value of the AH register to 4Ch to indicate a program termination function
    int 21h
    main endp
end main
