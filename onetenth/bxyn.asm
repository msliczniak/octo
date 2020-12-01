; Origin set to 00250H, EOF = 0028EH
		ORG  00250H

; CPU Type:
		CPU 1805

; Labels:
R025A	EQU 025AH
R0276	EQU 0276H
R0281	EQU 0281H
R0284	EQU 0284H
R028E	EQU 028EH

; Unused or indirect labels:
; S0250

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
S0250
		GHI  R2              ;0250: 92          
		PHI  RD              ;0251: BD          
		LDI  9FH             ;0252: F8 9F       
		PLO  RD              ;0254: AD          
		LDN  RD              ;0255: 0D          
		BZ   R025A           ;0256: 32 5A       
		DB   45H             ;0258: 45
		DB   0D4H            ;0259: D4
R025A
		NOP                  ;025A: C4          
		LDA  R5              ;025B: 45          
		ANI  0FH             ;025C: FA 0F       
		PLO  RF              ;025E: AF          
		BZ   R028E           ;025F: 32 8E       
		LDA  R6              ;0261: 46          
		ANI  3FH             ;0262: FA 3F       
		SHR                  ;0264: F6          
		SHR                  ;0265: F6          
		SHR                  ;0266: F6          
		DEC  R2              ;0267: 22          
		STR  R2              ;0268: 52          
		SEX  R2              ;0269: E2          
		LDN  R6              ;026A: 06          
		ANI  3FH             ;026B: FA 3F       
		SHL                  ;026D: FE          
		SHL                  ;026E: FE          
		SHL                  ;026F: FE          
		OR                   ;0270: F1          
		PLO  RC              ;0271: AC          
		INC  R2              ;0272: 12          
		LDI  0D2H            ;0273: F8 D2       
		PHI  RC              ;0275: BC          
R0276
		BNF  R0284           ;0276: 3B 84       
		GHI  RC              ;0278: 9C          
		SMI  0D2H            ;0279: FF D2       
		BZ   R0281           ;027B: 32 81       
		DB   0F8H            ;027D: F8
		DB   0D2H            ;027E: D2
		DB   30H             ;027F: 30
		DB   83H             ;0280: 83
R0281
		LDI  0D3H            ;0281: F8 D3       
		PHI  RC              ;0283: BC          
R0284
		LDN  R7              ;0284: 07          
		STR  RC              ;0285: 5C          
		GLO  RC              ;0286: 8C          
		ADI  08H             ;0287: FC 08       
		PLO  RC              ;0289: AC          
		DEC  RF              ;028A: 2F          
		GLO  RF              ;028B: 8F          
		BNZ  R0276           ;028C: 3A 76       
R028E
		SEP  R4              ;028E: D4          
		END
