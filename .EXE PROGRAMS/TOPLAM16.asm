PAGE  60,80
TITLE 16 BITLIK POZITIF IKI SAYININ TOPLANMASI

;80X86 AILESINDE REGISTERLAR 16 BIT OLDUGU ICIN SONUCU 
;TASMA IHTIMALINE KARSI SONUC ADLI DOUBLEWORD TANIMLI BIR 
;DEGISKENDE SAKLAYACAGIZ

STACKSG         SEGMENT PARA STACK 'STACK'
                DW 32 DUP(?)
STACKSG         ENDS
DATASG          SEGMENT PARA 'DATA'
                SAYI1 DW 0ABCDh
                SAYI2 DW 0ABCDh
                SONUC DD 0
DATASG          ENDS
CODESG          SEGMENT PARA 'CODE'
                ASSUME SS:STACKSG, DS:DATASG, CS:CODESG
BASLA           PROC FAR
    
                PUSH DS
                XOR AX,AX
                PUSH AX
                
                MOV AX,DATASG
                MOV DS,AX
                
                ;PROGRAMIN BASLANGICI
                
                XOR AX,AX
                XOR BX,BX
                
                MOV AX,SAYI1        ;SAYI1, AX E AL
                MOV BX,SAYI2        ;SAYI2 BX E AL
                
                LEA SI,SONUC         ;SI YA SONUC DEGISKENIN BASLANGIC ADRESINI AT
                
                ADD AX,BX            ;TOPLAMA ISLEMINI YAP
                MOV [SI],AX          ;ISLEMI SONUCUN AZ ANLAMLI KISMINA ATA
                
                ADC WORD PTR [SI + 2],0  ;TASMA VARSA DIYE CARRY I SONUC UN YUKSEK KISMINA ATA
                 
      
                RET
BASLA           ENDP
CODESG          ENDS
                END   BASLA