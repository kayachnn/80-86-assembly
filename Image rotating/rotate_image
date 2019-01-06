
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <iostream>
#include "image_processing.cpp"

using namespace std;

void sagaDondur(short n, int resim);
void solaDondur(short n, int resim);

int main(void) {
	int M, N, Q, i, j, k;
	bool type;
	int efile, islem;
	char resimadi[100], sonek[10];
	do {
		printf("Islem yapilacak resmin yolunu (path) giriniz:\n-> ");
		scanf("%s", &resimadi);
		system("CLS");
		efile = readImageHeader(resimadi, N, M, Q, type);
	} while (efile > 1);
	printf("%s\n", resimadi);
	int** resim = resimOku(resimadi);

	short *resimdizi;
	resimdizi = (short*) malloc(N*M * sizeof(short));

	for (i = 0; i < N; i++) 
		for (j = 0; j < M; j++) 
			resimdizi[i*N + j] = (short) resim[i][j];

	int resimadres = (int) resimdizi;

	do {
		system("CLS");
		printf("\n\n 16011008  \n Cihan kaya\n ");
		printf("\t     ISLEMLER\n");
		printf("------------------------------------\n");
		printf("1)  Resmi saga dondur\n");
		printf("2)  Resmi sola dondur\n");
		printf("0)  Cikis\n\n");
		printf("\"%s\" yolundaki resim icin yapilacak islemi seciniz\n-> ", resimadi);
		scanf("%d", &islem);
	} while (islem > 2 || islem < 0);

	switch (islem) {
		case 0:
			exit(0);
		case 1:
			sagaDondur(N, resimadres);
			strcpy(sonek, "_sag.pgm");
			break;
		case 2:
			solaDondur(N , resimadres);
			strcpy(sonek, "_sol.pgm");
			break;
		default:
			strcpy(sonek, "_orj.pgm");
			break;
	}

	for (k = 0; k < N * M; k++) {
		j = k % N;
		i = k / N;
		resim[i][j] = (int)resimdizi[k];
	}
	
	string::size_type pos = string(resimadi).find_last_of(".");
	resimadi[pos] = '\0';
	strcat(resimadi, sonek);
	resimYaz(resimadi, resim, N, M, Q);
	printf("\nIslem basariyla tamamlandi :)\n\"%s\" yolunda resim olusturuldu.\n\n", resimadi);
	system("PAUSE");
	return 0;
}

