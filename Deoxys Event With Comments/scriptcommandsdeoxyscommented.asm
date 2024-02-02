LASTRESULT EQU $800D
end: MACRO
	db $02
	ENDM
return: MACRO
	db $03
	ENDM
goto: MACRO
	db $05
	dd \1
	ENDM
goto_if: MACRO
	db $06
	db \1
	dd \2
	ENDM
call_if: MACRO
	db $07
	db \1
	dd \2
	ENDM
gotostd: MACRO
	db $08
	db \1
	ENDM
callstd: MACRO
	db $09, \1
	ENDM
gotostd_if: MACRO
	db $0A
	db \1
	db \2
	ENDM
callstd_if: MACRO
	db $0B
	db \3
	db \2
	ENDM
returnram: MACRO
	db $0C
	ENDM
killscript: MACRO
	db $0D
	ENDM
setbyte: MACRO
	db $0E, \1
	ENDM
loadword: MACRO
	db $0F
	db \1
	dd \2
	ENDM
loadbyte: MACRO
	db $10
	db \1
	db \2
	ENDM
writebytetoaddr: MACRO
	db $11
	db \1
	dd \2
	ENDM
loadbytefromaddr: MACRO
	db $12
	db \1
	dd \2
	ENDM
setptrbyte: MACRO
	db $13
	db \1
	dd \2
	ENDM
copylocal: MACRO
	db $14
	db \1
	db \2
	ENDM
copybyte: MACRO
	db $15
	dd \1
	dd \2
	ENDM
setvar: MACRO
	db $16
	dw \1
	dw \2
	ENDM
addvar: MACRO
	db $17
	dw \1
	dw \2
	ENDM
subvar: MACRO
	db $18
	dw \1
	dw \2
	ENDM
copyvar: MACRO
	db $19
	dw \1
	dw \2
	ENDM
copyvarifnotzero: MACRO
	db $1A
	dw \1, \2
	ENDM
compare: MACRO
	db $21
	dw \1, \2
	ENDM
setflag: MACRO
	db $29
	dw \1
	ENDM
checkflag: MACRO
	db $2B
	dw \1
	ENDM
playfanfare: MACRO
	db $31
	dw \1
	ENDM
waitfanfare: MACRO
	db $32
	ENDM
getpartysize: MACRO
	db $43
	ENDM
additem: MACRO
	db $44
	dw \1, \2
	ENDM
checkitemroom: MACRO
	db $46
	dw \1, \2
	ENDM
checkitem: MACRO
	db $47
	dw \1, \2
	ENDM
checkpcitem: MACRO
	db $4A
	dw \1, \2
	ENDM
adddecoration: MACRO
	db $4b
	dw \1
	ENDM
faceplayer: MACRO
	db $5A
	ENDM
waitmsg: MACRO
	db $66
	ENDM
lock: MACRO
	db $6A
	ENDM
release: MACRO
	db $6C
	ENDM
waitkeypress: MACRO
	db $6D
	ENDM
showmonpic: MACRO
	db $75
	dw \1
	db \2
	db \3
	ENDM
hidemonpic: MACRO
	db $76
	ENDM
showcontestpainting: MACRO
	db $77
	db \1
	ENDM
braillemessage: MACRO
	db $78
	dd \1
	ENDM
brailleformat: MACRO
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	ENDM
givemon: MACRO
	db $79
	dw \1
	db \2
	dw \3
	dd \4
	dd \5
	db \6
	ENDM
giveegg: MACRO
	db $7A
	dw \1
	ENDM
setmonmove: MACRO
	db $7b
	db \1
	db \2
	dw \3
	ENDM
checkpartymove: MACRO
	db $7c
	dw \1
	ENDM
bufferspeciesname: MACRO
	db $7d
	db \1
	dw \2
	ENDM
bufferleadmonspeciesname: MACRO
	db $7E
	db \1
	ENDM
bufferpartymonnick: MACRO
	db $7f
	db \1
	dw \2
	ENDM
bufferitemname: MACRO
	db $80
	db \1
	dw \2
	ENDM
bufferdecorationname: MACRO
	db $81
	db \1
	dw \2
	ENDM
buffermovename: MACRO
	db $82
	db \1
	dw \2
	ENDM
random: MACRO
	db $8F
	dw \1
	ENDM
setrespawn: MACRO
	db $9F
	dw \1
	ENDM
checkplayergender: MACRO
	db $A0
	ENDM
playmoncry: MACRO
	db $A1
	dw \1
	dw \2
	ENDM
