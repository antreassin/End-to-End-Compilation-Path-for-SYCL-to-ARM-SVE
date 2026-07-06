	.text
	.file	"syrk.cpp"
	.section	.text._ZTS6Syr2k2,"axG",@progbits,_ZTS6Syr2k2,comdat
	.weak	_ZTS6Syr2k2                     // -- Begin function _ZTS6Syr2k2
	.p2align	4
	.type	_ZTS6Syr2k2,@function
_ZTS6Syr2k2:                            // @_ZTS6Syr2k2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	mov	w14, #1123418112                // =0x42f60000
	mov	w16, #-2147483648               // =0x80000000
	lsl	x9, x0, #2
	mov	w12, #49152                     // =0xc000
	cntw	x13
	mov	x15, #-1                        // =0xffffffffffffffff
	stp	x24, x23, [sp, #16]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	ptrue	p0.s, vl1
	ptrue	p1.s
	add	x11, x0, #1
	mov	x29, sp
	mov	z0.s, w16
	add	x10, x9, #4
	movk	w12, #18018, lsl #16
	mov	x8, xzr
	mov	x16, x1
	mov	z1.s, w14
	incw	x15
	b	.LBB0_2
	.p2align	5, , 16
.LBB0_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	add	x16, x16, x9
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
                                        //       Child Loop BB0_9 Depth 3
                                        //       Child Loop BB0_12 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_14
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x18, x9, x8
	mul	x6, x8, x0
	add	x5, x1, x10
	mov	x17, xzr
	mov	x7, x1
	add	x3, x18, #4
	add	x4, x1, x18
	add	x5, x5, x18
	add	x6, x2, x6, lsl #2
	cmp	xzr, x0
	b.hs	.LBB0_1
	.p2align	5, , 16
.LBB0_4:                                // %for.body6.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_9 Depth 3
                                        //       Child Loop BB0_12 Depth 3
	ldr	s2, [x6, x17, lsl #2]
	fmov	s3, w12
	cmp	x11, x13
	fmul	s2, s2, s3
	str	s2, [x6, x17, lsl #2]
	b.hi	.LBB0_6
// %bb.5:                               //   in Loop: Header=BB0_4 Depth=2
	mov	x19, xzr
	b	.LBB0_12
	.p2align	5, , 16
.LBB0_6:                                // %vector.memcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	add	x20, x18, x17, lsl #2
	add	x24, x1, x10
	mov	x19, xzr
	add	x21, x2, x20
	add	x20, x3, x17, lsl #2
	add	x22, x2, x20
	mul	x20, x9, x17
	cmp	x21, x5
	ccmp	x4, x22, #2, lo
	add	x23, x1, x20
	add	x24, x24, x20
	cset	w20, lo
	cmp	x23, x22
	ccmp	x21, x24, #2, lo
	b.lo	.LBB0_12
// %bb.7:                               // %vector.memcheck
                                        //   in Loop: Header=BB0_4 Depth=2
	tbnz	w20, #0, .LBB0_12
// %bb.8:                               // %vector.ph
                                        //   in Loop: Header=BB0_4 Depth=2
	ands	x19, x11, x15
	sel	z2.s, p0, z2.s, z0.s
	mov	x20, xzr
	csel	x19, x13, x19, eq
	sub	x19, x11, x19
	.p2align	5, , 16
.LBB0_9:                                // %vector.body
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ld1w	{ z3.s }, p1/z, [x16, x20, lsl #2]
	ld1w	{ z4.s }, p1/z, [x7, x20, lsl #2]
	incw	x20
	cmp	x19, x20
	fmul	z3.s, z3.s, z1.s
	fmla	z2.s, p1/m, z3.s, z4.s
	b.ne	.LBB0_9
// %bb.10:                              // %middle.block
                                        //   in Loop: Header=BB0_4 Depth=2
	faddv	s2, p1, z2.s
	str	s2, [x6, x17, lsl #2]
	b	.LBB0_12
	.p2align	5, , 16
.LBB0_11:                               // %for.body13.i
                                        //   in Loop: Header=BB0_12 Depth=3
	ldr	s3, [x16, x19, lsl #2]
	fmov	s4, w14
	fmul	s3, s3, s4
	ldr	s4, [x7, x19, lsl #2]
	add	x19, x19, #1
	fmadd	s2, s3, s4, s2
	str	s2, [x6, x17, lsl #2]
.LBB0_12:                               // %for.cond9.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_4 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	cmp	x19, x0
	b.lo	.LBB0_11
// %bb.13:                              // %for.cond.cleanup12.i
                                        //   in Loop: Header=BB0_4 Depth=2
	add	x17, x17, #1
	add	x7, x7, x9
	cmp	x17, x0
	b.lo	.LBB0_4
	b	.LBB0_1
.LBB0_14:                               // %_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS6Syr2k2, .Lfunc_end0-_ZTS6Syr2k2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
