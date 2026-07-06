	.text
	.file	"2dconvolution.cpp"
	.section	.text._ZTS6conv2D,"axG",@progbits,_ZTS6conv2D,comdat
	.weak	_ZTS6conv2D                     // -- Begin function _ZTS6conv2D
	.p2align	4
	.type	_ZTS6conv2D,@function
_ZTS6conv2D:                            // @_ZTS6conv2D
// %bb.0:                               // %polly.split_new_and_old
	sub	sp, sp, #256
	subs	x8, x0, #1
	stp	x29, x30, [sp, #160]            // 16-byte Folded Spill
	stp	x28, x27, [sp, #176]            // 16-byte Folded Spill
	add	x29, sp, #160
	smulh	x10, x8, x0
	mul	x9, x8, x0
	stp	x26, x25, [sp, #192]            // 16-byte Folded Spill
	stp	x24, x23, [sp, #208]            // 16-byte Folded Spill
	cmp	x10, x9, asr #63
	stp	x22, x21, [sp, #224]            // 16-byte Folded Spill
	cset	w13, ne
	adds	x10, x9, x0
	stp	x20, x19, [sp, #240]            // 16-byte Folded Spill
	str	x0, [sp, #80]                   // 8-byte Folded Spill
	cset	w9, vs
	adds	x11, x0, #1
	add	x15, x1, x10, lsl #2
	cset	w10, vs
	subs	x12, x0, #2
	add	x16, x2, x11, lsl #2
	mul	x17, x12, x0
	smulh	x12, x12, x0
	cset	w11, vs
	cmp	x12, x17, asr #63
	cset	w14, ne
	adds	x8, x17, x8
	cset	w12, vs
	cmp	x15, x16
	add	x8, x2, x8, lsl #2
	ccmp	x8, x1, #0, hi
	cset	w15, hi
	subs	x8, x0, #1
	b.lt	.LBB0_24
// %bb.1:                               // %polly.split_new_and_old
	tbnz	w15, #0, .LBB0_24
// %bb.2:                               // %polly.split_new_and_old
	tbnz	w13, #0, .LBB0_24
// %bb.3:                               // %polly.split_new_and_old
	tbnz	w9, #0, .LBB0_24
// %bb.4:                               // %polly.split_new_and_old
	tbnz	w10, #0, .LBB0_24
// %bb.5:                               // %polly.split_new_and_old
	tbnz	w11, #0, .LBB0_24
// %bb.6:                               // %polly.split_new_and_old
	tbnz	w14, #0, .LBB0_24
// %bb.7:                               // %polly.split_new_and_old
	cbnz	w12, .LBB0_24
// %bb.8:                               // %polly.loop_if
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	sub	x8, x8, #3
	asr	x9, x8, #5
	str	x9, [sp, #16]                   // 8-byte Folded Spill
	tbnz	x9, #63, .LBB0_29
// %bb.9:                               // %polly.loop_preheader
	ldr	x10, [sp, #80]                  // 8-byte Folded Reload
	lsr	x8, x8, #5
	mov	w12, #39322                     // =0x999a
	mov	w17, #52429                     // =0xcccd
	mov	w3, #39322                      // =0x999a
	mov	w4, #13107                      // =0x3333
	mov	w5, #52429                      // =0xcccd
	mov	x13, xzr
	fmov	s2, #0.50000000
	movi	v4.4s, #63, lsl #24
	str	x8, [sp, #64]                   // 8-byte Folded Spill
	mov	w6, #26214                      // =0x6666
	mov	w7, #52429                      // =0xcccd
	add	x11, x1, #8
	movk	w12, #48793, lsl #16
	movk	w17, #15948, lsl #16
	movk	w3, #16153, lsl #16
	movk	w4, #16179, lsl #16
	movk	w5, #48972, lsl #16
	movk	w6, #48998, lsl #16
	movk	w7, #15820, lsl #16
	dup	v0.4s, w12
	dup	v1.4s, w17
	dup	v5.4s, w3
	dup	v6.4s, w4
	lsl	x8, x10, #7
	lsl	x9, x10, #2
	add	x14, x11, x10, lsl #2
	add	x15, x11, x10, lsl #3
	dup	v7.4s, w5
	dup	v16.4s, w6
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	add	x8, x2, x10, lsl #2
	mov	w2, #52429                      // =0xcccd
	movk	w2, #16076, lsl #16
	add	x16, x8, #4
	dup	v17.4s, w7
	dup	v3.4s, w2
	b	.LBB0_11
	.p2align	5, , 16
.LBB0_10:                               // %polly.loop_exit39
                                        //   in Loop: Header=BB0_11 Depth=1
	ldp	x8, x10, [sp, #16]              // 16-byte Folded Reload
	ldp	x14, x11, [sp, #48]             // 16-byte Folded Reload
	ldp	x16, x15, [sp, #32]             // 16-byte Folded Reload
	cmp	x10, x8
	add	x13, x10, #1
	ldr	x10, [sp, #8]                   // 8-byte Folded Reload
	add	x11, x11, x10
	add	x14, x14, x10
	add	x15, x15, x10
	add	x16, x16, x10
	b.ge	.LBB0_29
.LBB0_11:                               // %polly.loop_preheader38
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_13 Depth 2
                                        //       Child Loop BB0_16 Depth 3
                                        //         Child Loop BB0_20 Depth 4
                                        //         Child Loop BB0_23 Depth 4
	ldr	x10, [sp, #80]                  // 8-byte Folded Reload
	str	x13, [sp, #24]                  // 8-byte Folded Spill
	mov	w8, #34                         // =0x22
	stur	xzr, [x29, #-16]                // 8-byte Folded Spill
	mov	x18, xzr
	sub	x13, x10, x13, lsl #5
	str	x16, [sp, #32]                  // 8-byte Folded Spill
	stur	x16, [x29, #-32]                // 8-byte Folded Spill
	str	x15, [sp, #40]                  // 8-byte Folded Spill
	stur	x15, [x29, #-40]                // 8-byte Folded Spill
	str	x14, [sp, #48]                  // 8-byte Folded Spill
	stur	x14, [x29, #-48]                // 8-byte Folded Spill
	str	x11, [sp, #56]                  // 8-byte Folded Spill
	stur	x11, [x29, #-56]                // 8-byte Folded Spill
	cmp	x13, #34
	str	x13, [sp, #72]                  // 8-byte Folded Spill
	csel	x8, x13, x8, lt
	mov	x13, x10
	sub	x8, x8, #3
	stur	x8, [x29, #-8]                  // 8-byte Folded Spill
	b	.LBB0_13
	.p2align	5, , 16
.LBB0_12:                               // %polly.loop_exit46
                                        //   in Loop: Header=BB0_13 Depth=2
	ldr	x8, [sp, #64]                   // 8-byte Folded Reload
	ldp	x13, x10, [x29, #-72]           // 16-byte Folded Reload
	cmp	x10, x8
	add	x18, x10, #1
	ldp	x11, x10, [x29, #-56]           // 16-byte Folded Reload
	sub	x13, x13, #32
	add	x8, x11, #128
	add	x10, x10, #128
	stp	x8, x10, [x29, #-56]            // 16-byte Folded Spill
	ldp	x11, x10, [x29, #-40]           // 16-byte Folded Reload
	add	x8, x11, #128
	add	x10, x10, #128
	stp	x8, x10, [x29, #-40]            // 16-byte Folded Spill
	ldur	x10, [x29, #-16]                // 8-byte Folded Reload
	add	x10, x10, #32
	stur	x10, [x29, #-16]                // 8-byte Folded Spill
	b.hs	.LBB0_10
.LBB0_13:                               // %polly.loop_if43
                                        //   Parent Loop BB0_11 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_16 Depth 3
                                        //         Child Loop BB0_20 Depth 4
                                        //         Child Loop BB0_23 Depth 4
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	cmp	x13, #34
	mov	w11, #34                        // =0x22
	stp	x13, x18, [x29, #-72]           // 16-byte Folded Spill
	csel	x10, x13, x11, lt
	sub	x28, x8, x18, lsl #5
	cmp	x28, #34
	csel	x8, x28, x11, lt
	ldr	x11, [sp, #72]                  // 8-byte Folded Reload
	cmp	x11, #3
	b.lt	.LBB0_12
// %bb.14:                              // %polly.loop_if51.preheader
                                        //   in Loop: Header=BB0_13 Depth=2
	sub	x10, x10, #3
	ldp	x1, x20, [sp, #48]              // 16-byte Folded Reload
	ldp	x24, x22, [x29, #-40]           // 16-byte Folded Reload
	ldp	x26, x25, [x29, #-56]           // 16-byte Folded Reload
	sub	x8, x8, #3
	cmp	x28, #34
	mov	x11, xzr
	bic	x10, x10, x10, asr #63
	bic	x8, x8, x8, asr #63
	add	w13, w10, #1
	add	x8, x8, #1
	and	x13, x13, #0x3
	sub	x10, x10, x13
	ldp	x13, x0, [sp, #32]              // 16-byte Folded Reload
	add	x10, x10, #1
	stur	x10, [x29, #-24]                // 8-byte Folded Spill
	mov	w10, #34                        // =0x22
	csel	x10, x28, x10, lt
	sub	x14, x10, #3
	b	.LBB0_16
	.p2align	5, , 16
.LBB0_15:                               // %polly.loop_exit54
                                        //   in Loop: Header=BB0_16 Depth=3
	ldur	x10, [x29, #-8]                 // 8-byte Folded Reload
	add	x26, x26, x9
	add	x25, x25, x9
	add	x24, x24, x9
	add	x22, x22, x9
	add	x20, x20, x9
	add	x1, x1, x9
	add	x0, x0, x9
	add	x13, x13, x9
	cmp	x11, x10
	add	x11, x11, #1
	b.ge	.LBB0_12
.LBB0_16:                               // %polly.loop_if51
                                        //   Parent Loop BB0_11 Depth=1
                                        //     Parent Loop BB0_13 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_20 Depth 4
                                        //         Child Loop BB0_23 Depth 4
	cmp	x28, #3
	b.lt	.LBB0_15
// %bb.17:                              // %polly.stmt.for.body7.i.preheader
                                        //   in Loop: Header=BB0_16 Depth=3
	cmp	x8, #4
	b.hs	.LBB0_19
// %bb.18:                              //   in Loop: Header=BB0_16 Depth=3
	mov	x10, xzr
	b	.LBB0_22
	.p2align	5, , 16
.LBB0_19:                               // %vector.ph
                                        //   in Loop: Header=BB0_16 Depth=3
	ldur	x30, [x29, #-24]                // 8-byte Folded Reload
	and	x10, x8, #0xfffffffffffffffc
	mov	x15, x22
	mov	x16, x24
	mov	x18, x25
	mov	x23, x26
	.p2align	5, , 16
.LBB0_20:                               // %vector.body
                                        //   Parent Loop BB0_11 Depth=1
                                        //     Parent Loop BB0_13 Depth=2
                                        //       Parent Loop BB0_16 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	q19, [x18, #-8]
	ldur	q18, [x23, #-8]
	subs	x30, x30, #4
	fmul	v19.4s, v19.4s, v0.4s
	fmla	v19.4s, v1.4s, v18.4s
	ldur	q18, [x16, #-8]
	fmla	v19.4s, v3.4s, v18.4s
	ldur	q18, [x23, #-4]
	fmla	v19.4s, v4.4s, v18.4s
	ldur	q18, [x18, #-4]
	fmla	v19.4s, v5.4s, v18.4s
	ldur	q18, [x16, #-4]
	fmla	v19.4s, v6.4s, v18.4s
	ldr	q18, [x23], #16
	fmla	v19.4s, v7.4s, v18.4s
	ldr	q18, [x18], #16
	fmla	v19.4s, v16.4s, v18.4s
	ldr	q18, [x16], #16
	fmla	v19.4s, v17.4s, v18.4s
	str	q19, [x15], #16
	b.ne	.LBB0_20
// %bb.21:                              // %middle.block
                                        //   in Loop: Header=BB0_16 Depth=3
	cmp	x8, x10
	b.eq	.LBB0_15
.LBB0_22:                               // %polly.stmt.for.body7.i.preheader1
                                        //   in Loop: Header=BB0_16 Depth=3
	ldur	x15, [x29, #-16]                // 8-byte Folded Reload
	sub	x30, x10, #1
	mov	x18, x13
	mov	x16, x0
	add	x10, x15, x10
	mov	x15, x1
	lsl	x23, x10, #2
	mov	x10, x20
	.p2align	5, , 16
.LBB0_23:                               // %polly.stmt.for.body7.i
                                        //   Parent Loop BB0_11 Depth=1
                                        //     Parent Loop BB0_13 Depth=2
                                        //       Parent Loop BB0_16 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x19, x15, x23
	add	x27, x10, x23
	fmov	s18, w12
	add	x21, x16, x23
	add	x30, x30, #1
	add	x10, x10, #4
	add	x15, x15, #4
	ldp	s19, s20, [x19, #-8]
	ldp	s21, s22, [x27, #-8]
	add	x16, x16, #4
	cmp	x30, x14
	fmul	s18, s19, s18
	fmov	s19, w17
	fmadd	s18, s21, s19, s18
	ldp	s21, s23, [x21, #-8]
	fmov	s19, w2
	fmadd	s18, s21, s19, s18
	fmov	s19, w3
	fmadd	s18, s22, s2, s18
	fmadd	s18, s20, s19, s18
	fmov	s19, w4
	ldr	s20, [x27]
	fmadd	s18, s23, s19, s18
	fmov	s19, w5
	fmadd	s18, s20, s19, s18
	ldr	s19, [x19]
	fmov	s20, w6
	fmadd	s18, s19, s20, s18
	ldr	s19, [x21]
	fmov	s20, w7
	fmadd	s18, s19, s20, s18
	str	s18, [x18, x23]
	add	x18, x18, #4
	b.lt	.LBB0_23
	b	.LBB0_15
.LBB0_24:                               // %for.cond.i.preheader
	ldr	x12, [sp, #80]                  // 8-byte Folded Reload
	mov	w15, #39322                     // =0x999a
	mov	w16, #52429                     // =0xcccd
	mov	w17, #52429                     // =0xcccd
	mov	w18, #39322                     // =0x999a
	mov	w0, #13107                      // =0x3333
	mov	w3, #26214                      // =0x6666
	mov	x9, xzr
	fmov	s0, #0.50000000
	mov	w4, #52429                      // =0xcccd
	mov	w14, #1                         // =0x1
	movk	w15, #48793, lsl #16
	movk	w16, #15948, lsl #16
	movk	w17, #16076, lsl #16
	movk	w18, #16153, lsl #16
	movk	w0, #16179, lsl #16
	movk	w3, #48998, lsl #16
	movk	w4, #15820, lsl #16
	lsl	x10, x12, #2
	add	x12, x1, x12, lsl #3
	add	x13, x10, #4
	add	x12, x12, #4
	add	x11, x1, x13
	add	x13, x2, x13
	mov	w2, #52429                      // =0xcccd
	movk	w2, #48972, lsl #16
	b	.LBB0_26
	.p2align	5, , 16
.LBB0_25:                               // %for.cond.i.loopexit
                                        //   in Loop: Header=BB0_26 Depth=1
	add	x9, x9, x10
.LBB0_26:                               // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_28 Depth 2
	cmp	x14, x8
	b.hs	.LBB0_29
// %bb.27:                              // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_26 Depth=1
	add	x14, x14, #1
	mov	w6, #1                          // =0x1
	mov	x5, x9
	cmp	x6, x8
	b.hs	.LBB0_25
	.p2align	5, , 16
.LBB0_28:                               // %for.body7.i
                                        //   Parent Loop BB0_26 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x19, x11, x5
	add	x7, x1, x5
	fmov	s2, w15
	add	x20, x12, x5
	add	x6, x6, #1
	ldur	s1, [x19, #-4]
	ldp	s3, s4, [x7]
	fmul	s1, s1, s2
	fmov	s2, w16
	fmadd	s1, s3, s2, s1
	ldur	s2, [x20, #-4]
	fmov	s3, w17
	fmadd	s1, s2, s3, s1
	fmov	s2, w18
	fmadd	s1, s4, s0, s1
	ldp	s3, s4, [x19]
	fmadd	s1, s3, s2, s1
	ldp	s3, s5, [x20]
	fmov	s2, w0
	fmadd	s1, s3, s2, s1
	ldr	s2, [x7, #8]
	fmov	s3, w2
	fmadd	s1, s2, s3, s1
	fmov	s2, w3
	fmadd	s1, s4, s2, s1
	fmov	s2, w4
	fmadd	s1, s5, s2, s1
	str	s1, [x13, x5]
	add	x5, x5, #4
	cmp	x6, x8
	b.lo	.LBB0_28
	b	.LBB0_25
.LBB0_29:                               // %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #240]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]            // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]            // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]            // 16-byte Folded Reload
	add	sp, sp, #256
	ret
.Lfunc_end0:
	.size	_ZTS6conv2D, .Lfunc_end0-_ZTS6conv2D
                                        // -- End function
	.ident	"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"
	.section	".note.GNU-stack","",@progbits
