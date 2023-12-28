.MODEL SMALL
.STACK 100H
.DATA

.CODE

NUM1 DB ?
NUM2 DB ?
NUM3 DB ?

MSG1 DB 0AH,0DH,"Enter the first number - $"
MSG2 DB 0AH,0DH,"Enter the second number -  $"
MSG3 DB 0AH,0DH,"Enter the third number - $"
MSG4 DB 0AH,0DH,"The resault - $"

MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    MOV DX , OFFSET MSG1
    MOV AH , 09H
    INT 21H
    
    MOV AH ,1
    INT 21H
    MOV NUM1, AL
    SUB NUM1 , 48
   
    
    MOV DX , OFFSET MSG2
    MOV AH , 09H
    INT 21H
    
    MOV AH ,1
    INT 21H
    MOV NUM2, AL
    SUB NUM2 , 48
    
    
    MOV DX , OFFSET MSG3
    MOV AH , 09H
    INT 21H
    
    MOV AH ,1
    INT 21H
    MOV NUM3, AL
    SUB NUM3 , 48
    
    MOV BH, NUM1
    MOV BL, NUM2
    MOV CL, NUM3
    
    CMP BH , BL
    JG LEVEL1
    
    CMP BL , CL
    JG LEVEL3
    MOV AH ,2
    ADD CL , 48
    MOV DL , CL
    INT 21H
    
    JMP EXIT:
    LEVEL1:
           CMP BH , CL
           JG LEVEL2
           MOV AH ,2
           ADD CL , 48
           MOV DL , CL
           INT 21H
    JMP EXIT:
    LEVEL2:
           MOV AH ,2
           ADD BH , 48
           MOV DL , BH
           INT 21H
    JMP EXIT:
    LEVEL3:
            MOV AH ,2
            ADD BL , 48
            MOV DL , BL
            INT 21H
            
    
    EXIT:
    MOV AH , 4CH
    INT 21H
    MAIN ENDP

END MAIN

