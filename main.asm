.386
.model	flat,c
.stack	4096
option	casemap:none

include msvcrt.inc
includelib msvcrt.lib

Student STRUC
	id			dd	0
	stuName		db	13	dup(0)
	score_Ch	dd	0
	score_math	dd	0
	score_C		dd	0
	score_all	dd	0
Student	ENDS

_setOneStu	PROTO
_showOneStu PROTO
showTitle	PROTO
addStudent	PROTO
deleteStudent	PROTO
changeStudent	PROTO
searchOneStu	PROTO
insertStudent	PROTO
getStuTable	PROTO

	.const
MAX_COUNT	dd	20
titles   dd  offset szTitle1, offset szTitle2, offset szTitle3
         dd  offset szTitle4, offset szTitle5, offset szTitle6
         dd  offset szTitle7, offset szTitle8, offset szTitle9
         dd  offset szTitle10, offset szTitle11
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	_setStu	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szGetNameMsg		db	"请输入姓名:",0
szGetName			db	"%s",0
szGetIdMsg			db	"请输入学号:",0
szGetId				db	"%d",0
szGetScoreChMsg		db	"请输入语文成绩:",0
szGetScoreMathMsg	db	"请输入数学成绩:",0
szGetScoreCMsg		db	"请输入C语言成绩:",0
szGetScore			db	"%d",0
szChangeSuccess		db	"修改成功!",0Ah,0
szInsertSuccess		db	"插入成功!",0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	addStudent	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szAddMsg			db	"录入学生成绩操作",0Ah,0
szAddSuccess		db	"录入成功!",0Ah,0Ah,0
szAddFull			db	"该表已满",0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	deleteStudent	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szDeleteMsg		db	"删除学生成绩操作",0Ah,0
szDeleteAsk		db	"请输入您所要删除学生对应的学号:",0
szDeleteFmt		db	"%d",0
szDeleteSuccess	db	"删除成功",0Ah,0Ah,0
szDeleteExist	db	"没有找到您所输入的学号所对应的学生",0Ah,0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	changeStudent	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szChangeMsg		db	"修改学生成绩操作",0Ah,0
szChangeAsk		db	"请输入您所要修改学生对应的学号:",0
szChangeFmt		db	"%d",0
szChangeSuc		db	"修改成功",0Ah,0Ah,0
szChangeExist	db	"没有找到您所输入的学号所对应的学生",0Ah,0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	searchStudent	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szSearchMsg		db	"搜索学生成绩操作",0Ah,0
szSearchAsk		db	"请输入您所要搜索学生对应的学号:",0
szSearchFmt		db	"%d",0
szSearchSuc		db	"搜索成功",0Ah,0Ah,0
szSearchExist	db	"没有找到您所输入的学号所对应的学生",0Ah,0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	insertStudent	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szInsertMsg		db	"插入学生成绩操作",0Ah,0
szInsertAsk		db	"请输入您所要插入的位置:",0
szInsertFmt		db	"%d",0
szInsertSuc		db	"插入成功",0Ah,0Ah,0
szInsertErr		db	"没有该位置(错误的位置)",0Ah,0Ah,0
szInsertExist	db	"该位置及其以后位置均已满，无法插入",0Ah,0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	MENU	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szTitle1		db	"|-------学生成绩管理系统--------|",0Ah,0
szTitle2		db	"|",09h,09h,09h,09h,"|",0Ah,0
szTitle3		db	"|",09h,"1.录入学生成绩",09h,09h,"|",0Ah,0
szTitle4		db	"|",09h,"2.删除学生成绩",09h,09h,"|",0Ah,0
szTitle5		db	"|",09h,"3.修改学生成绩",09h,09h,"|",0Ah,0
szTitle6		db	"|",09h,"4.搜索学生成绩",09h,09h,"|",0Ah,0
szTitle7		db	"|",09h,"5.插入学生成绩",09h,09h,"|",0Ah,0
szTitle8		db	"|",09h,"6.查看所有学生成绩",09h,"|",0Ah,0
szTitle9		db	"|",09h,"0.退出系统",09h,09h,"|",0Ah,0
szTitle10		db	"|",09h,09h,09h,09h,"|",0Ah,0
szTitle11		db	"|-------------------------------|",0Ah,0
szInputMenu		db	09h,"请输入菜单编号(0-6):",0
szInputOne		db	"%d",0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	EXit	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szExit			db	"退出程序成功!",0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;	getStuTable	Message
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szGetTableMsg1	db	"查看所有学生成绩操作",0Ah,0
szGetTableMsg2	db	"|---------------学生成绩信息---------------|",0Ah,0
szTableTitle	db	"姓名",09h,"学号",09h,"语文",09h,"数学",09h,"C语言",09h,"总分",0Ah,0
szOneStuMsg		db	"%s",09h,"%d",09h,"%d",09h,"%d",09h,"%d",09h,"%d",0Ah,0
szShowSumMsg	db	"一共有%d个学生!",0Ah,0Ah,0
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
szDefault		db	0Ah,"未知的命令,请重新输入",0Ah,0


