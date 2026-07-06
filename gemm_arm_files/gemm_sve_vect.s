	.text
	.file	"gemm.cpp"
	.section	.text._ZTS4Gemm,"axG",@progbits,_ZTS4Gemm,comdat
	.weak	_ZTS4Gemm                       // -- Begin function _ZTS4Gemm
	.p2align	4
	.type	_ZTS4Gemm,@function
_ZTS4Gemm:                              // @_ZTS4Gemm
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-80]!           // 16-byte Folded Spill
	mov	w14, #45056                     // =0xb000
	lsl	x9, x1, #2
	addvl	x12, x5, #1
	cnth	x13
	mov	w15, #14336                     // =0x3800
	mov	x17, #-1                        // =0xffffffffffffffff
	add	x11, x1, #1
	str	x25, [sp, #16]                  // 8-byte Folded Spill
	stp	x24, x23, [sp, #32]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             // 16-byte Folded Spill
	cntw	x16
	ptrue	p0.s
	mov	x29, sp
	movk	w14, #17668, lsl #16
	add	x10, x9, #4
	movk	w15, #18173, lsl #16
	stp	x20, x19, [sp, #64]             // 16-byte Folded Spill
	mov	x8, xzr
	mov	x18, x5
	incw	x17
	mov	z0.s, w14
	b	.LBB0_2
	.p2align	5, , 16
.LBB0_1:                                // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	add	x12, x12, x9
	add	x18, x18, x9
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_8 Depth 2
                                        //     Child Loop BB0_10 Depth 2
                                        //     Child Loop BB0_12 Depth 2
                                        //       Child Loop BB0_20 Depth 3
                                        //       Child Loop BB0_22 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_24
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	madd	x6, x9, x8, x5
	cmp	x11, x13
	b.hi	.LBB0_5
// %bb.4:                               //   in Loop: Header=BB0_2 Depth=1
	mov	x20, xzr
	b	.LBB0_9
	.p2align	5, , 16
.LBB0_5:                                // %vector.scevcheck6
                                        //   in Loop: Header=BB0_2 Depth=1
	cmp	xzr, x1, lsr #62
	add	x19, x6, x1, lsl #2
	mov	x20, xzr
	cset	w7, ne
	cmp	x19, x6
	b.lo	.LBB0_9
// %bb.6:                               // %vector.scevcheck6
                                        //   in Loop: Header=BB0_2 Depth=1
	tbnz	w7, #0, .LBB0_9
// %bb.7:                               // %vector.ph14
                                        //   in Loop: Header=BB0_2 Depth=1
	mov	x19, #-1                        // =0xffffffffffffffff
	mov	x7, xzr
	inch	x19
	ands	x19, x11, x19
	csel	x19, x13, x19, eq
	sub	x20, x11, x19
	.p2align	5, , 16
.LBB0_8:                                // %vector.body18
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p0/z, [x18, x7, lsl #2]
	ld1w	{ z2.s }, p0/z, [x12, x7, lsl #2]
	fmul	z1.s, z1.s, z0.s
	fmul	z2.s, z2.s, z0.s
	st1w	{ z1.s }, p0, [x18, x7, lsl #2]
	st1w	{ z2.s }, p0, [x12, x7, lsl #2]
	inch	x7
	cmp	x20, x7
	b.ne	.LBB0_8
.LBB0_9:                                // %for.cond2.i.preheader1
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x19, x9, x8
	add	x21, x5, x10
	add	x7, x5, x19
	add	x19, x21, x19
	cmp	x20, x1
	b.hs	.LBB0_11
	.p2align	5, , 16
.LBB0_10:                               // %for.body5.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s1, [x18, x20, lsl #2]
	fmov	s2, w14
	fmul	s1, s1, s2
	str	s1, [x18, x20, lsl #2]
	add	x20, x20, #1
	cmp	x20, x1
	b.lo	.LBB0_10
.LBB0_11:                               // %for.cond8.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x21, x8, x2
	mov	x20, xzr
	mov	x22, x4
	add	x21, x3, x21, lsl #2
	cmp	xzr, x2
	b.hs	.LBB0_1
	.p2align	5, , 16
.LBB0_12:                               // %for.body11.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_20 Depth 3
                                        //       Child Loop BB0_22 Depth 3
	ldr	s1, [x21, x20, lsl #2]
	fmov	s2, w15
	cmp	x11, x16
	fmul	s1, s1, s2
	b.hi	.LBB0_14
// %bb.13:                              //   in Loop: Header=BB0_12 Depth=2
	mov	x23, xzr
	b	.LBB0_22
	.p2align	5, , 16
.LBB0_14:                               // %vector.scevcheck
                                        //   in Loop: Header=BB0_12 Depth=2
	cmp	xzr, x1, lsr #62
	add	x25, x6, x1, lsl #2
	mov	x23, xzr
	cset	w24, ne
	cmp	x25, x6
	b.lo	.LBB0_22
// %bb.15:                              // %vector.scevcheck
                                        //   in Loop: Header=BB0_12 Depth=2
	tbnz	w24, #0, .LBB0_22
// %bb.16:                              // %vector.memcheck
                                        //   in Loop: Header=BB0_12 Depth=2
	mul	x23, x9, x20
	add	x24, x4, x10
	add	x24, x24, x23
	cmp	x7, x24
	b.hs	.LBB0_19
// %bb.17:                              // %vector.memcheck
                                        //   in Loop: Header=BB0_12 Depth=2
	add	x23, x4, x23
	cmp	x23, x19
	b.hs	.LBB0_19
// %bb.18:                              //   in Loop: Header=BB0_12 Depth=2
	mov	x23, xzr
	b	.LBB0_22
.LBB0_19:                               // %vector.ph
                                        //   in Loop: Header=BB0_12 Depth=2
	ands	x23, x11, x17
	mov	z2.s, s1
	mov	x24, xzr
	csel	x23, x16, x23, eq
	sub	x23, x11, x23
	.p2align	5, , 16
.LBB0_20:                               // %vector.body
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_12 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z3.s }, p0/z, [x22, x24, lsl #2]
	ld1w	{ z4.s }, p0/z, [x18, x24, lsl #2]
	fmad	z3.s, p0/m, z2.s, z4.s
	st1w	{ z3.s }, p0, [x18, x24, lsl #2]
	incw	x24
	cmp	x23, x24
	b.ne	.LBB0_20
	b	.LBB0_22
	.p2align	5, , 16
.LBB0_21:                               // %for.body22.i
                                        //   in Loop: Header=BB0_22 Depth=3
	ldr	s2, [x22, x23, lsl #2]
	ldr	s3, [x18, x23, lsl #2]
	fmadd	s2, s1, s2, s3
	str	s2, [x18, x23, lsl #2]
	add	x23, x23, #1
.LBB0_22:                               // %for.cond18.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_12 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	cmp	x23, x1
	b.lo	.LBB0_21
// %bb.23:                              // %for.cond.cleanup21.i
                                        //   in Loop: Header=BB0_12 Depth=2
	add	x20, x20, #1
	add	x22, x22, x9
	cmp	x20, x2
	b.lo	.LBB0_12
	b	.LBB0_1
.LBB0_24:                               // %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #64]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             // 16-byte Folded Reload
	ldr	x25, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #80             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS4Gemm, .Lfunc_end0-_ZTS4Gemm
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
