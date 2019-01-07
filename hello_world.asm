PAGE        60,80
TITLE       EKRANA MESAJ YAZMA

MYSS        SEGMENT PARA STACK 'STACK'
            32 DW DUP(0)
MYSS        ENDS
MYDS        SEGMENT PARA 'DATA'
            
            MESAJ DB 'HELLO WORLD','$'
            
MYDS        ENDS
MYCS        SEGMENT PARA 'CODE'
            ASSUME  SS:MYSS, DS:MYDS, CS:MYCS   
            
;INT 10 YARDIMIYLA EKRANI SILMEYI SAGLAYACAK MACRO

SIL         MACRO
            
            MOV CX,0000H        ;EKRANIN SOL UST KOSESI
            MOV DX,184FH        ;EKRANIN SAG ALT KOSESI
            MOV BH,07H          ;ATTRIBUTE BYTE
            MOV AX,0600H        ;AH = 06H PENCERE YUKARI KAYDIRMA
            INT 10H
            ENDM
             

;INT 21H YARDIMIYLA EKRANA MESAJ YAZAN MACRO             
YAZDIR      MACRO  TEXT
            
            MOV DX,OFFSET TEXT         ;DX YAZILACAK MESAJIN BASININ GOSTERMELI
            MOV AH,09H          ;AH=09H EKRANA MESAJ YAZMA
            INT 21H  
            ENDM    


BASLA       PROC FAR
    
            PUSH DS
            XOR AX,AX
            PUSH AX
            
            MOV AX,MYDS
            MOV DS,AX
            
            ;PROGRAMIN BASLADIGI YER
            
            
            SIL
            YAZDIR MESAJ
    
    
    
            
            RET
BASLA       ENDP
MYCS        ENDS
            END  BASLA
