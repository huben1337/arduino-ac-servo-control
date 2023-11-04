	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "main.cpp"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbi 0x4,5
	in r24,0xa
	ori r24,lo8(-64)
	out 0xa,r24
	sbi 0x5,5
/* #APP */
 ;  23 "main.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(2)
	sts 176,r24
	ldi r24,lo8(1)
	sts 177,r24
	sts 178,__zero_reg__
	ldi r24,lo8(95)
	sts 179,r24
	ldi r24,lo8(47)
	sts 180,r24
	lds r24,112
	ori r24,lo8(6)
	sts 112,r24
/* #APP */
 ;  30 "main.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(3)
	sts 196,r24
	sts 197,__zero_reg__
	ldi r24,lo8(24)
	sts 193,r24
.L2:
	lds r24,192
	sbrs r24,5
	rjmp .L2
	ldi r24,lo8(67)
	sts 198,r24
.LBB2:
	ldi r30,lo8(82)
.L3:
	lds r24,192
	sbrs r24,7
	rjmp .L3
	lds r24,198
.LVL0:
.L4:
	lds r25,192
	sbrs r25,7
	rjmp .L4
	lds r18,198
	mov r19,r24
	ldi r20,0
	ldi r22,lo8(-30)
	ldi r23,0
	ldi r24,0
	call __mulpsi3
	sts targetStepPosition,r22
	sts targetStepPosition+1,r23
	sts targetStepPosition+2,r24
.LVL1:
.L5:
	lds r24,192
	sbrs r24,5
	rjmp .L5
	sts 198,r30
.LBE2:
	rjmp .L3
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
.global	__vector_7
	.type	__vector_7, @function
__vector_7:
.LFB1:
	.cfi_startproc
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...3 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
/* #APP */
 ;  82 "main.cpp" 1
	cbi 11, 6
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
	__gcc_isr 2
	reti
	__gcc_isr 0,r0
	.cfi_endproc
.LFE1:
	.size	__vector_7, .-__vector_7
.global	__vector_8
	.type	__vector_8, @function
__vector_8:
.LFB2:
	.cfi_startproc
	__gcc_isr 1
	push r19
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 19, -2
	push r20
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 20, -3
	push r24
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 24, -4
	push r25
.LCFI3:
	.cfi_def_cfa_offset 6
	.cfi_offset 25, -5
	push r26
.LCFI4:
	.cfi_def_cfa_offset 7
	.cfi_offset 26, -6
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 5...9 */
.L__stack_usage = 5 + __gcc_isr.n_pushed
	lds r18,targetStepPosition
	lds r19,targetStepPosition+1
	lds r20,targetStepPosition+2
	lds r24,currentStepPosition
	lds r25,currentStepPosition+1
	lds r26,currentStepPosition+2
/* #APP */
 ;  91 "main.cpp" 1
	cp r24, r18
	cpc r25, r19
	cpc r26, r20
	breq end
	brlo up
	sbi 11, 7
	sbi 11, 6
	sbiw r24, 1
	sbc r26, __zero_reg__
	rjmp end
	up:
	cbi 11, 7
	sbi 11, 6
	adiw r24, 1
	adc r26, __zero_reg__
	end:
	
 ;  0 "" 2
/* #NOAPP */
	sts currentStepPosition,r24
	sts currentStepPosition+1,r25
	sts currentStepPosition+2,r26
/* epilogue start */
	pop r26
	pop r25
	pop r24
	pop r20
	pop r19
	__gcc_isr 2
	reti
	__gcc_isr 0,r18
	.cfi_endproc
.LFE2:
	.size	__vector_8, .-__vector_8
.global	targetStepPosition
	.section .bss
	.type	targetStepPosition, @object
	.size	targetStepPosition, 3
targetStepPosition:
	.zero	3
.global	currentStepPosition
	.type	currentStepPosition, @object
	.size	currentStepPosition, 3
currentStepPosition:
	.zero	3
	.text
.Letext0:
	.file 2 "c:\\msys64\\mingw64\\avr\\include\\stdint.h"
	.file 3 "./config.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x119
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.long	.LASF17
	.long	.LASF18
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7e
	.byte	0x16
	.long	0x3c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x80
	.byte	0x16
	.long	0x56
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0x24
	.byte	0x11
	.long	0x30
	.uleb128 0x5
	.long	.LASF11
	.byte	0x1
	.byte	0x6
	.byte	0x13
	.long	0x9f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	currentStepPosition
	.uleb128 0x2
	.byte	0x3
	.byte	0x7
	.long	.LASF10
	.uleb128 0x6
	.long	0x98
	.uleb128 0x5
	.long	.LASF12
	.byte	0x1
	.byte	0x7
	.byte	0x13
	.long	0x9f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	targetStepPosition
	.uleb128 0x7
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST1
	.byte	0x1
	.uleb128 0x8
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.long	0x43
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.long	.LBB2
	.long	.LBE2
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x47
	.byte	0x11
	.long	0x30
	.long	.LLST0
	.long	.LVUS0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.uleb128 0x2137
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.long	.LFB2
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI4
	.long	.LFE2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	0
	.long	0
.LVUS0:
	.uleb128 .LVU40
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 0
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x1
	.byte	0x68
	.long	.LVL1
	.long	.LFE0
	.word	0x1
	.byte	0x63
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB0
	.long	.LFE0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"firstByte"
.LASF11:
	.string	"currentStepPosition"
.LASF18:
	.string	"C:\\Users\\huben\\Documents\\Personal\\Diplomarbeit\\software\\arduino\\arduino-ac-servo-control\\frimware\\src"
.LASF6:
	.string	"long unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF14:
	.string	"__vector_7"
.LASF13:
	.string	"__vector_8"
.LASF16:
	.string	"GNU C++17 12.2.0 -mn-flash=1 -mdouble=32 -mlong-double=64 -mmcu=avr5 -gdwarf-2 -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums --param=min-pagesize=0 -mn-flash=1 -mno-skip-bug -fno-rtti -fno-enforce-eh-specs -fno-exceptions"
.LASF17:
	.string	"main.cpp"
.LASF9:
	.string	"factor_t"
.LASF19:
	.string	"main"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF7:
	.string	"long long int"
.LASF3:
	.string	"uint16_t"
.LASF12:
	.string	"targetStepPosition"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF10:
	.string	"__uint24"
	.ident	"GCC: (GNU) 12.2.0"
.global __do_clear_bss
