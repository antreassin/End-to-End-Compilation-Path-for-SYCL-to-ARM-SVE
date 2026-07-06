	.text
	.file	"gemm.cpp"
	.section	.text._ZTS4Gemm,"axG",@progbits,_ZTS4Gemm,comdat
	.weak	_ZTS4Gemm                       // -- Begin function _ZTS4Gemm
	.p2align	4
	.type	_ZTS4Gemm,@function
_ZTS4Gemm:                              // @_ZTS4Gemm
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
	cmp	x0, #0
	orr	x8, x1, x2
	str	x3, [sp, #152]                  // 8-byte Folded Spill
	ccmp	x8, #0, #0, gt
	cset	w13, lt
	subs	x15, x0, #1
	smulh	x10, x15, x2
	mul	x9, x15, x2
	cset	w8, vs
	str	x15, [sp, #328]                 // 8-byte Folded Spill
	cmp	x10, x9, asr #63
	smulh	x10, x15, x1
	cset	w12, ne
	adds	x9, x9, x2
	add	x14, x3, x9, lsl #2
	mul	x9, x15, x1
	cset	w11, vs
	cmp	x10, x9, asr #63
	cset	w10, ne
	adds	x15, x9, x1
	cset	w9, vs
	cmp	x14, x5
	add	x18, x5, x15, lsl #2
	ccmp	x18, x3, #0, hi
	cset	w17, hi
	subs	x16, x2, #1
	mul	x15, x16, x1
	str	x16, [sp, #128]                 // 8-byte Folded Spill
	smulh	x16, x16, x1
	cset	w14, vs
	cmp	x16, x15, asr #63
	cset	w16, ne
	adds	x3, x15, x1
	add	x3, x4, x3, lsl #2
	cset	w15, vs
	cmp	x3, x5
	ccmp	x18, x4, #0, hi
	cset	w18, hi
	tbnz	x0, #63, .LBB0_111
// %bb.1:                               // %polly.split_new_and_old
	tbnz	w13, #0, .LBB0_111
// %bb.2:                               // %polly.split_new_and_old
	tbnz	w17, #0, .LBB0_111
// %bb.3:                               // %polly.split_new_and_old
	tbnz	w18, #0, .LBB0_111
// %bb.4:                               // %polly.split_new_and_old
	tbnz	w12, #0, .LBB0_111
// %bb.5:                               // %polly.split_new_and_old
	tbnz	w11, #0, .LBB0_111
// %bb.6:                               // %polly.split_new_and_old
	tbnz	w14, #0, .LBB0_111
// %bb.7:                               // %polly.split_new_and_old
	tbnz	w16, #0, .LBB0_111
// %bb.8:                               // %polly.split_new_and_old
	tbnz	w15, #0, .LBB0_111
// %bb.9:                               // %polly.split_new_and_old
	tbnz	w8, #0, .LBB0_111
// %bb.10:                              // %polly.split_new_and_old
	tbnz	w10, #0, .LBB0_111
// %bb.11:                              // %polly.split_new_and_old
	cbnz	w9, .LBB0_111
// %bb.12:                              // %polly.loop_if
	ldr	x8, [sp, #328]                  // 8-byte Folded Reload
	str	x1, [sp, #376]                  // 8-byte Folded Spill
	str	x2, [sp, #320]                  // 8-byte Folded Spill
	asr	x8, x8, #5
	str	x4, [sp, #80]                   // 8-byte Folded Spill
	tbnz	x8, #63, .LBB0_30
// %bb.13:                              // %polly.loop_preheader
	ldr	x13, [sp, #376]                 // 8-byte Folded Reload
	mov	w18, #45056                     // =0xb000
	cntw	x16
	ptrue	p0.s
	mov	x14, #-1                        // =0xffffffffffffffff
	mov	w15, #31                        // =0x1f
	mov	w17, #8                         // =0x8
	mov	x12, xzr
	mov	x1, x5
	movk	w18, #17668, lsl #16
	mov	z0.s, w18
	sub	x10, x13, #1
	lsl	x9, x13, #2
	lsl	x13, x13, #7
	asr	x11, x10, #5
	b	.LBB0_15
	.p2align	5, , 16
.LBB0_14:                               // %polly.loop_exit80
                                        //   in Loop: Header=BB0_15 Depth=1
	cmp	x12, x8
	add	x12, x12, #1
	add	x1, x1, x13
	b.ge	.LBB0_30
.LBB0_15:                               // %polly.loop_if77
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_18 Depth 2
                                        //       Child Loop BB0_21 Depth 3
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_24 Depth 4
	tbnz	x11, #63, .LBB0_14
// %bb.16:                              // %polly.loop_if85.preheader
                                        //   in Loop: Header=BB0_15 Depth=1
	eor	x2, x14, x12, lsl #5
	mov	x6, xzr
	mul	x3, x13, x12
	mov	x19, x1
	add	x4, x0, x2
	cmp	x4, #31
	csel	x7, x4, x15, lt
	b	.LBB0_18
	.p2align	5, , 16
.LBB0_17:                               // %polly.loop_exit88
                                        //   in Loop: Header=BB0_18 Depth=2
	cmp	x6, x11
	add	x6, x6, #1
	add	x19, x19, #128
	b.ge	.LBB0_14
.LBB0_18:                               // %polly.loop_if85
                                        //   Parent Loop BB0_15 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_21 Depth 3
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_24 Depth 4
	sub	x2, x10, x6, lsl #5
	cmp	x2, #31
	csel	x2, x2, x15, lt
	tbnz	x4, #63, .LBB0_17
// %bb.19:                              // %polly.loop_if93.preheader
                                        //   in Loop: Header=BB0_18 Depth=2
	ldr	x24, [sp, #376]                 // 8-byte Folded Reload
	bic	x20, x2, x2, asr #63
	eor	x2, x14, x6, lsl #5
	mov	x23, xzr
	add	x22, x3, x6, lsl #7
	mov	x26, x19
	add	x21, x20, #1
	add	x24, x24, x2
	cmp	x24, #31
	csel	x25, x24, x15, lt
	b	.LBB0_21
	.p2align	5, , 16
.LBB0_20:                               // %polly.loop_exit96
                                        //   in Loop: Header=BB0_21 Depth=3
	cmp	x23, x7
	add	x23, x23, #1
	add	x26, x26, x9
	b.ge	.LBB0_17
.LBB0_21:                               // %polly.loop_if93
                                        //   Parent Loop BB0_15 Depth=1
                                        //     Parent Loop BB0_18 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_24 Depth 4
	tbnz	x24, #63, .LBB0_20
// %bb.22:                              // %polly.stmt.for.body5.i.preheader
                                        //   in Loop: Header=BB0_21 Depth=3
	cmp	x16, #8
	csel	x2, x16, x17, hi
	cmp	x21, x2
	b.hs	.LBB0_25
// %bb.23:                              //   in Loop: Header=BB0_21 Depth=3
	mov	x2, xzr
	.p2align	5, , 16
.LBB0_24:                               // %polly.stmt.for.body5.i
                                        //   Parent Loop BB0_15 Depth=1
                                        //     Parent Loop BB0_18 Depth=2
                                        //       Parent Loop BB0_21 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	s1, [x26, x2, lsl #2]
	fmov	s2, w18
	cmp	x2, x25
	fmul	s1, s1, s2
	str	s1, [x26, x2, lsl #2]
	add	x2, x2, #1
	b.lt	.LBB0_24
	b	.LBB0_20
	.p2align	5, , 16
.LBB0_25:                               // %vector.scevcheck
                                        //   in Loop: Header=BB0_21 Depth=3
	madd	x27, x9, x23, x22
	cmp	xzr, x20, lsr #62
	mov	x2, xzr
	add	x28, x5, x27
	cset	w27, ne
	add	x30, x28, x20, lsl #2
	cmp	x30, x28
	b.lo	.LBB0_24
// %bb.26:                              // %vector.scevcheck
                                        //   in Loop: Header=BB0_21 Depth=3
	tbnz	w27, #0, .LBB0_24
// %bb.27:                              // %vector.ph
                                        //   in Loop: Header=BB0_21 Depth=3
	neg	x2, x16
	mov	x27, xzr
	and	x2, x21, x2
	.p2align	5, , 16
.LBB0_28:                               // %vector.body
                                        //   Parent Loop BB0_15 Depth=1
                                        //     Parent Loop BB0_18 Depth=2
                                        //       Parent Loop BB0_21 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ld1w	{ z1.s }, p0/z, [x26, x27, lsl #2]
	fmul	z1.s, z1.s, z0.s
	st1w	{ z1.s }, p0, [x26, x27, lsl #2]
	incw	x27
	cmp	x2, x27
	b.ne	.LBB0_28
// %bb.29:                              // %middle.block
                                        //   in Loop: Header=BB0_21 Depth=3
	cmp	x21, x2
	b.ne	.LBB0_24
	b	.LBB0_20
.LBB0_30:                               // %polly.cond
	ldr	x6, [sp, #80]                   // 8-byte Folded Reload
	ldr	x21, [sp, #320]                 // 8-byte Folded Reload
	ldr	x7, [sp, #376]                  // 8-byte Folded Reload
	cmp	x0, #0
	b.le	.LBB0_121
// %bb.31:                              // %polly.loop_if101
	sub	x8, x7, #768
	subs	x10, x7, #1
	csel	x11, x8, x10, lt
	cmn	x11, #768
	b.le	.LBB0_121
// %bb.32:                              // %polly.loop_preheader103
	ldr	x2, [sp, #128]                  // 8-byte Folded Reload
	mov	x13, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	ldr	x19, [sp, #328]                 // 8-byte Folded Reload
	ldr	x4, [sp, #152]                  // 8-byte Folded Reload
	lsl	x3, x7, #12
	mov	x22, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	add	x9, x7, #1
	mov	x12, #6148914691236517205       // =0x5555555555555555
	add	x14, x7, #3
	add	x28, sp, #48, lsl #12           // =196608
	mov	x20, xzr
	mov	z2.d, #3                        // =0x3
	mov	z3.d, #12                       // =0xc
	str	x6, [sp, #104]                  // 8-byte Folded Spill
	sub	x8, x7, #2
	eor	x13, x13, #0x8000000000000001
	str	x3, [sp, #120]                  // 8-byte Folded Spill
	add	x3, sp, #512
	movk	x22, #43691
	movk	x12, #21846
	add	x28, x28, #512
	cntw	x20
	ptrue	p0.s
	ptrue	p1.d
	lsl	x26, x21, #2
	mov	w24, #12276                     // =0x2ff4
	smulh	x11, x11, x13
	umulh	x16, x7, x22
	umulh	x17, x10, x22
	umulh	x18, x9, x22
	smulh	x12, x9, x12
	asr	x2, x2, #10
	smulh	x15, x19, x13
	lsl	x13, x7, #2
	add	x6, x4, #4
	umulh	x14, x14, x22
	str	x2, [sp, #144]                  // 8-byte Folded Spill
	lsr	x2, x0, #1
	madd	x4, x13, x19, x5
	lsr	x23, x16, #1
	lsr	x16, x17, #1
	lsr	x17, x18, #1
	add	x12, x12, x12, lsr #63
	lsr	x14, x14, #1
	str	x2, [sp, #272]                  // 8-byte Folded Spill
	add	x2, x0, #1
	add	x14, x14, x14, lsl #1
	umulh	x1, x8, x22
	stp	x23, x6, [sp, #64]              // 16-byte Folded Spill
	lsr	x18, x1, #1
	mov	z0.d, x20
	lsr	x2, x2, #1
	str	x4, [sp, #496]                  // 8-byte Folded Spill
	asr	x4, x15, #3
	mov	z1.d, x22
	mov	z4.d, x28
	str	x2, [sp, #256]                  // 8-byte Folded Spill
	orr	x2, x3, #0x8
	str	x2, [sp, #368]                  // 8-byte Folded Spill
	asr	x2, x11, #7
	add	x11, x2, x11, lsr #63
	str	x11, [sp, #88]                  // 8-byte Folded Spill
	add	x11, x4, x15, lsr #63
	add	x15, x17, x17, lsl #1
	str	x11, [sp, #312]                 // 8-byte Folded Spill
	add	x11, x23, x23, lsl #1
	sub	x23, x14, #3
	sub	x11, x7, x11
	str	x11, [sp, #352]                 // 8-byte Folded Spill
	sub	x11, x9, x15
	str	x11, [sp, #240]                 // 8-byte Folded Spill
	add	x11, x12, x12, lsl #1
	add	x12, x21, x21, lsl #1
	lsl	x14, x12, #6
	sub	x30, x9, x11
	orr	x9, x28, #0x8
	mov	w11, #4                         // =0x4
	orr	x12, x3, #0x4
	stp	x9, x14, [sp, #296]             // 16-byte Folded Spill
	lsr	x9, x19, #1
	orr	x8, x11, x8, lsl #12
	str	x12, [sp, #488]                 // 8-byte Folded Spill
	add	x9, x3, x9, lsl #13
	str	x8, [sp, #424]                  // 8-byte Folded Spill
	mov	w8, #8196                       // =0x2004
	add	x8, x3, x8
	str	x9, [sp, #112]                  // 8-byte Folded Spill
	add	x9, x18, x18, lsl #1
	str	x8, [sp, #232]                  // 8-byte Folded Spill
	mov	x8, xzr
	orr	x9, x11, x9, lsl #12
	str	x9, [sp, #208]                  // 8-byte Folded Spill
	add	x9, x16, x16, lsl #1
	mov	w16, #14336                     // =0x3800
	movk	w16, #18173, lsl #16
	lsl	x9, x9, #12
	fmov	s5, w16
	str	x9, [sp, #432]                  // 8-byte Folded Spill
	orr	x9, x28, #0x4
	str	x9, [sp, #200]                  // 8-byte Folded Spill
	b	.LBB0_34
	.p2align	5, , 16
.LBB0_33:                               // %polly.loop_exit113
                                        //   in Loop: Header=BB0_34 Depth=1
	ldp	x9, x8, [sp, #88]               // 16-byte Folded Reload
	sub	x28, x28, #768, lsl #12         // =3145728
	cmp	x8, x9
	ldr	x9, [sp, #104]                  // 8-byte Folded Reload
	add	x8, x8, #1
	add	x9, x9, #3072
	str	x9, [sp, #104]                  // 8-byte Folded Spill
	b.ge	.LBB0_121
.LBB0_34:                               // %polly.loop_if110
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_37 Depth 2
                                        //       Child Loop BB0_104 Depth 3
                                        //         Child Loop BB0_107 Depth 4
                                        //         Child Loop BB0_110 Depth 4
                                        //       Child Loop BB0_40 Depth 3
                                        //         Child Loop BB0_45 Depth 4
                                        //           Child Loop BB0_48 Depth 5
                                        //           Child Loop BB0_51 Depth 5
                                        //         Child Loop BB0_53 Depth 4
                                        //           Child Loop BB0_56 Depth 5
                                        //             Child Loop BB0_58 Depth 6
                                        //           Child Loop BB0_61 Depth 5
                                        //         Child Loop BB0_70 Depth 4
                                        //           Child Loop BB0_72 Depth 5
                                        //         Child Loop BB0_87 Depth 4
                                        //         Child Loop BB0_79 Depth 4
                                        //         Child Loop BB0_95 Depth 4
                                        //           Child Loop BB0_98 Depth 5
	str	x8, [sp, #96]                   // 8-byte Folded Spill
	add	x8, x8, x8, lsl #1
	ldr	x11, [sp, #144]                 // 8-byte Folded Reload
	lsl	x19, x8, #8
	add	x9, x19, #767
	cmp	x9, x10
	str	x9, [sp, #360]                  // 8-byte Folded Spill
	csel	x9, x9, x10, lt
	cmp	x9, x19
	csel	x9, x9, x19, gt
	tbnz	x11, #63, .LBB0_33
// %bb.35:                              // %polly.loop_if118.preheader
                                        //   in Loop: Header=BB0_34 Depth=1
	ldr	x12, [sp, #96]                  // 8-byte Folded Reload
	mov	x11, #-768                      // =0xfffffffffffffd00
	ldr	x15, [sp, #360]                 // 8-byte Folded Reload
	mov	w14, #255                       // =0xff
	index	z6.d, x19, #1
	mov	x17, xzr
	mov	x1, xzr
	cmp	x10, x15
	madd	x9, x12, x11, x9
	ldr	x11, [sp, #64]                  // 8-byte Folded Reload
	csel	x27, x10, x15, lt
	add	x25, x9, #1
	mov	x9, #-1                         // =0xffffffffffffffff
	str	x27, [sp, #344]                 // 8-byte Folded Spill
	eor	x9, x9, x12, lsl #8
	str	x25, [sp, #136]                 // 8-byte Folded Spill
	add	x18, x11, x9
	mov	z7.d, z6.d
	cmp	x18, #255
	csel	x9, x18, x14, lt
	incd	z7.d
	str	x9, [sp, #504]                  // 8-byte Folded Spill
	mov	w9, #3                          // =0x3
	bfi	x9, x8, #8, #56
	cmp	x7, x9
	cset	w9, ge
	cmp	x15, x7
	ldr	x15, [sp, #104]                 // 8-byte Folded Reload
	cset	w11, ge
	csel	w9, wzr, w9, lt
	cmp	x18, #255
	str	w9, [sp, #340]                  // 4-byte Folded Spill
	csel	x9, x18, x14, lt
	str	x9, [sp, #288]                  // 8-byte Folded Spill
	ldr	x9, [sp, #352]                  // 8-byte Folded Reload
	cmp	x9, #0
	lsl	x9, x12, #18
	mov	w12, #2                         // =0x2
	csel	w11, wzr, w11, eq
	mov	z16.d, x9
	ldp	x9, x14, [sp, #72]              // 16-byte Folded Reload
	bfi	x12, x8, #8, #56
	str	w11, [sp, #284]                 // 4-byte Folded Spill
	mov	w11, #4                         // =0x4
	bfi	x11, x8, #8, #56
	lsl	x8, x8, #10
	stp	x12, x18, [sp, #384]            // 16-byte Folded Spill
	mov	w12, #1023                      // =0x3ff
	str	x8, [sp, #248]                  // 8-byte Folded Spill
	add	x8, sp, #512
	str	x8, [sp, #472]                  // 8-byte Folded Spill
	mov	w8, #1                          // =0x1
	str	x11, [sp, #264]                 // 8-byte Folded Spill
	stp	x8, x9, [sp, #216]              // 16-byte Folded Spill
	b	.LBB0_37
	.p2align	5, , 16
.LBB0_36:                               // %polly.loop_exit147
                                        //   in Loop: Header=BB0_37 Depth=2
	ldp	x25, x8, [sp, #136]             // 16-byte Folded Reload
	ldp	x12, x9, [sp, #176]             // 16-byte Folded Reload
	ldp	x15, x14, [sp, #160]            // 16-byte Folded Reload
	mov	x22, #-6148914691236517206      // =0xaaaaaaaaaaaaaaaa
	cntw	x20
	mov	w24, #12276                     // =0x2ff4
	movk	x22, #43691
	ldr	x17, [sp, #192]                 // 8-byte Folded Reload
	cmp	x9, x8
	add	x1, x9, #1
	ldr	x9, [sp, #120]                  // 8-byte Folded Reload
	add	x12, x12, #1024
	add	x17, x17, #1024
	add	x15, x15, x9
	add	x14, x14, x9
	ldp	x11, x9, [sp, #216]             // 16-byte Folded Reload
	sub	x8, x11, #1024
	add	x9, x9, #1, lsl #12             // =4096
	stp	x8, x9, [sp, #216]              // 16-byte Folded Spill
	ldr	x9, [sp, #472]                  // 8-byte Folded Reload
	sub	x9, x9, #2, lsl #12             // =8192
	str	x9, [sp, #472]                  // 8-byte Folded Spill
	b.ge	.LBB0_33
.LBB0_37:                               // %polly.loop_if118
                                        //   Parent Loop BB0_34 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_104 Depth 3
                                        //         Child Loop BB0_107 Depth 4
                                        //         Child Loop BB0_110 Depth 4
                                        //       Child Loop BB0_40 Depth 3
                                        //         Child Loop BB0_45 Depth 4
                                        //           Child Loop BB0_48 Depth 5
                                        //           Child Loop BB0_51 Depth 5
                                        //         Child Loop BB0_53 Depth 4
                                        //           Child Loop BB0_56 Depth 5
                                        //             Child Loop BB0_58 Depth 6
                                        //           Child Loop BB0_61 Depth 5
                                        //         Child Loop BB0_70 Depth 4
                                        //           Child Loop BB0_72 Depth 5
                                        //         Child Loop BB0_87 Depth 4
                                        //         Child Loop BB0_79 Depth 4
                                        //         Child Loop BB0_95 Depth 4
                                        //           Child Loop BB0_98 Depth 5
	ldr	x11, [sp, #128]                 // 8-byte Folded Reload
	str	x17, [sp, #192]                 // 8-byte Folded Spill
	lsl	x4, x1, #10
	stp	x12, x1, [sp, #176]             // 16-byte Folded Spill
	cmp	x12, x11
	csel	x8, x12, x11, lt
	mov	x12, x28
	cmp	x8, x17
	csel	x9, x8, x17, gt
	mov	w8, #1023                       // =0x3ff
	mov	x17, x15
	stp	x15, x14, [sp, #160]            // 16-byte Folded Spill
	bfi	x8, x1, #10, #54
	cmp	x8, x11
	csel	x15, x8, x11, lt
	mov	x8, x14
	mov	x14, x17
	mov	x17, x4
	cmp	x15, x4
	csel	x11, x15, x4, gt
	cmp	x21, x4
	b.gt	.LBB0_104
.LBB0_38:                               // %polly.loop_if144
                                        //   in Loop: Header=BB0_37 Depth=2
	ldp	x8, x1, [sp, #216]              // 16-byte Folded Reload
	ldr	x17, [sp, #152]                 // 8-byte Folded Reload
	ldr	x22, [sp, #368]                 // 8-byte Folded Reload
	mov	x2, xzr
	mov	x12, xzr
	add	x8, x9, x8
	add	w9, w9, #1
	and	x9, x9, #0x1
	sub	x8, x8, x9
	str	x8, [sp, #448]                  // 8-byte Folded Spill
	sub	x8, x11, x4
	add	x8, x8, #1
	str	x8, [sp, #456]                  // 8-byte Folded Spill
	mvn	x8, x4
	add	x20, x21, x8
	mov	w8, #1023                       // =0x3ff
	cmp	x20, #1023
	csel	x24, x20, x8, lt
	ldr	x8, [sp, #112]                  // 8-byte Folded Reload
	str	x8, [sp, #480]                  // 8-byte Folded Spill
	b	.LBB0_40
	.p2align	5, , 16
.LBB0_39:                               // %polly.merge370
                                        //   in Loop: Header=BB0_40 Depth=3
	ldp	x8, x21, [sp, #312]             // 16-byte Folded Reload
	ldr	x9, [sp, #440]                  // 8-byte Folded Reload
	ldr	x2, [sp, #464]                  // 8-byte Folded Reload
	cmp	x9, x8
	add	x12, x9, #1
	mov	x9, #-24                        // =0xffffffffffffffe8
	ldp	x1, x17, [sp, #408]             // 16-byte Folded Reload
	ldr	x22, [sp, #368]                 // 8-byte Folded Reload
	ldr	x27, [sp, #344]                 // 8-byte Folded Reload
	movk	x9, #7, lsl #48
	add	x2, x2, x9
	ldr	x9, [sp, #304]                  // 8-byte Folded Reload
	add	x1, x1, x9
	add	x17, x17, x9
	ldr	x9, [sp, #480]                  // 8-byte Folded Reload
	sub	x9, x9, #48, lsl #12            // =196608
	str	x9, [sp, #480]                  // 8-byte Folded Spill
	b.ge	.LBB0_36
.LBB0_40:                               // %polly.loop_if152
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_45 Depth 4
                                        //           Child Loop BB0_48 Depth 5
                                        //           Child Loop BB0_51 Depth 5
                                        //         Child Loop BB0_53 Depth 4
                                        //           Child Loop BB0_56 Depth 5
                                        //             Child Loop BB0_58 Depth 6
                                        //           Child Loop BB0_61 Depth 5
                                        //         Child Loop BB0_70 Depth 4
                                        //           Child Loop BB0_72 Depth 5
                                        //         Child Loop BB0_87 Depth 4
                                        //         Child Loop BB0_79 Depth 4
                                        //         Child Loop BB0_95 Depth 4
                                        //           Child Loop BB0_98 Depth 5
	ldr	x9, [sp, #328]                  // 8-byte Folded Reload
	add	x8, x12, x12, lsl #1
	ldr	x3, [sp, #456]                  // 8-byte Folded Reload
	str	x12, [sp, #440]                 // 8-byte Folded Spill
	lsl	x25, x8, #4
	stp	x1, x17, [sp, #408]             // 16-byte Folded Spill
	str	x2, [sp, #464]                  // 8-byte Folded Spill
	add	x12, x25, #47
	mov	x6, x25
	cmp	x9, x12
	csel	x9, x9, x12, lt
	cmp	x0, x8, lsl #4
	b.gt	.LBB0_45
.LBB0_41:                               // %polly.cond175
                                        //   in Loop: Header=BB0_40 Depth=3
	orr	x8, x25, #0x2
	cmp	x0, x8
	str	x8, [sp, #400]                  // 8-byte Folded Spill
	b.lt	.LBB0_63
// %bb.42:                              // %polly.cond175
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #392]                  // 8-byte Folded Reload
	tbnz	x8, #63, .LBB0_63
// %bb.43:                              // %polly.loop_if189.preheader
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #272]                  // 8-byte Folded Reload
	ldr	x11, [sp, #440]                 // 8-byte Folded Reload
	mov	x9, #-24                        // =0xffffffffffffffe8
	ldr	x7, [sp, #296]                  // 8-byte Folded Reload
	mov	x22, xzr
	madd	x6, x11, x9, x8
	mov	w8, #24                         // =0x18
	cmp	x6, #24
	csel	x8, x6, x8, lt
	tst	x0, #0x1
	ccmp	x12, x0, #8, ne
	sub	x1, x8, #1
	cset	w17, lt
	b	.LBB0_53
	.p2align	5, , 16
.LBB0_44:                               // %polly.loop_exit163
                                        //   in Loop: Header=BB0_45 Depth=4
	cmp	x6, x9
	add	x6, x6, #1
	add	x1, x1, x26
	add	x17, x17, x26
	b.ge	.LBB0_41
.LBB0_45:                               // %polly.loop_if160
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_48 Depth 5
                                        //           Child Loop BB0_51 Depth 5
	cmp	x21, x4
	b.le	.LBB0_44
// %bb.46:                              // %polly.loop_header161.preheader
                                        //   in Loop: Header=BB0_45 Depth=4
	add	x8, x2, x6, lsr #1
	cmp	x3, #2
	mov	w11, w6
	mov	x14, x4
	lsl	x8, x8, #13
	b.lo	.LBB0_50
// %bb.47:                              // %vector.ph11
                                        //   in Loop: Header=BB0_45 Depth=4
	ldr	x7, [sp, #448]                  // 8-byte Folded Reload
	mov	x14, x8
	bfi	x14, x11, #2, #1
	and	x2, x3, #0xfffffffffffffffe
	mov	x3, x1
	add	x18, x22, x14
	add	x14, x4, x2
	.p2align	5, , 16
.LBB0_48:                               // %vector.body16
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_45 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldp	s17, s18, [x3, #-4]
	subs	x7, x7, #2
	add	x3, x3, #8
	stur	s17, [x18, #-8]
	str	s18, [x18], #16
	b.ne	.LBB0_48
// %bb.49:                              // %middle.block8
                                        //   in Loop: Header=BB0_45 Depth=4
	ldr	x3, [sp, #456]                  // 8-byte Folded Reload
	cmp	x3, x2
	ldr	x2, [sp, #464]                  // 8-byte Folded Reload
	b.eq	.LBB0_44
.LBB0_50:                               // %polly.loop_header161.preheader1
                                        //   in Loop: Header=BB0_45 Depth=4
	ldr	x18, [sp, #472]                 // 8-byte Folded Reload
	ubfiz	x11, x11, #2, #1
	add	x8, x8, x14, lsl #3
	add	x11, x18, x11
	add	x8, x11, x8
	.p2align	5, , 16
.LBB0_51:                               // %polly.loop_header161
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_45 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s17, [x17, x14, lsl #2]
	cmp	x14, x15
	add	x14, x14, #1
	str	s17, [x8], #8
	b.lt	.LBB0_51
	b	.LBB0_44
	.p2align	5, , 16
.LBB0_52:                               // %polly.merge305
                                        //   in Loop: Header=BB0_53 Depth=4
	ldr	x8, [sp, #504]                  // 8-byte Folded Reload
	add	x7, x7, #3, lsl #12             // =12288
	cmp	x22, x8
	add	x22, x22, #1
	b.ge	.LBB0_63
.LBB0_53:                               // %polly.loop_if189
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_56 Depth 5
                                        //             Child Loop BB0_58 Depth 6
                                        //           Child Loop BB0_61 Depth 5
	cmp	x6, #1
	b.lt	.LBB0_59
// %bb.54:                              // %polly.loop_if197.preheader
                                        //   in Loop: Header=BB0_53 Depth=4
	add	x8, x22, x22, lsl #1
	ldr	x11, [sp, #488]                 // 8-byte Folded Reload
	mov	x14, xzr
	add	x8, x19, x8
	lsl	x27, x8, #2
	add	x21, x27, #4
	add	x18, x27, #8
	b	.LBB0_56
	.p2align	5, , 16
.LBB0_55:                               // %polly.loop_exit200
                                        //   in Loop: Header=BB0_56 Depth=5
	cmp	x14, x1
	add	x14, x14, #1
	add	x11, x11, #2, lsl #12           // =8192
	b.ge	.LBB0_59
.LBB0_56:                               // %polly.loop_if197
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_53 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB0_58 Depth 6
	tbnz	x20, #63, .LBB0_55
// %bb.57:                              // %polly.stmt.for.body22.i287.preheader
                                        //   in Loop: Header=BB0_56 Depth=5
	add	x8, x25, x14, lsl #1
	mov	x12, x7
	mov	x2, x11
	madd	x3, x13, x8, x5
	orr	x8, x8, #0x1
	madd	x9, x13, x8, x5
	mov	x8, #-1                         // =0xffffffffffffffff
	.p2align	5, , 16
.LBB0_58:                               // %polly.stmt.for.body22.i287
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_53 Depth=4
                                        //           Parent Loop BB0_56 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
	ldur	s17, [x2, #-4]
	fmov	s18, w16
	ldr	s19, [x3, x27]
	ldp	s20, s21, [x12, #-8]
	ldr	s22, [x3, x18]
	add	x8, x8, #1
	cmp	x8, x24
	fmul	s17, s17, s18
	fmadd	s19, s17, s20, s19
	str	s19, [x3, x27]
	ldr	s19, [x3, x21]
	fmadd	s19, s17, s21, s19
	str	s19, [x3, x21]
	ldr	s19, [x12], #12
	fmadd	s17, s17, s19, s22
	str	s17, [x3, x18]
	ldr	s17, [x2], #8
	fmul	s17, s17, s18
	ldr	s18, [x9, x27]
	fmadd	s18, s17, s20, s18
	str	s18, [x9, x27]
	ldr	s18, [x9, x21]
	fmadd	s18, s17, s21, s18
	str	s18, [x9, x21]
	ldr	s18, [x9, x18]
	fmadd	s17, s17, s19, s18
	str	s17, [x9, x18]
	b.lt	.LBB0_58
	b	.LBB0_55
	.p2align	5, , 16
.LBB0_59:                               // %polly.cond304
                                        //   in Loop: Header=BB0_53 Depth=4
	cmp	x20, #0
	csinc	w8, w17, wzr, ge
	tbnz	w8, #0, .LBB0_52
// %bb.60:                              // %polly.stmt.for.body22.i351.preheader
                                        //   in Loop: Header=BB0_53 Depth=4
	ldr	x9, [sp, #496]                  // 8-byte Folded Reload
	add	x8, x22, x22, lsl #1
	ldr	x11, [sp, #480]                 // 8-byte Folded Reload
	mov	x12, x7
	add	x8, x19, x8
	add	x8, x9, x8, lsl #2
	mov	x9, #-1                         // =0xffffffffffffffff
	ldp	s19, s18, [x8]
	ldr	s17, [x8, #8]
	.p2align	5, , 16
.LBB0_61:                               // %polly.stmt.for.body22.i351
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_53 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s20, [x11], #8
	ldp	s21, s22, [x12, #-8]
	add	x9, x9, #1
	cmp	x9, x24
	fmul	s20, s20, s5
	fmadd	s19, s20, s21, s19
	ldr	s21, [x12], #12
	fmadd	s18, s20, s22, s18
	fmadd	s17, s20, s21, s17
	b.lt	.LBB0_61
// %bb.62:                              // %polly.merge305.loopexit
                                        //   in Loop: Header=BB0_53 Depth=4
	stp	s19, s18, [x8]
	str	s17, [x8, #8]
	b	.LBB0_52
	.p2align	5, , 16
.LBB0_63:                               // %polly.cond369
                                        //   in Loop: Header=BB0_40 Depth=3
	ldp	x7, x8, [sp, #376]              // 16-byte Folded Reload
	ldr	x3, [sp, #400]                  // 8-byte Folded Reload
	ldr	x11, [sp, #360]                 // 8-byte Folded Reload
	orr	x12, x25, #0x1
	cmp	x8, x7
	cset	w8, ge
	cmp	x0, x3
	csel	w9, wzr, w8, lt
	ldr	w8, [sp, #340]                  // 4-byte Folded Reload
	csel	w8, wzr, w8, lt
	cmp	x11, x7
	orr	x11, x25, #0x3
	ccmp	x0, x11, #8, ge
	ldr	x11, [sp, #352]                 // 8-byte Folded Reload
	csinc	w8, w8, wzr, lt
	cmp	x11, #0
	csel	w8, wzr, w8, eq
	tbnz	w9, #0, .LBB0_66
// %bb.64:                              // %polly.cond369
                                        //   in Loop: Header=BB0_40 Depth=3
	tbnz	w8, #0, .LBB0_66
// %bb.65:                              // %polly.cond369
                                        //   in Loop: Header=BB0_40 Depth=3
	cmp	x12, x0
	b.ne	.LBB0_39
.LBB0_66:                               // %polly.cond375
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x1, [sp, #288]                  // 8-byte Folded Reload
	cmp	x12, x0
	b.ne	.LBB0_74
// %bb.67:                              // %polly.cond375
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #392]                  // 8-byte Folded Reload
	tbnz	x8, #63, .LBB0_74
// %bb.68:                              // %polly.loop_if388.preheader
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x14, [sp, #296]                 // 8-byte Folded Reload
	mov	x17, xzr
	b	.LBB0_70
	.p2align	5, , 16
.LBB0_69:                               // %polly.loop_exit391
                                        //   in Loop: Header=BB0_70 Depth=4
	cmp	x17, x1
	add	x17, x17, #1
	add	x14, x14, #3, lsl #12           // =12288
	b.ge	.LBB0_74
.LBB0_70:                               // %polly.loop_if388
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_72 Depth 5
	tbnz	x20, #63, .LBB0_69
// %bb.71:                              // %polly.stmt.for.body22.i428.preheader
                                        //   in Loop: Header=BB0_70 Depth=4
	ldr	x9, [sp, #496]                  // 8-byte Folded Reload
	add	x8, x17, x17, lsl #1
	add	x11, sp, #512
	mov	x18, x14
	add	x8, x19, x8
	add	x8, x9, x8, lsl #2
	mov	x9, #-1                         // =0xffffffffffffffff
	ldp	s19, s18, [x8]
	ldr	s17, [x8, #8]
	.p2align	5, , 16
.LBB0_72:                               // %polly.stmt.for.body22.i428
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_70 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldr	s20, [x11], #8
	ldp	s21, s22, [x18, #-8]
	add	x9, x9, #1
	cmp	x9, x24
	fmul	s20, s20, s5
	fmadd	s19, s20, s21, s19
	ldr	s21, [x18], #12
	fmadd	s18, s20, s22, s18
	fmadd	s17, s20, s21, s17
	b.lt	.LBB0_72
// %bb.73:                              // %polly.loop_exit391.loopexit
                                        //   in Loop: Header=BB0_70 Depth=4
	stp	s19, s18, [x8]
	str	s17, [x8, #8]
	b	.LBB0_69
	.p2align	5, , 16
.LBB0_74:                               // %polly.cond444
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	w8, [sp, #284]                  // 4-byte Folded Reload
	tbz	w8, #0, .LBB0_39
// %bb.75:                              // %polly.cond449
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #264]                  // 8-byte Folded Reload
	cmp	x7, x8
	b.ge	.LBB0_84
// %bb.76:                              // %polly.loop_if545
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #384]                  // 8-byte Folded Reload
	ldr	x11, [sp, #248]                 // 8-byte Folded Reload
	tbnz	x20, #63, .LBB0_92
// %bb.77:                              // %polly.cond568.preheader
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x18, [sp, #488]                 // 8-byte Folded Reload
	ldr	x9, [sp, #200]                  // 8-byte Folded Reload
	madd	x14, x13, x25, x5
	mov	x17, #-1                        // =0xffffffffffffffff
	madd	x12, x13, x12, x5
	b	.LBB0_79
	.p2align	5, , 16
.LBB0_78:                               // %polly.merge588
                                        //   in Loop: Header=BB0_79 Depth=4
	add	x17, x17, #1
	add	x9, x9, #12
	add	x18, x18, #8
	cmp	x17, x24
	b.ge	.LBB0_92
.LBB0_79:                               // %polly.cond568
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x18, #-4]
	ldr	s19, [x14, x11]
	cmp	x8, x7
	fmul	s18, s17, s5
	ldur	s17, [x9, #-4]
	fmadd	s19, s18, s17, s19
	str	s19, [x14, x11]
	b.ne	.LBB0_81
// %bb.80:                              // %polly.stmt.for.body22.i572
                                        //   in Loop: Header=BB0_79 Depth=4
	ldr	s19, [x9]
	ldr	s20, [x14, x10, lsl #2]
	fmadd	s18, s18, s19, s20
	str	s18, [x14, x10, lsl #2]
.LBB0_81:                               // %polly.cond587
                                        //   in Loop: Header=BB0_79 Depth=4
	cmp	x0, x3
	b.lt	.LBB0_78
// %bb.82:                              // %polly.cond606
                                        //   in Loop: Header=BB0_79 Depth=4
	ldr	s18, [x18]
	ldr	s19, [x12, x11]
	cmp	x8, x7
	fmul	s18, s18, s5
	fmadd	s17, s18, s17, s19
	str	s17, [x12, x11]
	b.ne	.LBB0_78
// %bb.83:                              // %polly.stmt.for.body22.i610
                                        //   in Loop: Header=BB0_79 Depth=4
	ldr	s17, [x9]
	ldr	s19, [x12, x10, lsl #2]
	fmadd	s17, s18, s17, s19
	str	s17, [x12, x10, lsl #2]
	b	.LBB0_78
.LBB0_84:                               // %polly.loop_if453
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #240]                  // 8-byte Folded Reload
	tbnz	x20, #63, .LBB0_92
// %bb.85:                              // %polly.cond479.preheader
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x18, [sp, #488]                 // 8-byte Folded Reload
	ldr	x1, [sp, #432]                  // 8-byte Folded Reload
	ldr	x2, [sp, #208]                  // 8-byte Folded Reload
	madd	x14, x13, x25, x5
	madd	x9, x13, x12, x5
	mov	x17, #-1                        // =0xffffffffffffffff
	b	.LBB0_87
	.p2align	5, , 16
.LBB0_86:                               // %polly.merge502
                                        //   in Loop: Header=BB0_87 Depth=4
	add	x17, x17, #1
	add	x2, x2, #12
	add	x1, x1, #12
	add	x18, x18, #8
	cmp	x17, x24
	b.ge	.LBB0_92
.LBB0_87:                               // %polly.cond479
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	s17, [x18, #-4]
	ldr	s19, [x14, x23, lsl #2]
	fmul	s18, s17, s5
	ldr	s17, [x28, x1]
	fmadd	s19, s18, s17, s19
	str	s19, [x14, x23, lsl #2]
	cbz	x8, .LBB0_89
// %bb.88:                              // %polly.cond501
                                        //   in Loop: Header=BB0_87 Depth=4
	cmp	x0, x3
	b.lt	.LBB0_86
	b	.LBB0_90
	.p2align	5, , 16
.LBB0_89:                               // %polly.stmt.for.body22.i484
                                        //   in Loop: Header=BB0_87 Depth=4
	ldr	s19, [x28, x2]
	ldr	s20, [x14, x10, lsl #2]
	fmadd	s18, s18, s19, s20
	str	s18, [x14, x10, lsl #2]
	cmp	x0, x3
	b.lt	.LBB0_86
.LBB0_90:                               // %polly.cond523
                                        //   in Loop: Header=BB0_87 Depth=4
	ldr	s18, [x18]
	ldr	s19, [x9, x23, lsl #2]
	fmul	s18, s18, s5
	fmadd	s17, s18, s17, s19
	str	s17, [x9, x23, lsl #2]
	cbnz	x8, .LBB0_86
// %bb.91:                              // %polly.stmt.for.body22.i528
                                        //   in Loop: Header=BB0_87 Depth=4
	ldr	s17, [x28, x2]
	ldr	s19, [x9, x10, lsl #2]
	fmadd	s17, s18, s17, s19
	str	s17, [x9, x10, lsl #2]
	b	.LBB0_86
	.p2align	5, , 16
.LBB0_92:                               // %polly.loop_if626
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x8, [sp, #256]                  // 8-byte Folded Reload
	ldr	x11, [sp, #440]                 // 8-byte Folded Reload
	mov	x9, #-24                        // =0xffffffffffffffe8
	madd	x9, x11, x9, x8
	mov	w8, #24                         // =0x18
	cmp	x9, #24
	csel	x8, x9, x8, lt
	cmp	x9, #2
	b.lt	.LBB0_39
// %bb.93:                              // %polly.loop_if634.preheader
                                        //   in Loop: Header=BB0_40 Depth=3
	ldr	x12, [sp, #232]                 // 8-byte Folded Reload
	sub	x9, x8, #1
	mov	w17, #1                         // =0x1
	b	.LBB0_95
	.p2align	5, , 16
.LBB0_94:                               // %polly.loop_exit637
                                        //   in Loop: Header=BB0_95 Depth=4
	cmp	x17, x9
	add	x17, x17, #1
	add	x12, x12, #2, lsl #12           // =8192
	b.ge	.LBB0_39
.LBB0_95:                               // %polly.loop_if634
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_98 Depth 5
	tbnz	x20, #63, .LBB0_94
// %bb.96:                              // %polly.cond661.preheader
                                        //   in Loop: Header=BB0_95 Depth=4
	add	x8, x25, x17, lsl #1
	ldp	x27, x21, [sp, #424]            // 16-byte Folded Reload
	mov	x2, #-1                         // =0xffffffffffffffff
	mov	x6, x12
	madd	x14, x13, x8, x5
	add	x18, x8, #2
	orr	x8, x8, #0x1
	madd	x1, x13, x8, x5
	mov	x22, x27
	b	.LBB0_98
	.p2align	5, , 16
.LBB0_97:                               // %polly.merge685
                                        //   in Loop: Header=BB0_98 Depth=5
	add	x2, x2, #1
	add	x27, x27, #12
	add	x22, x22, #12
	add	x21, x21, #12
	add	x6, x6, #8
	cmp	x2, x24
	b.ge	.LBB0_94
.LBB0_98:                               // %polly.cond661
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        //         Parent Loop BB0_95 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	ldur	s17, [x6, #-4]
	ldr	s19, [x14, x23, lsl #2]
	fmul	s18, s17, s5
	ldr	s17, [x28, x21]
	fmadd	s19, s18, s17, s19
	str	s19, [x14, x23, lsl #2]
	cbz	x30, .LBB0_100
// %bb.99:                              // %polly.cond684
                                        //   in Loop: Header=BB0_98 Depth=5
	cmp	x0, x18
	b.lt	.LBB0_97
	b	.LBB0_101
	.p2align	5, , 16
.LBB0_100:                              // %polly.stmt.for.body22.i666
                                        //   in Loop: Header=BB0_98 Depth=5
	ldr	s19, [x28, x22]
	ldr	s20, [x14, x10, lsl #2]
	fmadd	s18, s18, s19, s20
	str	s18, [x14, x10, lsl #2]
	cmp	x0, x18
	b.lt	.LBB0_97
.LBB0_101:                              // %polly.cond708
                                        //   in Loop: Header=BB0_98 Depth=5
	ldr	s18, [x6]
	ldr	s19, [x1, x23, lsl #2]
	fmul	s18, s18, s5
	fmadd	s17, s18, s17, s19
	str	s17, [x1, x23, lsl #2]
	cbnz	x30, .LBB0_97
// %bb.102:                             // %polly.stmt.for.body22.i713
                                        //   in Loop: Header=BB0_98 Depth=5
	ldr	s17, [x28, x27]
	ldr	s19, [x1, x10, lsl #2]
	fmadd	s17, s18, s17, s19
	str	s17, [x1, x10, lsl #2]
	b	.LBB0_97
	.p2align	5, , 16
.LBB0_103:                              // %polly.loop_exit129
                                        //   in Loop: Header=BB0_104 Depth=3
	cmp	x17, x15
	add	x17, x17, #1
	add	x14, x14, x13
	add	x12, x12, #12
	add	x8, x8, x13
	b.ge	.LBB0_38
.LBB0_104:                              // %polly.loop_if126
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_107 Depth 4
                                        //         Child Loop BB0_110 Depth 4
	cmp	x7, x19
	b.le	.LBB0_103
// %bb.105:                             // %polly.loop_header127.preheader
                                        //   in Loop: Header=BB0_104 Depth=3
	cmp	x25, x20
	mov	x1, x19
	b.lo	.LBB0_109
// %bb.106:                             // %vector.ph24
                                        //   in Loop: Header=BB0_104 Depth=3
	sub	x3, x17, x4
	neg	x1, x20
	mov	z18.d, z6.d
	mov	z19.d, z7.d
	mov	x18, xzr
	mov	z17.d, x3
	and	x2, x25, x1
	add	x1, x19, x2
	.p2align	5, , 16
.LBB0_107:                              // %vector.body30
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_104 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	z21.d, z18.d, z1.d
	ld1w	{ z20.s }, p0/z, [x14, x18, lsl #2]
	incw	x18
	cmp	x2, x18
	umulh	z22.d, z19.d, z1.d
	lsr	z21.d, z21.d, #1
	lsr	z22.d, z22.d, #1
	lsl	z23.d, z22.d, #10
	lsl	z24.d, z21.d, #10
	msb	z21.d, p1/m, z2.d, z18.d
	msb	z22.d, p1/m, z2.d, z19.d
	add	z18.d, z18.d, z0.d
	add	z19.d, z19.d, z0.d
	sub	z24.d, z24.d, z16.d
	sub	z23.d, z23.d, z16.d
	add	z23.d, z23.d, z17.d
	add	z24.d, z24.d, z17.d
	mad	z24.d, p1/m, z3.d, z4.d
	mad	z23.d, p1/m, z3.d, z4.d
	adr	z22.d, [z23.d, z22.d, lsl #2]
	adr	z21.d, [z24.d, z21.d, lsl #2]
	uunpklo	z23.d, z20.s
	uunpkhi	z20.d, z20.s
	st1w	{ z23.d }, p1, [z21.d]
	st1w	{ z20.d }, p1, [z22.d]
	b.ne	.LBB0_107
// %bb.108:                             // %middle.block21
                                        //   in Loop: Header=BB0_104 Depth=3
	cmp	x25, x2
	b.eq	.LBB0_103
.LBB0_109:                              // %polly.loop_header127.preheader3
                                        //   in Loop: Header=BB0_104 Depth=3
	sub	x18, x1, #1
	add	x2, x12, x1, lsl #2
	add	x3, x8, x1, lsl #2
	.p2align	5, , 16
.LBB0_110:                              // %polly.loop_header127
                                        //   Parent Loop BB0_34 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        //       Parent Loop BB0_104 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	umulh	x6, x1, x22
	ldr	s17, [x3], #4
	add	x18, x18, #1
	add	x1, x1, #1
	cmp	x18, x27
	lsr	x6, x6, #1
	mul	x6, x6, x24
	str	s17, [x2, x6]
	add	x2, x2, #4
	b.lt	.LBB0_110
	b	.LBB0_103
.LBB0_111:                              // %for.cond.i.preheader
	mov	w10, #45056                     // =0xb000
	mov	w11, #14336                     // =0x3800
	lsl	x9, x1, #2
	mov	x8, xzr
	movk	w10, #17668, lsl #16
	movk	w11, #18173, lsl #16
	b	.LBB0_113
	.p2align	5, , 16
.LBB0_112:                              // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_113 Depth=1
	add	x8, x8, #1
	add	x5, x5, x9
.LBB0_113:                              // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_115 Depth 2
                                        //     Child Loop BB0_118 Depth 2
                                        //       Child Loop BB0_120 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_121
// %bb.114:                             // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_113 Depth=1
	mov	x12, xzr
	cmp	xzr, x1
	b.hs	.LBB0_116
	.p2align	5, , 16
.LBB0_115:                              // %for.body5.i
                                        //   Parent Loop BB0_113 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s0, [x5, x12, lsl #2]
	fmov	s1, w10
	fmul	s0, s0, s1
	str	s0, [x5, x12, lsl #2]
	add	x12, x12, #1
	cmp	x12, x1
	b.lo	.LBB0_115
.LBB0_116:                              // %for.cond8.i.preheader
                                        //   in Loop: Header=BB0_113 Depth=1
	ldr	x14, [sp, #152]                 // 8-byte Folded Reload
	mul	x13, x8, x2
	mov	x12, xzr
	add	x13, x14, x13, lsl #2
	mov	x14, x4
	b	.LBB0_118
	.p2align	5, , 16
.LBB0_117:                              // %for.cond.cleanup21.i
                                        //   in Loop: Header=BB0_118 Depth=2
	add	x12, x12, #1
	add	x14, x14, x9
.LBB0_118:                              // %for.cond8.i
                                        //   Parent Loop BB0_113 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_120 Depth 3
	cmp	x12, x2
	b.hs	.LBB0_112
// %bb.119:                             // %for.body11.i
                                        //   in Loop: Header=BB0_118 Depth=2
	ldr	s0, [x13, x12, lsl #2]
	fmov	s1, w11
	mov	x15, xzr
	fmul	s0, s0, s1
	cmp	xzr, x1
	b.hs	.LBB0_117
	.p2align	5, , 16
.LBB0_120:                              // %for.body22.i
                                        //   Parent Loop BB0_113 Depth=1
                                        //     Parent Loop BB0_118 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	s1, [x14, x15, lsl #2]
	ldr	s2, [x5, x15, lsl #2]
	fmadd	s1, s0, s1, s2
	str	s1, [x5, x15, lsl #2]
	add	x15, x15, #1
	cmp	x15, x1
	b.lo	.LBB0_120
	b	.LBB0_117
.LBB0_121:                              // %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	mov	sp, x29
	ldp	x20, x19, [sp, #80]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS4Gemm, .Lfunc_end0-_ZTS4Gemm
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