szTest		db	"hello world",0

	.data
stuTable	Student	20	dup(<>)
stuTemp		Student	<>

	.code
main	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	call showTitle
menu_loop:
	push offset szInputMenu
	call crt_printf
	add esp,4
	lea eax,dword ptr[ebp-4]
	push eax
	push offset szInputOne
	call crt_scanf
	add esp,8
	cmp dword ptr[ebp-4],0
	je case0
	cmp dword ptr[ebp-4],1
	je case1
	cmp dword ptr[ebp-4],2
	je case2
	cmp dword ptr[ebp-4],3
	je case3
	cmp dword ptr[ebp-4],4
	je case4
	cmp dword ptr[ebp-4],5
	je case5
	cmp dword ptr[ebp-4],6
	je case6
	jmp default
case0:
	push offset szExit
	call crt_printf
	add esp,4
	jmp program_done
case1:
	call addStudent
	jmp menu_loop
case2:
	call deleteStudent
	jmp menu_loop
case3:
	call changeStudent
	jmp menu_loop
case4:
	call searchOneStu
	jmp menu_loop
case5:
	call insertStudent
	jmp menu_loop
case6:
	call getStuTable
	jmp menu_loop
default:
	push offset szDefault
	call crt_printf
	add esp,4
	call showTitle
	jmp menu_loop
program_done:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
main	ENDP

_setOneStu	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szGetNameMsg
	call crt_printf
	add esp,4
	push offset stuTemp.stuName
	push offset szGetName
	call crt_scanf
	add esp,8
	push offset szGetIdMsg
	call crt_printf
	add esp,4
	push offset stuTemp.id
	push offset szGetId
	call crt_scanf
	add esp,8

	push offset szGetScoreChMsg
	call crt_printf
	add esp,4
	push offset stuTemp.score_Ch
	push offset szGetScore
	call crt_scanf
	add esp,8

	push offset szGetScoreMathMsg
	call crt_printf
	add esp,4
	push offset stuTemp.score_math
	push offset szGetScore
	call crt_scanf
	add esp,8

	push offset szGetScoreCMsg
	call crt_printf
	add esp,4
	push offset stuTemp.score_C
	push offset szGetScore
	call crt_scanf
	add esp,8

	mov eax,stuTemp.score_Ch
    add eax,stuTemp.score_math
    add eax,stuTemp.score_C
    mov stuTemp.score_all,eax

	mov esi,offset stuTemp
	mov eax,dword ptr[ebp+8]		;eax:index
	mov ecx,TYPE Student			
	imul eax,ecx					;eax: offset = sizeof Student * index
	mov edi,offset stuTable
	add edi,eax						;edi:&stuTable[index]
	rep movsb

	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
_setOneStu	ENDP

_showOneStu PROC
	push ebp
	mov ebp,esp
	sub esp,20h
	mov esi,SIZEOF Student
	mov ecx,dword ptr[ebp+8]
	imul esi,ecx
	push stuTable[esi].score_all
	push stuTable[esi].score_C
	push stuTable[esi].score_math
	push stuTable[esi].score_Ch
	push stuTable[esi].id
	lea eax,stuTable[esi].stuName
	push eax
	push offset szOneStuMsg
	call crt_printf
	add esp,1Ch
	xor eax,eax
	add esp,20h
	mov esp,ebp
	pop ebp
	ret
