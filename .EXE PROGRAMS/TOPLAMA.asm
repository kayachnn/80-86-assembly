PUBLIC      TOPLAMA
CODESG      SEGMENT PARA 'CODE'
            ASSUME CS:CODESG
TOPLAMA     PROC FAR
            
            
            XOR AX,AX
            ADD AL,BL
            ADD AL,BH
            ADC AH,0
            RET

TOPLAMA     ENDP
CODESG      ENDS
            END
            