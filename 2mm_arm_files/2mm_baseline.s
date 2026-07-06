	.text
	.file	"2mm.cpp"
	.section	.text._ZTS15Polybench_2mm_1,"axG",@progbits,_ZTS15Polybench_2mm_1,comdat
	.weak	_ZTS15Polybench_2mm_1           // -- Begin function _ZTS15Polybench_2mm_1
	.p2align	2
	.type	_ZTS15Polybench_2mm_1,@function
_ZTS15Polybench_2mm_1:                  // @_ZTS15Polybench_2mm_1
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x8, x0, #2
	mov	x9, xzr
	mov	x29, sp
	b	.LBB0_2
.LBB0_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x9, x9, #1
	add	x3, x3, x8
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_5 Depth 2
                                        //       Child Loop BB0_7 Depth 3
	cmp	x9, x0
	b.hs	.LBB0_8
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x11, x9, x0
	mov	x10, xzr
	mov	x12, x2
	add	x11, x1, x11, lsl #2
	b	.LBB0_5
.LBB0_4:                                // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_5 Depth=2
	add	x10, x10, #1
	add	x12, x12, x8
.LBB0_5:                                // %for.cond2.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_7 Depth 3
	cmp	x10, x0
	b.hs	.LBB0_1
// %bb.6:                               // %for.cond7.i.preheader
                                        //   in Loop: Header=BB0_5 Depth=2
	mov	x13, xzr
	cmp	xzr, x0
	b.hs	.LBB0_4
.LBB0_7:                                // %for.body11.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_5 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x14, x13, #2
	ldr	s0, [x11, x10, lsl #2]
	add	x13, x13, #1
	ldr	s1, [x12, x14]
	ldr	s2, [x3, x14]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x14]
	cmp	x13, x0
	b.lo	.LBB0_7
	b	.LBB0_4
.LBB0_8:                                // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS15Polybench_2mm_1, .Lfunc_end0-_ZTS15Polybench_2mm_1
                                        // -- End function
	.section	.text._ZTS15Polybench_2mm_2,"axG",@progbits,_ZTS15Polybench_2mm_2,comdat
	.weak	_ZTS15Polybench_2mm_2           // -- Begin function _ZTS15Polybench_2mm_2
	.p2align	2
	.type	_ZTS15Polybench_2mm_2,@function
_ZTS15Polybench_2mm_2:                  // @_ZTS15Polybench_2mm_2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x8, x0, #2
	mov	x9, xzr
	mov	x29, sp
	b	.LBB1_2
.LBB1_1:                                // %for.cond.cleanup11.i
                                        //   in Loop: Header=BB1_2 Depth=1
	add	x9, x9, #1
	add	x3, x3, x8
.LBB1_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
                                        //     Child Loop BB1_7 Depth 2
                                        //       Child Loop BB1_9 Depth 3
	cmp	x9, x0
	b.hs	.LBB1_10
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB1_5
.LBB1_4:                                // %for.body6.i
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	str	wzr, [x3, x10, lsl #2]
	add	x10, x10, #1
	cmp	x10, x0
	b.lo	.LBB1_4
.LBB1_5:                                // %for.cond8.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	mul	x11, x9, x0
	mov	x10, xzr
	mov	x12, x2
	add	x11, x1, x11, lsl #2
	b	.LBB1_7
.LBB1_6:                                // %for.cond.cleanup17.i
                                        //   in Loop: Header=BB1_7 Depth=2
	add	x10, x10, #1
	add	x12, x12, x8
.LBB1_7:                                // %for.cond8.i
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB1_9 Depth 3
	cmp	x10, x0
	b.hs	.LBB1_1
// %bb.8:                               // %for.cond14.i.preheader
                                        //   in Loop: Header=BB1_7 Depth=2
	mov	x13, xzr
	cmp	xzr, x0
	b.hs	.LBB1_6
.LBB1_9:                                // %for.body18.i
                                        //   Parent Loop BB1_2 Depth=1
                                        //     Parent Loop BB1_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x14, x13, #2
	ldr	s0, [x11, x10, lsl #2]
	add	x13, x13, #1
	ldr	s1, [x12, x14]
	ldr	s2, [x3, x14]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x14]
	cmp	x13, x0
	b.lo	.LBB1_9
	b	.LBB1_6
.LBB1_10:                               // %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	_ZTS15Polybench_2mm_2, .Lfunc_end1-_ZTS15Polybench_2mm_2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
