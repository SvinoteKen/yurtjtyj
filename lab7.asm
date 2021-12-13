.386p
.model flat, stdcall
option casemap:none

GetModuleHandleA PROTO STDCALL :DWORD
LoadCursorA PROTO STDCALL :DWORD,:DWORD
RegisterClassExA PROTO STDCALL :DWORD
CreateWindowExA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
LoadIconA PROTO STDCALL :DWORD,:DWORD
ShowWindow PROTO STDCALL :DWORD,:DWORD
UpdateWindow PROTO STDCALL :DWORD
GetMessageA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
TranslateMessage  PROTO STDCALL :DWORD
DispatchMessageA  PROTO STDCALL :DWORD
DefWindowProcA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
PostQuitMessage PROTO STDCALL :DWORD
ExitProcess PROTO      :DWORD
WinExec PROTO :DWORD, :DWORD

WinMain proto :DWORD,:DWORD,:DWORD,:DWORD
MessageBoxA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD 
GetCommandLineA PROTO STDCALL
SetFocus PROTO STDCALL :DWORD
SetWindowTextA PROTO STDCALL :DWORD,:DWORD
GetWindowTextA PROTO STDCALL :DWORD,:DWORD,:DWORD
DestroyWindow PROTO STDCALL :DWORD
SendMessageA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD
wsprintfA PROTO C :VARARG
StrToIntA PROTO STDCALL :DWORD

HINSTANCE typedef DWORD
LPSTR     typedef DWORD
HWND      typedef DWORD
UINT      typedef DWORD
WPARAM    typedef DWORD
LPARAM    typedef DWORD

POINT STRUCT
  x  DWORD ?
  y  DWORD ?
POINT ENDS


MSG STRUCT
  hwnd      DWORD      ?
  message   DWORD      ?
  wParam    DWORD      ?
  lParam    DWORD      ?
  time      DWORD      ?
  pt        POINT      <>
MSG ENDS


WNDCLASSEXA STRUCT
  cbSize            DWORD      ?
  style             DWORD      ?
  lpfnWndProc       DWORD      ?
  cbClsExtra        DWORD      ?
  cbWndExtra        DWORD      ?
  hInstance         DWORD      ?
  hIcon             DWORD      ?
  hCursor           DWORD      ?
  hbrBackground     DWORD      ?
  lpszMenuName      DWORD      ?
  lpszClassName     DWORD      ?
  hIconSm           DWORD      ?
WNDCLASSEXA ENDS


.data
   ClassName db "SimpleWinClass",0
   AppName   db "App",0
   IconName db 'ICON_MAIN', 0
   task1 db '����������� ���� � ������� �������� ���� �������� � ��������� �������������� �������� ��������� ����. ������� �������������� �������F9 ���������� ���� � ������ ������� ���� ������.',0
   task2 db '���������� ����� ���� �������� �� ���������',0
   Help db '������� ���������� � ����������� ������� � ������� ����',0
   MenuName db 'MyMenu',0
   path2 db 'C:\LLPL\lab6.exe',0
   path1 db 'C:\LLPL\da.exe',0
.data?
   hInstance HINSTANCE ?
   CommandLine LPSTR ?

.const 
WM_DESTROY	equ 2h 		; ��������� �������� ��� �������� ����
WM_KEYDOWN      equ 100h        ; ��������� �������� ���� ��� ������� ����������� �������
VK_ESCAPE       equ 1Bh		; ����������� ��� ������� ESC

IDI_APPLICATION equ 32512 	; ������������� ����������� ������
IDC_ARROW	equ 32512 	; ������������� �������
SW_SHOWNORMAL	equ 1 		; ����� ������ ���� � ����������
CS_HREDRAW      equ 2h		; �������� ������� ���� ������ ���� ������������ ��� ��������� ������ ����
CS_VREDRAW      equ 1h  	; �������� ������� ���� ������ ���� ������������ ��� ��������� ������ ����
CS_GLOBALCLASS  equ 4000h	; ������ ����� ������ ���������� � ��������� ������ ����������. 
				; ������ ��������� ����� ��������� ���� �� ���� ����� ������
COLOR_BACKGROUND  	equ 3		; ���������� ����� ���� ������ ����
CW_USEDEFAULT           equ 80000000h   ; ������� �� ��������� ������ ��� ������

