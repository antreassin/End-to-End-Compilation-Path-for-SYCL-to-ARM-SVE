	.text
	.file	"2mm.cpp"
	.section	.text._ZTS15Polybench_2mm_1,"axG",@progbits,_ZTS15Polybench_2mm_1,comdat
	.weak	_ZTS15Polybench_2mm_1           // -- Begin function _ZTS15Polybench_2mm_1
	.p2align	4
	.type	_ZTS15Polybench_2mm_1,@function
_ZTS15Polybench_2mm_1:                  // @_ZTS15Polybench_2mm_1
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	lsl	x9, x0, #2
	cntw	x12
	mov	x13, #-1                        // =0xffffffffffffffff
	ptrue	p0.s
	add	x11, x0, #1
	stp	x24, x23, [sp, #16]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	mov	x29, sp
	mov	x8, xzr
	mov	x14, x3
	add	x10, x9, #4
	incw	x13
	b	.LBB0_2
	.p2align	5, , 16
.LBB0_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	add	x14, x14, x9
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
                                        //       Child Loop BB0_11 Depth 3
                                        //       Child Loop BB0_13 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_15
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x16, x9, x8
	mul	x6, x8, x0
	add	x18, x3, x10
	mov	x15, xzr
	mov	x7, x2
	add	x17, x3, x16
	madd	x5, x9, x8, x3
	add	x18, x18, x16
	add	x4, x16, #4
	add	x6, x1, x6, lsl #2
	cmp	xzr, x0
	b.hs	.LBB0_1
	.p2align	5, , 16
.LBB0_4:                                // %for.cond7.i.preheader
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_11 Depth 3
                                        //       Child Loop BB0_13 Depth 3
	cmp	x11, x12
	b.hi	.LBB0_6
// %bb.5:                               //   in Loop: Header=BB0_4 Depth=2
	mov	x19, xzr
	b	.LBB0_13
	.p2align	5, , 16
.LBB0_6:                                // %vector.scevcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	cmp	xzr, x0, lsr #62
	add	x21, x5, x0, lsl #2
	mov	x19, xzr
	cset	w20, ne
	cmp	x21, x5
	b.lo	.LBB0_13
// %bb.7:                               // %vector.scevcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	tbnz	w20, #0, .LBB0_13
// %bb.8:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	add	x20, x16, x15, lsl #2
	add	x24, x2, x10
	mov	x19, xzr
	add	x21, x1, x20
	add	x20, x4, x15, lsl #2
	add	x22, x1, x20
	mul	x20, x9, x15
	add	x23, x2, x20
	add	x20, x24, x20
	cmp	x17, x20
	ccmp	x23, x18, #2, lo
	cset	w20, lo
	cmp	x21, x18
	ccmp	x17, x22, #2, lo
	b.lo	.LBB0_13
// %bb.9:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	tbnz	w20, #0, .LBB0_13
// %bb.10:                              // %vector.ph
                                        //   in Loop: Header=BB0_4 Depth=2
	ands	x19, x11, x13
	mov	x20, xzr
	csel	x19, x12, x19, eq
	sub	x19, x11, x19
	.p2align	5, , 16
.LBB0_11:                               // %vector.body
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x21, x6, x15, lsl #2
	ld1w	{ z1.s }, p0/z, [x7, x20, lsl #2]
	ld1w	{ z2.s }, p0/z, [x14, x20, lsl #2]
	ld1rw	{ z0.s }, p0/z, [x21]
	fmad	z0.s, p0/m, z1.s, z2.s
	st1w	{ z0.s }, p0, [x14, x20, lsl #2]
	incw	x20
	cmp	x19, x20
	b.ne	.LBB0_11
	b	.LBB0_13
	.p2align	5, , 16
.LBB0_12:                               // %for.body11.i
                                        //   in Loop: Header=BB0_13 Depth=3
	ldr	s0, [x6, x15, lsl #2]
	ldr	s1, [x7, x19, lsl #2]
	ldr	s2, [x14, x19, lsl #2]
	fmadd	s0, s0, s1, s2
	str	s0, [x14, x19, lsl #2]
	add	x19, x19, #1
.LBB0_13:                               // %for.cond7.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	cmp	x19, x0
	b.lo	.LBB0_12
// %bb.14:                              // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_4 Depth=2
	add	x15, x15, #1
	add	x7, x7, x9
	cmp	x15, x0
	b.lo	.LBB0_4
	b	.LBB0_1
.LBB0_15:                               // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS15Polybench_2mm_1, .Lfunc_end0-_ZTS15Polybench_2mm_1
                                        // -- End function
	.section	.text._ZTS15Polybench_2mm_2,"axG",@progbits,_ZTS15Polybench_2mm_2,comdat
	.weak	_ZTS15Polybench_2mm_2           // -- Begin function _ZTS15Polybench_2mm_2
	.p2align	4
	.type	_ZTS15Polybench_2mm_2,@function
_ZTS15Polybench_2mm_2:                  // @_ZTS15Polybench_2mm_2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-80]!           // 16-byte Folded Spill
	lsl	x9, x0, #2
	addvl	x12, x3, #1
	cnth	x13
	mov	x15, #-1                        // =0xffffffffffffffff
	mov	z0.s, #0                        // =0x0
	add	x11, x0, #1
	stp	x26, x25, [sp, #16]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             // 16-byte Folded Spill
	cntw	x14
	ptrue	p0.s
	stp	x20, x19, [sp, #64]             // 16-byte Folded Spill
	add	x10, x9, #4
	incw	x15
	mov	x29, sp
	mov	x8, xzr
	mov	x16, x3
	b	.LBB1_2
	.p2align	5, , 16
.LBB1_1:                                // %for.cond.cleanup11.i
                                        //   in Loop: Header=BB1_2 Depth=1
	add	x8, x8, #1
	add	x12, x12, x9
	add	x16, x16, x9
.LBB1_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_6 Depth 2
                                        //     Child Loop BB1_8 Depth 2
                                        //     Child Loop BB1_10 Depth 2
                                        //       Child Loop BB1_17 Depth 3
                                        //       Child Loop BB1_19 Depth 3
	cmp	x8, x0
	b.hs	.LBB1_21
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	cmp	x11, x13
	b.hi	.LBB1_5
// %bb.4:                               //   in Loop: Header=BB1_2 Depth=1
	mov	x7, xzr
	b	.LBB1_7
	.p2align	5, , 16
.LBB1_5:                                // %vector.ph14
                                        //   in Loop: Header=BB1_2 Depth=1
	mov	x18, #-1                        // =0xffffffffffffffff
	mov	x17, xzr
	inch	x18
	ands	x18, x11, x18
	csel	x18, x13, x18, eq
	sub	x7, x11, x18
	.p2align	5, , 16
.LBB1_6:                                // %vector.body18
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	st1w	{ z0.s }, p0, [x16, x17, lsl #2]
	st1w	{ z0.s }, p0, [x12, x17, lsl #2]
	inch	x17
	cmp	x7, x17
	b.ne	.LBB1_6
.LBB1_7:                                // %for.cond2.i.preheader2
                                        //   in Loop: Header=BB1_2 Depth=1
	mul	x17, x9, x8
	add	x4, x3, x10
	madd	x6, x9, x8, x3
	add	x18, x3, x17
	add	x4, x4, x17
	add	x5, x17, #4
	cmp	x7, x0
	b.hs	.LBB1_9
	.p2align	5, , 16
.LBB1_8:                                // %for.body6.i
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	wzr, [x16, x7, lsl #2]
	add	x7, x7, #1
	cmp	x7, x0
	b.lo	.LBB1_8
.LBB1_9:                                // %for.cond8.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	mul	x19, x8, x0
	mov	x7, xzr
	mov	x20, x2
	add	x19, x1, x19, lsl #2
	cmp	xzr, x0
	b.hs	.LBB1_1
	.p2align	5, , 16
.LBB1_10:                               // %for.cond14.i.preheader
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_17 Depth 3
                                        //       Child Loop BB1_19 Depth 3
	cmp	x11, x14
	b.hi	.LBB1_12
// %bb.11:                              //   in Loop: Header=BB1_10 Depth=2
	mov	x21, xzr
	b	.LBB1_19
	.p2align	5, , 16
.LBB1_12:                               // %vector.scevcheck
                                        //   in Loop: Header=BB1_10 Depth=2
	cmp	xzr, x0, lsr #62
	add	x23, x6, x0, lsl #2
	mov	x21, xzr
	cset	w22, ne
	cmp	x23, x6
	b.lo	.LBB1_19
// %bb.13:                              // %vector.scevcheck
                                        //   in Loop: Header=BB1_10 Depth=2
	tbnz	w22, #0, .LBB1_19
// %bb.14:                              // %vector.memcheck
                                        //   in Loop: Header=BB1_10 Depth=2
	add	x22, x17, x7, lsl #2
	add	x26, x2, x10
	mov	x21, xzr
	add	x23, x1, x22
	add	x22, x5, x7, lsl #2
	add	x24, x1, x22
	mul	x22, x9, x7
	add	x25, x2, x22
	add	x22, x26, x22
	cmp	x18, x22
	ccmp	x25, x4, #2, lo
	cset	w22, lo
	cmp	x23, x4
	ccmp	x18, x24, #2, lo
	b.lo	.LBB1_19
// %bb.15:                              // %vector.memcheck
                                        //   in Loop: Header=BB1_10 Depth=2
	tbnz	w22, #0, .LBB1_19
// %bb.16:                              // %vector.ph
                                        //   in Loop: Header=BB1_10 Depth=2
	ands	x21, x11, x15
	mov	x22, xzr
	csel	x21, x14, x21, eq
	sub	x21, x11, x21
	.p2align	5, , 16
.LBB1_17:                               // %vector.body
                                        //   Parent Loop BB1_2 Depth=1
                                        //     Parent Loop BB1_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x23, x19, x7, lsl #2
	ld1w	{ z2.s }, p0/z, [x20, x22, lsl #2]
	ld1w	{ z3.s }, p0/z, [x16, x22, lsl #2]
	ld1rw	{ z1.s }, p0/z, [x23]
	fmad	z1.s, p0/m, z2.s, z3.s
	st1w	{ z1.s }, p0, [x16, x22, lsl #2]
	incw	x22
	cmp	x21, x22
	b.ne	.LBB1_17
	b	.LBB1_19
	.p2align	5, , 16
.LBB1_18:                               // %for.body18.i
                                        //   in Loop: Header=BB1_19 Depth=3
	ldr	s1, [x19, x7, lsl #2]
	ldr	s2, [x20, x21, lsl #2]
	ldr	s3, [x16, x21, lsl #2]
	fmadd	s1, s1, s2, s3
	str	s1, [x16, x21, lsl #2]
	add	x21, x21, #1
.LBB1_19:                               // %for.cond14.i
                                        //   Parent Loop BB1_2 Depth=1
                                        //     Parent Loop BB1_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	cmp	x21, x0
	b.lo	.LBB1_18
// %bb.20:                              // %for.cond.cleanup17.i
                                        //   in Loop: Header=BB1_10 Depth=2
	add	x7, x7, #1
	add	x20, x20, x9
	cmp	x7, x0
	b.lo	.LBB1_10
	b	.LBB1_1
.LBB1_21:                               // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #64]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	_ZTS15Polybench_2mm_2, .Lfunc_end1-_ZTS15Polybench_2mm_2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
