;Write a ARM alp to store 1 if a number is an armstrong number else store 0
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
	LDR R0, =SRC
	LDR R1, [R0]
	LDR R7, [R0]
	LDR R2, =DST
	MOV R5, #0
	MOV R4, #0
UP	AND R3, R1, #0XF
	MUL R3, R3
	MUL R3, R3
	ADD R4, R3
	LSR R1, #4
	CMP R1, #0
	BNE UP
	MOV R8, #0
	LDR R9, =UNPACKED
UP1	SUBS R4, #10
	ADD R8, #1
	CMP R4, #10
	BGT UP1
	STRB R4, [R9], #1
	CMP R4, #0
	BEQ STORE
	MOV R4, R8
	B UP1	
STORE MOV R9, #0
	LDR R0, =DST
	LDR R5, [R0]
	CMP R5, R7
	STRNE R9, [R2]
	ADD R9, #1
	STREQ R9, [R2]
STOP B STOP
SRC DCD 0x010503
	AREA mydata, DATA, READWRITE
UNPACKED DCD 0
DST DCD 0
	END