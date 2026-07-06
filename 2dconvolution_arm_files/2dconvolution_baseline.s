	.text
	.file	"2dconvolution.cpp"
	.section	.text._ZTS6conv2D,"axG",@progbits,_ZTS6conv2D,comdat
	.weak	_ZTS6conv2D                     // -- Begin function _ZTS6conv2D
	.p2align	2
	.type	_ZTS6conv2D,@function
_ZTS6conv2D:                            // @_ZTS6conv2D
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	lsl	x10, x0, #2
	add	x14, x1, x0, lsl #3
	fmov	s0, #0.50000000
	mov	w11, #39322                     // =0x999a
	mov	w12, #52429                     // =0xcccd
	sub	x13, x0, #1
	add	x16, x10, #4
	mov	w17, #52429                     // =0xcccd
	mov	w18, #39322                     // =0x999a
	add	x15, x1, x16
	add	x16, x2, x16
	mov	w0, #13107                      // =0x3333
	mov	w2, #52429                      // =0xcccd
	mov	w3, #26214                      // =0x6666
	mov	w4, #52429                      // =0xcccd
	mov	x8, xzr
	mov	w9, #1                          // =0x1
	movk	w11, #48793, lsl #16
	movk	w12, #15948, lsl #16
	add	x14, x14, #4
	movk	w17, #16076, lsl #16
	movk	w18, #16153, lsl #16
	movk	w0, #16179, lsl #16
	movk	w2, #48972, lsl #16
	movk	w3, #48998, lsl #16
	movk	w4, #15820, lsl #16
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	mov	x29, sp
	b	.LBB0_2
.LBB0_1:                                // %for.cond.cleanup6.i
                                        //   in Loop: Header=BB0_2 Depth=1
	add	x9, x9, #1
	add	x8, x8, x10
.LBB0_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
	cmp	x9, x13
	b.hs	.LBB0_5
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_2 Depth=1
	mov	x5, x8
	mov	w6, #1                          // =0x1
	cmp	x6, x13
	b.hs	.LBB0_1
.LBB0_4:                                // %for.body7.i
                                        //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x7, x15, x5
	fmov	s2, w11
	add	x19, x1, x5
	ldur	s1, [x7, #-4]
	fmov	s3, w12
	add	x20, x14, x5
	add	x6, x6, #1
	fmul	s1, s1, s2
	ldp	s2, s4, [x19]
	fmadd	s1, s2, s3, s1
	fmov	s3, w17
	ldur	s2, [x20, #-4]
	fmadd	s1, s2, s3, s1
	fmov	s3, w18
	fmadd	s1, s4, s0, s1
	ldp	s2, s4, [x7]
	fmadd	s1, s2, s3, s1
	ldp	s2, s5, [x20]
	fmov	s3, w0
	fmadd	s1, s2, s3, s1
	fmov	s3, w2
	ldr	s2, [x19, #8]
	fmadd	s1, s2, s3, s1
	fmov	s2, w3
	fmadd	s1, s4, s2, s1
	fmov	s2, w4
	fmadd	s1, s5, s2, s1
	str	s1, [x16, x5]
	add	x5, x5, #4
	cmp	x6, x13
	b.lo	.LBB0_4
	b	.LBB0_1
.LBB0_5:                                // %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS6conv2D, .Lfunc_end0-_ZTS6conv2D
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
