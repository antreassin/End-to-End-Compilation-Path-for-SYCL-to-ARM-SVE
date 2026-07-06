	.text
	.file	"bicg.cpp"
	.section	.text._ZTS5Bicg1,"axG",@progbits,_ZTS5Bicg1,comdat
	.weak	_ZTS5Bicg1                      // -- Begin function _ZTS5Bicg1
	.p2align	2
	.type	_ZTS5Bicg1,@function
_ZTS5Bicg1:                             // @_ZTS5Bicg1
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x8, x0, #2
	mov	x9, xzr
	mov	x29, sp
	b	.LBB0_2
.LBB0_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x9, x9, #1
	add	x1, x1, x8
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
	cmp	x9, x0
	b.hs	.LBB0_5
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB0_1
.LBB0_4:                                // %for.body6.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl	x11, x10, #2
	ldr	s1, [x2, x9, lsl #2]
	add	x10, x10, #1
	ldr	s0, [x1, x11]
	ldr	s2, [x3, x11]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x11]
	cmp	x10, x0
	b.lo	.LBB0_4
	b	.LBB0_1
.LBB0_5:                                // %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS5Bicg1, .Lfunc_end0-_ZTS5Bicg1
                                        // -- End function
	.section	.text._ZTS5Bicg2,"axG",@progbits,_ZTS5Bicg2,comdat
	.weak	_ZTS5Bicg2                      // -- Begin function _ZTS5Bicg2
	.p2align	2
	.type	_ZTS5Bicg2,@function
_ZTS5Bicg2:                             // @_ZTS5Bicg2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x8, x0, #2
	mov	x9, xzr
	mov	x29, sp
	b	.LBB1_2
.LBB1_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB1_2 Depth=1
	add	x9, x9, #1
	add	x1, x1, x8
.LBB1_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
	cmp	x9, x0
	b.hs	.LBB1_5
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	ldr	s0, [x3, x9, lsl #2]
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB1_1
.LBB1_4:                                // %for.body6.i
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl	x11, x10, #2
	add	x10, x10, #1
	ldr	s1, [x1, x11]
	ldr	s2, [x2, x11]
	fmadd	s0, s1, s2, s0
	str	s0, [x3, x9, lsl #2]
	cmp	x10, x0
	b.lo	.LBB1_4
	b	.LBB1_1
.LBB1_5:                                // %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	_ZTS5Bicg2, .Lfunc_end1-_ZTS5Bicg2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
