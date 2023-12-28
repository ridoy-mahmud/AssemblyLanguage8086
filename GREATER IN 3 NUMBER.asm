.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 0AH, 0DH , "Enter the first digit - $"
MSG2 DB 0AH, 0DH , "Enter the second digit - $"
MSG3 DB 0AH, 0DH , "Enter the third digit - $"
MSG4 DB 0AH, 0DH , "The Result is - $"

NUM1 DB ?
NUM2 DB ?
NUM3 DB ?

.CODE 

        MAIN PROC
        
        MOV AX,@DATA
        MOV DS , AX
        
        MOV DX , OFFSET MSG1
        MOV AH , 09H
        INT 21H
        
        MOV AH ,1
        INT 21H
        MOV BH ,AL
        SUB BH , 48
        
        MOV DX , OFFSET MSG2
        MOV AH , 09H
        INT 21H
        
        MOV AH ,1
        INT 21H
        MOV BL ,AL
        SUB BL , 48 
        
        MOV DX , OFFSET MSG3
        MOV AH , 09H
        INT 21H
        
        MOV AH ,1
        INT 21H
        MOV CL ,AL
        SUB CL , 48
        
        MOV AH ,2 
        MOV DL , 0AH
        INT 21H
        MOV DL , 0DH
        INT 21H
        
        MOV DX , OFFSET MSG4
        MOV AH , 09H
        INT 21H
        
        ;COMPARE  
        CMP BH , BL
        JG LEVEL1
        
        CMP BL ,CL
        JG LEVEL3
        MOV AH , 2
        ADD CL , 48
        MOV DL , CL
        INT 21H
        
        LEVEL1:
        CMP BH , CL
        JG LEVEL2
        MOV AH , 2
        ADD CL , 48
        MOV DL , CL
        INT 21H 
        
        JMP EXIT
        
        LEVEL2:
        MOV AH , 2
        ADD BH , 48
        MOV DL , BH
        INT 21H
        
        JMP EXIT
        
        LEVEL3:
        MOV AH , 2
        ADD BL , 48
        MOV DL , BL
        INT 21H
        
        JMP EXIT
        
        EXIT:
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
END MAIN 




