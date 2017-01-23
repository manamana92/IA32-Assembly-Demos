; The _assembly label is the entry point of our execution.
; Do not change!

%define DWORD_SIZE 4

section .text
	global _assembly
	global _add3Ver1
	global _add3Ver2

_assembly:
	int3
	ret

_add3Ver1:
	; To use the base pointer to access variables is pretty easy, you must save the current location of
	; ebp on the stack, this means that our offset is now DWORD_SIZE * 2
	push ebp						; on the stack is ebp and the return address for eip, this needs to be
	mov ebp, esp					; taken into account, now we move ebp to be where esp is

	mov eax, [ebp + DWORD_SIZE * 2]
	add eax, [ebp + DWORD_SIZE * 3]
	add eax, [ebp + DWORD_SIZE * 4]

	mov esp, ebp					; move esp to where ebp is currently
	pop ebp							; pop off the old epb value for restoration to the caller
	ret								; return back to the caller, the caller cleans up _stdcall by convention

_add3Ver2:
	; To use the base pointer to access variables is pretty easy, you must save the current location of
	; ebp on the stack, this means that our offset is now DWORD_SIZE * 2 but we can use a struc to do the same
	; work
	struc Parameters
		.oldebp		resd	1
		.oldeip		resd	1
		.a			resd	1
		.b			resd	1
		.c			resd	1
	endstruc

	push ebp						; on the stack is ebp and the return address for eip, this needs to be
	mov ebp, esp					; taken into account, now we move ebp to be where esp is

	mov eax, [ebp + Parameters.a]
	add eax, [ebp + Parameters.b]
	add eax, [ebp + Parameters.c]

	mov esp, ebp					; move esp to where ebp is currently
	pop ebp							; pop off the old epb value for restoration to the caller
	ret								; return back to the caller, the caller cleans up _stdcall by convention