setwildbattle: MACRO
	db $B6
	dw \1
	db \2
	dw \3
	ENDM
dowildbattle: MACRO
	db $B7
	ENDM
setvirtualaddress: MACRO
	db $B8
	GBAPTR \1
	ENDM
virtualgotoif: MACRO
	db $BB
	db \1
	GBAPTR \2
	ENDM
virtualmsgbox: MACRO
	db $BD
	GBAPTR \1
	ENDM
virtualloadpointer: MACRO
	db $BE
	GBAPTR \1
	ENDM
waitmoncry: MACRO
	db $C5
	ENDM
setmoneventlegal: MACRO
	db $CD
	dw \1
	ENDM

special: MACRO
       db $25
       dw \1
       ENDM

sound: MACRO
       db $2F
       dw \1
       ENDM

pause: MACRO
       db $28
       dw \1
       ENDM

playsong: MACRO
	db $33
	dw \1
	db \2
	ENDM

waitstate: MACRO
           db $27
           ENDM

callasm: MACRO
	db $23
	dd \1
	ENDM

; All hex values are just the "thumb" form of the GBA ARM instruction set translated to machine code.
; This part of the project is a bit daunting, I would recommend watching some videos on any instruction set architecture
; to at least familiarize yourself with the general idea of how assembly works.

; You'll also want to reference this:
; https://fabiensanglard.net/another_world_polygons_GBA/gbatech.html
; It will help tremendously when you are trying to understand all of the machine code below.

setmondataobedientballs: MACRO
	dw $0000     ; Spacer word for keeping data alligned
	dw $0000     ; Spacer again for allignment
	dw $4802     ; ldr r0, [pc, #8] - this loads the value of line 339 into r0. Reference gbatek to understand why pc+8 refers a line 6 lines away.
	dw $A203     ; adr r2, #0xc - this stores a reference of line 340 (a pointer to the adddres of the value of line 340). Refer to gbatek for why 0xC (decimal value 12) relates to a line 6 lines away.
	dw $214F        ; movs r1, $0x4f - 0x4f (the field you want to change of the mon) is up to you to change. 0x45 is 79 in decimal. I want to change the EVENT_LEGAL field. 0x4f (decimal 79) was obtained from https://github.com/pret/pokeruby/blob/master/include/constants/pokemon.h
	dw $4B03     ; ldr r3, [pc, #0xc] - r3 now holds the value of line 342. Reference gbatek to understand why pc + 0xc (pc + 12) relates to line 342.
	dw $4718     ; bx r3 - This branches to the value in r3, which happens to be 0803D2ED, which is the function call for setboxmondata. 
	dw $0000     ; Essentially what happened above is we prepared r0, r1, and r2 for the function "setboxmondata" which uses r0,r1,r2. Then we stored the function call of setboxmondata in r3, and then essentially just called setboxmondata with the prepared register values.
	dd $030045c0 ; This is the location of the pokemon we want to change - "gEnemyParty" - found at: https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby.sym
	dw $0010        ; This is the new value that you want the field you picked in line 335 to be. https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9mon_data_substructures_(Generation_III) tells us that bits 0-26 are all used for ribbons. 27-31 are reserved for EVENT_LEGAL. If the high bit is 1, it is obedient.
	dw $0000        ; Essentially in the word we defined (dw 0010) this is the same as 0000 0000 0000 0000 0000 0000 0001 0000. In short, the high value (bit 5 from the right) is set, which allows our pokemon to be obedient.
	dd $0803D2ED ; https://raw.githubusercontent.com/pret/pokeruby/symbols/pokeruby.sym
	dw $0000     ; Spacer
	db $00       ; Spacer
	ENDM

setmondatalocation: MACRO
	db $00
	dw $4802
	dw $A203
	dw $2123
	dw $4B03
	dw $4718
	dw $0000
	dd $030045C0
	dw $00C8
	dw $0000
	dd $0803D2ED
	dw $0000
	dw $00
	ENDM

setmondatagame: MACRO
	dw $4802
	dw $A203
	dw $2125
	dw $4B03
	dw $4718
	dw $0000
	dd $030045C0
	dw $0003
	dw $0000
	dd $0803D2ED
	dw $0000
	dw $00
	ENDM


checkmoneventlegal: MACRO
	db $CE
	dw \1
	ENDM
setmonmetlocation: MACRO
	db $D2
	dw \1
	db \2
	ENDM

clearflag: MACRO
	db $2A
	dw \1
	ENDM
