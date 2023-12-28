.MODEL SMALL
.STACK 100H
.DATA

NUM1 DB ?
NUM2 DB ?

MSG1 DB 0AH,0DH,"Enter the first number - $"
MSG2 DB 0AH,0DH,"Enter the first number - $"
MSG3 DB 0AH,0DH,"The Grater number is --   $"

.CODE
     MAIN PROC
     
     MOV AX, @DATA 
     MOV DS, AX
     
     MOV DX , OFFSET MSG1
     MOV AH, 09H
     INT 21H
     
     MOV AH ,1
     INT 21H
     MOV BL ,AL
     SUB BL , 48
     
     MOV DX , OFFSET MSG2
     MOV AH, 09H
     INT 21H
     
     MOV AH ,1
     INT 21H
     MOV BH ,AL
     SUB BH , 48
     
     CMP BL,BH
     JG LEVEL
     
      
     MOV DX , OFFSET MSG3
     MOV AH, 09H
     INT 21H
     
     MOV AH ,2
     ADD BH , 48
     MOV DL,BH
     INT 21H
     
     JMP EXIT:
     
     LEVEL: 
     MOV AH ,2
     ADD BL, 48
     MOV DL, BL
     INT 21H
  
    
     EXIT:
     MOV AH, 4CH
     INT 21H
     MAIN ENDP

END MAIN



