;to sort a list using bubble sort
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
;Copy src to dst
	LDR R0, =SRC
	LDR R1, =DST
	MOV R8, #10
UP	LDR R2, [R0], #4
	STR R2, [R1], #4
	SUBS R8, #1
	BNE UP
	
	LDR R1, =DST
	MOV R10, #9
OUTER	MOV R9, R10?
	MOV R2, R1
INNER	LDR R4, [R2], #4
	LDR R5, [R2]
	CMP R4, R5
	STRGT R4, [R2]
	STRGT R5, [R2, #-4]
	SUBS R9, #1
	BNE  INNER
	SUBS R10, #1
	BNE OUTER
STOP B STOP
SRC DCD 0X5, 0X9, 0X1, 0X6, 0X2, 0X8, 0X7, 0X3, 0X11, 0X4
	AREA mydata, DATA, READWRITE
DST DCD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	END