_showOneStu ENDP

showTitle	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	mov ebx,offset titles
	mov dword ptr[ebp-4],0
print_title_loop:
	mov ecx,dword ptr[ebp-4]
	cmp ecx,11
	jae print_title_loop_over
	push dword ptr[ebx+ecx*4]
	call crt_printf
	add esp,4
	add dword ptr[ebp-4],1
	jmp print_title_loop
print_title_loop_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
showTitle	ENDP

addStudent	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szAddMsg
	call crt_printf
	add esp,4
	mov dword ptr[ebp-4],0
addStudent_loop:
	cmp dword ptr[ebp-4],20
	jae addStudent_overflow
	mov esi,dword ptr[ebp-4]
	imul esi,TYPE Student
	add dword ptr[ebp-4],1
	cmp stuTable[esi].id,0
	jne addStudent_loop
	sub dword ptr[ebp-4],1
	push dword ptr[ebp-4]
	call _setOneStu
	add esp,4
	push offset szAddSuccess
	call crt_printf
	add esp,4
	jmp addStudent_over
addStudent_overflow:
	push offset szAddFull
	call crt_printf
	add esp,8
addStudent_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
addStudent	ENDP

deleteStudent	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szDeleteMsg
	call crt_printf
	add esp,4
	push offset szDeleteAsk
	call crt_printf
	add esp,4
	lea eax,dword ptr[ebp-4]
	push eax
	push offset szDeleteFmt
	call crt_scanf
	add esp,8
	mov dword ptr[ebp-8],0
deleteStudent_loop:
	cmp dword ptr[ebp-8],20
	jae deleteStudent_overflow
	mov esi,dword ptr[ebp-8]
	imul esi,TYPE Student
	add dword ptr[ebp-8],1
	mov eax,dword ptr[ebp-4]
	cmp stuTable[esi].id,eax
	jne deleteStudent_loop
	mov stuTable[esi].id,0
	push offset szDeleteSuccess
	call crt_printf
	add esp,4
	jmp deleteStudent_over
deleteStudent_overflow:
	push offset szDeleteExist
	call crt_printf
	add esp,4
deleteStudent_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
deleteStudent	ENDP

changeStudent	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szChangeMsg
	call crt_printf
	add esp,4
	push offset szChangeAsk
	call crt_printf
	add esp,4
	lea eax,dword ptr[ebp-4]
	push eax
	push offset szChangeFmt
	call crt_scanf
	add esp,8
	mov dword ptr[ebp-8],0
changeStudent_loop:
	cmp dword ptr[ebp-8],20
	jae changeStudent_overflow
	mov esi,dword ptr[ebp-8]
	imul esi,TYPE Student
	add dword ptr[ebp-8],1
	mov eax,dword ptr[ebp-4]
	cmp stuTable[esi].id,eax
	jne changeStudent_loop
	sub dword ptr[ebp-8],1
	push dword ptr[ebp-8]
	call _setOneStu
	add esp,4
	push offset szChangeSuc
	call crt_printf
	add esp,4
	jmp changeStudent_over
changeStudent_overflow:
	push offset szChangeExist
	call crt_printf
	add esp,4
changeStudent_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
changeStudent	ENDP

searchOneStu	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szSearchMsg
	call crt_printf
	add esp,4
	push offset szSearchAsk
	call crt_printf
	add esp,4
	lea eax,dword ptr[ebp-4]
	push eax
	push offset szSearchFmt
	call crt_scanf
	add esp,8
	mov dword ptr[ebp-8],0
searchOneStu_loop:
	cmp dword ptr[ebp-8],20
	jae searchOneStu_overflow
	mov esi,dword ptr[ebp-8]
	imul esi,TYPE Student
	add dword ptr[ebp-8],1
	mov eax,dword ptr[ebp-4]
	cmp stuTable[esi].id,eax
	jne searchOneStu_loop
	sub dword ptr[ebp-8],1
	push dword ptr[ebp-8]
	call _showOneStu
	add esp,4
	jmp searchOneStu_over
