	.text
	.file	"2dconvolution.cpp"
	.section	.text._ZTS6conv2D,"axG",@progbits,_ZTS6conv2D,comdat
	.weak	_ZTS6conv2D                     // -- Begin function _ZTS6conv2D
	.p2align	4
	.type	_ZTS6conv2D,@function
_ZTS6conv2D:                            // @_ZTS6conv2D
// %bb.0:                               // %entry
	sub	sp, sp, #160
	index	z6.d, #1, #1
	mov	w9, #12                         // =0xc
	mov	x10, #4                         // =0x4
	cntw	x8
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	mov	x28, x0
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	add	x29, sp, #64
	mov	w13, #4                         // =0x4
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	mov	w7, #39322                      // =0x999a
	mov	w25, #52429                     // =0xcccd
	madd	x12, x0, x9, x10
	lsl	x10, x0, #2
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	bfi	x13, x0, #3, #61
	mov	w23, #52429                     // =0xcccd
	mov	w24, #26214                     // =0x6666
	movk	w7, #48793, lsl #16
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	mov	w21, #39322                     // =0x999a
	mov	w22, #13107                     // =0x3333
	movk	w21, #16153, lsl #16
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	mov	w19, #52429                     // =0xcccd
	mov	z0.d, x8
	add	x8, x10, #4
	fmov	s1, #0.50000000
	fmov	z17.s, #0.50000000
	mov	x0, xzr
	stur	x28, [x29, #-8]                 // 8-byte Folded Spill
	mov	w20, #52429                     // =0xcccd
	movk	w19, #15948, lsl #16
	movk	w20, #16076, lsl #16
	mov	x30, x1
	stp	x8, x2, [x29, #-24]             // 16-byte Folded Spill
	add	x15, x2, x8
	add	x8, x1, x12
	movk	w22, #16179, lsl #16
	str	x8, [sp, #24]                   // 8-byte Folded Spill
	add	x8, x1, x10
	movk	w23, #48972, lsl #16
	movk	w24, #48998, lsl #16
	movk	w25, #15820, lsl #16
	mov	z2.s, w7
	mov	z7.d, z6.d
	str	x8, [sp, #16]                   // 8-byte Folded Spill
	add	x8, x1, x13
	mov	z3.s, w19
	mov	z4.s, w20
	mov	z5.s, w21
	ptrue	p0.s
	sub	x9, x28, #1
	lsl	x11, x28, #3
	str	x11, [sp, #32]                  // 8-byte Folded Spill
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	mov	z16.s, w22
	mov	x8, #-1                         // =0xffffffffffffffff
	add	x14, x1, x28, lsl #3
	add	x16, x1, x28, lsl #2
	add	x17, x1, #4
	add	x18, x2, x28, lsl #2
	incd	z7.d
	mov	z18.s, w23
	mov	w3, #1                          // =0x1
	incw	x8
	mov	x27, #1                         // =0x1
	str	x8, [sp]                        // 8-byte Folded Spill
	mov	z19.s, w24
	mov	z20.s, w25
	cmp	x3, x9
	b.hs	.LBB0_11
	.p2align	5, , 16
.LBB0_1:                                // %for.cond2.i.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //     Child Loop BB0_9 Depth 2
	cntw	x8
	cmp	x9, x8
	b.hi	.LBB0_3
.LBB0_2:                                //   in Loop: Header=BB0_1 Depth=1
	mov	w26, #1                         // =0x1
	b	.LBB0_8
	.p2align	5, , 16
.LBB0_3:                                // %vector.memcheck
                                        //   in Loop: Header=BB0_1 Depth=1
	ldp	x11, x8, [x29, #-24]            // 16-byte Folded Reload
	mul	x12, x10, x0
	add	x2, x1, x12
	add	x13, x11, x12
	ldr	x11, [sp, #32]                  // 8-byte Folded Reload
	add	x4, x8, x13
	add	x13, x1, x13
	add	x5, x11, x12
	add	x6, x8, x5
	ldp	x8, x11, [sp, #16]              // 16-byte Folded Reload
	add	x5, x1, x5
	add	x26, x11, x12
	add	x11, x8, x12
	ldr	x8, [sp, #8]                    // 8-byte Folded Reload
	add	x8, x8, x12
	cmp	x4, x8
	ccmp	x11, x6, #2, lo
	cset	w12, lo
	cmp	x4, x13
	ccmp	x2, x6, #2, lo
	cset	w13, lo
	cmp	x5, x6
	ccmp	x4, x26, #2, lo
	b.lo	.LBB0_2
// %bb.4:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_1 Depth=1
	mov	w26, #1                         // =0x1
	tbnz	w12, #0, .LBB0_8
// %bb.5:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_1 Depth=1
	tbnz	w13, #0, .LBB0_8
// %bb.6:                               // %vector.ph
                                        //   in Loop: Header=BB0_1 Depth=1
	ldur	x11, [x29, #-8]                 // 8-byte Folded Reload
	sub	x8, x3, #1
	mov	z22.d, z6.d
	mov	z21.d, z7.d
	mov	x13, xzr
	mul	x8, x8, x11
	add	x4, x1, x8, lsl #2
	mul	x8, x3, x11
	add	x5, x1, x8, lsl #2
	add	x8, x11, x8
	cntw	x11
	add	x6, x1, x8, lsl #2
	ldr	x8, [sp]                        // 8-byte Folded Reload
	ands	x8, x9, x8
	csel	x8, x11, x8, eq
	sub	x12, x9, x8
	add	x26, x12, #1
	.p2align	5, , 16
.LBB0_7:                                // %vector.body
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z24.s }, p0/z, [x16, x13, lsl #2]
	ld1w	{ z23.s }, p0/z, [x30, x13, lsl #2]
	add	x8, x30, x13, lsl #2
	add	x11, x16, x13, lsl #2
	add	x2, x14, x13, lsl #2
	add	z21.d, z21.d, z0.d
	fmul	z24.s, z24.s, z2.s
	fmad	z23.s, p0/m, z3.s, z24.s
	ld1w	{ z24.s }, p0/z, [x14, x13, lsl #2]
	fmla	z23.s, p0/m, z24.s, z4.s
	ld1w	{ z24.s }, p0/z, [x8, x27, lsl #2]
	fmla	z23.s, p0/m, z24.s, z17.s
	ld1w	{ z24.s }, p0/z, [x11, x27, lsl #2]
	fmla	z23.s, p0/m, z24.s, z5.s
	ld1w	{ z24.s }, p0/z, [x2, x27, lsl #2]
	fmla	z23.s, p0/m, z24.s, z16.s
	add	z24.d, z22.d, z0.d
	add	z22.d, z22.d, #1                // =0x1
	fmov	x8, d22
	ld1w	{ z22.s }, p0/z, [x4, x8, lsl #2]
	fmad	z22.s, p0/m, z18.s, z23.s
	ld1w	{ z23.s }, p0/z, [x5, x8, lsl #2]
	fmla	z22.s, p0/m, z23.s, z19.s
	ld1w	{ z23.s }, p0/z, [x6, x8, lsl #2]
	fmla	z22.s, p0/m, z23.s, z20.s
	st1w	{ z22.s }, p0, [x15, x13, lsl #2]
	incw	x13
	mov	z22.d, z24.d
	cmp	x12, x13
	b.ne	.LBB0_7
.LBB0_8:                                // %for.cond2.i.preheader1
                                        //   in Loop: Header=BB0_1 Depth=1
	add	x8, x26, x28
	add	x4, x17, x26, lsl #2
	add	x5, x14, x26, lsl #2
	add	x13, x1, x8, lsl #2
	cmp	x26, x9
	b.hs	.LBB0_10
	.p2align	5, , 16
.LBB0_9:                                // %for.body7.i
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	s21, [x13, #-4]
	fmov	s22, w7
	ldp	s23, s24, [x4, #-8]
	fmul	s21, s21, s22
	fmov	s22, w19
	fmadd	s21, s23, s22, s21
	ldur	s22, [x5, #-4]
	fmov	s23, w20
	fmadd	s21, s22, s23, s21
	ldr	s22, [x13]
	fmov	s23, w21
	fmadd	s21, s24, s1, s21
	fmadd	s21, s22, s23, s21
	ldr	s22, [x5]
	fmov	s23, w22
	fmadd	s21, s22, s23, s21
	ldr	s22, [x4], #4
	fmov	s23, w23
	fmadd	s21, s22, s23, s21
	ldr	s22, [x13, #4]!
	fmov	s23, w24
	fmadd	s21, s22, s23, s21
	ldr	s22, [x5, #4]!
	fmov	s23, w25
	fmadd	s21, s22, s23, s21
	str	s21, [x18, x26, lsl #2]
	add	x26, x26, #1
	cmp	x26, x9
	b.lo	.LBB0_9
.LBB0_10:                               // %for.cond.cleanup6.i
                                        //   in Loop: Header=BB0_1 Depth=1
	ldur	x8, [x29, #-8]                  // 8-byte Folded Reload
	add	x3, x3, #1
	add	x0, x0, #1
	add	x14, x14, x10
	add	x15, x15, x10
	add	x16, x16, x10
	add	x30, x30, x10
	add	x17, x17, x10
	add	x18, x18, x10
	add	x28, x28, x8
	cmp	x3, x9
	b.lo	.LBB0_1
.LBB0_11:                               // %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	add	sp, sp, #160
	ret
.Lfunc_end0:
	.size	_ZTS6conv2D, .Lfunc_end0-_ZTS6conv2D
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
