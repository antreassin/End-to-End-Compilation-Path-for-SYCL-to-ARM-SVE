	.text
	.file	"bicg.cpp"
	.section	.text._ZTS5Bicg1,"axG",@progbits,_ZTS5Bicg1,comdat
	.weak	_ZTS5Bicg1                      // -- Begin function _ZTS5Bicg1
	.p2align	4
	.type	_ZTS5Bicg1,@function
_ZTS5Bicg1:                             // @_ZTS5Bicg1
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x9, x0, #2
	cntw	x13
	mov	x14, #-1                        // =0xffffffffffffffff
	ptrue	p0.s
	add	x11, x0, #1
	mov	x29, sp
	mov	x8, xzr
	mov	x15, x1
	add	x12, x9, #4
	incw	x14
	add	x10, x3, x12
	add	x12, x1, x12
	cmp	xzr, x0
	b.hs	.LBB0_10
	.p2align	5, , 16
.LBB0_1:                                // %for.cond2.i.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_6 Depth 2
                                        //     Child Loop BB0_8 Depth 2
	cmp	x11, x13
	b.hi	.LBB0_3
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	mov	x16, xzr
	b	.LBB0_8
	.p2align	5, , 16
.LBB0_3:                                // %vector.memcheck
                                        //   in Loop: Header=BB0_1 Depth=1
	mul	x17, x9, x8
	mov	x16, xzr
	add	x18, x1, x17
	add	x4, x12, x17
	add	x17, x2, x8, lsl #2
	add	x5, x17, #4
	cmp	x3, x5
	ccmp	x17, x10, #2, lo
	cset	w17, lo
	cmp	x18, x10
	ccmp	x3, x4, #2, lo
	b.lo	.LBB0_8
// %bb.4:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_1 Depth=1
	tbnz	w17, #0, .LBB0_8
// %bb.5:                               // %vector.ph
                                        //   in Loop: Header=BB0_1 Depth=1
	ands	x16, x11, x14
	mov	x17, xzr
	csel	x16, x13, x16, eq
	sub	x16, x11, x16
	.p2align	5, , 16
.LBB0_6:                                // %vector.body
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x18, x2, x8, lsl #2
	ld1w	{ z0.s }, p0/z, [x15, x17, lsl #2]
	ld1w	{ z2.s }, p0/z, [x3, x17, lsl #2]
	ld1rw	{ z1.s }, p0/z, [x18]
	fmad	z0.s, p0/m, z1.s, z2.s
	st1w	{ z0.s }, p0, [x3, x17, lsl #2]
	incw	x17
	cmp	x16, x17
	b.ne	.LBB0_6
	b	.LBB0_8
	.p2align	5, , 16
.LBB0_7:                                // %for.body6.i
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	s0, [x15, x16, lsl #2]
	ldr	s1, [x2, x8, lsl #2]
	ldr	s2, [x3, x16, lsl #2]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x16, lsl #2]
	add	x16, x16, #1
.LBB0_8:                                // %for.cond2.i
                                        //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	x16, x0
	b.lo	.LBB0_7
// %bb.9:                               // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_1 Depth=1
	add	x8, x8, #1
	add	x15, x15, x9
	cmp	x8, x0
	b.lo	.LBB0_1
.LBB0_10:                               // %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS5Bicg1, .Lfunc_end0-_ZTS5Bicg1
                                        // -- End function
	.section	.text._ZTS5Bicg2,"axG",@progbits,_ZTS5Bicg2,comdat
	.weak	_ZTS5Bicg2                      // -- Begin function _ZTS5Bicg2
	.p2align	4
	.type	_ZTS5Bicg2,@function
_ZTS5Bicg2:                             // @_ZTS5Bicg2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	mov	w15, #-2147483648               // =0x80000000
	lsl	x9, x0, #2
	cntw	x13
	mov	x14, #-1                        // =0xffffffffffffffff
	ptrue	p0.s, vl1
	add	x11, x0, #1
	mov	x29, sp
	mov	x8, xzr
	ptrue	p1.s
	add	x12, x9, #4
	mov	z0.s, w15
	incw	x14
	mov	x15, x1
	add	x10, x2, x12
	add	x12, x1, x12
	cmp	xzr, x0
	b.hs	.LBB1_11
	.p2align	5, , 16
.LBB1_1:                                // %for.cond2.i.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_6 Depth 2
                                        //     Child Loop BB1_9 Depth 2
	ldr	s1, [x3, x8, lsl #2]
	cmp	x11, x13
	b.hi	.LBB1_3
// %bb.2:                               //   in Loop: Header=BB1_1 Depth=1
	mov	x16, xzr
	b	.LBB1_9
	.p2align	5, , 16
.LBB1_3:                                // %vector.memcheck
                                        //   in Loop: Header=BB1_1 Depth=1
	add	x18, x3, x8, lsl #2
	mul	x17, x9, x8
	mov	x16, xzr
	add	x4, x18, #4
	cmp	x18, x10
	add	x5, x1, x17
	ccmp	x2, x4, #2, lo
	add	x6, x12, x17
	cset	w17, lo
	cmp	x5, x4
	ccmp	x18, x6, #2, lo
	b.lo	.LBB1_9
// %bb.4:                               // %vector.memcheck
                                        //   in Loop: Header=BB1_1 Depth=1
	tbnz	w17, #0, .LBB1_9
// %bb.5:                               // %vector.ph
                                        //   in Loop: Header=BB1_1 Depth=1
	ands	x16, x11, x14
	sel	z2.s, p0, z1.s, z0.s
	mov	x17, xzr
	csel	x16, x13, x16, eq
	sub	x16, x11, x16
	.p2align	5, , 16
.LBB1_6:                                // %vector.body
                                        //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ld1w	{ z1.s }, p1/z, [x15, x17, lsl #2]
	ld1w	{ z3.s }, p1/z, [x2, x17, lsl #2]
	incw	x17
	cmp	x16, x17
	fmla	z2.s, p1/m, z1.s, z3.s
	b.ne	.LBB1_6
// %bb.7:                               // %middle.block
                                        //   in Loop: Header=BB1_1 Depth=1
	movi	v1.2s, #128, lsl #24
	fadda	s1, p1, s1, z2.s
	str	s1, [x3, x8, lsl #2]
	b	.LBB1_9
	.p2align	5, , 16
.LBB1_8:                                // %for.body6.i
                                        //   in Loop: Header=BB1_9 Depth=2
	ldr	s2, [x15, x16, lsl #2]
	ldr	s3, [x2, x16, lsl #2]
	add	x16, x16, #1
	fmadd	s1, s2, s3, s1
	str	s1, [x3, x8, lsl #2]
.LBB1_9:                                // %for.cond2.i
                                        //   Parent Loop BB1_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	x16, x0
	b.lo	.LBB1_8
// %bb.10:                              // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB1_1 Depth=1
	add	x8, x8, #1
	add	x15, x15, x9
	cmp	x8, x0
	b.lo	.LBB1_1
.LBB1_11:                               // %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	_ZTS5Bicg2, .Lfunc_end1-_ZTS5Bicg2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
