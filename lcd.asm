RS	REG	P3.4
R/W	REG	P3.5
E	REG	P3.6
	ORG	00H
	MOV	SP,#70H
	MOV	P0,#01H
	CALL	ENABLE
	MOV	P0,#38H
	CALL	ENABLE
	MOV	P0,06H
	CALL 	ENABLE
	MOV	P0,#80H
	CALL	ENABLE	
	MOV	DPTR,#TABLE1
	CALL	WRITE1
	MOV	P0,#C0H
	CALL	ENABLE
	MOV	DPTR,#TABLE2
	CALL	WRITE1
	CALL	ENABLE
	JMP	$
ENABLE:	CLR	RS
	CLR	R/W
	CLR	E
	CALL	DELAY
	SETB	E
	RET
WRITE1:	MOV	R1,#00H
A1:	MOV	A,R1
	MOVC	A,@A+DPTR
	CALL	WRITE2
	INC	R1
	CJNE	A,#00H,A1
	RET
WRITE2:	MOV	P0,A
	SETB	RS
	CLR	R/W
	CLR	E
	CALL	DELAY
	SETB	E
	RET
DELAY:	MOV	R4,#05H
D1:	MOV	R5,#FFH
	DJNZ	R5,$
	DJNZ	R4,D1
	RET
TABLE1:	DB	'WONG JIA XUAN   ',00H
TABLE2:	DB	'04 05 17          ',00H
	END
