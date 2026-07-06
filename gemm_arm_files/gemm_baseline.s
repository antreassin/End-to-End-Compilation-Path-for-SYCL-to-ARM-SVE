	.text
	.file	"gemm.cpp"
	.section	.text._ZTS4Gemm,"axG",@progbits,_ZTS4Gemm,comdat
	.weak	_ZTS4Gemm                       // -- Begin function _ZTS4Gemm
	.p2align	2
	.type	_ZTS4Gemm,@function
_ZTS4Gemm:                              // @_ZTS4Gemm
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x9, x1, #2
	mov	w10, #45056                     // =0xb000
	mov	w11, #14336                     // =0x3800
	mov	x8, xzr
	movk	w10, #17668, lsl #16
	movk	w11, #18173, lsl #16
	mov	x29, sp
	b	.LBB0_2
.LBB0_1:                                // %for.cond.cleanup10.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	add	x5, x5, x9
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_9 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_10
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mov	x12, xzr
	cmp	xzr, x1
	b.hs	.LBB0_5
.LBB0_4:                                // %for.body5.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsl	x13, x12, #2
	fmov	s1, w10
	add	x12, x12, #1
	ldr	s0, [x5, x13]
	fmul	s0, s0, s1
	str	s0, [x5, x13]
	cmp	x12, x1
	b.lo	.LBB0_4
.LBB0_5:                                // %for.cond8.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x13, x8, x2
	mov	x12, xzr
	mov	x14, x4
	add	x13, x3, x13, lsl #2
	b	.LBB0_7
.LBB0_6:                                // %for.cond.cleanup21.i
                                        //   in Loop: Header=BB0_7 Depth=2
	add	x12, x12, #1
	add	x14, x14, x9
.LBB0_7:                                // %for.cond8.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_9 Depth 3
	cmp	x12, x2
	b.hs	.LBB0_1
// %bb.8:                               // %for.body11.i
                                        //   in Loop: Header=BB0_7 Depth=2
	fmov	s1, w11
	ldr	s0, [x13, x12, lsl #2]
	mov	x15, xzr
	fmul	s0, s0, s1
	cmp	xzr, x1
	b.hs	.LBB0_6
.LBB0_9:                                // %for.body22.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x16, x15, #2
	add	x15, x15, #1
	ldr	s1, [x14, x16]
	ldr	s2, [x5, x16]
	fmadd	s1, s0, s1, s2
	str	s1, [x5, x16]
	cmp	x15, x1
	b.lo	.LBB0_9
	b	.LBB0_6
.LBB0_10:                               // %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS4Gemm, .Lfunc_end0-_ZTS4Gemm
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
