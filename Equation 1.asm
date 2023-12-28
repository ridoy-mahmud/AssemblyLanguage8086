.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 0AH,0DH,"Enter first numbers $"
MSG2 DB 0AH,0DH,"The result is -  $"

.CODE

    MAIN PROC
    MOV AX , @DATA                                                          ; A + 4B - C
    MOV DS , AX
    
    LEA DX , MSG1
    MOV AH , 9
    INT 21H
    
    MOV AH ,1
    INT 21H
           
    MOV BL,AL
    SUB BL , 48
    INT 21H                           ;A + 4B -C 
    
    MOV BH,AL
    SUB BH, 48
    INT 21H
    
    MOV CL,AL
    SUB CL, 48
    
    ADD BL ,BH
    ADD BL ,BH
    ADD BL ,BH
    ADD BL ,BH
    
    SUB BL,CL
    
    MOV AH ,2
    MOV DL, 0AH
    INT 21H      ;New line
    MOV DL, 0DH
    INT 21H
    
    LEA DX , MSG2
    MOV AH , 9
    INT 21H
    
    MOV AH,2
    ADD BL,48
    MOV DL, BL    ;Output
    INT 21H
        
    MOV AH,4CH
    INT 21H
    MAIN ENDP    

END MAIN

