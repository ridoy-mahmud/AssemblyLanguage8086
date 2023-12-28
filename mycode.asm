.MODEL SMALL
.STACK 100
.DATA

VAR1 DB ?
VAR2 DB ?
RES DB ? ; Note: Use single quotes to represent characters

MSG1 DB 0AH,0DH,'The first digit - $'
MSG2 DB 0AH,0DH, 'The second digit - $'


.CODE 
  MAIN PROC
  
  MOV AX, @DATA
  MOV DS, AX
  
  MOV DX, OFFSET MSG1
  MOV AH, 09H
  INT 21H
  
  MOV AH,1
  INT 21H
  MOV DL,VAR1
  
  MOV DX, OFFSET MSG2
  MOV AH, 09H
  INT 21H
  
  MOV AH,1
  INT 21H
  MOV DL,VAR2
 
  
  ;OUTPUT
  MOV AH, 2
  MOV DL,AL 
  INT 21H
  

  ; Convert ASCII to integer
  SUB DL, '0'   ; Subtract ASCII value of '0'
  MOV AH, 0     ; Clear AH to store the result in AX
  MOV AL, DL    ; Move the converted value to AL
      
  ; Now, AL contains the integer value of VAR1
  
  MOV AH, 4CH
  INT 21H    
  MAIN ENDP

END MAIN


