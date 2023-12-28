.MODEL SMALL
.STACK 100H
.DATA

.CODE
     MAIN PROC
     
     ; Taking Input
     MOV AH, 1
     INT 21H
     SUB AL, '0'  ; Convert ASCII character to numeric value
     MOV BL, AL
     
     ; Taking another input
     MOV AH, 1
     INT 21H
     SUB AL, '0'  ; Convert ASCII character to numeric value
     ADD BL, AL   ; Add the two numeric values
     
     ; Convert the sum back to ASCII character
     ADD BL, '0'
     
     ; Taking Output
     MOV AH, 2
     MOV DL, BL
     INT 21H
    
     ; Exit of this code
     MOV AH, 4CH
     INT 21H
     MAIN ENDP

END MAIN





