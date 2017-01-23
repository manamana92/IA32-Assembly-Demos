; The _assembly label is the entry point of our exection.
; Do not change!

section .text
	global _assembly

_assembly:
	; Examples of mov instruction
	int3
	mov eax, edx
	mov ecx, eax
	mov eax, 42

	; The mov instruction can be interpreted as move the contents of operand 2 into
	; operand 1

	add eax, 3

	; The add instruction can be interpreted as the following C'ish psuedo code
	; <op1> += <op2>->eax += 3

	; more examples
	mov eax, edx
	mov edx, edx
	mov edx, -90
	add eax, 40 * 2
	add edx, edx

	; Hexadecimal is preceded by the 0x marker
	; examples of hex
	mov eax, 0x4
	mov edx, 0x34f
	mov ecx, 0xffff
	mov edx, 0x1234

	; word of note a byte is represented by two hex digits
	mov eax, 0xFF; this moved into eax 255

	; xchg exhanges the contents of two registers
	mov eax, 0
	mov edx, 1
	xchg eax, edx
	; eax = 1, edx = 0