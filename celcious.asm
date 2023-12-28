.MODEL SMALL
.STACK 100H
.DATA
    F DW ?
    MSG DB 'Result: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 260      ; Celsius temperature
    MOV BX, 9
    MUL BX           ; AX = Celsius * 9
    MOV BX, 5
    DIV BX           ; AX = (Celsius * 9) / 5
    ADD AX, 32       ; AX = (Celsius * 9) / 5 + 32
    SUB AX, 1        ; AX = (Celsius * 9) / 5 + 31
    MOV F, AX

    ; Display the result as an integer
    MOV AH, 09h
    LEA DX, MSG
    INT 21h

    MOV AX, F
    MOV AH,2
    INT 21H

    ; Terminate the program
    MOV AX, 4CH
    INT 21h
    MAIN ENDP

END MAIN
