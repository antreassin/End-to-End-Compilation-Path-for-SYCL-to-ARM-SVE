	.text
	.file	"syrk.cpp"
	.section	.text._ZTS6Syr2k2,"axG",@progbits,_ZTS6Syr2k2,comdat
	.weak	_ZTS6Syr2k2                     // -- Begin function _ZTS6Syr2k2
	.p2align	2
	.type	_ZTS6Syr2k2,@function
_ZTS6Syr2k2:                            // @_ZTS6Syr2k2
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x9, x0, #2
	mov	w10, #49152                     // =0xc000
	mov	x8, xzr
	movk	w10, #18018, lsl #16
	mov	w11, #1123418112                // =0x42f60000
	mov	x12, x1
	mov	x29, sp
	b	.LBB0_2
.LBB0_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	add	x12, x12, x9
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_5 Depth 2
                                        //       Child Loop BB0_7 Depth 3
	cmp	x8, x0
	b.hs	.LBB0_8
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mul	x14, x8, x0
	mov	x13, xzr
	mov	x15, x1
	add	x14, x2, x14, lsl #2
	b	.LBB0_5
.LBB0_4:                                // %for.cond.cleanup12.i
                                        //   in Loop: Header=BB0_5 Depth=2
	add	x13, x13, #1
	add	x15, x15, x9
.LBB0_5:                                // %for.cond2.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_7 Depth 3
	cmp	x13, x0
	b.hs	.LBB0_1
// %bb.6:                               // %for.body6.i
                                        //   in Loop: Header=BB0_5 Depth=2
	lsl	x17, x13, #2
	fmov	s1, w10
	mov	x16, xzr
	ldr	s0, [x14, x17]
	fmul	s0, s0, s1
	str	s0, [x14, x17]
	cmp	xzr, x0
	b.hs	.LBB0_4
.LBB0_7:                                // %for.body13.i
                                        //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_5 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x17, x16, #2
	fmov	s2, w11
	add	x16, x16, #1
	ldr	s1, [x12, x17]
	fmul	s1, s1, s2
	ldr	s2, [x15, x17]
	fmadd	s0, s1, s2, s0
	str	s0, [x14, x13, lsl #2]
	cmp	x16, x0
	b.lo	.LBB0_7
	b	.LBB0_4
.LBB0_8:                                // %_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x29, x30, [sp], #16             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS6Syr2k2, .Lfunc_end0-_ZTS6Syr2k2
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