WS_OVERLAPPED           equ 0h		; �������������� ����
WS_CAPTION              equ 0C00000h	; ���� � ����������
WS_SYSMENU              equ 80000h	; ���� � ������� ���������� ����
WS_THICKFRAME           equ 40000h	; ���� � ������, ������������ �� ��������
WS_MINIMIZEBOX          equ 20000h      ; ���� � ������� ���������� ����
WS_MAXIMIZEBOX          equ 10000h      ; ���� � ������� ������������ ����
; �������������� ���� � ����������, ��������� ����, ������, �������� ���������� � ������������
WS_OVERLAPPEDWINDOW     equ WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX

   Button1ID equ 1
   Button2ID equ 2
   Edit1ID equ 3 
   Edit2ID equ 4
   Edit3ID equ 5
   Edit4ID equ 6
   StaticID equ 7                             
   SW_SHOWDEFAULT   equ 10
   WS_EX_CLIENTEDGE equ 00000200h
   WS_CHILD   equ 40000000h
   WS_VISIBLE equ 10000000h
   WS_BORDER  equ 800000h
   BS_DEFPUSHBUTTON  equ 1h
   ES_LEFT           equ 0h
   WM_CREATE         equ 1h
   WM_COMMAND        equ 111h
   ES_AUTOHSCROLL    equ 80h
   BN_CLICKED        equ 0
   COLOR_BTNFACE     equ 15
   SS_CENTER         equ 1h
   MB_OK equ 0
   
IDM_Task_1 equ 101
IDM_Task_2 equ 102
IDM_Solve_1 equ 103
IDM_Solve_2 equ 104
IDM_HELP equ 111
IDM_EXIT equ 112

.code
start:	
       invoke GetModuleHandleA, 0
       mov    hInstance,eax
       invoke GetCommandLineA
       mov CommandLine,eax
       invoke WinMain, hInstance,0,CommandLine, SW_SHOWDEFAULT
       invoke ExitProcess,eax

   WinMain proc hInst:HINSTANCE,hPrevInst:HINSTANCE,CmdLine:LPSTR,CmdShow:DWORD
       LOCAL wc:WNDCLASSEXA
       LOCAL msg:MSG
       LOCAL hwnd:HWND

       mov   wc.cbSize,SIZEOF WNDCLASSEXA
       mov   wc.style, CS_HREDRAW or CS_VREDRAW
       mov   wc.lpfnWndProc, OFFSET WndProc
       mov   wc.cbClsExtra,0
       mov   wc.cbWndExtra,0
       push  hInst
       pop   wc.hInstance
       mov   wc.hbrBackground,COLOR_BTNFACE+1
       mov wc.lpszMenuName,OFFSET MenuName
       mov   wc.lpszClassName,OFFSET ClassName

       invoke LoadIconA, hInst, OFFSET IconName
       mov   wc.hIcon,eax
       mov   wc.hIconSm,eax
       invoke LoadCursorA,0,IDC_ARROW
       mov   wc.hCursor,eax
       invoke RegisterClassExA, addr wc
       invoke CreateWindowExA,WS_EX_CLIENTEDGE,ADDR ClassName, \
                           ADDR AppName, WS_OVERLAPPEDWINDOW,\
                           600, 300, 400,400,0,0, hInst,0
       mov   hwnd,eax
       invoke ShowWindow, hwnd,SW_SHOWNORMAL
       invoke UpdateWindow, hwnd
       .WHILE 1
           invoke GetMessageA, ADDR msg,0,0,0
           .BREAK .IF (!eax)
           invoke TranslateMessage, ADDR msg
           invoke DispatchMessageA, ADDR msg
       .ENDW
       mov     eax,msg.wParam
       ret

   WinMain endp
   
	WndProc proc hWnd:DWORD, wMsg:DWORD, wParam:DWORD, lParam:DWORD
   .IF wMsg == WM_COMMAND
			mov eax,wParam
			.IF lParam == 0 ; ������ ������� ����
				.IF ax == IDM_HELP
					invoke MessageBoxA,0,ADDR Help,ADDR AppName,MB_OK
				.ENDIF
				.IF ax == IDM_EXIT
					invoke PostQuitMessage, 0
				.ENDIF
				.IF ax == IDM_Task_1
					invoke MessageBoxA,0,addr task1,addr AppName,MB_OK
				.ENDIF
				.IF ax == IDM_Task_2
					invoke MessageBoxA,0,addr task2,addr AppName,MB_OK
				.ENDIF
				.IF ax == IDM_Solve_1
					invoke WinExec,offset path1, SW_SHOWNORMAL
				.ENDIF
				.IF ax == IDM_Solve_2
					invoke WinExec,offset path2, SW_SHOWNORMAL
				.ENDIF
			.ENDIF
	.ENDIF
	
; ��������� � ������������� ����������� ����
.IF wMsg==WM_DESTROY
; ��������� � ������� ��������� WM_QUIT
invoke PostQuitMessage,0
; ���� ������ �������
.ELSEIF wMsg==WM_KEYDOWN
; � ��� ��� ������� ESC
.IF wParam==VK_ESCAPE
; ��������� � ������� ��������� WM_QUIT
invoke PostQuitMessage, 0
.ENDIF
.ELSE
; ����� ������� ��������� ��������� �� ���������
invoke DefWindowProcA,hWnd,wMsg,wParam,lParam
ret
.ENDIF
xor eax,eax
ret
   WndProc endp
end start

