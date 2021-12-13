.686p
.model flat, stdcall
option casemap: none
ExitProcess PROTO STDCALL :DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
CreateFileA proto stdcall :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ReadFile proto stdcall :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
WriteFile proto stdcall :DWORD,:DWORD,:DWORD,:DWORD,:DWORD

.data
filename byte "E:\result.txt",0
filenameread byte "E:\readstring.txt",0

TitleMsg db 'gfgfg',0
; указываем буфер дл¤ форматированного вывода
	buffer1 db 128 dup(0)
; указываем строку формата со спецификаци¤ми форматов
	format1 db 'количество слов %d', 0

bufferread db 128 dup(0)
bytesread db 0
numberofspaces db 0
writecount db 0
gg1 db 200 dup (?)
gg2 db 200 dup (?)

count dd 0

.const
GENERIC_READ equ 80000000h
GENERIC_WRITE equ 40000000h
CREATE_ALWAYS equ 2
OPEN_ALWAYS equ 4
FILE_ATTRIBUTE_NORMAL equ 00000080h
	
.code
 program:
	;открываем файл и считываем текст
	invoke CreateFileA, addr filenameread,GENERIC_READ,0, 0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
	invoke ReadFile, eax, addr bufferread, 128, addr bytesread,0
	;считаем кол-во слов	
	
	lea esi, bufferread
	lea edi, gg1
	lp: 
	dec ecx
	lodsb
	cmp al,'o'
	jz fos
	cmp al,0
	jz kon1
	stosb
	jmp lp

	fos:
	lq:
	inc count
	lk: 
	dec ecx
	lodsb
	cmp al,'o'
	jz lq
	cmp al,0
	jz kon1
	stosb
	cmp al,0
	jnz lk

	;------------------------------------------------------

	kon1:
	mov al,0
	stosb


	lea esi, gg1
	lea edi, gg2
	lp5: 
	;dec ecx
	lodsb
	cmp al,'m'
	jz fos5
	cmp al,0
	jz kon3
	stosb
	jmp lp5

	fos5:
	lq5:
	inc count
	lk5: 
	dec ecx
	lodsb
	cmp al,'m'
	jz lq5
	cmp al,0
	jz kon3
	stosb
	cmp al,0
	jnz lk5


	kon3:
	mov al,0
	stosb
		
	
	
	
	;формируем выодную строку
	;invoke wsprintfA, addr buffer1, addr format1,numberofspaces	
	;invoke MessageBoxA, 0, ADDR buffer2, ADDR TitleMsg,0
	
	invoke CreateFileA, addr filename,GENERIC_WRITE,0, 0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
	invoke WriteFile, eax, addr gg2, 120, addr bytesread,0

	invoke ExitProcess,0
	
end program