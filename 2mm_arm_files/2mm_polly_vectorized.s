	.text
	.file	"2mm.cpp"
	.section	.text._ZTS15Polybench_2mm_1,"axG",@progbits,_ZTS15Polybench_2mm_1,comdat
	.weak	_ZTS15Polybench_2mm_1           // -- Begin function _ZTS15Polybench_2mm_1
	.p2align	4
	.type	_ZTS15Polybench_2mm_1,@function
_ZTS15Polybench_2mm_1:                  // @_ZTS15Polybench_2mm_1
// %bb.0:                               // %polly.split_new_and_old
	stp	x29, x30, [sp, #-96]!           // 16-byte Folded Spill
	sub	x9, sp, #816, lsl #12           // =3342336
	stp	x28, x27, [sp, #16]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	sub	x9, x9, #544
	stp	x24, x23, [sp, #48]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             // 16-byte Folded Spill
	and	sp, x9, #0xffffffffffffffc0
	subs	x8, x0, #1
	str	x1, [sp, #152]                  // 8-byte Folded Spill
	smulh	x11, x8, x0
	mul	x10, x8, x0
	cset	w9, vs
	cmp	x11, x10, asr #63
	cset	w11, ne
	adds	x13, x10, x0
	add	x12, x2, x13, lsl #2
	cset	w10, vs
	add	x14, x3, x13, lsl #2
	add	x13, x1, x13, lsl #2
	cmp	x12, x3
	ccmp	x14, x2, #0, hi
	cset	w12, hi
	cmp	x13, x3
	ccmp	x14, x1, #0, hi
	cset	w13, hi
	tbnz	x0, #63, .LBB0_90
// %bb.1:                               // %polly.split_new_and_old
	tbnz	w12, #0, .LBB0_90
// %bb.2:                               // %polly.split_new_and_old
	tbnz	w13, #0, .LBB0_90
// %bb.3:                               // %polly.split_new_and_old
	tbnz	w9, #0, .LBB0_90
// %bb.4:                               // %polly.split_new_and_old
	tbnz	w11, #0, .LBB0_90
// %bb.5:                               // %polly.split_new_and_old
	cbnz	w10, .LBB0_90
// %bb.6:                               // %polly.loop_if
	cmp	x0, #0
	mov	x9, #-768                       // =0xfffffffffffffd00
	csel	x11, x9, x8, eq
	cmn	x11, #768
	b.le	.LBB0_98
// %bb.7:                               // %polly.loop_preheader
	lsr	x16, x8, #10
	mov	x7, #-6148914691236517206       // =0xaaaaaaaaaaaaaaaa
	sub	x1, x0, #4
	add	x12, x0, #3
	mov	x13, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	add	x4, x0, x0, lsl #1
	mov	x6, xzr
	mov	z2.d, #3                        // =0x3
	mov	z3.d, #12                       // =0xc
	str	x2, [sp, #96]                   // 8-byte Folded Spill
	lsr	x17, x0, #1
	movk	x7, #43691
	eor	x13, x13, #0x8000000000000001
	add	x10, x0, #1
	add	x5, sp, #512
	lsl	x4, x4, #6
	str	x17, [sp, #312]                 // 8-byte Folded Spill
	lsl	x17, x0, #12
	mul	x1, x1, x7
	umulh	x14, x12, x7
	lsl	x12, x0, #2
	smulh	x11, x11, x13
	umulh	x13, x8, x7
	str	x4, [sp, #376]                  // 8-byte Folded Spill
	stp	x17, x16, [sp, #128]            // 16-byte Folded Spill
	ldr	x17, [sp, #152]                 // 8-byte Folded Reload
	madd	x20, x12, x8, x3
	umulh	x15, x0, x7
	orr	x4, x5, #0x4
	umulh	x16, x10, x7
	lsl	x19, x8, #12
	stp	x4, x20, [sp, #488]             // 16-byte Folded Spill
	str	x19, [sp, #216]                 // 8-byte Folded Spill
	sub	x9, x0, #2
	str	x1, [sp, #80]                   // 8-byte Folded Spill
	add	x1, x12, #4
	umulh	x18, x9, x7
	orr	x23, x5, #0x8
	ptrue	p0.s
	mov	z1.d, x7
	str	x23, [sp, #384]                 // 8-byte Folded Spill
	mul	x1, x1, x8
	lsr	x20, x10, #1
	lsr	x14, x14, #1
	ptrue	p1.d
	add	x14, x14, x14, lsl #1
	add	x17, x17, #4
	stp	x1, x20, [sp, #280]             // 16-byte Folded Spill
	asr	x1, x11, #7
	sub	x27, x14, #3
	mov	w20, #12276                     // =0x2ff4
	str	x17, [sp, #88]                  // 8-byte Folded Spill
	add	x17, sp, #48, lsl #12           // =196608
	add	x11, x1, x11, lsr #63
	add	x17, x17, #512
	orr	x4, x17, #0x8
	mov	z4.d, x17
	str	x4, [sp, #344]                  // 8-byte Folded Spill
	and	x4, x19, #0xffffffffffffe000
	lsr	x19, x13, #5
	lsr	x13, x13, #1
	str	x19, [sp, #368]                 // 8-byte Folded Spill
	lsr	x19, x15, #1
	lsr	x15, x16, #1
	lsr	x16, x18, #1
	stp	x11, x19, [sp, #64]             // 16-byte Folded Spill
	add	x11, x19, x19, lsl #1
	add	x15, x15, x15, lsl #1
	cntw	x19
	sub	x11, x0, x11
	sub	x28, x10, x15
	add	x10, x3, x27, lsl #2
	str	x11, [sp, #408]                 // 8-byte Folded Spill
	lsl	x11, x27, #2
	mov	z0.d, x19
	stp	x10, x11, [sp, #248]            // 16-byte Folded Spill
	add	x10, x5, x4
	mov	w11, #4                         // =0x4
	str	x10, [sp, #120]                 // 8-byte Folded Spill
	orr	x10, x17, #0x4
	orr	x9, x11, x9, lsl #12
	str	x10, [sp, #168]                 // 8-byte Folded Spill
	add	x10, x16, x16, lsl #1
	str	x9, [sp, #464]                  // 8-byte Folded Spill
	mov	w9, #8196                       // =0x2004
	mov	x16, x2
	orr	x10, x11, x10, lsl #12
	add	x9, x5, x9
	str	x10, [sp, #160]                 // 8-byte Folded Spill
	add	x10, x13, x13, lsl #1
	str	x9, [sp, #240]                  // 8-byte Folded Spill
	lsl	x10, x10, #12
	str	x10, [sp, #360]                 // 8-byte Folded Spill
	b	.LBB0_9
	.p2align	5, , 16
.LBB0_8:                                // %polly.loop_exit79
                                        //   in Loop: Header=BB0_9 Depth=1
	ldp	x16, x9, [sp, #104]             // 16-byte Folded Reload
	ldr	x10, [sp, #64]                  // 8-byte Folded Reload
	ldr	x2, [sp, #96]                   // 8-byte Folded Reload
	sub	x17, x17, #768, lsl #12         // =3145728
	cmp	x9, x10
	add	x6, x9, #1
	add	x16, x16, #3072
	b.ge	.LBB0_98
.LBB0_9:                                // %polly.loop_preheader78
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_11 Depth 2
                                        //       Child Loop BB0_83 Depth 3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_89 Depth 4
                                        //       Child Loop BB0_14 Depth 3
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_22 Depth 5
                                        //           Child Loop BB0_25 Depth 5
                                        //         Child Loop BB0_27 Depth 4
                                        //           Child Loop BB0_30 Depth 5
                                        //             Child Loop BB0_32 Depth 6
                                        //           Child Loop BB0_35 Depth 5
                                        //         Child Loop BB0_44 Depth 4
                                        //           Child Loop BB0_46 Depth 5
                                        //         Child Loop BB0_66 Depth 4
                                        //         Child Loop BB0_61 Depth 4
                                        //         Child Loop BB0_53 Depth 4
                                        //         Child Loop BB0_74 Depth 4
                                        //           Child Loop BB0_77 Depth 5
	add	x9, x6, x6, lsl #1
	ldr	x14, [sp, #72]                  // 8-byte Folded Reload
	lsl	x11, x6, #8
	mov	w15, #255                       // =0xff
	add	x25, sp, #512
	mov	x1, xzr
	mov	x24, xzr
	stp	x16, x6, [sp, #104]             // 16-byte Folded Spill
	lsl	x18, x9, #8
	mvn	x13, x11
	add	x4, x18, #767
	cmp	x4, x8
	csel	x22, x4, x8, lt
	add	x13, x14, x13
	index	z5.d, x18, #1
	str	x4, [sp, #400]                  // 8-byte Folded Spill
	cmp	x22, x18
	str	x13, [sp, #352]                 // 8-byte Folded Spill
	str	x22, [sp, #144]                 // 8-byte Folded Spill
	csel	x10, x22, x18, gt
	cmp	x13, #255
	csel	x13, x13, x15, lt
	mov	z6.d, z5.d
	str	x13, [sp, #504]                 // 8-byte Folded Spill
	mov	w13, #3                         // =0x3
	bfi	x13, x9, #8, #56
	cmp	x0, x13
	cset	w13, ge
	cmp	x4, x0
	incd	z6.d
	csel	w13, wzr, w13, lt
	cset	w14, ge
	str	w13, [sp, #396]                 // 4-byte Folded Spill
	ldr	x13, [sp, #80]                  // 8-byte Folded Reload
	sub	x11, x13, x11
	cmp	x11, #255
	str	x11, [sp, #304]                 // 8-byte Folded Spill
	csel	x11, x11, x15, lt
	mov	x15, x16
	str	x11, [sp, #336]                 // 8-byte Folded Spill
	ldr	x11, [sp, #408]                 // 8-byte Folded Reload
	cmp	x11, #0
	mov	x11, #-768                      // =0xfffffffffffffd00
	madd	x10, x6, x11, x10
	mov	w11, #2                         // =0x2
	bfi	x11, x9, #8, #56
	add	x10, x10, #1
	str	x11, [sp, #424]                 // 8-byte Folded Spill
	csel	w11, wzr, w14, eq
	str	x10, [sp, #328]                 // 8-byte Folded Spill
	lsl	x10, x6, #18
	str	w11, [sp, #324]                 // 4-byte Folded Spill
	mov	w11, #49                        // =0x31
	mov	z7.d, x10
	ldr	x10, [sp, #88]                  // 8-byte Folded Reload
	bfi	x11, x9, #8, #56
	str	x11, [sp, #296]                 // 8-byte Folded Spill
	mov	w11, #4                         // =0x4
	bfi	x11, x9, #8, #56
	lsl	x9, x9, #10
	stp	x9, x11, [sp, #264]             // 16-byte Folded Spill
	mov	w9, #1                          // =0x1
	mov	w11, #1023                      // =0x3ff
	stp	x9, x10, [sp, #224]             // 16-byte Folded Spill
	b	.LBB0_11
	.p2align	5, , 16
.LBB0_10:                               // %polly.loop_exit108
                                        //   in Loop: Header=BB0_11 Depth=2
	ldp	x9, x22, [sp, #136]             // 16-byte Folded Reload
	ldp	x11, x10, [sp, #192]            // 16-byte Folded Reload
	ldp	x15, x2, [sp, #176]             // 16-byte Folded Reload
	mov	x7, #-6148914691236517206       // =0xaaaaaaaaaaaaaaaa
	cntw	x19
	sub	x25, x25, #2, lsl #12           // =8192
	mov	w20, #12276                     // =0x2ff4
	movk	x7, #43691
	ldr	x1, [sp, #208]                  // 8-byte Folded Reload
	cmp	x10, x9
	add	x24, x10, #1
	ldr	x10, [sp, #128]                 // 8-byte Folded Reload
	add	x11, x11, #1024
	add	x1, x1, #1024
	add	x15, x15, x10
	add	x2, x2, x10
	ldr	x10, [sp, #224]                 // 8-byte Folded Reload
	sub	x9, x10, #1024
	ldr	x10, [sp, #232]                 // 8-byte Folded Reload
	add	x10, x10, #1, lsl #12           // =4096
	stp	x9, x10, [sp, #224]             // 16-byte Folded Spill
	b.hs	.LBB0_8
.LBB0_11:                               // %polly.loop_if83
                                        //   Parent Loop BB0_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_83 Depth 3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_89 Depth 4
                                        //       Child Loop BB0_14 Depth 3
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_22 Depth 5
                                        //           Child Loop BB0_25 Depth 5
                                        //         Child Loop BB0_27 Depth 4
                                        //           Child Loop BB0_30 Depth 5
                                        //             Child Loop BB0_32 Depth 6
                                        //           Child Loop BB0_35 Depth 5
                                        //         Child Loop BB0_44 Depth 4
                                        //           Child Loop BB0_46 Depth 5
                                        //         Child Loop BB0_66 Depth 4
                                        //         Child Loop BB0_61 Depth 4
                                        //         Child Loop BB0_53 Depth 4
                                        //         Child Loop BB0_74 Depth 4
                                        //           Child Loop BB0_77 Depth 5
	cmp	x11, x8
	mov	w10, #1023                      // =0x3ff
	lsl	x21, x24, #10
	stp	x2, x11, [sp, #184]             // 16-byte Folded Spill
	str	x1, [sp, #208]                  // 8-byte Folded Spill
	mov	x14, x17
	csel	x9, x11, x8, lt
	bfi	x10, x24, #10, #54
	mov	x11, x2
	str	x15, [sp, #176]                 // 8-byte Folded Spill
	mov	x16, x21
	cmp	x9, x1
	csel	x9, x9, x1, gt
	cmp	x10, x8
	csel	x13, x10, x8, lt
	cmp	x13, x21
	csel	x10, x13, x21, gt
	cmp	x0, x21
	b.gt	.LBB0_83
.LBB0_12:                               // %polly.loop_preheader107
                                        //   in Loop: Header=BB0_11 Depth=2
	ldp	x11, x7, [sp, #224]             // 16-byte Folded Reload
	str	x24, [sp, #200]                 // 8-byte Folded Spill
	ldr	x24, [sp, #120]                 // 8-byte Folded Reload
	mov	x30, xzr
	mov	x14, xzr
	add	x11, x9, x11
	add	w9, w9, #1
	ldr	x16, [sp, #152]                 // 8-byte Folded Reload
	str	x25, [sp, #416]                 // 8-byte Folded Spill
	and	x9, x9, #0x1
	sub	x9, x11, x9
	str	x9, [sp, #480]                  // 8-byte Folded Spill
	sub	x9, x10, x21
	mov	w10, #1023                      // =0x3ff
	add	x2, x9, #1
	mvn	x9, x21
	add	x9, x0, x9
	cmp	x9, #1023
	csel	x19, x9, x10, lt
	b	.LBB0_14
	.p2align	5, , 16
.LBB0_13:                               // %polly.merge316
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #368]                 // 8-byte Folded Reload
	ldr	x11, [sp, #472]                 // 8-byte Folded Reload
	ldp	x16, x30, [sp, #448]            // 16-byte Folded Reload
	sub	x24, x24, #48, lsl #12          // =196608
	cmp	x11, x10
	add	x14, x11, #1
	mov	x11, #-24                       // =0xffffffffffffffe8
	ldr	x7, [sp, #440]                  // 8-byte Folded Reload
	ldr	x25, [sp, #416]                 // 8-byte Folded Reload
	movk	x11, #7, lsl #48
	add	x30, x30, x11
	ldp	x11, x23, [sp, #376]            // 16-byte Folded Reload
	add	x7, x7, x11
	add	x16, x16, x11
	b.hs	.LBB0_10
.LBB0_14:                               // %polly.loop_if112
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_22 Depth 5
                                        //           Child Loop BB0_25 Depth 5
                                        //         Child Loop BB0_27 Depth 4
                                        //           Child Loop BB0_30 Depth 5
                                        //             Child Loop BB0_32 Depth 6
                                        //           Child Loop BB0_35 Depth 5
                                        //         Child Loop BB0_44 Depth 4
                                        //           Child Loop BB0_46 Depth 5
                                        //         Child Loop BB0_66 Depth 4
                                        //         Child Loop BB0_61 Depth 4
                                        //         Child Loop BB0_53 Depth 4
                                        //         Child Loop BB0_74 Depth 4
                                        //           Child Loop BB0_77 Depth 5
	add	x11, x14, x14, lsl #1
	str	x14, [sp, #472]                 // 8-byte Folded Spill
	stp	x7, x16, [sp, #440]             // 16-byte Folded Spill
	lsl	x14, x11, #4
	add	x22, x14, #47
	mov	x26, x14
	cmp	x8, x22
	csel	x10, x8, x22, lt
	cmp	x0, x11, lsl #4
	b.gt	.LBB0_19
.LBB0_15:                               // %polly.cond
                                        //   in Loop: Header=BB0_14 Depth=3
	orr	x10, x14, #0x2
	str	x30, [sp, #456]                 // 8-byte Folded Spill
	cmp	x0, x10
	str	x10, [sp, #432]                 // 8-byte Folded Spill
	b.lt	.LBB0_37
// %bb.16:                              // %polly.cond
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #352]                 // 8-byte Folded Reload
	tbnz	x10, #63, .LBB0_37
// %bb.17:                              // %polly.loop_if145.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	ldr	x15, [sp, #472]                 // 8-byte Folded Reload
	mov	x11, #-24                       // =0xffffffffffffffe8
	ldr	x6, [sp, #344]                  // 8-byte Folded Reload
	mov	x16, xzr
	madd	x7, x15, x11, x10
	mov	w10, #24                        // =0x18
	cmp	x7, #24
	csel	x10, x7, x10, lt
	tst	x0, #0x1
	ccmp	x22, x0, #8, ne
	sub	x10, x10, #1
	cset	w26, lt
	b	.LBB0_27
	.p2align	5, , 16
.LBB0_18:                               // %polly.loop_exit123
                                        //   in Loop: Header=BB0_19 Depth=4
	cmp	x26, x10
	add	x26, x26, #1
	add	x7, x7, x12
	add	x16, x16, x12
	b.ge	.LBB0_15
.LBB0_19:                               // %polly.loop_if120
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_22 Depth 5
                                        //           Child Loop BB0_25 Depth 5
	cmp	x0, x21
	b.le	.LBB0_18
// %bb.20:                              // %polly.loop_header121.preheader
                                        //   in Loop: Header=BB0_19 Depth=4
	add	x11, x30, x26, lsr #1
	cmp	x2, #2
	mov	w1, w26
	lsl	x15, x11, #13
	mov	x11, x21
	b.lo	.LBB0_24
// %bb.21:                              // %vector.ph
                                        //   in Loop: Header=BB0_19 Depth=4
	ldr	x20, [sp, #480]                 // 8-byte Folded Reload
	mov	x11, x15
	bfi	x11, x1, #2, #1
	and	x5, x2, #0xfffffffffffffffe
	mov	x6, x7
	add	x4, x23, x11
	add	x11, x21, x5
	.p2align	5, , 16
.LBB0_22:                               // %vector.body
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_19 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldp	s16, s17, [x6, #-4]
	subs	x20, x20, #2
	add	x6, x6, #8
	stur	s16, [x4, #-8]
	str	s17, [x4], #16
	b.ne	.LBB0_22
// %bb.23:                              // %middle.block
                                        //   in Loop: Header=BB0_19 Depth=4
	cmp	x2, x5
	b.eq	.LBB0_18
.LBB0_24:                               // %polly.loop_header121.preheader1
                                        //   in Loop: Header=BB0_19 Depth=4
	ubfiz	x1, x1, #2, #1
	add	x15, x15, x11, lsl #3
	add	x1, x25, x1
	add	x15, x1, x15
	.p2align	5, , 16
.LBB0_25:                               // %polly.loop_header121
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_19 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s16, [x16, x11, lsl #2]
	cmp	x11, x13
	add	x11, x11, #1
	str	s16, [x15], #8
	b.lt	.LBB0_25
	b	.LBB0_18
	.p2align	5, , 16
.LBB0_26:                               // %polly.merge254
                                        //   in Loop: Header=BB0_27 Depth=4
	ldr	x11, [sp, #504]                 // 8-byte Folded Reload
	add	x6, x6, #3, lsl #12             // =12288
	cmp	x16, x11
	add	x16, x16, #1
	b.ge	.LBB0_37
.LBB0_27:                               // %polly.loop_if145
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_30 Depth 5
                                        //             Child Loop BB0_32 Depth 6
                                        //           Child Loop BB0_35 Depth 5
	cmp	x7, #1
	b.lt	.LBB0_33
// %bb.28:                              // %polly.loop_if153.preheader
                                        //   in Loop: Header=BB0_27 Depth=4
	add	x11, x16, x16, lsl #1
	ldr	x23, [sp, #488]                 // 8-byte Folded Reload
	mov	x5, xzr
	add	x11, x18, x11
	lsl	x25, x11, #2
	add	x15, x25, #4
	add	x20, x25, #8
	b	.LBB0_30
	.p2align	5, , 16
.LBB0_29:                               // %polly.loop_exit156
                                        //   in Loop: Header=BB0_30 Depth=5
	cmp	x5, x10
	add	x5, x5, #1
	add	x23, x23, #2, lsl #12           // =8192
	b.ge	.LBB0_33
.LBB0_30:                               // %polly.loop_if153
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_27 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB0_32 Depth 6
	tbnz	x9, #63, .LBB0_29
// %bb.31:                              // %polly.stmt.for.body11.i237.preheader
                                        //   in Loop: Header=BB0_30 Depth=5
	add	x11, x14, x5, lsl #1
	mov	x4, #-1                         // =0xffffffffffffffff
	mov	x22, x6
	madd	x1, x12, x11, x3
	orr	x11, x11, #0x1
	madd	x30, x12, x11, x3
	mov	x11, x23
	.p2align	5, , 16
.LBB0_32:                               // %polly.stmt.for.body11.i237
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_27 Depth=4
                                        //           Parent Loop BB0_30 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
	ldur	s16, [x11, #-4]
	ldr	s17, [x1, x25]
	ldp	s18, s19, [x22, #-8]
	add	x4, x4, #1
	cmp	x4, x19
	ldr	s20, [x1, x20]
	fmadd	s17, s16, s18, s17
	str	s17, [x1, x25]
	ldr	s17, [x1, x15]
	fmadd	s17, s16, s19, s17
	str	s17, [x1, x15]
	ldr	s17, [x22], #12
	fmadd	s16, s16, s17, s20
	str	s16, [x1, x20]
	ldr	s16, [x11], #8
	ldr	s20, [x30, x25]
	fmadd	s18, s16, s18, s20
	str	s18, [x30, x25]
	ldr	s18, [x30, x15]
	fmadd	s18, s16, s19, s18
	str	s18, [x30, x15]
	ldr	s18, [x30, x20]
	fmadd	s16, s16, s17, s18
	str	s16, [x30, x20]
	b.lt	.LBB0_32
	b	.LBB0_29
	.p2align	5, , 16
.LBB0_33:                               // %polly.cond253
                                        //   in Loop: Header=BB0_27 Depth=4
	cmp	x9, #0
	csinc	w11, w26, wzr, ge
	tbnz	w11, #0, .LBB0_26
// %bb.34:                              // %polly.stmt.for.body11.i298.preheader
                                        //   in Loop: Header=BB0_27 Depth=4
	ldr	x15, [sp, #496]                 // 8-byte Folded Reload
	add	x11, x16, x16, lsl #1
	mov	x1, x24
	mov	x4, x6
	add	x11, x18, x11
	add	x11, x15, x11, lsl #2
	mov	x15, #-1                        // =0xffffffffffffffff
	ldp	s18, s17, [x11]
	ldr	s16, [x11, #8]
	.p2align	5, , 16
.LBB0_35:                               // %polly.stmt.for.body11.i298
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_27 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s19, [x1], #8
	ldp	s20, s21, [x4, #-8]
	add	x15, x15, #1
	cmp	x15, x19
	fmadd	s18, s19, s20, s18
	ldr	s20, [x4], #12
	fmadd	s17, s19, s21, s17
	fmadd	s16, s19, s20, s16
	b.lt	.LBB0_35
// %bb.36:                              // %polly.merge254.loopexit
                                        //   in Loop: Header=BB0_27 Depth=4
	stp	s18, s17, [x11]
	str	s16, [x11, #8]
	b	.LBB0_26
	.p2align	5, , 16
.LBB0_37:                               // %polly.cond315
                                        //   in Loop: Header=BB0_14 Depth=3
	ldp	x10, x20, [sp, #424]            // 16-byte Folded Reload
	ldr	x11, [sp, #400]                 // 8-byte Folded Reload
	ldr	x23, [sp, #360]                 // 8-byte Folded Reload
	cmp	x10, x0
	cset	w10, ge
	cmp	x0, x20
	csel	w15, wzr, w10, lt
	ldr	w10, [sp, #396]                 // 4-byte Folded Reload
	csel	w10, wzr, w10, lt
	cmp	x11, x0
	orr	x11, x14, #0x3
	ccmp	x0, x11, #8, ge
	ldr	x11, [sp, #408]                 // 8-byte Folded Reload
	csinc	w10, w10, wzr, lt
	cmp	x11, #0
	csel	w11, wzr, w10, eq
	orr	x10, x14, #0x1
	tbnz	w15, #0, .LBB0_40
// %bb.38:                              // %polly.cond315
                                        //   in Loop: Header=BB0_14 Depth=3
	tbnz	w11, #0, .LBB0_40
// %bb.39:                              // %polly.cond315
                                        //   in Loop: Header=BB0_14 Depth=3
	cmp	x10, x0
	b.ne	.LBB0_13
.LBB0_40:                               // %polly.cond321
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x6, [sp, #336]                  // 8-byte Folded Reload
	cmp	x10, x0
	b.ne	.LBB0_48
// %bb.41:                              // %polly.cond321
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x11, [sp, #304]                 // 8-byte Folded Reload
	tbnz	x11, #63, .LBB0_48
// %bb.42:                              // %polly.loop_if334.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x11, [sp, #344]                 // 8-byte Folded Reload
	mov	x15, xzr
	b	.LBB0_44
	.p2align	5, , 16
.LBB0_43:                               // %polly.loop_exit337
                                        //   in Loop: Header=BB0_44 Depth=4
	cmp	x15, x6
	add	x15, x15, #1
	add	x11, x11, #3, lsl #12           // =12288
	b.ge	.LBB0_48
.LBB0_44:                               // %polly.loop_if334
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_46 Depth 5
	tbnz	x9, #63, .LBB0_43
// %bb.45:                              // %polly.stmt.for.body11.i372.preheader
                                        //   in Loop: Header=BB0_44 Depth=4
	ldr	x1, [sp, #496]                  // 8-byte Folded Reload
	add	x16, x15, x15, lsl #1
	add	x4, sp, #512
	mov	x5, x11
	add	x16, x18, x16
	add	x16, x1, x16, lsl #2
	mov	x1, #-1                         // =0xffffffffffffffff
	ldp	s18, s17, [x16]
	ldr	s16, [x16, #8]
	.p2align	5, , 16
.LBB0_46:                               // %polly.stmt.for.body11.i372
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_44 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s19, [x4], #8
	ldp	s20, s21, [x5, #-8]
	add	x1, x1, #1
	cmp	x1, x19
	fmadd	s18, s19, s20, s18
	ldr	s20, [x5], #12
	fmadd	s17, s19, s21, s17
	fmadd	s16, s19, s20, s16
	b.lt	.LBB0_46
// %bb.47:                              // %polly.loop_exit337.loopexit
                                        //   in Loop: Header=BB0_44 Depth=4
	stp	s18, s17, [x16]
	str	s16, [x16, #8]
	b	.LBB0_43
	.p2align	5, , 16
.LBB0_48:                               // %polly.cond387
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	w11, [sp, #324]                 // 4-byte Folded Reload
	tbz	w11, #0, .LBB0_13
// %bb.49:                              // %polly.cond392
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x11, [sp, #296]                 // 8-byte Folded Reload
	cmp	x0, x11
	b.lt	.LBB0_55
// %bb.50:                              // %polly.cond392
                                        //   in Loop: Header=BB0_14 Depth=3
	cmp	x10, x0
	b.ne	.LBB0_55
// %bb.51:                              // %polly.loop_if396
                                        //   in Loop: Header=BB0_14 Depth=3
	tbnz	x9, #63, .LBB0_71
// %bb.52:                              // %polly.stmt.for.body11.i404.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #280]                 // 8-byte Folded Reload
	ldr	x15, [sp, #216]                 // 8-byte Folded Reload
	add	x11, sp, #512
	ldr	s16, [x3, x10]
	mov	x10, #-1                        // =0xffffffffffffffff
	.p2align	5, , 16
.LBB0_53:                               // %polly.stmt.for.body11.i404
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	s17, [x11], #8
	ldr	s18, [x17, x15]
	add	x10, x10, #1
	add	x15, x15, #12
	cmp	x10, x19
	fmadd	s16, s17, s18, s16
	b.lt	.LBB0_53
// %bb.54:                              // %polly.loop_if585.loopexit
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #280]                 // 8-byte Folded Reload
	str	s16, [x3, x10]
	b	.LBB0_71
.LBB0_55:                               // %polly.cond420
                                        //   in Loop: Header=BB0_14 Depth=3
	ldp	x5, x11, [sp, #264]             // 16-byte Folded Reload
	ldp	x7, x6, [sp, #248]              // 16-byte Folded Reload
	ldr	x4, [sp, #424]                  // 8-byte Folded Reload
	cmp	x0, x11
	b.lt	.LBB0_63
// %bb.56:                              // %polly.cond420
                                        //   in Loop: Header=BB0_14 Depth=3
	cmp	x0, x20
	b.lt	.LBB0_63
// %bb.57:                              // %polly.loop_if424
                                        //   in Loop: Header=BB0_14 Depth=3
	tbnz	x9, #63, .LBB0_71
// %bb.58:                              // %polly.cond449.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x1, [sp, #488]                  // 8-byte Folded Reload
	ldr	x5, [sp, #160]                  // 8-byte Folded Reload
	mul	x10, x12, x10
	madd	x11, x12, x14, x3
	mov	x16, #-1                        // =0xffffffffffffffff
	mov	x4, x23
	add	x15, x3, x10
	b	.LBB0_61
	.p2align	5, , 16
.LBB0_59:                               // %polly.merge488.critedge
                                        //   in Loop: Header=BB0_61 Depth=4
	ldr	s17, [x1]
	ldr	s18, [x7, x10]
	fmadd	s16, s17, s16, s18
	str	s16, [x7, x10]
.LBB0_60:                               // %polly.merge488
                                        //   in Loop: Header=BB0_61 Depth=4
	add	x16, x16, #1
	add	x5, x5, #12
	add	x4, x4, #12
	add	x1, x1, #8
	cmp	x16, x19
	b.ge	.LBB0_71
.LBB0_61:                               // %polly.cond449
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x1, #-4]
	ldr	s16, [x17, x4]
	ldr	s18, [x11, x6]
	fmadd	s18, s17, s16, s18
	str	s18, [x11, x6]
	cbnz	x28, .LBB0_59
// %bb.62:                              // %polly.stmt.for.body11.i454
                                        //   in Loop: Header=BB0_61 Depth=4
	ldr	s18, [x17, x5]
	ldr	s19, [x11, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x11, x8, lsl #2]
	ldr	s17, [x1]
	ldr	s19, [x15, x6]
	fmadd	s16, s17, s16, s19
	str	s16, [x15, x6]
	ldr	s16, [x15, x8, lsl #2]
	fmadd	s16, s17, s18, s16
	str	s16, [x15, x8, lsl #2]
	b	.LBB0_60
.LBB0_63:                               // %polly.loop_if508
                                        //   in Loop: Header=BB0_14 Depth=3
	tbnz	x9, #63, .LBB0_71
// %bb.64:                              // %polly.cond530.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x16, [sp, #488]                 // 8-byte Folded Reload
	ldr	x1, [sp, #168]                  // 8-byte Folded Reload
	madd	x11, x12, x14, x3
	mov	x15, #-1                        // =0xffffffffffffffff
	madd	x10, x12, x10, x3
	b	.LBB0_66
	.p2align	5, , 16
.LBB0_65:                               // %polly.merge549
                                        //   in Loop: Header=BB0_66 Depth=4
	add	x15, x15, #1
	add	x1, x1, #12
	add	x16, x16, #8
	cmp	x15, x19
	b.ge	.LBB0_71
.LBB0_66:                               // %polly.cond530
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x16, #-4]
	ldur	s16, [x1, #-4]
	ldr	s18, [x11, x5]
	cmp	x4, x0
	fmadd	s18, s17, s16, s18
	str	s18, [x11, x5]
	b.ne	.LBB0_68
// %bb.67:                              // %polly.stmt.for.body11.i534
                                        //   in Loop: Header=BB0_66 Depth=4
	ldr	s18, [x1]
	ldr	s19, [x11, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x11, x8, lsl #2]
.LBB0_68:                               // %polly.cond548
                                        //   in Loop: Header=BB0_66 Depth=4
	cmp	x0, x20
	b.lt	.LBB0_65
// %bb.69:                              // %polly.cond566
                                        //   in Loop: Header=BB0_66 Depth=4
	ldr	s17, [x16]
	ldr	s18, [x10, x5]
	cmp	x4, x0
	fmadd	s16, s17, s16, s18
	str	s16, [x10, x5]
	b.ne	.LBB0_65
// %bb.70:                              // %polly.stmt.for.body11.i570
                                        //   in Loop: Header=BB0_66 Depth=4
	ldr	s16, [x1]
	ldr	s18, [x10, x8, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x10, x8, lsl #2]
	b	.LBB0_65
	.p2align	5, , 16
.LBB0_71:                               // %polly.loop_if585
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x15, [sp, #472]                 // 8-byte Folded Reload
	mov	x11, #-24                       // =0xffffffffffffffe8
	madd	x11, x15, x11, x10
	mov	w10, #24                        // =0x18
	cmp	x11, #24
	csel	x10, x11, x10, lt
	cmp	x11, #2
	b.lt	.LBB0_13
// %bb.72:                              // %polly.loop_if593.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	ldr	x16, [sp, #240]                 // 8-byte Folded Reload
	sub	x10, x10, #1
	mov	w7, #1                          // =0x1
	b	.LBB0_74
	.p2align	5, , 16
.LBB0_73:                               // %polly.loop_exit596
                                        //   in Loop: Header=BB0_74 Depth=4
	cmp	x7, x10
	add	x7, x7, #1
	add	x16, x16, #2, lsl #12           // =8192
	b.ge	.LBB0_13
.LBB0_74:                               // %polly.loop_if593
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_77 Depth 5
	tbnz	x9, #63, .LBB0_73
// %bb.75:                              // %polly.cond619.preheader
                                        //   in Loop: Header=BB0_74 Depth=4
	add	x1, x14, x7, lsl #1
	ldr	x30, [sp, #464]                 // 8-byte Folded Reload
	mov	x20, #-1                        // =0xffffffffffffffff
	mov	x22, x16
	mov	x25, x23
	madd	x11, x12, x1, x3
	add	x15, x1, #2
	orr	x1, x1, #0x1
	madd	x5, x12, x1, x3
	mov	x26, x30
	b	.LBB0_77
	.p2align	5, , 16
.LBB0_76:                               // %polly.merge642
                                        //   in Loop: Header=BB0_77 Depth=5
	add	x20, x20, #1
	add	x30, x30, #12
	add	x26, x26, #12
	add	x25, x25, #12
	add	x22, x22, #8
	cmp	x20, x19
	b.ge	.LBB0_73
.LBB0_77:                               // %polly.cond619
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        //         Parent Loop BB0_74 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldur	s17, [x22, #-4]
	ldr	s16, [x17, x25]
	ldr	s18, [x11, x27, lsl #2]
	fmadd	s18, s17, s16, s18
	str	s18, [x11, x27, lsl #2]
	cbz	x28, .LBB0_79
// %bb.78:                              // %polly.cond641
                                        //   in Loop: Header=BB0_77 Depth=5
	cmp	x0, x15
	b.lt	.LBB0_76
	b	.LBB0_80
	.p2align	5, , 16
.LBB0_79:                               // %polly.stmt.for.body11.i624
                                        //   in Loop: Header=BB0_77 Depth=5
	ldr	s18, [x17, x26]
	ldr	s19, [x11, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x11, x8, lsl #2]
	cmp	x0, x15
	b.lt	.LBB0_76
.LBB0_80:                               // %polly.cond664
                                        //   in Loop: Header=BB0_77 Depth=5
	ldr	s17, [x22]
	ldr	s18, [x5, x27, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x5, x27, lsl #2]
	cbnz	x28, .LBB0_76
// %bb.81:                              // %polly.stmt.for.body11.i669
                                        //   in Loop: Header=BB0_77 Depth=5
	ldr	s16, [x17, x30]
	ldr	s18, [x5, x8, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x5, x8, lsl #2]
	b	.LBB0_76
	.p2align	5, , 16
.LBB0_82:                               // %polly.loop_exit94
                                        //   in Loop: Header=BB0_83 Depth=3
	cmp	x16, x13
	add	x16, x16, #1
	add	x15, x15, x12
	add	x14, x14, #12
	add	x11, x11, x12
	b.ge	.LBB0_12
.LBB0_83:                               // %polly.loop_if91
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_89 Depth 4
	cmp	x0, x18
	b.le	.LBB0_82
// %bb.84:                              // %polly.loop_header92.preheader
                                        //   in Loop: Header=BB0_83 Depth=3
	ldr	x1, [sp, #328]                  // 8-byte Folded Reload
	cmp	x1, x19
	mov	x1, x18
	b.lo	.LBB0_88
// %bb.85:                              // %vector.ph9
                                        //   in Loop: Header=BB0_83 Depth=3
	ldr	x4, [sp, #328]                  // 8-byte Folded Reload
	sub	x5, x16, x21
	neg	x1, x19
	mov	z17.d, z5.d
	mov	z18.d, z6.d
	mov	x2, xzr
	mov	z16.d, x5
	and	x4, x4, x1
	add	x1, x18, x4
	.p2align	5, , 16
.LBB0_86:                               // %vector.body15
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_83 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	z20.d, z17.d, z1.d
	ld1w	{ z19.s }, p0/z, [x15, x2, lsl #2]
	incw	x2
	cmp	x4, x2
	umulh	z21.d, z18.d, z1.d
	lsr	z20.d, z20.d, #1
	lsr	z21.d, z21.d, #1
	lsl	z22.d, z21.d, #10
	lsl	z23.d, z20.d, #10
	msb	z20.d, p1/m, z2.d, z17.d
	msb	z21.d, p1/m, z2.d, z18.d
	add	z17.d, z17.d, z0.d
	add	z18.d, z18.d, z0.d
	sub	z23.d, z23.d, z7.d
	sub	z22.d, z22.d, z7.d
	add	z22.d, z22.d, z16.d
	add	z23.d, z23.d, z16.d
	mad	z23.d, p1/m, z3.d, z4.d
	mad	z22.d, p1/m, z3.d, z4.d
	adr	z21.d, [z22.d, z21.d, lsl #2]
	adr	z20.d, [z23.d, z20.d, lsl #2]
	uunpklo	z22.d, z19.s
	uunpkhi	z19.d, z19.s
	st1w	{ z22.d }, p1, [z20.d]
	st1w	{ z19.d }, p1, [z21.d]
	b.ne	.LBB0_86
// %bb.87:                              // %middle.block6
                                        //   in Loop: Header=BB0_83 Depth=3
	ldr	x2, [sp, #328]                  // 8-byte Folded Reload
	cmp	x2, x4
	b.eq	.LBB0_82
.LBB0_88:                               // %polly.loop_header92.preheader4
                                        //   in Loop: Header=BB0_83 Depth=3
	sub	x2, x1, #1
	add	x4, x14, x1, lsl #2
	add	x5, x11, x1, lsl #2
	.p2align	5, , 16
.LBB0_89:                               // %polly.loop_header92
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_83 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	x6, x1, x7
	ldr	s16, [x5], #4
	add	x2, x2, #1
	add	x1, x1, #1
	cmp	x2, x22
	lsr	x6, x6, #1
	mul	x6, x6, x20
	str	s16, [x4, x6]
	add	x4, x4, #4
	b.lt	.LBB0_89
	b	.LBB0_82
.LBB0_90:                               // %for.cond.i.preheader
	lsl	x9, x0, #2
	mov	x8, xzr
	b	.LBB0_92
	.p2align	5, , 16
.LBB0_91:                               // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_92 Depth=1
	add	x8, x8, #1
	add	x3, x3, x9
.LBB0_92:                               // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_95 Depth 2
                                        //       Child Loop BB0_97 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_98
// %bb.93:                              // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_92 Depth=1
	ldr	x12, [sp, #152]                 // 8-byte Folded Reload
	mul	x11, x8, x0
	mov	x10, xzr
	add	x11, x12, x11, lsl #2
	mov	x12, x2
	b	.LBB0_95
	.p2align	5, , 16
.LBB0_94:                               // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_95 Depth=2
	add	x10, x10, #1
	add	x12, x12, x9
.LBB0_95:                               // %for.cond2.i
                                        //   Parent Loop BB0_92 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_97 Depth 3
	cmp	x10, x0
	b.hs	.LBB0_91
// %bb.96:                              // %for.cond7.i.preheader
                                        //   in Loop: Header=BB0_95 Depth=2
	mov	x13, xzr
	cmp	xzr, x0
	b.hs	.LBB0_94
	.p2align	5, , 16
.LBB0_97:                               // %for.body11.i
                                        //   Parent Loop BB0_92 Depth=1
                                        //     Parent Loop BB0_95 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	s0, [x11, x10, lsl #2]
	ldr	s1, [x12, x13, lsl #2]
	ldr	s2, [x3, x13, lsl #2]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x13, lsl #2]
	add	x13, x13, #1
	cmp	x13, x0
	b.lo	.LBB0_97
	b	.LBB0_94
.LBB0_98:                               // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	mov	sp, x29
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS15Polybench_2mm_1, .Lfunc_end0-_ZTS15Polybench_2mm_1
                                        // -- End function
	.section	.text._ZTS15Polybench_2mm_2,"axG",@progbits,_ZTS15Polybench_2mm_2,comdat
	.weak	_ZTS15Polybench_2mm_2           // -- Begin function _ZTS15Polybench_2mm_2
	.p2align	4
	.type	_ZTS15Polybench_2mm_2,@function
_ZTS15Polybench_2mm_2:                  // @_ZTS15Polybench_2mm_2
// %bb.0:                               // %polly.split_new_and_old
	stp	x29, x30, [sp, #-96]!           // 16-byte Folded Spill
	sub	x9, sp, #816, lsl #12           // =3342336
	stp	x28, x27, [sp, #16]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	sub	x9, x9, #544
	stp	x24, x23, [sp, #48]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             // 16-byte Folded Spill
	and	sp, x9, #0xffffffffffffffc0
	subs	x8, x0, #1
	str	x1, [sp, #152]                  // 8-byte Folded Spill
	smulh	x11, x8, x0
	mul	x10, x8, x0
	cset	w9, vs
	cmp	x11, x10, asr #63
	cset	w11, ne
	adds	x13, x10, x0
	add	x12, x1, x13, lsl #2
	cset	w10, vs
	add	x14, x3, x13, lsl #2
	add	x13, x2, x13, lsl #2
	cmp	x12, x3
	ccmp	x14, x1, #0, hi
	cset	w12, hi
	cmp	x13, x3
	ccmp	x14, x2, #0, hi
	cset	w13, hi
	tbnz	x0, #63, .LBB1_21
// %bb.1:                               // %polly.split_new_and_old
	tbnz	w12, #0, .LBB1_21
// %bb.2:                               // %polly.split_new_and_old
	tbnz	w13, #0, .LBB1_21
// %bb.3:                               // %polly.split_new_and_old
	tbnz	w9, #0, .LBB1_21
// %bb.4:                               // %polly.split_new_and_old
	tbnz	w11, #0, .LBB1_21
// %bb.5:                               // %polly.split_new_and_old
	cbnz	w10, .LBB1_21
// %bb.6:                               // %polly.loop_if
	cntw	x23
	ptrue	p0.s
	asr	x10, x8, #5
	lsl	x9, x0, #2
	tbnz	x10, #63, .LBB1_31
// %bb.7:                               // %polly.loop_preheader
	mov	x13, xzr
	lsr	x11, x8, #5
	lsl	x12, x0, #7
	mov	x14, #-1                        // =0xffffffffffffffff
	mov	w15, #31                        // =0x1f
	mov	z0.s, #0                        // =0x0
	mov	x16, x3
	b	.LBB1_9
	.p2align	5, , 16
.LBB1_8:                                // %polly.loop_exit80
                                        //   in Loop: Header=BB1_9 Depth=1
	cmp	x13, x10
	add	x13, x13, #1
	add	x16, x16, x12
	b.ge	.LBB1_31
.LBB1_9:                                // %polly.loop_preheader79
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_11 Depth 2
                                        //       Child Loop BB1_14 Depth 3
                                        //         Child Loop BB1_18 Depth 4
                                        //         Child Loop BB1_20 Depth 4
	eor	x18, x14, x13, lsl #5
	mov	x17, xzr
	mov	x22, x16
	add	x18, x0, x18
	cmp	x18, #31
	csel	x1, x18, x15, lt
	b	.LBB1_11
	.p2align	5, , 16
.LBB1_10:                               // %polly.loop_exit87
                                        //   in Loop: Header=BB1_11 Depth=2
	cmp	x17, x11
	add	x17, x17, #1
	add	x22, x22, #128
	b.hs	.LBB1_8
.LBB1_11:                               // %polly.loop_if84
                                        //   Parent Loop BB1_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_14 Depth 3
                                        //         Child Loop BB1_18 Depth 4
                                        //         Child Loop BB1_20 Depth 4
	sub	x4, x8, x17, lsl #5
	cmp	x4, #31
	csel	x4, x4, x15, lt
	tbnz	x18, #63, .LBB1_10
// %bb.12:                              // %polly.loop_if92.preheader
                                        //   in Loop: Header=BB1_11 Depth=2
	eor	x6, x14, x17, lsl #5
	bic	x4, x4, x4, asr #63
	mov	x5, xzr
	mov	x19, x22
	add	x6, x0, x6
	add	x4, x4, #1
	cmp	x6, #31
	csel	x7, x6, x15, lt
	b	.LBB1_14
	.p2align	5, , 16
.LBB1_13:                               // %polly.loop_exit95
                                        //   in Loop: Header=BB1_14 Depth=3
	cmp	x5, x1
	add	x5, x5, #1
	add	x19, x19, x9
	b.ge	.LBB1_10
.LBB1_14:                               // %polly.loop_if92
                                        //   Parent Loop BB1_9 Depth=1
                                        //     Parent Loop BB1_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB1_18 Depth 4
                                        //         Child Loop BB1_20 Depth 4
	tbnz	x6, #63, .LBB1_13
// %bb.15:                              // %polly.stmt.for.body6.i.preheader
                                        //   in Loop: Header=BB1_14 Depth=3
	cmp	x4, x23
	b.hs	.LBB1_17
// %bb.16:                              //   in Loop: Header=BB1_14 Depth=3
	mov	x20, xzr
	b	.LBB1_20
	.p2align	5, , 16
.LBB1_17:                               // %vector.ph
                                        //   in Loop: Header=BB1_14 Depth=3
	neg	x20, x23
	mov	x21, xzr
	and	x20, x4, x20
	.p2align	5, , 16
.LBB1_18:                               // %vector.body
                                        //   Parent Loop BB1_9 Depth=1
                                        //     Parent Loop BB1_11 Depth=2
                                        //       Parent Loop BB1_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	st1w	{ z0.s }, p0, [x19, x21, lsl #2]
	incw	x21
	cmp	x20, x21
	b.ne	.LBB1_18
// %bb.19:                              // %middle.block
                                        //   in Loop: Header=BB1_14 Depth=3
	cmp	x4, x20
	b.eq	.LBB1_13
	.p2align	5, , 16
.LBB1_20:                               // %polly.stmt.for.body6.i
                                        //   Parent Loop BB1_9 Depth=1
                                        //     Parent Loop BB1_11 Depth=2
                                        //       Parent Loop BB1_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	str	wzr, [x19, x20, lsl #2]
	cmp	x20, x7
	add	x20, x20, #1
	b.lt	.LBB1_20
	b	.LBB1_13
.LBB1_21:                               // %for.cond.i.preheader
	lsl	x9, x0, #2
	mov	x8, xzr
	b	.LBB1_23
	.p2align	5, , 16
.LBB1_22:                               // %for.cond.cleanup11.i
                                        //   in Loop: Header=BB1_23 Depth=1
	add	x8, x8, #1
	add	x3, x3, x9
.LBB1_23:                               // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_25 Depth 2
                                        //     Child Loop BB1_28 Depth 2
                                        //       Child Loop BB1_30 Depth 3
	cmp	x8, x0
	b.hs	.LBB1_115
// %bb.24:                              // %for.cond2.i.preheader
                                        //   in Loop: Header=BB1_23 Depth=1
	mul	x11, x8, x0
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB1_26
	.p2align	5, , 16
.LBB1_25:                               // %for.body6.i
                                        //   Parent Loop BB1_23 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	wzr, [x3, x10, lsl #2]
	add	x10, x10, #1
	cmp	x10, x0
	b.lo	.LBB1_25
.LBB1_26:                               // %for.cond8.i.preheader
                                        //   in Loop: Header=BB1_23 Depth=1
	ldr	x12, [sp, #152]                 // 8-byte Folded Reload
	mov	x10, xzr
	add	x11, x12, x11, lsl #2
	mov	x12, x2
	b	.LBB1_28
	.p2align	5, , 16
.LBB1_27:                               // %for.cond.cleanup17.i
                                        //   in Loop: Header=BB1_28 Depth=2
	add	x10, x10, #1
	add	x12, x12, x9
.LBB1_28:                               // %for.cond8.i
                                        //   Parent Loop BB1_23 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_30 Depth 3
	cmp	x10, x0
	b.hs	.LBB1_22
// %bb.29:                              // %for.cond14.i.preheader
                                        //   in Loop: Header=BB1_28 Depth=2
	mov	x13, xzr
	cmp	xzr, x0
	b.hs	.LBB1_27
	.p2align	5, , 16
.LBB1_30:                               // %for.body18.i
                                        //   Parent Loop BB1_23 Depth=1
                                        //     Parent Loop BB1_28 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	s0, [x11, x10, lsl #2]
	ldr	s1, [x12, x13, lsl #2]
	ldr	s2, [x3, x13, lsl #2]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x13, lsl #2]
	add	x13, x13, #1
	cmp	x13, x0
	b.lo	.LBB1_30
	b	.LBB1_27
.LBB1_31:                               // %polly.loop_if100
	sub	x10, x0, #768
	cmp	x0, #1
	csel	x11, x10, x8, lt
	cmn	x11, #768
	b.le	.LBB1_115
// %bb.32:                              // %polly.loop_preheader102
	lsr	x18, x0, #1
	mov	x19, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	lsr	x4, x8, #10
	sub	x1, x0, #4
	add	x6, x9, #4
	add	x14, x0, #1
	mov	x7, xzr
	mov	z2.d, #3                        // =0x3
	mov	z3.d, #12                       // =0xc
	str	x2, [sp, #96]                   // 8-byte Folded Spill
	str	x18, [sp, #312]                 // 8-byte Folded Spill
	madd	x18, x9, x8, x3
	movk	x19, #43691
	mov	x13, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	eor	x13, x13, #0x8000000000000001
	lsl	x20, x8, #12
	add	x12, x0, #3
	str	x20, [sp, #216]                 // 8-byte Folded Spill
	str	x18, [sp, #496]                 // 8-byte Folded Spill
	lsl	x18, x0, #12
	mul	x1, x1, x19
	smulh	x11, x11, x13
	umulh	x13, x8, x19
	umulh	x12, x12, x19
	umulh	x15, x0, x19
	add	x5, x0, x0, lsl #1
	sub	x10, x0, #2
	umulh	x16, x14, x19
	umulh	x17, x10, x19
	stp	x18, x4, [sp, #128]             // 16-byte Folded Spill
	ldr	x18, [sp, #152]                 // 8-byte Folded Reload
	str	x1, [sp, #80]                   // 8-byte Folded Spill
	mul	x1, x6, x8
	add	x4, sp, #512
	lsl	x6, x5, #6
	mov	z1.d, x19
	lsr	x5, x13, #5
	lsr	x12, x12, #1
	lsr	x13, x13, #1
	orr	x25, x4, #0x8
	ptrue	p1.d
	add	x12, x12, x12, lsl #1
	str	x1, [sp, #280]                  // 8-byte Folded Spill
	lsr	x1, x14, #1
	stp	x5, x6, [sp, #360]              // 16-byte Folded Spill
	lsr	x5, x15, #1
	lsr	x15, x16, #1
	lsr	x16, x17, #1
	mov	w6, #12276                      // =0x2ff4
	str	x25, [sp, #376]                 // 8-byte Folded Spill
	str	x1, [sp, #288]                  // 8-byte Folded Spill
	orr	x1, x4, #0x4
	sub	x28, x12, #3
	mov	w12, #4                         // =0x4
	add	x15, x15, x15, lsl #1
	add	x18, x18, #4
	str	x1, [sp, #488]                  // 8-byte Folded Spill
	orr	x10, x12, x10, lsl #12
	sub	x30, x14, x15
	str	x18, [sp, #88]                  // 8-byte Folded Spill
	add	x18, sp, #48, lsl #12           // =196608
	add	x18, x18, #512
	orr	x1, x18, #0x8
	mov	z4.d, x18
	str	x1, [sp, #344]                  // 8-byte Folded Spill
	and	x1, x20, #0xffffffffffffe000
	add	x1, x4, x1
	str	x1, [sp, #120]                  // 8-byte Folded Spill
	asr	x1, x11, #7
	add	x11, x1, x11, lsr #63
	stp	x11, x5, [sp, #64]              // 16-byte Folded Spill
	add	x11, x5, x5, lsl #1
	sub	x11, x0, x11
	str	x11, [sp, #400]                 // 8-byte Folded Spill
	lsl	x11, x28, #2
	str	x11, [sp, #256]                 // 8-byte Folded Spill
	add	x11, x3, x28, lsl #2
	str	x11, [sp, #248]                 // 8-byte Folded Spill
	orr	x11, x18, #0x4
	str	x11, [sp, #168]                 // 8-byte Folded Spill
	add	x11, x16, x16, lsl #1
	mov	x16, x2
	orr	x11, x12, x11, lsl #12
	str	x11, [sp, #160]                 // 8-byte Folded Spill
	add	x11, x13, x13, lsl #1
	lsl	x11, x11, #12
	stp	x10, x11, [sp, #456]            // 16-byte Folded Spill
	mov	w10, #8196                      // =0x2004
	add	x10, x4, x10
	str	x10, [sp, #240]                 // 8-byte Folded Spill
	cntw	x10
	mov	z0.d, x10
	b	.LBB1_34
	.p2align	5, , 16
.LBB1_33:                               // %polly.loop_exit111
                                        //   in Loop: Header=BB1_34 Depth=1
	ldp	x16, x10, [sp, #104]            // 16-byte Folded Reload
	ldr	x11, [sp, #64]                  // 8-byte Folded Reload
	ldr	x2, [sp, #96]                   // 8-byte Folded Reload
	sub	x18, x18, #768, lsl #12         // =3145728
	cmp	x10, x11
	add	x7, x10, #1
	add	x16, x16, #3072
	b.ge	.LBB1_115
.LBB1_34:                               // %polly.loop_preheader110
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_36 Depth 2
                                        //       Child Loop BB1_108 Depth 3
                                        //         Child Loop BB1_111 Depth 4
                                        //         Child Loop BB1_114 Depth 4
                                        //       Child Loop BB1_39 Depth 3
                                        //         Child Loop BB1_44 Depth 4
                                        //           Child Loop BB1_47 Depth 5
                                        //           Child Loop BB1_50 Depth 5
                                        //         Child Loop BB1_52 Depth 4
                                        //           Child Loop BB1_55 Depth 5
                                        //             Child Loop BB1_57 Depth 6
                                        //           Child Loop BB1_60 Depth 5
                                        //         Child Loop BB1_69 Depth 4
                                        //           Child Loop BB1_71 Depth 5
                                        //         Child Loop BB1_91 Depth 4
                                        //         Child Loop BB1_86 Depth 4
                                        //         Child Loop BB1_78 Depth 4
                                        //         Child Loop BB1_99 Depth 4
                                        //           Child Loop BB1_102 Depth 5
	add	x10, x7, x7, lsl #1
	ldr	x14, [sp, #72]                  // 8-byte Folded Reload
	lsl	x12, x7, #8
	mov	w15, #255                       // =0xff
	mov	w21, #2                         // =0x2
	add	x26, sp, #512
	mov	x17, xzr
	mov	x5, xzr
	stp	x16, x7, [sp, #104]             // 16-byte Folded Spill
	lsl	x4, x10, #8
	mvn	x13, x12
	bfi	x21, x10, #8, #56
	add	x1, x4, #767
	index	z5.d, x4, #1
	cmp	x1, x8
	str	x1, [sp, #392]                  // 8-byte Folded Spill
	str	x21, [sp, #416]                 // 8-byte Folded Spill
	csel	x20, x1, x8, lt
	add	x13, x14, x13
	cmp	x20, x4
	str	x13, [sp, #352]                 // 8-byte Folded Spill
	str	x20, [sp, #144]                 // 8-byte Folded Spill
	csel	x11, x20, x4, gt
	cmp	x13, #255
	csel	x13, x13, x15, lt
	str	x13, [sp, #504]                 // 8-byte Folded Spill
	mov	w13, #3                         // =0x3
	bfi	x13, x10, #8, #56
	mov	z6.d, z5.d
	cmp	x0, x13
	cset	w13, ge
	cmp	x1, x0
	incd	z6.d
	csel	w13, wzr, w13, lt
	cset	w14, ge
	str	w13, [sp, #388]                 // 4-byte Folded Spill
	ldr	x13, [sp, #80]                  // 8-byte Folded Reload
	sub	x12, x13, x12
	cmp	x12, #255
	str	x12, [sp, #304]                 // 8-byte Folded Spill
	csel	x13, x12, x15, lt
	ldr	x12, [sp, #400]                 // 8-byte Folded Reload
	cmp	x12, #0
	mov	x12, #-768                      // =0xfffffffffffffd00
	madd	x11, x7, x12, x11
	csel	w12, wzr, w14, eq
	mov	x14, x16
	str	w12, [sp, #324]                 // 4-byte Folded Spill
	mov	w12, #49                        // =0x31
	add	x11, x11, #1
	bfi	x12, x10, #8, #56
	stp	x11, x13, [sp, #328]            // 16-byte Folded Spill
	lsl	x11, x7, #18
	str	x12, [sp, #296]                 // 8-byte Folded Spill
	mov	w12, #4                         // =0x4
	mov	z7.d, x11
	ldr	x11, [sp, #88]                  // 8-byte Folded Reload
	bfi	x12, x10, #8, #56
	lsl	x10, x10, #10
	stp	x10, x12, [sp, #264]            // 16-byte Folded Spill
	mov	w10, #1                         // =0x1
	mov	w12, #1023                      // =0x3ff
	stp	x10, x11, [sp, #224]            // 16-byte Folded Spill
	b	.LBB1_36
	.p2align	5, , 16
.LBB1_35:                               // %polly.loop_exit140
                                        //   in Loop: Header=BB1_36 Depth=2
	ldp	x10, x20, [sp, #136]            // 16-byte Folded Reload
	ldp	x12, x11, [sp, #192]            // 16-byte Folded Reload
	ldp	x14, x2, [sp, #176]             // 16-byte Folded Reload
	mov	x19, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	sub	x26, x26, #2, lsl #12           // =8192
	mov	w6, #12276                      // =0x2ff4
	movk	x19, #43691
	ldr	x17, [sp, #208]                 // 8-byte Folded Reload
	cmp	x11, x10
	add	x5, x11, #1
	ldr	x11, [sp, #128]                 // 8-byte Folded Reload
	add	x12, x12, #1024
	add	x17, x17, #1024
	add	x14, x14, x11
	add	x2, x2, x11
	ldr	x11, [sp, #224]                 // 8-byte Folded Reload
	sub	x10, x11, #1024
	ldr	x11, [sp, #232]                 // 8-byte Folded Reload
	add	x11, x11, #1, lsl #12           // =4096
	stp	x10, x11, [sp, #224]            // 16-byte Folded Spill
	b.hs	.LBB1_33
.LBB1_36:                               // %polly.loop_if115
                                        //   Parent Loop BB1_34 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_108 Depth 3
                                        //         Child Loop BB1_111 Depth 4
                                        //         Child Loop BB1_114 Depth 4
                                        //       Child Loop BB1_39 Depth 3
                                        //         Child Loop BB1_44 Depth 4
                                        //           Child Loop BB1_47 Depth 5
                                        //           Child Loop BB1_50 Depth 5
                                        //         Child Loop BB1_52 Depth 4
                                        //           Child Loop BB1_55 Depth 5
                                        //             Child Loop BB1_57 Depth 6
                                        //           Child Loop BB1_60 Depth 5
                                        //         Child Loop BB1_69 Depth 4
                                        //           Child Loop BB1_71 Depth 5
                                        //         Child Loop BB1_91 Depth 4
                                        //         Child Loop BB1_86 Depth 4
                                        //         Child Loop BB1_78 Depth 4
                                        //         Child Loop BB1_99 Depth 4
                                        //           Child Loop BB1_102 Depth 5
	cmp	x12, x8
	mov	w11, #1023                      // =0x3ff
	lsl	x22, x5, #10
	stp	x12, x5, [sp, #192]             // 16-byte Folded Spill
	str	x17, [sp, #208]                 // 8-byte Folded Spill
	mov	x13, x18
	csel	x10, x12, x8, lt
	bfi	x11, x5, #10, #54
	stp	x14, x2, [sp, #176]             // 16-byte Folded Spill
	mov	x12, x2
	cmp	x10, x17
	csel	x10, x10, x17, gt
	cmp	x11, x8
	mov	x17, x22
	csel	x7, x11, x8, lt
	cmp	x7, x22
	csel	x11, x7, x22, gt
	cmp	x0, x22
	b.gt	.LBB1_108
.LBB1_37:                               // %polly.loop_preheader139
                                        //   in Loop: Header=BB1_36 Depth=2
	ldp	x12, x2, [sp, #224]             // 16-byte Folded Reload
	ldr	x17, [sp, #152]                 // 8-byte Folded Reload
	mov	x27, xzr
	mov	x14, xzr
	str	x26, [sp, #408]                 // 8-byte Folded Spill
	add	x12, x10, x12
	add	w10, w10, #1
	and	x10, x10, #0x1
	sub	x10, x12, x10
	str	x10, [sp, #480]                 // 8-byte Folded Spill
	sub	x10, x11, x22
	ldr	x11, [sp, #120]                 // 8-byte Folded Reload
	add	x13, x10, #1
	mvn	x10, x22
	add	x5, x0, x10
	mov	w10, #1023                      // =0x3ff
	cmp	x5, #1023
	csel	x20, x5, x10, lt
	b	.LBB1_39
	.p2align	5, , 16
.LBB1_38:                               // %polly.merge349
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x10, [sp, #360]                 // 8-byte Folded Reload
	ldr	x12, [sp, #472]                 // 8-byte Folded Reload
	ldp	x17, x27, [sp, #440]            // 16-byte Folded Reload
	sub	x11, x11, #48, lsl #12          // =196608
	cmp	x12, x10
	add	x14, x12, #1
	mov	x12, #-24                       // =0xffffffffffffffe8
	ldr	x2, [sp, #432]                  // 8-byte Folded Reload
	ldr	x26, [sp, #408]                 // 8-byte Folded Reload
	movk	x12, #7, lsl #48
	add	x27, x27, x12
	ldp	x12, x25, [sp, #368]            // 16-byte Folded Reload
	add	x2, x2, x12
	add	x17, x17, x12
	b.hs	.LBB1_35
.LBB1_39:                               // %polly.loop_if144
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB1_44 Depth 4
                                        //           Child Loop BB1_47 Depth 5
                                        //           Child Loop BB1_50 Depth 5
                                        //         Child Loop BB1_52 Depth 4
                                        //           Child Loop BB1_55 Depth 5
                                        //             Child Loop BB1_57 Depth 6
                                        //           Child Loop BB1_60 Depth 5
                                        //         Child Loop BB1_69 Depth 4
                                        //           Child Loop BB1_71 Depth 5
                                        //         Child Loop BB1_91 Depth 4
                                        //         Child Loop BB1_86 Depth 4
                                        //         Child Loop BB1_78 Depth 4
                                        //         Child Loop BB1_99 Depth 4
                                        //           Child Loop BB1_102 Depth 5
	add	x12, x14, x14, lsl #1
	str	x14, [sp, #472]                 // 8-byte Folded Spill
	stp	x2, x17, [sp, #432]             // 16-byte Folded Spill
	lsl	x14, x12, #4
	add	x6, x14, #47
	mov	x19, x14
	cmp	x8, x6
	csel	x10, x8, x6, lt
	cmp	x0, x12, lsl #4
	b.gt	.LBB1_44
.LBB1_40:                               // %polly.cond
                                        //   in Loop: Header=BB1_39 Depth=3
	orr	x10, x14, #0x2
	str	x27, [sp, #448]                 // 8-byte Folded Spill
	cmp	x0, x10
	str	x10, [sp, #424]                 // 8-byte Folded Spill
	b.lt	.LBB1_62
// %bb.41:                              // %polly.cond
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x10, [sp, #352]                 // 8-byte Folded Reload
	tbnz	x10, #63, .LBB1_62
// %bb.42:                              // %polly.loop_if177.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x12, [sp, #312]                 // 8-byte Folded Reload
	ldr	x16, [sp, #472]                 // 8-byte Folded Reload
	mov	x15, #-24                       // =0xffffffffffffffe8
	mov	x10, xzr
	madd	x19, x16, x15, x12
	mov	w12, #24                        // =0x18
	ldr	x16, [sp, #344]                 // 8-byte Folded Reload
	cmp	x19, #24
	csel	x12, x19, x12, lt
	tst	x0, #0x1
	ccmp	x6, x0, #8, ne
	sub	x2, x12, #1
	cset	w27, lt
	b	.LBB1_52
	.p2align	5, , 16
.LBB1_43:                               // %polly.loop_exit155
                                        //   in Loop: Header=BB1_44 Depth=4
	cmp	x19, x10
	add	x19, x19, #1
	add	x2, x2, x9
	add	x17, x17, x9
	b.ge	.LBB1_40
.LBB1_44:                               // %polly.loop_if152
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB1_47 Depth 5
                                        //           Child Loop BB1_50 Depth 5
	cmp	x0, x22
	b.le	.LBB1_43
// %bb.45:                              // %polly.loop_header153.preheader
                                        //   in Loop: Header=BB1_44 Depth=4
	add	x12, x27, x19, lsr #1
	cmp	x13, #2
	mov	w16, w19
	lsl	x15, x12, #13
	mov	x12, x22
	b.lo	.LBB1_49
// %bb.46:                              // %vector.ph9
                                        //   in Loop: Header=BB1_44 Depth=4
	ldr	x24, [sp, #480]                 // 8-byte Folded Reload
	mov	x12, x15
	bfi	x12, x16, #2, #1
	and	x21, x13, #0xfffffffffffffffe
	mov	x23, x2
	add	x1, x25, x12
	add	x12, x22, x21
	.p2align	5, , 16
.LBB1_47:                               // %vector.body14
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_44 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldp	s16, s17, [x23, #-4]
	subs	x24, x24, #2
	add	x23, x23, #8
	stur	s16, [x1, #-8]
	str	s17, [x1], #16
	b.ne	.LBB1_47
// %bb.48:                              // %middle.block6
                                        //   in Loop: Header=BB1_44 Depth=4
	cmp	x13, x21
	b.eq	.LBB1_43
.LBB1_49:                               // %polly.loop_header153.preheader1
                                        //   in Loop: Header=BB1_44 Depth=4
	ubfiz	x16, x16, #2, #1
	add	x15, x15, x12, lsl #3
	add	x16, x26, x16
	add	x15, x16, x15
	.p2align	5, , 16
.LBB1_50:                               // %polly.loop_header153
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_44 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s16, [x17, x12, lsl #2]
	cmp	x12, x7
	add	x12, x12, #1
	str	s16, [x15], #8
	b.lt	.LBB1_50
	b	.LBB1_43
	.p2align	5, , 16
.LBB1_51:                               // %polly.merge287
                                        //   in Loop: Header=BB1_52 Depth=4
	ldr	x12, [sp, #504]                 // 8-byte Folded Reload
	add	x16, x16, #3, lsl #12           // =12288
	cmp	x10, x12
	add	x10, x10, #1
	b.ge	.LBB1_62
.LBB1_52:                               // %polly.loop_if177
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB1_55 Depth 5
                                        //             Child Loop BB1_57 Depth 6
                                        //           Child Loop BB1_60 Depth 5
	cmp	x19, #1
	b.lt	.LBB1_58
// %bb.53:                              // %polly.loop_if185.preheader
                                        //   in Loop: Header=BB1_52 Depth=4
	add	x12, x10, x10, lsl #1
	ldr	x24, [sp, #488]                 // 8-byte Folded Reload
	mov	x26, xzr
	add	x12, x4, x12
	lsl	x25, x12, #2
	add	x23, x25, #4
	add	x21, x25, #8
	b	.LBB1_55
	.p2align	5, , 16
.LBB1_54:                               // %polly.loop_exit188
                                        //   in Loop: Header=BB1_55 Depth=5
	cmp	x26, x2
	add	x26, x26, #1
	add	x24, x24, #2, lsl #12           // =8192
	b.ge	.LBB1_58
.LBB1_55:                               // %polly.loop_if185
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_52 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB1_57 Depth 6
	tbnz	x5, #63, .LBB1_54
// %bb.56:                              // %polly.stmt.for.body18.i270.preheader
                                        //   in Loop: Header=BB1_55 Depth=5
	add	x12, x14, x26, lsl #1
	mov	x15, #-1                        // =0xffffffffffffffff
	mov	x6, x16
	madd	x1, x9, x12, x3
	orr	x12, x12, #0x1
	madd	x17, x9, x12, x3
	mov	x12, x24
	.p2align	5, , 16
.LBB1_57:                               // %polly.stmt.for.body18.i270
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_52 Depth=4
                                        //           Parent Loop BB1_55 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
	ldur	s16, [x12, #-4]
	ldr	s17, [x1, x25]
	ldp	s18, s19, [x6, #-8]
	add	x15, x15, #1
	cmp	x15, x20
	ldr	s20, [x1, x21]
	fmadd	s17, s16, s18, s17
	str	s17, [x1, x25]
	ldr	s17, [x1, x23]
	fmadd	s17, s16, s19, s17
	str	s17, [x1, x23]
	ldr	s17, [x6], #12
	fmadd	s16, s16, s17, s20
	str	s16, [x1, x21]
	ldr	s16, [x12], #8
	ldr	s20, [x17, x25]
	fmadd	s18, s16, s18, s20
	str	s18, [x17, x25]
	ldr	s18, [x17, x23]
	fmadd	s18, s16, s19, s18
	str	s18, [x17, x23]
	ldr	s18, [x17, x21]
	fmadd	s16, s16, s17, s18
	str	s16, [x17, x21]
	b.lt	.LBB1_57
	b	.LBB1_54
	.p2align	5, , 16
.LBB1_58:                               // %polly.cond286
                                        //   in Loop: Header=BB1_52 Depth=4
	cmp	x5, #0
	csinc	w12, w27, wzr, ge
	tbnz	w12, #0, .LBB1_51
// %bb.59:                              // %polly.stmt.for.body18.i331.preheader
                                        //   in Loop: Header=BB1_52 Depth=4
	ldr	x15, [sp, #496]                 // 8-byte Folded Reload
	add	x12, x10, x10, lsl #1
	mov	x17, x11
	mov	x1, x16
	add	x12, x4, x12
	add	x12, x15, x12, lsl #2
	mov	x15, #-1                        // =0xffffffffffffffff
	ldp	s18, s17, [x12]
	ldr	s16, [x12, #8]
	.p2align	5, , 16
.LBB1_60:                               // %polly.stmt.for.body18.i331
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_52 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s19, [x17], #8
	ldp	s20, s21, [x1, #-8]
	add	x15, x15, #1
	cmp	x15, x20
	fmadd	s18, s19, s20, s18
	ldr	s20, [x1], #12
	fmadd	s17, s19, s21, s17
	fmadd	s16, s19, s20, s16
	b.lt	.LBB1_60
// %bb.61:                              // %polly.merge287.loopexit
                                        //   in Loop: Header=BB1_52 Depth=4
	stp	s18, s17, [x12]
	str	s16, [x12, #8]
	b	.LBB1_51
	.p2align	5, , 16
.LBB1_62:                               // %polly.cond348
                                        //   in Loop: Header=BB1_39 Depth=3
	ldp	x10, x21, [sp, #416]            // 16-byte Folded Reload
	ldr	x12, [sp, #392]                 // 8-byte Folded Reload
	cmp	x10, x0
	cset	w10, ge
	cmp	x0, x21
	csel	w15, wzr, w10, lt
	ldr	w10, [sp, #388]                 // 4-byte Folded Reload
	csel	w10, wzr, w10, lt
	cmp	x12, x0
	orr	x12, x14, #0x3
	ccmp	x0, x12, #8, ge
	ldr	x12, [sp, #400]                 // 8-byte Folded Reload
	csinc	w10, w10, wzr, lt
	cmp	x12, #0
	csel	w12, wzr, w10, eq
	orr	x10, x14, #0x1
	tbnz	w15, #0, .LBB1_65
// %bb.63:                              // %polly.cond348
                                        //   in Loop: Header=BB1_39 Depth=3
	tbnz	w12, #0, .LBB1_65
// %bb.64:                              // %polly.cond348
                                        //   in Loop: Header=BB1_39 Depth=3
	cmp	x10, x0
	b.ne	.LBB1_38
.LBB1_65:                               // %polly.cond354
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x6, [sp, #336]                  // 8-byte Folded Reload
	cmp	x10, x0
	b.ne	.LBB1_73
// %bb.66:                              // %polly.cond354
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x12, [sp, #304]                 // 8-byte Folded Reload
	tbnz	x12, #63, .LBB1_73
// %bb.67:                              // %polly.loop_if367.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x12, [sp, #344]                 // 8-byte Folded Reload
	mov	x2, xzr
	b	.LBB1_69
	.p2align	5, , 16
.LBB1_68:                               // %polly.loop_exit370
                                        //   in Loop: Header=BB1_69 Depth=4
	cmp	x2, x6
	add	x2, x2, #1
	add	x12, x12, #3, lsl #12           // =12288
	b.ge	.LBB1_73
.LBB1_69:                               // %polly.loop_if367
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB1_71 Depth 5
	tbnz	x5, #63, .LBB1_68
// %bb.70:                              // %polly.stmt.for.body18.i405.preheader
                                        //   in Loop: Header=BB1_69 Depth=4
	ldr	x16, [sp, #496]                 // 8-byte Folded Reload
	add	x15, x2, x2, lsl #1
	add	x17, sp, #512
	mov	x1, x12
	add	x15, x4, x15
	add	x15, x16, x15, lsl #2
	mov	x16, #-1                        // =0xffffffffffffffff
	ldp	s18, s17, [x15]
	ldr	s16, [x15, #8]
	.p2align	5, , 16
.LBB1_71:                               // %polly.stmt.for.body18.i405
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_69 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s19, [x17], #8
	ldp	s20, s21, [x1, #-8]
	add	x16, x16, #1
	cmp	x16, x20
	fmadd	s18, s19, s20, s18
	ldr	s20, [x1], #12
	fmadd	s17, s19, s21, s17
	fmadd	s16, s19, s20, s16
	b.lt	.LBB1_71
// %bb.72:                              // %polly.loop_exit370.loopexit
                                        //   in Loop: Header=BB1_69 Depth=4
	stp	s18, s17, [x15]
	str	s16, [x15, #8]
	b	.LBB1_68
	.p2align	5, , 16
.LBB1_73:                               // %polly.cond420
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	w12, [sp, #324]                 // 4-byte Folded Reload
	tbz	w12, #0, .LBB1_38
// %bb.74:                              // %polly.cond425
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x12, [sp, #296]                 // 8-byte Folded Reload
	cmp	x0, x12
	b.lt	.LBB1_80
// %bb.75:                              // %polly.cond425
                                        //   in Loop: Header=BB1_39 Depth=3
	cmp	x10, x0
	b.ne	.LBB1_80
// %bb.76:                              // %polly.loop_if429
                                        //   in Loop: Header=BB1_39 Depth=3
	tbnz	x5, #63, .LBB1_96
// %bb.77:                              // %polly.stmt.for.body18.i437.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x10, [sp, #280]                 // 8-byte Folded Reload
	ldr	x15, [sp, #216]                 // 8-byte Folded Reload
	add	x12, sp, #512
	ldr	s16, [x3, x10]
	mov	x10, #-1                        // =0xffffffffffffffff
	.p2align	5, , 16
.LBB1_78:                               // %polly.stmt.for.body18.i437
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	s17, [x12], #8
	ldr	s18, [x18, x15]
	add	x10, x10, #1
	add	x15, x15, #12
	cmp	x10, x20
	fmadd	s16, s17, s18, s16
	b.lt	.LBB1_78
// %bb.79:                              // %polly.loop_if618.loopexit
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x10, [sp, #280]                 // 8-byte Folded Reload
	str	s16, [x3, x10]
	b	.LBB1_96
.LBB1_80:                               // %polly.cond453
                                        //   in Loop: Header=BB1_39 Depth=3
	ldp	x17, x12, [sp, #264]            // 16-byte Folded Reload
	ldp	x19, x16, [sp, #248]            // 16-byte Folded Reload
	ldr	x15, [sp, #416]                 // 8-byte Folded Reload
	cmp	x0, x12
	b.lt	.LBB1_88
// %bb.81:                              // %polly.cond453
                                        //   in Loop: Header=BB1_39 Depth=3
	cmp	x0, x21
	b.lt	.LBB1_88
// %bb.82:                              // %polly.loop_if457
                                        //   in Loop: Header=BB1_39 Depth=3
	tbnz	x5, #63, .LBB1_96
// %bb.83:                              // %polly.cond482.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x2, [sp, #488]                  // 8-byte Folded Reload
	ldr	x15, [sp, #464]                 // 8-byte Folded Reload
	ldr	x6, [sp, #160]                  // 8-byte Folded Reload
	mul	x10, x9, x10
	madd	x12, x9, x14, x3
	mov	x1, #-1                         // =0xffffffffffffffff
	add	x17, x3, x10
	b	.LBB1_86
	.p2align	5, , 16
.LBB1_84:                               // %polly.merge521.critedge
                                        //   in Loop: Header=BB1_86 Depth=4
	ldr	s17, [x2]
	ldr	s18, [x19, x10]
	fmadd	s16, s17, s16, s18
	str	s16, [x19, x10]
.LBB1_85:                               // %polly.merge521
                                        //   in Loop: Header=BB1_86 Depth=4
	add	x1, x1, #1
	add	x6, x6, #12
	add	x15, x15, #12
	add	x2, x2, #8
	cmp	x1, x20
	b.ge	.LBB1_96
.LBB1_86:                               // %polly.cond482
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x2, #-4]
	ldr	s16, [x18, x15]
	ldr	s18, [x12, x16]
	fmadd	s18, s17, s16, s18
	str	s18, [x12, x16]
	cbnz	x30, .LBB1_84
// %bb.87:                              // %polly.stmt.for.body18.i487
                                        //   in Loop: Header=BB1_86 Depth=4
	ldr	s18, [x18, x6]
	ldr	s19, [x12, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x12, x8, lsl #2]
	ldr	s17, [x2]
	ldr	s19, [x17, x16]
	fmadd	s16, s17, s16, s19
	str	s16, [x17, x16]
	ldr	s16, [x17, x8, lsl #2]
	fmadd	s16, s17, s18, s16
	str	s16, [x17, x8, lsl #2]
	b	.LBB1_85
.LBB1_88:                               // %polly.loop_if541
                                        //   in Loop: Header=BB1_39 Depth=3
	tbnz	x5, #63, .LBB1_96
// %bb.89:                              // %polly.cond563.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x1, [sp, #488]                  // 8-byte Folded Reload
	ldr	x6, [sp, #168]                  // 8-byte Folded Reload
	madd	x12, x9, x14, x3
	mov	x2, #-1                         // =0xffffffffffffffff
	madd	x10, x9, x10, x3
	b	.LBB1_91
	.p2align	5, , 16
.LBB1_90:                               // %polly.merge582
                                        //   in Loop: Header=BB1_91 Depth=4
	add	x2, x2, #1
	add	x6, x6, #12
	add	x1, x1, #8
	cmp	x2, x20
	b.ge	.LBB1_96
.LBB1_91:                               // %polly.cond563
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x1, #-4]
	ldur	s16, [x6, #-4]
	ldr	s18, [x12, x17]
	cmp	x15, x0
	fmadd	s18, s17, s16, s18
	str	s18, [x12, x17]
	b.ne	.LBB1_93
// %bb.92:                              // %polly.stmt.for.body18.i567
                                        //   in Loop: Header=BB1_91 Depth=4
	ldr	s18, [x6]
	ldr	s19, [x12, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x12, x8, lsl #2]
.LBB1_93:                               // %polly.cond581
                                        //   in Loop: Header=BB1_91 Depth=4
	cmp	x0, x21
	b.lt	.LBB1_90
// %bb.94:                              // %polly.cond599
                                        //   in Loop: Header=BB1_91 Depth=4
	ldr	s17, [x1]
	ldr	s18, [x10, x17]
	cmp	x15, x0
	fmadd	s16, s17, s16, s18
	str	s16, [x10, x17]
	b.ne	.LBB1_90
// %bb.95:                              // %polly.stmt.for.body18.i603
                                        //   in Loop: Header=BB1_91 Depth=4
	ldr	s16, [x6]
	ldr	s18, [x10, x8, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x10, x8, lsl #2]
	b	.LBB1_90
	.p2align	5, , 16
.LBB1_96:                               // %polly.loop_if618
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x15, [sp, #472]                 // 8-byte Folded Reload
	mov	x12, #-24                       // =0xffffffffffffffe8
	madd	x12, x15, x12, x10
	mov	w10, #24                        // =0x18
	cmp	x12, #24
	csel	x10, x12, x10, lt
	cmp	x12, #2
	b.lt	.LBB1_38
// %bb.97:                              // %polly.loop_if626.preheader
                                        //   in Loop: Header=BB1_39 Depth=3
	ldr	x17, [sp, #240]                 // 8-byte Folded Reload
	sub	x10, x10, #1
	mov	w2, #1                          // =0x1
	b	.LBB1_99
	.p2align	5, , 16
.LBB1_98:                               // %polly.loop_exit629
                                        //   in Loop: Header=BB1_99 Depth=4
	cmp	x2, x10
	add	x2, x2, #1
	add	x17, x17, #2, lsl #12           // =8192
	b.ge	.LBB1_38
.LBB1_99:                               // %polly.loop_if626
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB1_102 Depth 5
	tbnz	x5, #63, .LBB1_98
// %bb.100:                             // %polly.cond652.preheader
                                        //   in Loop: Header=BB1_99 Depth=4
	add	x15, x14, x2, lsl #1
	ldp	x27, x25, [sp, #456]            // 16-byte Folded Reload
	mov	x21, #-1                        // =0xffffffffffffffff
	mov	x23, x17
	madd	x12, x9, x15, x3
	add	x6, x15, #2
	orr	x15, x15, #0x1
	madd	x19, x9, x15, x3
	mov	x26, x27
	b	.LBB1_102
	.p2align	5, , 16
.LBB1_101:                              // %polly.merge675
                                        //   in Loop: Header=BB1_102 Depth=5
	add	x21, x21, #1
	add	x27, x27, #12
	add	x26, x26, #12
	add	x25, x25, #12
	add	x23, x23, #8
	cmp	x21, x20
	b.ge	.LBB1_98
.LBB1_102:                              // %polly.cond652
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_39 Depth=3
                                        //         Parent Loop BB1_99 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldur	s17, [x23, #-4]
	ldr	s16, [x18, x25]
	ldr	s18, [x12, x28, lsl #2]
	fmadd	s18, s17, s16, s18
	str	s18, [x12, x28, lsl #2]
	cbz	x30, .LBB1_104
// %bb.103:                             // %polly.cond674
                                        //   in Loop: Header=BB1_102 Depth=5
	cmp	x0, x6
	b.lt	.LBB1_101
	b	.LBB1_105
	.p2align	5, , 16
.LBB1_104:                              // %polly.stmt.for.body18.i657
                                        //   in Loop: Header=BB1_102 Depth=5
	ldr	s18, [x18, x26]
	ldr	s19, [x12, x8, lsl #2]
	fmadd	s17, s17, s18, s19
	str	s17, [x12, x8, lsl #2]
	cmp	x0, x6
	b.lt	.LBB1_101
.LBB1_105:                              // %polly.cond697
                                        //   in Loop: Header=BB1_102 Depth=5
	ldr	s17, [x23]
	ldr	s18, [x19, x28, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x19, x28, lsl #2]
	cbnz	x30, .LBB1_101
// %bb.106:                             // %polly.stmt.for.body18.i702
                                        //   in Loop: Header=BB1_102 Depth=5
	ldr	s16, [x18, x27]
	ldr	s18, [x19, x8, lsl #2]
	fmadd	s16, s17, s16, s18
	str	s16, [x19, x8, lsl #2]
	b	.LBB1_101
	.p2align	5, , 16
.LBB1_107:                              // %polly.loop_exit126
                                        //   in Loop: Header=BB1_108 Depth=3
	cmp	x17, x7
	add	x17, x17, #1
	add	x14, x14, x9
	add	x13, x13, #12
	add	x12, x12, x9
	b.ge	.LBB1_37
.LBB1_108:                              // %polly.loop_if123
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB1_111 Depth 4
                                        //         Child Loop BB1_114 Depth 4
	cmp	x0, x4
	b.le	.LBB1_107
// %bb.109:                             // %polly.loop_header124.preheader
                                        //   in Loop: Header=BB1_108 Depth=3
	ldr	x16, [sp, #328]                 // 8-byte Folded Reload
	cntw	x15
	mov	x1, x4
	cmp	x16, x15
	b.lo	.LBB1_113
// %bb.110:                             // %vector.ph22
                                        //   in Loop: Header=BB1_108 Depth=3
	ldr	x1, [sp, #328]                  // 8-byte Folded Reload
	cntw	x16
	sub	x2, x17, x22
	mov	z17.d, z5.d
	mov	z18.d, z6.d
	mov	x15, xzr
	mov	z16.d, x2
	neg	x16, x16
	and	x16, x1, x16
	add	x1, x4, x16
	.p2align	5, , 16
.LBB1_111:                              // %vector.body28
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_108 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	z20.d, z17.d, z1.d
	ld1w	{ z19.s }, p0/z, [x14, x15, lsl #2]
	incw	x15
	cmp	x16, x15
	umulh	z21.d, z18.d, z1.d
	lsr	z20.d, z20.d, #1
	lsr	z21.d, z21.d, #1
	lsl	z22.d, z21.d, #10
	lsl	z23.d, z20.d, #10
	msb	z20.d, p1/m, z2.d, z17.d
	msb	z21.d, p1/m, z2.d, z18.d
	add	z17.d, z17.d, z0.d
	add	z18.d, z18.d, z0.d
	sub	z23.d, z23.d, z7.d
	sub	z22.d, z22.d, z7.d
	add	z22.d, z22.d, z16.d
	add	z23.d, z23.d, z16.d
	mad	z23.d, p1/m, z3.d, z4.d
	mad	z22.d, p1/m, z3.d, z4.d
	adr	z21.d, [z22.d, z21.d, lsl #2]
	adr	z20.d, [z23.d, z20.d, lsl #2]
	uunpklo	z22.d, z19.s
	uunpkhi	z19.d, z19.s
	st1w	{ z22.d }, p1, [z20.d]
	st1w	{ z19.d }, p1, [z21.d]
	b.ne	.LBB1_111
// %bb.112:                             // %middle.block19
                                        //   in Loop: Header=BB1_108 Depth=3
	ldr	x15, [sp, #328]                 // 8-byte Folded Reload
	cmp	x15, x16
	b.eq	.LBB1_107
.LBB1_113:                              // %polly.loop_header124.preheader4
                                        //   in Loop: Header=BB1_108 Depth=3
	sub	x15, x1, #1
	add	x16, x13, x1, lsl #2
	add	x2, x12, x1, lsl #2
	.p2align	5, , 16
.LBB1_114:                              // %polly.loop_header124
                                        //   Parent Loop BB1_34 Depth=1
                                        //     Parent Loop BB1_36 Depth=2
                                        //       Parent Loop BB1_108 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	x5, x1, x19
	ldr	s16, [x2], #4
	add	x15, x15, #1
	add	x1, x1, #1
	cmp	x15, x20
	lsr	x5, x5, #1
	mul	x5, x5, x6
	str	s16, [x16, x5]
	add	x16, x16, #4
	b.lt	.LBB1_114
	b	.LBB1_107
.LBB1_115:                              // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit
	mov	sp, x29
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	_ZTS15Polybench_2mm_2, .Lfunc_end1-_ZTS15Polybench_2mm_2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
