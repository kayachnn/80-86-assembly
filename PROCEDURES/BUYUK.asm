PUBLIC      BUYUK
EXTRN       DIZI:WORD

CODESG      SEGMENT PARA PUBLIC 'CODE'
            ASSUME CS:CODESG
BUYUK       PROC FAR
            
            XOR SI,SI
            MOV AX,DIZI[SI]
            SUB CX,1
     L1:    ADD SI,2
            CMP AX,DIZI[SI]
            JA  DEVAM
            MOV AX,DIZI[SI]
     DEVAM: LOOP L1
            RET
BUYUK       ENDP
CODESG      ENDS
            END