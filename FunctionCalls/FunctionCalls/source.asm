extern _MessageBoxA@16

%define DWORD_SIZE 4

; The _assembly label is the entry point of our execution.
; Do not change!

global _assembly
global _addNumbers

section .data
	text db "Hello, World!", 0xA, 0x0		; add the newline and the null terminator
	caption db "The Caption!", 0xA, 0x0		; the caption for MessageBoxA

section .text
_assembly:
	; call takes the instruction location after the "call" and adds it to the stack
	call anotherFunction
	mov eax, 0

	ret

anotherFunction:
	mov eax, 3
	; the ret instruction reads the pointer on the top of the stack (usually esp) adds 4 to esp to remove it
	; then sets eip to be the value that was just read so that execution may continue, basically reversing call

	; MessageBoxA is __stdcall, this means the callee cleans up and we just push the arguments to the stack

	push dword 0x0		; Message box will have an OK button
	push dword caption	; the message box caption
	push dword text		; the message box text
	push dword 0x0		; we are not supplying a handle, there is no owner
	call _MessageBoxA@16

	ret

_addNumbers:
	; returning a result is done by putting the value to be returned in eax, to access parameters
	; we will use scaling offsets
	mov eax, [esp + DWORD_SIZE * 1]		; access the first parameter
	add eax, [esp + DWORD_SIZE * 2]		; access the third parameter
	ret