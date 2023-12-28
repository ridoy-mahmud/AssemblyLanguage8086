.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 0AH, 0DH, "Enter the first Number: $"
MSG2 DB 0AH, 0DH, "Enter the second Number: $"
MSG3 DB 0AH, 0DH, "Enter the third Number: $"
MSG4 DB 0AH, 0DH, "The reault is = $" 

.CODE
     MAIN PROC
     
     MOV AX, @DATA 
     MOV DS, AX
     
     ;Showing Message to the user    
     MOV DX, OFFSET MSG1 
     MOV AH, 09H 
     INT 21H 
     
     MOV AH , 1
     INT 21H
     
     MOV BL,AL
     SUB BL,48 ;1ST INPUT
     INT 21H                         ;2A - 2B + C
     
     MOV BH,AL
     SUB BH,48  ;2ND INPUT
     INT 21H
     
     MOV CL,AL
     SUB CL, 48   ;3RD INPUT
     
     ADD BL,BL
     SUB BL,BH
     SUB BL,BH
     ADD BL,CL
     
     MOV DX, OFFSET MSG4 
     MOV AH, 09H 
     INT 21H
     
     MOV AH ,2
     ADD BL,48
     MOV DL , BL
     INT 21H
     
     
     ; Exit of this code
     MOV AH, 4CH
     INT 21H
     MAIN ENDP

END MAIN

