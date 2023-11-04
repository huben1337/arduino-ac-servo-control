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
/* #APP */
	ldi r28, 0
	ldi r29, 0
	ldi r30, 0
	
/* #NOAPP */
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB0:
	.loc 1 16 17 view -0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 18 9 view .LVU1
	.loc 1 18 14 is_stmt 0 view .LVU2
	sbi 0x4,5
	.loc 1 21 9 is_stmt 1 view .LVU3
	.loc 1 21 16 is_stmt 0 view .LVU4
	in r24,0xa
	ori r24,lo8(-64)
	.loc 1 21 14 view .LVU5
	out 0xa,r24
	.loc 1 27 5 is_stmt 1 view .LVU6
	.loc 1 27 32 is_stmt 0 view .LVU7
	sbi 0x5,5
	.loc 1 29 5 is_stmt 1 view .LVU8
/* #APP */
 ;  29 "main.cpp" 1
	cli
 ;  0 "" 2
	.loc 1 30 5 view .LVU9
	.loc 1 30 12 is_stmt 0 view .LVU10
/* #NOAPP */
	ldi r24,lo8(2)
	sts 176,r24
	.loc 1 31 5 is_stmt 1 view .LVU11
	.loc 1 31 12 is_stmt 0 view .LVU12
	ldi r24,lo8(1)
	sts 177,r24
	.loc 1 32 5 is_stmt 1 view .LVU13
	.loc 1 32 11 is_stmt 0 view .LVU14
	sts 178,__zero_reg__
	.loc 1 33 5 is_stmt 1 view .LVU15
	.loc 1 33 11 is_stmt 0 view .LVU16
	ldi r24,lo8(-97)
	sts 179,r24
	.loc 1 34 5 is_stmt 1 view .LVU17
	.loc 1 34 11 is_stmt 0 view .LVU18
	ldi r24,lo8(79)
	sts 180,r24
	.loc 1 35 5 is_stmt 1 view .LVU19
	lds r24,112
	.loc 1 35 12 is_stmt 0 view .LVU20
	ori r24,lo8(6)
	sts 112,r24
	.loc 1 36 5 is_stmt 1 view .LVU21
/* #APP */
 ;  36 "main.cpp" 1
	sei
 ;  0 "" 2
	.loc 1 38 5 view .LVU22
	.loc 1 38 12 is_stmt 0 view .LVU23
/* #NOAPP */
	ldi r24,lo8(3)
	sts 196,r24
	.loc 1 39 5 is_stmt 1 view .LVU24
	.loc 1 39 12 is_stmt 0 view .LVU25
	sts 197,__zero_reg__
	.loc 1 40 5 is_stmt 1 view .LVU26
	.loc 1 40 12 is_stmt 0 view .LVU27
	ldi r24,lo8(24)
	sts 193,r24
	.loc 1 42 5 is_stmt 1 view .LVU28
.L2:
	.loc 1 42 12 discriminator 1 view .LVU29
	.loc 1 42 14 is_stmt 0 discriminator 1 view .LVU30
	lds r24,192
	.loc 1 42 12 discriminator 1 view .LVU31
	sbrs r24,5
	rjmp .L2
	.loc 1 43 5 is_stmt 1 view .LVU32
	.loc 1 43 10 is_stmt 0 view .LVU33
	ldi r24,lo8(67)
	sts 198,r24
	.loc 1 80 5 is_stmt 1 view .LVU34
/* #APP */
 ;  80 "main.cpp" 1
	ldi r31, 82
	ldi r20, 226
	L1:
	lds r15, 192
	sbrs r15, 7
	rjmp L1
	lds r19, 198
	L2:
	lds r15, 192
	sbrs r15, 7
	rjmp L2
	lds r18, 198
	mul r18, r20
	mov r22, r0
	mov r23, r1
	mul r19, r20
	add r23, r0
	adc r24, r1
	mov r12, r22
	mov r13, r23
	mov r14, r24
	L3:
	lds r15, 192
	sbrs r15, 5
	rjmp L3
	sts 198, r31
	rjmp L1
	
 ;  0 "" 2
	.loc 1 124 1 is_stmt 0 view .LVU35
/* #NOAPP */
	ldi r24,0
	ldi r25,0
/* epilogue start */
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
.global	__vector_7
	.type	__vector_7, @function
__vector_7:
.LFB1:
	.loc 1 126 24 is_stmt 1 view -0
	.cfi_startproc
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...3 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
	.loc 1 127 5 view .LVU37
/* #APP */
 ;  127 "main.cpp" 1
	cbi 11, 6
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
	.loc 1 132 1 is_stmt 0 view .LVU38
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
	.loc 1 134 24 is_stmt 1 view -0
	.cfi_startproc
	__gcc_isr 1
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 0...3 */
.L__stack_usage = 0 + __gcc_isr.n_pushed
	.loc 1 160 5 view .LVU40
/* #APP */
 ;  160 "main.cpp" 1
	push r0
	push r1
	cp r28, r12
	cpc r29, r13
	cpc r30, r14
	breq end
	brlo up
	sbi 11, 7
	sbi 11, 6
	sbiw r28, 1
	sbc r30, __zero_reg__
	rjmp end
	up:
	cbi 11, 7
	sbi 11, 6
	adiw r28, 1
	adc r30, __zero_reg__
	end:
	pop r1
	pop r0
	
 ;  0 "" 2
/* #NOAPP */
/* epilogue start */
	.loc 1 189 1 is_stmt 0 view .LVU41
	__gcc_isr 2
	reti
	__gcc_isr 0,r0
	.cfi_endproc
.LFE2:
	.size	__vector_8, .-__vector_8
.Letext0:
	.file 2 "c:\\msys64\\mingw64\\avr\\include\\stdint.h"
	.file 3 "./config.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc8
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF12
	.byte	0x4
	.long	.LASF13
	.long	.LASF14
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
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x5
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x7e
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x6
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x10
	.byte	0x5
	.long	0x43
	.long	.LFB0
	.long	.LFE0
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
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
	.uleb128 0x6
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
	.byte	0
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
.LASF14:
	.string	"C:\\Users\\huben\\Documents\\Personal\\Diplomarbeit\\software\\arduino\\arduino-ac-servo-control\\frimware\\src"
.LASF6:
	.string	"long unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF10:
	.string	"__vector_8"
.LASF13:
	.string	"main.cpp"
.LASF9:
	.string	"factor_t"
.LASF15:
	.string	"main"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF7:
	.string	"long long int"
.LASF12:
	.string	"GNU C++17 12.2.0 -mn-flash=1 -mdouble=32 -mlong-double=64 -mmcu=avr5 -gdwarf-2 -O3 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums --param=min-pagesize=0 -mn-flash=1 -mno-skip-bug -fno-rtti -fno-enforce-eh-specs -fno-exceptions"
.LASF3:
	.string	"uint16_t"
.LASF11:
	.string	"__vector_7"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (GNU) 12.2.0"