searchOneStu_overflow:
	push offset szSearchExist
	call crt_printf
	add esp,8
searchOneStu_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
searchOneStu	ENDP

insertStudent	PROC
	push ebp							;[ebp-0x4]	pos
	mov ebp,esp							;[ebp-0x8]	i = pos - 1 i < 20 i++
	sub esp,0CCh						;[ebp-0xC]	emptyIndex	0xFFFFFFFF
	push offset szInsertMsg
	call crt_printf
	add esp,4
	push offset szInsertAsk
	call crt_printf
	add esp,4
	lea eax,dword ptr[ebp-4]
	push eax
	push offset szInsertFmt
	call crt_scanf
	add esp,4
	cmp dword ptr[ebp-4],0
	jle insertStudent_error
	cmp dword ptr[ebp-4],20
	jle insertStudent_right
insertStudent_error:
	push offset szInsertErr
	call crt_printf
	add esp,4
	jmp insertStudent_over
insertStudent_right:
	mov esi,dword ptr[ebp-4]
	sub esi,1
	imul esi,TYPE Student
	cmp stuTable[esi].id,0
	je insertEmpty
	mov dword ptr[ebp-0Ch],0FFFFFFFFh
	mov eax,dword ptr[ebp-4]
	sub eax,2
	mov dword ptr[ebp-8],eax
insertStudent_loop1:
	add dword ptr[ebp-8],1
	cmp dword ptr[ebp-8],20
	jae insertStudent_overflow
	mov esi,dword ptr[ebp-8]
	imul esi,TYPE Student
	cmp stuTable[esi].id,0
	jne insertStudent_loop1
	mov eax,dword ptr[ebp-8]
	mov dword ptr[ebp-0Ch],eax
insertStudent_loop2:
	mov eax,dword ptr[ebp-4]
	sub eax,1
	cmp dword ptr[ebp-0Ch],eax
	je insertEmpty
	mov ecx,TYPE Student
	mov eax,dword ptr[ebp-0Ch]
	imul eax,ecx
	mov esi,offset stuTable
	add esi,eax
	mov edi,esi
	sub esi,TYPE Student
	rep movsb
	sub dword ptr[ebp-0Ch],1
	jmp insertStudent_loop2
insertEmpty:
	mov eax,dword ptr[ebp-4]
	sub eax,1
	push eax
	call _setOneStu
	add esp,4
	push offset szInsertSuc
	call crt_printf
	add esp,4
	jmp insertStudent_over
insertStudent_overflow:
	push offset szInsertExist
	call crt_printf
	add esp,4
insertStudent_over:
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
insertStudent	ENDP

getStuTable	PROC
	push ebp
	mov ebp,esp
	sub esp,0CCh
	push offset szGetTableMsg1
	call crt_printf
	add esp,4
	push offset szGetTableMsg2
	call crt_printf
	add esp,4
	push offset szTableTitle
	call crt_printf
	add esp,4
	mov dword ptr[ebp-4],0
	mov dword ptr[ebp-8],0
loop_print_Table:
	mov eax,MAX_COUNT
	cmp dword ptr[ebp-8],20
	jae loop_print_Table_over
	mov ecx,dword ptr[ebp-8]
	mov esi,SIZEOF Student
	imul esi,ecx
	add dword ptr[ebp-8],1
	cmp stuTable[esi].id,0
	je loop_print_Table
	sub dword ptr[ebp-8],1
	push dword ptr[ebp-8]
	call _showOneStu
	add esp,4
	add dword ptr[ebp-8],1
	add dword ptr[ebp-4],1
	jmp loop_print_Table
loop_print_Table_over:
	push dword ptr[ebp-4]
	push offset szShowSumMsg
	call crt_printf
	add esp,8
	xor eax,eax
	add esp,0CCh
	mov esp,ebp
	pop ebp
	ret
getStuTable	ENDP
END		main