void sagaDondur(short n, int resim) {
	
	__asm {
		

                ;;
;
;
;
;BU ISLEM ICIN KULLANILAN C KODU
;
;for(x=0;x<n/2;x++){
;for(y=x; y<n-x-1;y++){
;tmp=matris[y*n + x];
;matris[y*n + x] = matris[(n-1-x)*n + y];
;matris[(n-1-x)*n +y] = matris[(n-1-y)*n + (n-1-x)] ;
;matris[(n-1-y)*n + (n-1-x)]= matris[(x*n) + (n-1-y)];
;matris[(x*n) + (n-1-y)] = tmp;
;}
;}

		  XOR EAX,EAX
		  XOR EBX,EBX
		  XOR ECX,ECX
		  XOR EDX,EDX
		  XOR ESI,ESI
		  XOR EDI,EDI

		  MOVZX EAX,n
		  SHR EAX,1
		  MOV ECX,EAX
		  MOV EBX,0        ;EBX E X DEGERINI ATA


    LOOP1:PUSH ECX
          XOR ECX,ECX
		  MOVZX EAX,n
		  SUB EAX,EBX				;EAX TE N-X DEGERI VAR
		  SUB EAX,EBX				;EAX TE N-2X DEGERI VAR
		  DEC EAX					;EAX TE N-2X-1 DEGERI VAR

		  MOV ECX,EAX

		  MOV EDX,EBX					;Y=X ATAMASI YAP

	LOOP2:
		  MOVZX EAX,n
		  PUSH EDX
		  MUL EDX             ;EAX TE N*Y DEGERI VAR
		  POP EDX

		  ADD EAX,EBX               ;EAX TE N*Y + X VAR
		  SHL EAX,1
		  MOV EDI,resim
		  
		  PUSH  WORD PTR[EDI+EAX]         ;DIZI[N*Y + X ] DEGERI STACKE ATILIYOT
          
          

		  MOVZX EAX,n
		  SUB EAX,EBX                   ;EAX TE N-X DEGERI VAR
		  DEC EAX                 ;EAX TE N-X-1 DEGERI VAR
		  
		  
		  PUSH EDX
		  MUL DWORD PTR n                     ;EAX TE (N-X-1)*N DEGERI VAR
		  POP EDX
		  
          ADD EAX,EDX                  ;EAX TE (N-X-1)*N + Y DEGERI VAR
		  SHL EAX,1
		  MOV EDI,resim
		  MOV SI,[EDI + EAX]                  ;SI DA DIZI[(N - X - 1)*N + Y]
		  
         

		  MOVZX EAX,n
		  PUSH EDX
		  MUL EDX             ;EAX TE N*Y VAR
		  POP EDX
		  ADD EAX , EBX        ;EAX TE N*Y + X VAR
		  SHL EAX,1
		  MOV [EDI + EAX],SI           ;DIZI[Y*N + X] = DIZI[(N-1-X)*N + Y]
		

		  MOVZX EAX,n
		  SUB EAX,EDX          ;EAX TE N-Y DEGERI VAR
		  DEC EAX                    ;EAX TE N-Y-1 DEGERI VAR
		 
	

		  PUSH EDX
		  MUL DWORD PTR n             ;EAX TE (N-Y-1)*N DEGERI VAR
		  POP EDX
		  
		  MOVZX ESI,n           
		  ADD EAX,ESI                ;EAX TE (N-Y-1)*N + N DEGERI VAR
		  SUB EAX,EBX              ; EAX TE(N - Y - 1)*N + N - X  DEGERI VAR
		  DEC EAX                     ; EAX TE(N - Y - 1)*N + N - X -1 DEGERI VAR
		  SHL EAX,1        
		  


		  MOV EDI,resim
		  MOV SI,[EDI + EAX]            ;SI DA DIZI[(N - Y - 1)*N + N - X - 1]  DEGERI VAR
		  
		  JMP L1

	LOOP2GIT:JMP LOOP2

			  L1:

		  MOVZX EAX,n
		  SUB EAX,EBX                 ;EAX TE N-X DEGERI VAR
		 


			  JMP L2

			  LOOP1GIT : JMP LOOP1

			  L2 :

		  DEC EAX                       ;EAX TE N-X-1 DEGERI VAR
		  PUSH EDX
		  MUL DWORD PTR n                    ;EAX TE (N-X-1)*N DEGERI VAR
		  POP EDX
		  ADD EAX,EDX           ;EAX TE (N - X - 1)*N + Y DEGERI VAR
		  SHL EAX,1
		  MOV EDI,resim
		  MOV [EDI + EAX],SI          ; DIZI[(N - X - 1)*N + Y] = DIZI[(N - Y - 1)*N + N - X - 1]


		  MOVZX EAX,n
		  PUSH EDX
		  MUL EBX               ;EAX TE N*X DEGERI VAR
		  POP EDX
		  MOVZX ESI,n
		  ADD EAX,ESI            ;EAX TE X*N +N DEGERI VAR
		  SUB EAX,EDX          ;EAX TE X*N + N-Y DEGERI VAR
		  DEC EAX              ;EAX TE X*N + N-Y-1 DEGERI VAR
		  SHL EAX,1
		  MOV EDI,resim
		  MOV SI,[EDI + EAX]       ;SI DA DIZI[X*N + N - Y - 1]
          
		  MOVZX EAX,n
		  SUB EAX,EDX               ;EAX TE N-Y DEGERI VAR
		  DEC EAX                 ;EAX TE N-Y-1 DEGERI VAR
		  PUSH EDX
		  MUL DWORD PTR n           ;EAX TE (N-Y-1)*N DEGERI VAR
		  POP EDX
		  
		  MOVZX EDI,n
		  ADD EAX,EDI				;EAX TE (N-Y-1)*N + N DEGERI VAR
		  SUB EAX , EBX          ;EAX TE(N - Y - 1)*N + N -X DEGERI VAR
		  DEC EAX                     ; (N - Y - 1)*N + N-X-1 DEGERI VAR
		  SHL EAX,1
		  
		  MOV EDI,resim
		  MOV [EDI + EAX],SI             ; DIZI[(N - Y - 1)*N + N - X - 1] = DIZI[X*N + N - Y - 1]
		  
          MOVZX EAX,n
		  PUSH EDX
		  MUL EBX    ;EAX TE N*X DEGERI VAR
		  POP EDX
		 
		  MOVZX ESI,n
		  ADD EAX,ESI             ;EAX TE N*X + N DEGERI VAR
		  SUB EAX,EDX            ;EAX TE N*X + N -Y DEGERI VAR
		  DEC EAX                    ;EAX TE N*X +N-Y-1 DEGERI VAR
		  SHL EAX,1
		  
	      POP SI               ;DIZI[X*N + X DEGERI ] STACK TEN CEKILIYOR
		  
		  MOV EDI,resim
		  MOV [EDI + EAX] ,SI
		  
		  INC EDX
		  
		  LOOP LOOP2GIT
		 
		  POP ECX
		  INC EBX
		  
		  LOOP LOOP1GIT













		  

		  

	}
	
}

