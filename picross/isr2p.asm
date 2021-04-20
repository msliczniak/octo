; Origin set to 00200H, EOF = 00250H
		ORG  00200H

; CPU Type:
		CPU 1805

; Labels:
R0203	EQU 0203H
R0204	EQU 0204H
R0215	EQU 0215H
R021C	EQU 021CH
R0229	EQU 0229H
R0238	EQU 0238H

; Unused or indirect labels:
; S0230
; S0245

; Register Definitions:
R0		EQU 0
R1		EQU 1
R2		EQU 2
R3		EQU 3
R4		EQU 4
R5		EQU 5
R6		EQU 6
R7		EQU 7
R8		EQU 8
R9		EQU 9
RA		EQU 10
RB		EQU 11
RC		EQU 12
RD		EQU 13
RE		EQU 14
RF		EQU 15

; Start code segment
		DB   12H             ;0200: 12
		DB   60H             ;0201: 60
		DB   01H             ;0202: 01
R0203
		REQ                  ;0203: 7A          
R0204
		LDA  R2              ;0204: 42          
		RET                  ;0205: 70          
		DEC  R2              ;0206: 22          
		SAV                  ;0207: 78          
		DEC  R2              ;0208: 22          
		STR  R2              ;0209: 52          
		NOP                  ;020A: C4          
		INC  R9              ;020B: 19          
		LDI  00H             ;020C: F8 00       
		PLO  R0              ;020E: A0          
		GHI  RB              ;020F: 9B          
		ANI  0EH             ;0210: FA 0E       
		PHI  R0              ;0212: B0          
		SEX  R2              ;0213: E2          
		SEX  R2              ;0214: E2          
R0215
		GLO  R0              ;0215: 80          
		SEX  R2              ;0216: E2          
		DEC  R0              ;0217: 20          
		PLO  R0              ;0218: A0          
		SEX  R2              ;0219: E2          
		BN1  R0215           ;021A: 3C 15       
R021C
		GLO  R0              ;021C: 80          
		SEX  R2              ;021D: E2          
		DEC  R0              ;021E: 20          
		PLO  R0              ;021F: A0          
		B1   R021C           ;0220: 34 1C       
		GHI  R8              ;0222: 98          
		BZ   R0229           ;0223: 32 29       
		PLO  RB              ;0225: AB          
		DEC  RB              ;0226: 2B          
		GLO  RB              ;0227: 8B          
		PHI  R8              ;0228: B8          
R0229
		GLO  R8              ;0229: 88          
		BZ   R0203           ;022A: 32 03       
		SEQ                  ;022C: 7B          
		DEC  R8              ;022D: 28          
		BR   R0204           ;022E: 30 04       
S0230
		LDI  02H             ;0230: F8 02       
		PLO  RE              ;0232: AE          
		GHI  RB              ;0233: 9B          
		PHI  RF              ;0234: BF          
		LDI  00H             ;0235: F8 00       
		PLO  RF              ;0237: AF          
R0238
		LDI  00H             ;0238: F8 00       
		STR  RF              ;023A: 5F          
		INC  RF              ;023B: 1F          
		GLO  RF              ;023C: 8F          
		BNZ  R0238           ;023D: 3A 38       
		DEC  RE              ;023F: 2E          
		GLO  RE              ;0240: 8E          
		BNZ  R0238           ;0241: 3A 38       
		SEP  R4              ;0243: D4          
		DB   01H             ;0244: 01
S0245
		GHI  RB              ;0245: 9B          
		SMI  01H             ;0246: FF 01       
		PHI  RB              ;0248: BB          
		SEP  R4              ;0249: D4          
		DB   00H             ;024A: 00
		DB   00H             ;024B: 00
		DB   00H             ;024C: 00
		DB   00H             ;024D: 00
		DB   00H             ;024E: 00
		DB   00H             ;024F: 00
		DB   92H             ;0250: 92
		END
