	.text
	.file	"bicg.cpp"
	.section	.text._ZTS5Bicg1,"axG",@progbits,_ZTS5Bicg1,comdat
	.weak	_ZTS5Bicg1                      // -- Begin function _ZTS5Bicg1
	.p2align	4
	.type	_ZTS5Bicg1,@function
_ZTS5Bicg1:                             // @_ZTS5Bicg1
// %bb.0:                               // %polly.split_new_and_old
	stp	x29, x30, [sp, #-64]!           // 16-byte Folded Spill
	add	x8, x2, x0, lsl #2
	add	x13, x3, x0, lsl #2
	str	x23, [sp, #16]                  // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	cmp	x8, x3
	stp	x20, x19, [sp, #48]             // 16-byte Folded Spill
	ccmp	x13, x2, #0, hi
	cset	w12, hi
	subs	x10, x0, #1
	smulh	x11, x10, x0
	mul	x9, x10, x0
	cset	w8, vs
	cmp	x11, x9, asr #63
	cset	w11, ne
	adds	x14, x9, x0
	add	x14, x1, x14, lsl #2
	cset	w9, vs
	cmp	x14, x3
	mov	x14, #2305843009213693952       // =0x2000000000000000
	ccmp	x13, x1, #0, hi
	cset	w13, hi
	cmp	x0, x14
	b.hi	.LBB0_18
// %bb.1:                               // %polly.split_new_and_old
	tbnz	w12, #0, .LBB0_18
// %bb.2:                               // %polly.split_new_and_old
	tbnz	w13, #0, .LBB0_18
// %bb.3:                               // %polly.split_new_and_old
	tbnz	w8, #0, .LBB0_18
// %bb.4:                               // %polly.split_new_and_old
	tbnz	w11, #0, .LBB0_18
// %bb.5:                               // %polly.split_new_and_old
	cbnz	w9, .LBB0_18
// %bb.6:                               // %polly.loop_if
	asr	x8, x10, #5
	tbnz	x8, #63, .LBB0_23
// %bb.7:                               // %polly.loop_preheader
	mov	x11, xzr
	lsl	x9, x0, #2
	lsr	x10, x10, #5
	lsl	x12, x0, #7
	mov	w13, #31                        // =0x1f
	mov	x14, #-1                        // =0xffffffffffffffff
	b	.LBB0_9
	.p2align	5, , 16
.LBB0_8:                                // %polly.loop_exit21
                                        //   in Loop: Header=BB0_9 Depth=1
	cmp	x11, x8
	add	x11, x11, #1
	add	x1, x1, #128
	b.ge	.LBB0_23
.LBB0_9:                                // %polly.loop_preheader20
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_11 Depth 2
                                        //       Child Loop BB0_14 Depth 3
                                        //         Child Loop BB0_16 Depth 4
	lsl	x15, x11, #5
	mov	x17, xzr
	mov	x4, x1
	mov	x5, x2
	mvn	x16, x15
	add	x16, x0, x16
	cmp	x16, #31
	csel	x18, x16, x13, lt
	b	.LBB0_11
	.p2align	5, , 16
.LBB0_10:                               // %polly.loop_exit28
                                        //   in Loop: Header=BB0_11 Depth=2
	cmp	x17, x10
	add	x17, x17, #1
	add	x5, x5, #128
	add	x4, x4, x12
	b.hs	.LBB0_8
.LBB0_11:                               // %polly.loop_if25
                                        //   Parent Loop BB0_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_14 Depth 3
                                        //         Child Loop BB0_16 Depth 4
	tbnz	x16, #63, .LBB0_10
// %bb.12:                              // %polly.loop_if33.preheader
                                        //   in Loop: Header=BB0_11 Depth=2
	eor	x6, x14, x17, lsl #5
	mov	x7, xzr
	mov	x20, x4
	add	x6, x0, x6
	cmp	x6, #31
	csel	x19, x6, x13, lt
	b	.LBB0_14
	.p2align	5, , 16
.LBB0_13:                               // %polly.loop_exit36
                                        //   in Loop: Header=BB0_14 Depth=3
	cmp	x7, x18
	add	x7, x7, #1
	add	x20, x20, #4
	b.ge	.LBB0_10
.LBB0_14:                               // %polly.loop_if33
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_16 Depth 4
	tbnz	x6, #63, .LBB0_13
// %bb.15:                              // %polly.stmt.for.body6.i.preheader
                                        //   in Loop: Header=BB0_14 Depth=3
	add	x21, x15, x7
	mov	x22, xzr
	mov	x23, x20
	ldr	s0, [x3, x21, lsl #2]
	.p2align	5, , 16
.LBB0_16:                               // %polly.stmt.for.body6.i
                                        //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        //       Parent Loop BB0_14 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	s1, [x23]
	ldr	s2, [x5, x22, lsl #2]
	cmp	x22, x19
	add	x22, x22, #1
	add	x23, x23, x9
	fmadd	s0, s1, s2, s0
	b.lt	.LBB0_16
// %bb.17:                              // %polly.loop_exit36.loopexit
                                        //   in Loop: Header=BB0_14 Depth=3
	str	s0, [x3, x21, lsl #2]
	b	.LBB0_13
.LBB0_18:                               // %for.cond.i.preheader
	lsl	x9, x0, #2
	mov	x8, xzr
	b	.LBB0_20
	.p2align	5, , 16
.LBB0_19:                               // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB0_20 Depth=1
	add	x8, x8, #1
	add	x1, x1, x9
.LBB0_20:                               // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_22 Depth 2
	cmp	x8, x0
	b.hs	.LBB0_23
// %bb.21:                              // %for.cond2.i.preheader
                                        //   in Loop: Header=BB0_20 Depth=1
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB0_19
	.p2align	5, , 16
.LBB0_22:                               // %for.body6.i
                                        //   Parent Loop BB0_20 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s0, [x1, x10, lsl #2]
	ldr	s1, [x2, x8, lsl #2]
	ldr	s2, [x3, x10, lsl #2]
	fmadd	s0, s0, s1, s2
	str	s0, [x3, x10, lsl #2]
	add	x10, x10, #1
	cmp	x10, x0
	b.lo	.LBB0_22
	b	.LBB0_19
.LBB0_23:                               // %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit
	ldp	x20, x19, [sp, #48]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             // 16-byte Folded Reload
	ldr	x23, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #64             // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	_ZTS5Bicg1, .Lfunc_end0-_ZTS5Bicg1
                                        // -- End function
	.section	.text._ZTS5Bicg2,"axG",@progbits,_ZTS5Bicg2,comdat
	.weak	_ZTS5Bicg2                      // -- Begin function _ZTS5Bicg2
	.p2align	4
	.type	_ZTS5Bicg2,@function
_ZTS5Bicg2:                             // @_ZTS5Bicg2
// %bb.0:                               // %for.cond.i.pre_entry_bb
	stp	x29, x30, [sp, #-16]!           // 16-byte Folded Spill
	lsl	x9, x0, #2
	mov	x29, sp
	mov	x8, xzr
	b	.LBB1_2
	.p2align	5, , 16
.LBB1_1:                                // %for.cond.cleanup5.i
                                        //   in Loop: Header=BB1_2 Depth=1
	add	x8, x8, #1
	add	x1, x1, x9
.LBB1_2:                                // %for.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB1_4 Depth 2
	cmp	x8, x0
	b.hs	.LBB1_5
// %bb.3:                               // %for.cond2.i.preheader
                                        //   in Loop: Header=BB1_2 Depth=1
	ldr	s0, [x3, x8, lsl #2]
	mov	x10, xzr
	cmp	xzr, x0
	b.hs	.LBB1_1
	.p2align	5, , 16
.LBB1_4:                                // %for.body6.i
                                        //   Parent Loop BB1_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	s1, [x1, x10, lsl #2]
	ldr	s2, [x2, x10, lsl #2]
	add	x10, x10, #1
	fmadd	s0, s1, s2, s0
	str	s0, [x3, x8, lsl #2]
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