void solaDondur(short n, int resim) {
	
	__asm {
		


;BU ISLEM ICIN KULLANILAN C KODU
;
;
;FOR(X=0;X<N/2;X++){
;FOR(Y=X,Y<N-X-1;Y++){
;TMP=MATRİS[X*N + Y]
;MATRİS[X*N + Y] = MATRİS[Y*N + N-X-1]
;MATRİS[Y*N + N-X-1]= MATRİS[(N-1-X)*N + (N-1-Y)]
;MATRİS[(N-1-X)*N + (N-1-Y)] = MATİS[(N-1-Y)*N+X]
;MATİS[(N-1-Y)*N+X] = TMP
;}
;}
		
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx
		xor edi, edi
		xor esi, esi

		mov EDI, resim
		movzx Ecx, n
		shr Ecx, 1
		mov ebx, 0; x degerini ebx e ata

		LOOP2 : PUSH ECX

				MOV EDX, EBX; Y = X YAP

				XOR ECX, ECX
				XOR EAX, EAX
				MOVZX EAX, n
				SUB EAX, EBX; N - X
				SUB EAX, EBX; N - 2X
				DEC EAX; N - 2X - 1

				MOV ECX, EAX;

	LOOP1:
		    MOVZX EAX, n

			PUSH EDX;
		    MUL EBX    ; EAX TE X*N DEGER VAR
			POP EDX

			ADD EAX, EDX; X*N + Y DEGERI TUTULUYOR
			SHL EAX, 1; EAX 2 ILE CARPILIYOR
			MOV EDI, resim
			PUSH WORD PTR[EDI + EAX]; TMP DEGERI STACK E ATANIYOR
			PUSH EAX; EAX DEGERI STACK E ATILIYOR X*N + Y  YANI
			MOVZX EAX, n

			PUSH EDX
			MUL EDX; EAX TE N*Y DEGERI VAR
			POP EDX

			PUSH EAX; N*Y DEGERI STACKE ATILIYOR
			MOVZX EAX, n; EAX E N DEGERI ATILIYOR
			SUB EAX, EBX; EAX E N - X DEGERI ATILIYOR
			DEC EAX; EAX E N - X - 1 DEGERI ATILIYOR
			POP ESI; ESI YA N*Y DEGERI STACK TEN CEKILEREK ATILIYOR
			ADD EAX, ESI; EAX E N*Y + N - X - 1 DEGERI
			SHL EAX, 1
			


			MOV EDI, resim
			
			MOV AX, [EDI + EAX]; AX E DIZI[Y*N + N - X - 1] DEGERI ATANIYOR


			MOV EDI, resim
			POP ESI; ESI YA X*N + Y DEGERI ATANIYOR
			MOV EDI, resim
			MOV [EDI + ESI], AX; dizi[x*n + y] = DIZI[Y*N + N - X - 1]



			MOVZX EAX, n
			SUB EAX, EBX; N - X DEGERI EAX E ATANIYOR
			DEC EAX; EAX E N - X - 1 ATANIYOR

			PUSH EDX
			MUL DWORD PTR n; EAX E(N - X - 1)*N ATANDI
			POP EDX

			PUSH EAX; (N - X - 1)*N DEGERI STACK E ATILIYOR

			MOVZX EAX, n
			SUB EAX, EDX; EAX E  N - Y ATANDI
			DEC EAX; EAX E N - Y - 1 ATANDI

			POP ESI;  ESI YA(N - X - 1)*N ATANIYOR
			ADD EAX, ESI; EAX E(N - X - 1)*N + N - Y - 1 DEGERI ATANIYOR
			SHL EAX, 1

			MOV EDI, resim
			MOV SI, [EDI + EAX]; SI DA DIZI[(N - X - 1)*N + (N - Y - 1)] VAR

			MOVZX EAX, n
			PUSH EDX
			MUL EDX; EAX E N*Y ATANDI
			POP EDX
			MOV EDI, EAX; EDI YA N*Y ATANDI
			MOVZX EAX, n
			SUB EAX, EBX; EAX E N - X ATANDI
			DEC EAX; EAX E N - X - 1 ATANDI

			ADD EAX, EDI; EAX E N - X - 1 + N * Y ATANDI
			SHL EAX, 1

			MOV EDI, resim
			MOV [EDI + EAX], SI; DIZI[N*Y + N - X - 1] = DIZI[(N - X - 1)*N + N - Y - 1]

			JMP L2


			LOOP2GIT : JMP LOOP2

			L2 :

		MOVZX EAX, n
			SUB EAX, EDX; EAX TE N - Y DEGERI VAR
			DEC EAX; EAX TE N - Y - 1 DEGERI VAR

			PUSH EDX
			MUL DWORD PTR n; EAX TE(N - Y - 1)*N DEGERI VAR
			POP EDX

			
			ADD EAX, EBX; EAX TE(N - Y - 1) *N + X DEGERI VAR
			SHL EAX, 1

			JMP L1

			ZIPLA : JMP LOOP1

			L1 :

		MOV EDI, resim
			MOV SI, [EDI + EAX]; SI YA DIZI[(N - Y - 1)*N + X] DEGERI VAR

			MOVZX EAX, n
			SUB EAX, EBX; EAX TE N - X DEGERI VAR
			DEC EAX; EAX TE N - X - 1 DEGERI VAR

			PUSH EDX
			MUL DWORD PTR n; EAX TE(N - X - 1) * N DEGERI VAR
			POP EDX

			MOV EDI, EAX; (N - X - 1) * N DEGERI EDI YA ATILDI

			MOVZX EAX, n
			SUB EAX, EDX; EAX TE N - Y DEGERI VAR
			DEC EAX; EAX TE N - Y - 1 DEGERI VAR
			
			ADD EAX, EDI; EAX TE(N - X - 1)*N + (N - Y - 1) DEGERI VAR
			SHL EAX, 1

			MOV EDI, resim
			MOV [EDI + EAX], SI; DIZI[(N - X - 1)*N + (N - Y - 1)] = DIZI[(N - Y - 1)*N + X]


			MOVZX EAX, n
			SUB EAX, EDX; EAX TE N - Y DEGERI VAR
			DEC EAX; EAX TE N - Y - 1 DEGERI VAR
			PUSH EDX
			MUL DWORD PTR n; EAX TE(N - Y - 1)*N VAR
			POP EDX

			ADD EAX, EBX; EAX TE(N - Y - 1)*N + X DEGERI VAR
			SHL EAX, 1

			POP SI; SI YA TMP DEGERI STACKTEN ALINARAK ATANIR
			MOV EDI, resim
			MOV [EDI + EAX], SI; DIZI[(N - Y - 1)*N + X] = TMP

			INC EDX; Y DEGERI 1 ARTTIRILIYOR

			LOOP  ZIPLA

			POP ECX
			INC EBX
			LOOP LOOP2GIT




	}
	
}
