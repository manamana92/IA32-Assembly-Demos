; The _assembly label is the entry point of our exection.
; Do not change!

section .text
	global _assembly

_assembly:
	int3

	; eip contains the memory pointer of the next instruction to execute
	; you cannot read or write from it
	mov eax, edx
	mov ecx, 0x4
	add eax, ecx
	; look at eip after these three statements in the debugger

	xchg eax, edx

	; the jmp instruction will cause execution to continue at the designated location
	; you specify a lable to jmp to...

	jmp .label
	; the above jmp will move EIP to the address of the label for execution

	mov eax, 1
	mov edx, 2

	.label:
	mov eax, 0
	mov edx, 3

	; conditional jumps with cmp
	; cmp sets various flags for testing with jcc -> no actual command called jcc
	cmp eax, 0
	je .EaxIs0

	; if eax is not 0 then this code will get executed
	ret

	.EaxIs0:
	mov eax, 0
	mov ecx, 0

	; while style loop
	jmp CheckCond
	WhileStyleLoop:
		; do some work
		; increment our counter
		add ecx, 1
	CheckCond:
		cmp ecx, 20
		jne WhileStyleLoop

	; another while style loop
	mov ecx, 0
	WhileStyleLoop2:
		cmp ecx, 20
		je EndLoop
		; do some work
		add ecx, 1		; increment our counter
		jmp WhileStyleLoop2
	EndLoop:

	; do while loop
	mov ecx, 0
	DoWhileStyle:
		; do some work
		add ecx, 1
		cmp ecx, 20
		jne DoWhileStyle

	ret
		