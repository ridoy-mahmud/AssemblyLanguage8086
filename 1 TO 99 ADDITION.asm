.MODEL SMALL
.STACK 100H
.DATA
     ;ARR DECLARED
      I DW 1
      ADDS DW ?
    
.CODE
 
     MAIN PROC
     MOV AX , @DATA
     MOV DS, AX
     
     MOV AL , 99
     SUB AL , 48
     MOV CX , 0
     MOV CL,AL
     
     MOV BX,0
     
     SUM:
         ADD BX,I
         INC I
         LOOP SUM
         MOV ADDS ,BX 
     
     MOV AH,4CH
     INT 21H
     MAIN ENDP  
END MAIN




