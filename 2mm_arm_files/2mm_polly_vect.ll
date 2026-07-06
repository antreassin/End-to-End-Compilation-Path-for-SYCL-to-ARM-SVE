; ModuleID = '<stdin>'
source_filename = "2mm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS15Polybench_2mm_1 = comdat any

$_ZTS15Polybench_2mm_2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS15Polybench_2mm_1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
polly.split_new_and_old:
  %Packed_B = alloca [256 x [1024 x [3 x float]]], align 64
  %Packed_A = alloca [24 x [1024 x [2 x float]]], align 64
  %0 = icmp slt i64 %_arg_size_, 0
  %1 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_size_, i64 -1)
  %.obit = extractvalue { i64, i1 } %1, 1
  %.res = extractvalue { i64, i1 } %1, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %_arg_size_)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state3 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %_arg_size_)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.overflow.state4 = or i1 %polly.overflow.state3, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.add..res
  %2 = icmp ugt ptr addrspace(1) %polly.access., %_arg_raw_C
  %polly.access.25 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %polly.access.add..res
  %3 = icmp ugt ptr addrspace(1) %polly.access.25, %_arg_raw_B
  %.not692 = and i1 %2, %3
  %.not690 = or i1 %0, %.not692
  %polly.access.46 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.add..res
  %4 = icmp ugt ptr addrspace(1) %polly.access.46, %_arg_raw_C
  %5 = icmp ugt ptr addrspace(1) %polly.access.25, %_arg_raw_A
  %.not694 = and i1 %4, %5
  %.not688 = or i1 %.not690, %.not694
  %polly.rtc.result.not = or i1 %.not688, %polly.overflow.state4
  br i1 %polly.rtc.result.not, label %for.cond.i.preheader, label %polly.loop_if

for.cond.i.preheader:                             ; preds = %polly.split_new_and_old
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.cond.cleanup5.i
  %i.0.i = phi i64 [ %inc26.i, %for.cond.cleanup5.i ], [ 0, %for.cond.i.preheader ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %6 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond.cleanup10.i, %for.cond2.i.preheader
  %k.0.i = phi i64 [ %inc23.i, %for.cond.cleanup10.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.cond7.i.preheader, label %for.cond.cleanup5.i

for.cond7.i.preheader:                            ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %6, i64 %k.0.i
  %mul14.i = mul i64 %k.0.i, %_arg_size_
  %8 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul14.i
  br label %for.cond7.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc26.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.cond7.i:                                      ; preds = %for.body11.i, %for.cond7.i.preheader
  %j.0.i = phi i64 [ %inc.i, %for.body11.i ], [ 0, %for.cond7.i.preheader ]
  %cmp9.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp9.i, label %for.body11.i, label %for.cond.cleanup10.i

for.cond.cleanup10.i:                             ; preds = %for.cond7.i
  %inc23.i = add i64 %k.0.i, 1
  br label %for.cond2.i, !llvm.loop !16

for.body11.i:                                     ; preds = %for.cond7.i
  %9 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !17
  %arrayidx16.i = getelementptr float, ptr addrspace(1) %8, i64 %j.0.i
  %10 = load float, ptr addrspace(1) %arrayidx16.i, align 4, !tbaa !17
  %arrayidx21.i = getelementptr float, ptr addrspace(1) %7, i64 %j.0.i
  %11 = load float, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !17
  %12 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %11)
  store float %12, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !17
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond7.i, !llvm.loop !19

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit: ; preds = %for.cond.i
  br label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit3: ; preds = %polly.loop_exit79
  br label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit3, %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit, %polly.loop_if
  ret void

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %pexp.fdiv_q.2 = icmp eq i64 %_arg_size_, 0
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 -768, i64 %.res
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 768
  %polly.loop_guard = icmp sgt i64 %pexp.fdiv_q.3, -768
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_exit79:                                ; preds = %polly.loop_exit108
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %pexp.fdiv_q.4
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader78, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit3

polly.loop_preheader:                             ; preds = %polly.loop_if
  %13 = shl i64 %_arg_size_, 2
  %pexp.p_div_q695 = lshr i64 %.res, 10
  %pexp.p_div_q105 = udiv i64 %.res, 48
  %pexp.p_div_q135 = udiv i64 %_arg_size_, 3
  %pexp.p_div_q144698 = lshr i64 %_arg_size_, 1
  %14 = and i64 %_arg_size_, 1
  %15 = icmp eq i64 %14, 0
  %pexp.div = lshr exact i64 %.res, 1
  %16 = mul i64 %13, %.res
  %17 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %16
  %18 = mul i64 %pexp.p_div_q135, 3
  %pexp.pdiv_r319.decomposed = sub i64 %_arg_size_, %18
  %19 = icmp ne i64 %pexp.pdiv_r319.decomposed, 0
  %20 = add nsw i64 %_arg_size_, -4
  %pexp.div325 = sdiv exact i64 %20, 3
  %21 = mul i64 %13, %.res
  %22 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %21
  %23 = shl i64 %.res, 2
  %24 = shl i64 %.res, 2
  %25 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r432 = urem i64 %25, 3
  %26 = sub nuw nsw i64 %_arg_size_, %pexp.pdiv_r432
  %pexp.p_div_q439 = udiv i64 %.res, 3
  %27 = shl i64 %pexp.p_div_q439, 10
  %28 = shl i64 %26, 2
  %29 = add nuw nsw i64 %_arg_size_, 1
  %pexp.zdiv_r453 = urem i64 %29, 3
  %30 = icmp eq i64 %pexp.zdiv_r453, 0
  %invariant.gep719 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %28
  %31 = add nsw i64 %_arg_size_, -2
  %pexp.div460 = udiv exact i64 %31, 3
  %32 = shl i64 %pexp.div460, 10
  %33 = shl i64 %.res, 2
  %pexp.div410 = sdiv exact i64 %.res, 3
  %34 = shl i64 %pexp.div410, 10
  %35 = add i64 %13, 4
  %36 = mul i64 %35, %.res
  %scevgep417 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %36
  %37 = add nuw nsw i64 %_arg_size_, 1
  %pexp.p_div_q584702 = lshr i64 %37, 1
  %38 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r601 = urem i64 %38, 3
  %39 = sub nsw i64 %_arg_size_, %pexp.pdiv_r601
  %pexp.p_div_q609 = udiv i64 %.res, 3
  %40 = shl i64 %pexp.p_div_q609, 10
  %41 = shl i64 %39, 2
  %pexp.zdiv_r623 = urem i64 %37, 3
  %42 = icmp eq i64 %pexp.zdiv_r623, 0
  %43 = add nsw i64 %_arg_size_, -2
  %pexp.div631 = sdiv exact i64 %43, 3
  %44 = shl i64 %pexp.div631, 10
  %45 = shl i64 %.res, 2
  %46 = add nsw i64 %_arg_size_, -2
  %pexp.div676 = sdiv exact i64 %46, 3
  %47 = shl i64 %pexp.div676, 10
  %48 = shl i64 %.res, 2
  br label %polly.loop_preheader78

polly.loop_exit108:                               ; preds = %polly.merge316
  %polly.indvar_next81 = add nuw nsw i64 %polly.indvar80, 1
  %polly.loop_cond82.not.not = icmp ult i64 %polly.indvar80, %pexp.p_div_q695
  br i1 %polly.loop_cond82.not.not, label %polly.loop_if83, label %polly.loop_exit79

polly.loop_preheader78:                           ; preds = %polly.loop_preheader, %polly.loop_exit79
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit79 ]
  %49 = mul nuw i64 %polly.indvar, 768
  %50 = add i64 %49, 767
  %smin4 = call i64 @llvm.smin.i64(i64 %50, i64 %.res)
  %smax5 = call i64 @llvm.smax.i64(i64 %smin4, i64 %49)
  %51 = mul i64 %polly.indvar, -768
  %52 = add i64 %51, 1
  %53 = add i64 %smax5, %52
  %54 = mul nuw nsw i64 %polly.indvar, 768
  %55 = add nuw nsw i64 %54, 767
  %56 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %55)
  %polly.loop_guard95.not.not = icmp sgt i64 %_arg_size_, %54
  %57 = shl i64 %polly.indvar, 18
  %58 = shl i64 %polly.indvar, 8
  %59 = xor i64 %58, -1
  %60 = add i64 %pexp.p_div_q135, %59
  %61 = tail call i64 @llvm.smin.i64(i64 %60, i64 255)
  %polly.loop_guard140 = icmp sgt i64 %60, -1
  %62 = mul nuw nsw i64 %polly.indvar, 768
  %63 = mul nuw nsw i64 %polly.indvar, 768
  %64 = mul nuw nsw i64 %polly.indvar, 768
  %65 = or disjoint i64 %64, 2
  %66 = icmp sge i64 %65, %_arg_size_
  %67 = add nuw nsw i64 %64, 767
  %68 = icmp sge i64 %67, %_arg_size_
  %69 = or disjoint i64 %64, 3
  %70 = icmp sge i64 %_arg_size_, %69
  %71 = and i1 %70, %68
  %72 = shl nsw i64 %polly.indvar, 8
  %73 = sub nsw i64 %pexp.div325, %72
  %74 = tail call i64 @llvm.smin.i64(i64 %73, i64 255)
  %polly.loop_guard330 = icmp sgt i64 %73, -1
  %75 = and i1 %68, %19
  %76 = or disjoint i64 %64, 49
  %77 = icmp sge i64 %_arg_size_, %76
  %78 = or disjoint i64 %64, 4
  %79 = icmp sge i64 %_arg_size_, %78
  %80 = mul i64 %polly.indvar, 3072
  %81 = icmp eq i64 %65, %_arg_size_
  %82 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B440 = sub i64 %27, %82
  %polly.access.mul.Packed_B461 = sub i64 %32, %82
  %83 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B411 = sub i64 %34, %83
  %84 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B610 = sub i64 %40, %84
  %polly.access.mul.Packed_B632 = sub i64 %44, %84
  %polly.access.mul.Packed_B677 = sub i64 %47, %84
  br label %polly.loop_if83

polly.loop_if83:                                  ; preds = %polly.loop_preheader78, %polly.loop_exit108
  %polly.indvar80 = phi i64 [ 0, %polly.loop_preheader78 ], [ %polly.indvar_next81, %polly.loop_exit108 ]
  %85 = shl i64 %polly.indvar80, 10
  %86 = add i64 %85, 1023
  %smin = call i64 @llvm.smin.i64(i64 %86, i64 %.res)
  %smax = call i64 @llvm.smax.i64(i64 %smin, i64 %85)
  %87 = mul i64 %polly.indvar80, -1024
  %88 = add i64 %87, 1
  %89 = add i64 %smax, %88
  %90 = shl i64 %polly.indvar80, 10
  %91 = or disjoint i64 %90, 1023
  %92 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %91)
  %polly.loop_guard87.not.not = icmp sgt i64 %_arg_size_, %90
  br i1 %polly.loop_guard87.not.not, label %polly.loop_if91.preheader, label %polly.loop_preheader107

polly.loop_if91.preheader:                        ; preds = %polly.loop_if83
  br label %polly.loop_if91

polly.loop_exit94.loopexit:                       ; preds = %middle.block6, %polly.loop_header92
  br label %polly.loop_exit94

polly.loop_exit94:                                ; preds = %polly.loop_exit94.loopexit, %polly.loop_if91
  %polly.indvar_next89 = add nuw nsw i64 %polly.indvar88, 1
  %polly.loop_cond90.not.not = icmp slt i64 %polly.indvar88, %92
  br i1 %polly.loop_cond90.not.not, label %polly.loop_if91, label %polly.loop_preheader107.loopexit

polly.loop_if91:                                  ; preds = %polly.loop_if91.preheader, %polly.loop_exit94
  %polly.indvar88 = phi i64 [ %polly.indvar_next89, %polly.loop_exit94 ], [ %90, %polly.loop_if91.preheader ]
  br i1 %polly.loop_guard95.not.not, label %polly.loop_header92.preheader, label %polly.loop_exit94

polly.loop_header92.preheader:                    ; preds = %polly.loop_if91
  %polly.access.mul.99 = mul nuw nsw i64 %polly.indvar88, %_arg_size_
  %93 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.mul.99
  %94 = sub i64 %polly.indvar88, %90
  %95 = call i64 @llvm.vscale.i64()
  %96 = mul i64 %95, 4
  %min.iters.check8 = icmp ult i64 %53, %96
  br i1 %min.iters.check8, label %scalar.ph7, label %vector.ph9

vector.ph9:                                       ; preds = %polly.loop_header92.preheader
  %97 = call i64 @llvm.vscale.i64()
  %98 = mul i64 %97, 4
  %n.mod.vf10 = urem i64 %53, %98
  %n.vec11 = sub i64 %53, %n.mod.vf10
  %ind.end12 = add i64 %54, %n.vec11
  %99 = call i64 @llvm.vscale.i64()
  %100 = mul i64 %99, 4
  %.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %54, i64 0
  %.splat = shufflevector <vscale x 4 x i64> %.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %101 = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
  %102 = add <vscale x 4 x i64> %101, zeroinitializer
  %103 = mul <vscale x 4 x i64> %102, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %induction = add <vscale x 4 x i64> %.splat, %103
  %104 = call i64 @llvm.vscale.i64()
  %105 = mul i64 %104, 4
  %106 = mul i64 1, %105
  %.splatinsert17 = insertelement <vscale x 4 x i64> poison, i64 %106, i64 0
  %.splat18 = shufflevector <vscale x 4 x i64> %.splatinsert17, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %57, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x i64> %broadcast.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert20 = insertelement <vscale x 4 x i64> poison, i64 %94, i64 0
  %broadcast.splat21 = shufflevector <vscale x 4 x i64> %broadcast.splatinsert20, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15, %vector.ph9
  %index16 = phi i64 [ 0, %vector.ph9 ], [ %index.next22, %vector.body15 ]
  %vec.ind = phi <vscale x 4 x i64> [ %induction, %vector.ph9 ], [ %vec.ind.next, %vector.body15 ]
  %offset.idx19 = add i64 %54, %index16
  %107 = add i64 %offset.idx19, 0
  %108 = getelementptr float, ptr addrspace(1) %93, i64 %107
  %109 = getelementptr float, ptr addrspace(1) %108, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %109, align 4, !alias.scope !23, !noalias !26
  %110 = freeze <vscale x 4 x i64> %vec.ind
  %111 = udiv <vscale x 4 x i64> %110, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %112 = shl <vscale x 4 x i64> %111, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 10, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %113 = sub <vscale x 4 x i64> %112, %broadcast.splat
  %114 = add nsw <vscale x 4 x i64> %113, %broadcast.splat21
  %115 = mul <vscale x 4 x i64> %111, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %116 = sub <vscale x 4 x i64> %110, %115
  %117 = mul <vscale x 4 x i64> %114, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 12, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %118 = getelementptr i8, ptr %Packed_B, <vscale x 4 x i64> %117
  %119 = getelementptr float, <vscale x 4 x ptr> %118, <vscale x 4 x i64> %116
  call void @llvm.masked.scatter.nxv4f32.nxv4p0(<vscale x 4 x float> %wide.load, <vscale x 4 x ptr> %119, i32 4, <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 true, i64 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer)), !alias.scope !31, !noalias !32
  %index.next22 = add nuw i64 %index16, %100
  %vec.ind.next = add <vscale x 4 x i64> %vec.ind, %.splat18
  %120 = icmp eq i64 %index.next22, %n.vec11
  br i1 %120, label %middle.block6, label %vector.body15, !llvm.loop !33

middle.block6:                                    ; preds = %vector.body15
  %cmp.n14 = icmp eq i64 %53, %n.vec11
  br i1 %cmp.n14, label %polly.loop_exit94.loopexit, label %scalar.ph7

scalar.ph7:                                       ; preds = %polly.loop_header92.preheader, %middle.block6
  %bc.resume.val13 = phi i64 [ %ind.end12, %middle.block6 ], [ %54, %polly.loop_header92.preheader ]
  br label %polly.loop_header92

polly.loop_header92:                              ; preds = %polly.loop_header92, %scalar.ph7
  %polly.indvar96 = phi i64 [ %polly.indvar_next97, %polly.loop_header92 ], [ %bc.resume.val13, %scalar.ph7 ]
  %polly.access.101 = getelementptr float, ptr addrspace(1) %93, i64 %polly.indvar96
  %polly.access.101.load = load float, ptr addrspace(1) %polly.access.101, align 4, !alias.scope !23, !noalias !26
  %polly.indvar96.frozen = freeze i64 %polly.indvar96
  %pexp.p_div_q102 = udiv i64 %polly.indvar96.frozen, 3
  %121 = shl i64 %pexp.p_div_q102, 10
  %polly.access.mul.Packed_B = sub i64 %121, %57
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %94
  %122 = mul i64 %pexp.p_div_q102, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar96.frozen, %122
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %123 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %123, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.101.load, ptr %polly.access.Packed_B, align 4, !alias.scope !31, !noalias !32
  %polly.indvar_next97 = add nuw nsw i64 %polly.indvar96, 1
  %polly.loop_cond98.not.not = icmp slt i64 %polly.indvar96, %56
  br i1 %polly.loop_cond98.not.not, label %polly.loop_header92, label %polly.loop_exit94.loopexit, !llvm.loop !36

polly.cond.loopexit:                              ; preds = %polly.loop_exit123
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_if112
  %124 = or disjoint i64 %159, 2
  %125 = icmp sge i64 %_arg_size_, %124
  %brmerge.not = select i1 %125, i1 %polly.loop_guard140, i1 false
  br i1 %brmerge.not, label %polly.loop_if145.preheader, label %polly.cond315

polly.cond315.loopexit:                           ; preds = %polly.merge254
  br label %polly.cond315

polly.cond315:                                    ; preds = %polly.cond315.loopexit, %polly.cond
  %126 = and i1 %66, %125
  %127 = or disjoint i64 %159, 3
  %128 = icmp sge i64 %_arg_size_, %127
  %129 = and i1 %68, %128
  %130 = and i1 %71, %125
  %131 = or i1 %129, %130
  %132 = and i1 %131, %19
  %133 = or i1 %126, %132
  %134 = or disjoint i64 %159, 1
  %135 = icmp eq i64 %134, %_arg_size_
  %136 = or i1 %133, %135
  br i1 %136, label %polly.cond321, label %polly.merge316

polly.merge316.loopexit:                          ; preds = %polly.loop_exit596
  br label %polly.merge316

polly.merge316:                                   ; preds = %polly.merge316.loopexit, %polly.loop_if585, %polly.cond387, %polly.cond315
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %polly.loop_cond111.not.not = icmp ult i64 %polly.indvar109, %pexp.p_div_q105
  br i1 %polly.loop_cond111.not.not, label %polly.loop_if112, label %polly.loop_exit108

polly.loop_preheader107.loopexit:                 ; preds = %polly.loop_exit94
  br label %polly.loop_preheader107

polly.loop_preheader107:                          ; preds = %polly.loop_preheader107.loopexit, %polly.loop_if83
  %137 = shl i64 %polly.indvar80, 11
  %138 = xor i64 %90, -1
  %139 = add nsw i64 %_arg_size_, %138
  %140 = tail call i64 @llvm.smin.i64(i64 %139, i64 1023)
  %polly.loop_guard157 = icmp sgt i64 %139, -1
  %141 = xor i64 %90, -1
  %142 = add nsw i64 %_arg_size_, %141
  %143 = tail call i64 @llvm.smin.i64(i64 %142, i64 1023)
  %polly.loop_guard261 = icmp slt i64 %142, 0
  %144 = xor i64 %90, -1
  %145 = add nsw i64 %_arg_size_, %144
  %146 = tail call i64 @llvm.smin.i64(i64 %145, i64 1023)
  %polly.loop_guard338 = icmp sgt i64 %145, -1
  %147 = xor i64 %90, -1
  %148 = add nsw i64 %_arg_size_, %147
  %149 = tail call i64 @llvm.smin.i64(i64 %148, i64 1023)
  %polly.loop_guard512 = icmp sgt i64 %148, -1
  %150 = xor i64 %90, -1
  %151 = add nsw i64 %_arg_size_, %150
  %152 = tail call i64 @llvm.smin.i64(i64 %151, i64 1023)
  %polly.loop_guard428 = icmp sgt i64 %151, -1
  %153 = xor i64 %90, -1
  %154 = add nsw i64 %_arg_size_, %153
  %155 = tail call i64 @llvm.smin.i64(i64 %154, i64 1023)
  %polly.loop_guard400 = icmp sgt i64 %154, -1
  %156 = xor i64 %90, -1
  %157 = add nsw i64 %_arg_size_, %156
  %158 = tail call i64 @llvm.smin.i64(i64 %157, i64 1023)
  %polly.loop_guard597 = icmp sgt i64 %157, -1
  br label %polly.loop_if112

polly.loop_if112:                                 ; preds = %polly.loop_preheader107, %polly.merge316
  %polly.indvar109 = phi i64 [ 0, %polly.loop_preheader107 ], [ %polly.indvar_next110, %polly.merge316 ]
  %159 = mul nuw nsw i64 %polly.indvar109, 48
  %160 = add nuw nsw i64 %159, 47
  %161 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %160)
  %polly.loop_guard116.not.not = icmp sgt i64 %_arg_size_, %159
  br i1 %polly.loop_guard116.not.not, label %polly.loop_if120.preheader, label %polly.cond

polly.loop_if120.preheader:                       ; preds = %polly.loop_if112
  %162 = mul i64 %polly.indvar109, 2251799813685224
  br label %polly.loop_if120

polly.loop_exit123.loopexit:                      ; preds = %middle.block, %polly.loop_header121
  br label %polly.loop_exit123

polly.loop_exit123:                               ; preds = %polly.loop_exit123.loopexit, %polly.loop_if120
  %polly.indvar_next118 = add nuw nsw i64 %polly.indvar117, 1
  %polly.loop_cond119.not.not = icmp slt i64 %polly.indvar117, %161
  br i1 %polly.loop_cond119.not.not, label %polly.loop_if120, label %polly.cond.loopexit

polly.loop_if120:                                 ; preds = %polly.loop_exit123, %polly.loop_if120.preheader
  %polly.indvar117 = phi i64 [ %polly.indvar_next118, %polly.loop_exit123 ], [ %159, %polly.loop_if120.preheader ]
  br i1 %polly.loop_guard87.not.not, label %polly.loop_header121.preheader, label %polly.loop_exit123

polly.loop_header121.preheader:                   ; preds = %polly.loop_if120
  %polly.access.mul.128 = mul nuw nsw i64 %polly.indvar117, %_arg_size_
  %163 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.mul.128
  %pexp.p_div_q131696 = lshr i64 %polly.indvar117, 1
  %164 = add i64 %162, %pexp.p_div_q131696
  %pexp.pdiv_r133 = and i64 %polly.indvar117, 1
  %.idx697 = shl i64 %164, 13
  %165 = getelementptr i8, ptr %Packed_A, i64 %.idx697
  %invariant.gep = getelementptr float, ptr %165, i64 %pexp.pdiv_r133
  %min.iters.check = icmp ult i64 %89, 2
  br i1 %min.iters.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %polly.loop_header121.preheader
  %n.mod.vf = urem i64 %89, 2
  %n.vec = sub i64 %89, %n.mod.vf
  %ind.end = add i64 %90, %n.vec
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = add i64 %90, %index
  %166 = add i64 %offset.idx, 0
  %167 = add i64 %offset.idx, 1
  %168 = getelementptr float, ptr addrspace(1) %163, i64 %166
  %169 = getelementptr float, ptr addrspace(1) %163, i64 %167
  %170 = load float, ptr addrspace(1) %168, align 4, !alias.scope !37, !noalias !38
  %171 = load float, ptr addrspace(1) %169, align 4, !alias.scope !37, !noalias !38
  %172 = shl nuw i64 %166, 1
  %173 = shl nuw i64 %167, 1
  %174 = sub i64 %172, %137
  %175 = sub i64 %173, %137
  %176 = getelementptr float, ptr %invariant.gep, i64 %174
  %177 = getelementptr float, ptr %invariant.gep, i64 %175
  store float %170, ptr %176, align 4, !alias.scope !39, !noalias !40
  store float %171, ptr %177, align 4, !alias.scope !39, !noalias !40
  %index.next = add nuw i64 %index, 2
  %178 = icmp eq i64 %index.next, %n.vec
  br i1 %178, label %middle.block, label %vector.body, !llvm.loop !41

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %89, %n.vec
  br i1 %cmp.n, label %polly.loop_exit123.loopexit, label %scalar.ph

scalar.ph:                                        ; preds = %polly.loop_header121.preheader, %middle.block
  %bc.resume.val = phi i64 [ %ind.end, %middle.block ], [ %90, %polly.loop_header121.preheader ]
  br label %polly.loop_header121

polly.loop_header121:                             ; preds = %polly.loop_header121, %scalar.ph
  %polly.indvar125 = phi i64 [ %polly.indvar_next126, %polly.loop_header121 ], [ %bc.resume.val, %scalar.ph ]
  %polly.access.130 = getelementptr float, ptr addrspace(1) %163, i64 %polly.indvar125
  %polly.access.130.load = load float, ptr addrspace(1) %polly.access.130, align 4, !alias.scope !37, !noalias !38
  %179 = shl nuw i64 %polly.indvar125, 1
  %180 = sub i64 %179, %137
  %gep = getelementptr float, ptr %invariant.gep, i64 %180
  store float %polly.access.130.load, ptr %gep, align 4, !alias.scope !39, !noalias !40
  %polly.indvar_next126 = add nuw nsw i64 %polly.indvar125, 1
  %polly.loop_cond127.not.not = icmp slt i64 %polly.indvar125, %92
  br i1 %polly.loop_cond127.not.not, label %polly.loop_header121, label %polly.loop_exit123.loopexit, !llvm.loop !42

polly.loop_if145.preheader:                       ; preds = %polly.cond
  %181 = mul nsw i64 %polly.indvar109, -24
  %182 = add nsw i64 %181, %pexp.p_div_q144698
  %183 = tail call i64 @llvm.smin.i64(i64 %182, i64 24)
  %184 = add nsw i64 %183, -1
  %polly.loop_guard149 = icmp sgt i64 %182, 0
  %185 = icmp slt i64 %160, %_arg_size_
  %.not728 = or i1 %185, %15
  %.neg = mul i64 %polly.indvar109, 2251799813685224
  %186 = add i64 %.neg, %pexp.div
  %.idx699 = shl i64 %186, 13
  %187 = getelementptr i8, ptr %Packed_A, i64 %.idx699
  br label %polly.loop_if145

polly.cond253.loopexit:                           ; preds = %polly.loop_exit156
  br label %polly.cond253

polly.cond253:                                    ; preds = %polly.cond253.loopexit, %polly.loop_if145
  %brmerge723 = select i1 %.not728, i1 true, i1 %polly.loop_guard261
  br i1 %brmerge723, label %polly.merge254, label %polly.stmt.for.body11.i298.preheader

polly.merge254.loopexit:                          ; preds = %polly.stmt.for.body11.i298
  %p_280.lcssa = phi float [ %p_280, %polly.stmt.for.body11.i298 ]
  %p_297.lcssa = phi float [ %p_297, %polly.stmt.for.body11.i298 ]
  %p_314.lcssa = phi float [ %p_314, %polly.stmt.for.body11.i298 ]
  store float %p_280.lcssa, ptr addrspace(1) %scevgep278, align 4, !alias.scope !43, !noalias !44
  store float %p_297.lcssa, ptr addrspace(1) %scevgep295, align 4, !alias.scope !43, !noalias !44
  store float %p_314.lcssa, ptr addrspace(1) %scevgep312, align 4, !alias.scope !43, !noalias !44
  br label %polly.merge254

polly.merge254:                                   ; preds = %polly.merge254.loopexit, %polly.cond253
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond143.not.not = icmp slt i64 %polly.indvar141, %61
  br i1 %polly.loop_cond143.not.not, label %polly.loop_if145, label %polly.cond315.loopexit

polly.loop_if145:                                 ; preds = %polly.merge254, %polly.loop_if145.preheader
  %polly.indvar141 = phi i64 [ %polly.indvar_next142, %polly.merge254 ], [ 0, %polly.loop_if145.preheader ]
  br i1 %polly.loop_guard149, label %polly.loop_if153.preheader, label %polly.cond253

polly.loop_if153.preheader:                       ; preds = %polly.loop_if145
  %188 = mul nuw nsw i64 %polly.indvar141, 3
  %189 = add nuw nsw i64 %62, %188
  %polly.access.mul.Packed_B166 = shl nsw i64 %polly.indvar141, 10
  %190 = shl i64 %189, 2
  %191 = add i64 %190, 4
  %192 = add i64 %190, 8
  br label %polly.loop_if153

polly.loop_exit156.loopexit:                      ; preds = %polly.stmt.for.body11.i237
  br label %polly.loop_exit156

polly.loop_exit156:                               ; preds = %polly.loop_exit156.loopexit, %polly.loop_if153
  %polly.indvar_next151 = add nuw nsw i64 %polly.indvar150, 1
  %polly.loop_cond152.not.not = icmp slt i64 %polly.indvar150, %184
  br i1 %polly.loop_cond152.not.not, label %polly.loop_if153, label %polly.cond253.loopexit

polly.loop_if153:                                 ; preds = %polly.loop_exit156, %polly.loop_if153.preheader
  %polly.indvar150 = phi i64 [ %polly.indvar_next151, %polly.loop_exit156 ], [ 0, %polly.loop_if153.preheader ]
  br i1 %polly.loop_guard157, label %polly.stmt.for.body11.i237.preheader, label %polly.loop_exit156

polly.stmt.for.body11.i237.preheader:             ; preds = %polly.loop_if153
  %193 = shl nuw nsw i64 %polly.indvar150, 1
  %194 = add nuw nsw i64 %159, %193
  %.idx707 = shl i64 %polly.indvar150, 13
  %195 = getelementptr i8, ptr %Packed_A, i64 %.idx707
  %196 = mul i64 %13, %194
  %197 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %196
  %scevgep = getelementptr i8, ptr addrspace(1) %197, i64 %190
  %scevgep186 = getelementptr i8, ptr addrspace(1) %197, i64 %191
  %scevgep202 = getelementptr i8, ptr addrspace(1) %197, i64 %192
  %198 = or disjoint i64 %194, 1
  %199 = mul i64 %13, %198
  %200 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %199
  %scevgep218 = getelementptr i8, ptr addrspace(1) %200, i64 %190
  %scevgep234 = getelementptr i8, ptr addrspace(1) %200, i64 %191
  %scevgep250 = getelementptr i8, ptr addrspace(1) %200, i64 %192
  br label %polly.stmt.for.body11.i237

polly.stmt.for.body11.i237:                       ; preds = %polly.stmt.for.body11.i237, %polly.stmt.for.body11.i237.preheader
  %polly.indvar158 = phi i64 [ %polly.indvar_next159, %polly.stmt.for.body11.i237 ], [ 0, %polly.stmt.for.body11.i237.preheader ]
  %polly.access.Packed_A165.idx = shl i64 %polly.indvar158, 3
  %polly.access.Packed_A165 = getelementptr i8, ptr %195, i64 %polly.access.Packed_A165.idx
  %_p_scalar_ = load float, ptr %polly.access.Packed_A165, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B167 = add nuw nsw i64 %polly.access.mul.Packed_B166, %polly.indvar158
  %polly.access.Packed_B170.idx = mul i64 %polly.access.add.Packed_B167, 12
  %polly.access.Packed_B170 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B170.idx
  %_p_scalar_171 = load float, ptr %polly.access.Packed_B170, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_172 = load float, ptr addrspace(1) %scevgep, align 4, !alias.scope !43, !noalias !44
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_171, float %_p_scalar_172)
  store float %p_, ptr addrspace(1) %scevgep, align 4, !alias.scope !43, !noalias !44
  %polly.access.Packed_B184 = getelementptr i8, ptr %polly.access.Packed_B170, i64 4
  %_p_scalar_185 = load float, ptr %polly.access.Packed_B184, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_187 = load float, ptr addrspace(1) %scevgep186, align 4, !alias.scope !43, !noalias !44
  %p_188 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_185, float %_p_scalar_187)
  store float %p_188, ptr addrspace(1) %scevgep186, align 4, !alias.scope !43, !noalias !44
  %polly.access.Packed_B200 = getelementptr i8, ptr %polly.access.Packed_B170, i64 8
  %_p_scalar_201 = load float, ptr %polly.access.Packed_B200, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_203 = load float, ptr addrspace(1) %scevgep202, align 4, !alias.scope !43, !noalias !44
  %p_204 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_201, float %_p_scalar_203)
  store float %p_204, ptr addrspace(1) %scevgep202, align 4, !alias.scope !43, !noalias !44
  %polly.access.Packed_A210 = getelementptr i8, ptr %polly.access.Packed_A165, i64 4
  %_p_scalar_211 = load float, ptr %polly.access.Packed_A210, align 4, !alias.scope !39, !noalias !40
  %_p_scalar_219 = load float, ptr addrspace(1) %scevgep218, align 4, !alias.scope !43, !noalias !44
  %p_220 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_171, float %_p_scalar_219)
  store float %p_220, ptr addrspace(1) %scevgep218, align 4, !alias.scope !43, !noalias !44
  %_p_scalar_235 = load float, ptr addrspace(1) %scevgep234, align 4, !alias.scope !43, !noalias !44
  %p_236 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_185, float %_p_scalar_235)
  store float %p_236, ptr addrspace(1) %scevgep234, align 4, !alias.scope !43, !noalias !44
  %_p_scalar_251 = load float, ptr addrspace(1) %scevgep250, align 4, !alias.scope !43, !noalias !44
  %p_252 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_201, float %_p_scalar_251)
  store float %p_252, ptr addrspace(1) %scevgep250, align 4, !alias.scope !43, !noalias !44
  %polly.indvar_next159 = add nuw nsw i64 %polly.indvar158, 1
  %polly.loop_cond160.not.not = icmp slt i64 %polly.indvar158, %140
  br i1 %polly.loop_cond160.not.not, label %polly.stmt.for.body11.i237, label %polly.loop_exit156.loopexit, !llvm.loop !45

polly.stmt.for.body11.i298.preheader:             ; preds = %polly.cond253
  %201 = mul nuw nsw i64 %polly.indvar141, 3
  %202 = add nuw nsw i64 %63, %201
  %polly.access.mul.Packed_B272 = shl nsw i64 %polly.indvar141, 10
  %203 = shl i64 %202, 2
  %scevgep278 = getelementptr i8, ptr addrspace(1) %17, i64 %203
  %scevgep295 = getelementptr i8, ptr addrspace(1) %scevgep278, i64 4
  %scevgep312 = getelementptr i8, ptr addrspace(1) %scevgep278, i64 8
  %scevgep278.promoted = load float, ptr addrspace(1) %scevgep278, align 4, !alias.scope !43, !noalias !44
  %scevgep295.promoted = load float, ptr addrspace(1) %scevgep295, align 4, !alias.scope !43, !noalias !44
  %scevgep312.promoted = load float, ptr addrspace(1) %scevgep312, align 4, !alias.scope !43, !noalias !44
  br label %polly.stmt.for.body11.i298

polly.stmt.for.body11.i298:                       ; preds = %polly.stmt.for.body11.i298, %polly.stmt.for.body11.i298.preheader
  %p_314714 = phi float [ %p_314, %polly.stmt.for.body11.i298 ], [ %scevgep312.promoted, %polly.stmt.for.body11.i298.preheader ]
  %p_297713 = phi float [ %p_297, %polly.stmt.for.body11.i298 ], [ %scevgep295.promoted, %polly.stmt.for.body11.i298.preheader ]
  %_p_scalar_279712 = phi float [ %p_280, %polly.stmt.for.body11.i298 ], [ %scevgep278.promoted, %polly.stmt.for.body11.i298.preheader ]
  %polly.indvar262 = phi i64 [ %polly.indvar_next263, %polly.stmt.for.body11.i298 ], [ 0, %polly.stmt.for.body11.i298.preheader ]
  %polly.access.Packed_A270.idx = shl i64 %polly.indvar262, 3
  %polly.access.Packed_A270 = getelementptr i8, ptr %187, i64 %polly.access.Packed_A270.idx
  %_p_scalar_271 = load float, ptr %polly.access.Packed_A270, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B273 = add nuw nsw i64 %polly.access.mul.Packed_B272, %polly.indvar262
  %polly.access.Packed_B276.idx = mul i64 %polly.access.add.Packed_B273, 12
  %polly.access.Packed_B276 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B276.idx
  %_p_scalar_277 = load float, ptr %polly.access.Packed_B276, align 4, !alias.scope !31, !noalias !32
  %p_280 = tail call float @llvm.fmuladd.f32(float %_p_scalar_271, float %_p_scalar_277, float %_p_scalar_279712)
  %polly.access.Packed_B293 = getelementptr i8, ptr %polly.access.Packed_B276, i64 4
  %_p_scalar_294 = load float, ptr %polly.access.Packed_B293, align 4, !alias.scope !31, !noalias !32
  %p_297 = tail call float @llvm.fmuladd.f32(float %_p_scalar_271, float %_p_scalar_294, float %p_297713)
  %polly.access.Packed_B310 = getelementptr i8, ptr %polly.access.Packed_B276, i64 8
  %_p_scalar_311 = load float, ptr %polly.access.Packed_B310, align 4, !alias.scope !31, !noalias !32
  %p_314 = tail call float @llvm.fmuladd.f32(float %_p_scalar_271, float %_p_scalar_311, float %p_314714)
  %polly.indvar_next263 = add nuw nsw i64 %polly.indvar262, 1
  %polly.loop_cond264.not.not = icmp slt i64 %polly.indvar262, %143
  br i1 %polly.loop_cond264.not.not, label %polly.stmt.for.body11.i298, label %polly.merge254.loopexit, !llvm.loop !47

polly.cond321:                                    ; preds = %polly.cond315
  %brmerge725.not = select i1 %135, i1 %polly.loop_guard330, i1 false
  br i1 %brmerge725.not, label %polly.loop_if334.preheader, label %polly.cond387

polly.loop_if334.preheader:                       ; preds = %polly.cond321
  br label %polly.loop_if334

polly.cond387.loopexit:                           ; preds = %polly.loop_exit337
  br label %polly.cond387

polly.cond387:                                    ; preds = %polly.cond387.loopexit, %polly.cond321
  br i1 %75, label %polly.cond392, label %polly.merge316

polly.loop_exit337.loopexit:                      ; preds = %polly.stmt.for.body11.i372
  %p_356.lcssa = phi float [ %p_356, %polly.stmt.for.body11.i372 ]
  %p_371.lcssa = phi float [ %p_371, %polly.stmt.for.body11.i372 ]
  %p_386.lcssa = phi float [ %p_386, %polly.stmt.for.body11.i372 ]
  store float %p_356.lcssa, ptr addrspace(1) %scevgep354, align 4, !alias.scope !43, !noalias !44
  store float %p_371.lcssa, ptr addrspace(1) %scevgep369, align 4, !alias.scope !43, !noalias !44
  store float %p_386.lcssa, ptr addrspace(1) %scevgep384, align 4, !alias.scope !43, !noalias !44
  br label %polly.loop_exit337

polly.loop_exit337:                               ; preds = %polly.loop_if334, %polly.loop_exit337.loopexit
  %polly.indvar_next332 = add nuw nsw i64 %polly.indvar331, 1
  %polly.loop_cond333.not.not = icmp slt i64 %polly.indvar331, %74
  br i1 %polly.loop_cond333.not.not, label %polly.loop_if334, label %polly.cond387.loopexit

polly.loop_if334:                                 ; preds = %polly.loop_if334.preheader, %polly.loop_exit337
  %polly.indvar331 = phi i64 [ %polly.indvar_next332, %polly.loop_exit337 ], [ 0, %polly.loop_if334.preheader ]
  br i1 %polly.loop_guard338, label %polly.stmt.for.body11.i372.preheader, label %polly.loop_exit337

polly.stmt.for.body11.i372.preheader:             ; preds = %polly.loop_if334
  %204 = mul nuw nsw i64 %polly.indvar331, 3
  %205 = add nuw nsw i64 %64, %204
  %polly.access.mul.Packed_B348 = shl nsw i64 %polly.indvar331, 10
  %206 = shl i64 %205, 2
  %scevgep354 = getelementptr i8, ptr addrspace(1) %22, i64 %206
  %scevgep369 = getelementptr i8, ptr addrspace(1) %scevgep354, i64 4
  %scevgep384 = getelementptr i8, ptr addrspace(1) %scevgep354, i64 8
  %scevgep354.promoted = load float, ptr addrspace(1) %scevgep354, align 4, !alias.scope !43, !noalias !44
  %scevgep369.promoted = load float, ptr addrspace(1) %scevgep369, align 4, !alias.scope !43, !noalias !44
  %scevgep384.promoted = load float, ptr addrspace(1) %scevgep384, align 4, !alias.scope !43, !noalias !44
  br label %polly.stmt.for.body11.i372

polly.stmt.for.body11.i372:                       ; preds = %polly.stmt.for.body11.i372, %polly.stmt.for.body11.i372.preheader
  %p_386717 = phi float [ %p_386, %polly.stmt.for.body11.i372 ], [ %scevgep384.promoted, %polly.stmt.for.body11.i372.preheader ]
  %p_371716 = phi float [ %p_371, %polly.stmt.for.body11.i372 ], [ %scevgep369.promoted, %polly.stmt.for.body11.i372.preheader ]
  %_p_scalar_355715 = phi float [ %p_356, %polly.stmt.for.body11.i372 ], [ %scevgep354.promoted, %polly.stmt.for.body11.i372.preheader ]
  %polly.indvar339 = phi i64 [ %polly.indvar_next340, %polly.stmt.for.body11.i372 ], [ 0, %polly.stmt.for.body11.i372.preheader ]
  %polly.access.Packed_A346.idx = shl i64 %polly.indvar339, 3
  %polly.access.Packed_A346 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A346.idx
  %_p_scalar_347 = load float, ptr %polly.access.Packed_A346, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B349 = add nuw nsw i64 %polly.access.mul.Packed_B348, %polly.indvar339
  %polly.access.Packed_B352.idx = mul i64 %polly.access.add.Packed_B349, 12
  %polly.access.Packed_B352 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B352.idx
  %_p_scalar_353 = load float, ptr %polly.access.Packed_B352, align 4, !alias.scope !31, !noalias !32
  %p_356 = tail call float @llvm.fmuladd.f32(float %_p_scalar_347, float %_p_scalar_353, float %_p_scalar_355715)
  %polly.access.Packed_B367 = getelementptr i8, ptr %polly.access.Packed_B352, i64 4
  %_p_scalar_368 = load float, ptr %polly.access.Packed_B367, align 4, !alias.scope !31, !noalias !32
  %p_371 = tail call float @llvm.fmuladd.f32(float %_p_scalar_347, float %_p_scalar_368, float %p_371716)
  %polly.access.Packed_B382 = getelementptr i8, ptr %polly.access.Packed_B352, i64 8
  %_p_scalar_383 = load float, ptr %polly.access.Packed_B382, align 4, !alias.scope !31, !noalias !32
  %p_386 = tail call float @llvm.fmuladd.f32(float %_p_scalar_347, float %_p_scalar_383, float %p_386717)
  %polly.indvar_next340 = add nuw nsw i64 %polly.indvar339, 1
  %polly.loop_cond341.not.not = icmp slt i64 %polly.indvar339, %146
  br i1 %polly.loop_cond341.not.not, label %polly.stmt.for.body11.i372, label %polly.loop_exit337.loopexit, !llvm.loop !48

polly.cond392:                                    ; preds = %polly.cond387
  %207 = and i1 %77, %135
  br i1 %207, label %polly.loop_if396, label %polly.cond420

polly.cond420:                                    ; preds = %polly.cond392
  %208 = and i1 %79, %125
  br i1 %208, label %polly.loop_if424, label %polly.loop_if508

polly.loop_if396:                                 ; preds = %polly.cond392
  br i1 %polly.loop_guard400, label %polly.stmt.for.body11.i404.preheader, label %polly.loop_if585

polly.stmt.for.body11.i404.preheader:             ; preds = %polly.loop_if396
  %scevgep417.promoted = load float, ptr addrspace(1) %scevgep417, align 4, !alias.scope !43, !noalias !44
  br label %polly.stmt.for.body11.i404

polly.stmt.for.body11.i404:                       ; preds = %polly.stmt.for.body11.i404, %polly.stmt.for.body11.i404.preheader
  %p_419718 = phi float [ %p_419, %polly.stmt.for.body11.i404 ], [ %scevgep417.promoted, %polly.stmt.for.body11.i404.preheader ]
  %polly.indvar401 = phi i64 [ %polly.indvar_next402, %polly.stmt.for.body11.i404 ], [ 0, %polly.stmt.for.body11.i404.preheader ]
  %polly.access.Packed_A408.idx = shl i64 %polly.indvar401, 3
  %polly.access.Packed_A408 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A408.idx
  %_p_scalar_409 = load float, ptr %polly.access.Packed_A408, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B412 = add nsw i64 %polly.access.mul.Packed_B411, %polly.indvar401
  %polly.access.Packed_B415.idx = mul i64 %polly.access.add.Packed_B412, 12
  %polly.access.Packed_B415 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B415.idx
  %_p_scalar_416 = load float, ptr %polly.access.Packed_B415, align 4, !alias.scope !31, !noalias !32
  %p_419 = tail call float @llvm.fmuladd.f32(float %_p_scalar_409, float %_p_scalar_416, float %p_419718)
  %polly.indvar_next402 = add nuw nsw i64 %polly.indvar401, 1
  %polly.loop_cond403.not.not = icmp slt i64 %polly.indvar401, %155
  br i1 %polly.loop_cond403.not.not, label %polly.stmt.for.body11.i404, label %polly.loop_if585.loopexit, !llvm.loop !49

polly.loop_if424:                                 ; preds = %polly.cond420
  br i1 %polly.loop_guard428, label %polly.cond449.preheader, label %polly.loop_if585

polly.cond449.preheader:                          ; preds = %polly.loop_if424
  %209 = mul i64 %13, %159
  %210 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %209
  %scevgep446 = getelementptr i8, ptr addrspace(1) %210, i64 %28
  %211 = mul i64 %13, %134
  %gep720 = getelementptr i8, ptr addrspace(1) %invariant.gep719, i64 %211
  %scevgep467 = getelementptr i8, ptr addrspace(1) %210, i64 %33
  %212 = mul i64 %13, %134
  %213 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %212
  %scevgep484 = getelementptr i8, ptr addrspace(1) %213, i64 %28
  %scevgep505 = getelementptr i8, ptr addrspace(1) %213, i64 %33
  br label %polly.cond449

polly.cond449:                                    ; preds = %polly.merge488, %polly.cond449.preheader
  %polly.indvar429 = phi i64 [ %polly.indvar_next430, %polly.merge488 ], [ 0, %polly.cond449.preheader ]
  %polly.access.Packed_A437.idx = shl i64 %polly.indvar429, 3
  %polly.access.Packed_A437 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A437.idx
  %_p_scalar_438 = load float, ptr %polly.access.Packed_A437, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B441 = add nsw i64 %polly.access.mul.Packed_B440, %polly.indvar429
  %polly.access.Packed_B444.idx = mul i64 %polly.access.add.Packed_B441, 12
  %polly.access.Packed_B444 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B444.idx
  %_p_scalar_445 = load float, ptr %polly.access.Packed_B444, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_447 = load float, ptr addrspace(1) %scevgep446, align 4, !alias.scope !43, !noalias !44
  %p_448 = tail call float @llvm.fmuladd.f32(float %_p_scalar_438, float %_p_scalar_445, float %_p_scalar_447)
  store float %p_448, ptr addrspace(1) %scevgep446, align 4, !alias.scope !43, !noalias !44
  br i1 %30, label %polly.stmt.for.body11.i454, label %polly.merge488.critedge

polly.merge488.critedge:                          ; preds = %polly.cond449
  %polly.access.Packed_A475.c = getelementptr i8, ptr %polly.access.Packed_A437, i64 4
  %_p_scalar_476.c = load float, ptr %polly.access.Packed_A475.c, align 4, !alias.scope !39, !noalias !40
  %_p_scalar_485.c = load float, ptr addrspace(1) %gep720, align 4, !alias.scope !43, !noalias !44
  %p_486.c = tail call float @llvm.fmuladd.f32(float %_p_scalar_476.c, float %_p_scalar_445, float %_p_scalar_485.c)
  store float %p_486.c, ptr addrspace(1) %gep720, align 4, !alias.scope !43, !noalias !44
  br label %polly.merge488

polly.merge488:                                   ; preds = %polly.stmt.for.body11.i454, %polly.merge488.critedge
  %polly.indvar_next430 = add nuw nsw i64 %polly.indvar429, 1
  %polly.loop_cond431.not.not = icmp slt i64 %polly.indvar429, %152
  br i1 %polly.loop_cond431.not.not, label %polly.cond449, label %polly.loop_if585.loopexit1, !llvm.loop !50

polly.stmt.for.body11.i454:                       ; preds = %polly.cond449
  %polly.access.add.Packed_B462 = add nsw i64 %polly.access.mul.Packed_B461, %polly.indvar429
  %.idx700 = mul i64 %polly.access.add.Packed_B462, 12
  %214 = getelementptr i8, ptr %Packed_B, i64 %.idx700
  %polly.access.Packed_B465 = getelementptr i8, ptr %214, i64 4
  %_p_scalar_466 = load float, ptr %polly.access.Packed_B465, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_468 = load float, ptr addrspace(1) %scevgep467, align 4, !alias.scope !43, !noalias !44
  %p_469 = tail call float @llvm.fmuladd.f32(float %_p_scalar_438, float %_p_scalar_466, float %_p_scalar_468)
  store float %p_469, ptr addrspace(1) %scevgep467, align 4, !alias.scope !43, !noalias !44
  %polly.access.Packed_A475 = getelementptr i8, ptr %polly.access.Packed_A437, i64 4
  %_p_scalar_476 = load float, ptr %polly.access.Packed_A475, align 4, !alias.scope !39, !noalias !40
  %_p_scalar_485 = load float, ptr addrspace(1) %scevgep484, align 4, !alias.scope !43, !noalias !44
  %p_486 = tail call float @llvm.fmuladd.f32(float %_p_scalar_476, float %_p_scalar_445, float %_p_scalar_485)
  store float %p_486, ptr addrspace(1) %scevgep484, align 4, !alias.scope !43, !noalias !44
  %_p_scalar_506 = load float, ptr addrspace(1) %scevgep505, align 4, !alias.scope !43, !noalias !44
  %p_507 = tail call float @llvm.fmuladd.f32(float %_p_scalar_476, float %_p_scalar_466, float %_p_scalar_506)
  store float %p_507, ptr addrspace(1) %scevgep505, align 4, !alias.scope !43, !noalias !44
  br label %polly.merge488

polly.loop_if508:                                 ; preds = %polly.cond420
  br i1 %polly.loop_guard512, label %polly.cond530.preheader, label %polly.loop_if585

polly.cond530.preheader:                          ; preds = %polly.loop_if508
  %215 = mul i64 %13, %159
  %216 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %215
  %scevgep527 = getelementptr i8, ptr addrspace(1) %216, i64 %80
  %scevgep545 = getelementptr i8, ptr addrspace(1) %216, i64 %23
  %217 = mul i64 %13, %134
  %218 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %217
  %scevgep563 = getelementptr i8, ptr addrspace(1) %218, i64 %80
  %scevgep581 = getelementptr i8, ptr addrspace(1) %218, i64 %24
  br label %polly.cond530

polly.cond530:                                    ; preds = %polly.merge549, %polly.cond530.preheader
  %polly.indvar513 = phi i64 [ %polly.indvar_next514, %polly.merge549 ], [ 0, %polly.cond530.preheader ]
  %polly.access.Packed_A520.idx = shl i64 %polly.indvar513, 3
  %polly.access.Packed_A520 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A520.idx
  %_p_scalar_521 = load float, ptr %polly.access.Packed_A520, align 4, !alias.scope !39, !noalias !40
  %polly.access.Packed_B525.idx = mul i64 %polly.indvar513, 12
  %polly.access.Packed_B525 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B525.idx
  %_p_scalar_526 = load float, ptr %polly.access.Packed_B525, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_528 = load float, ptr addrspace(1) %scevgep527, align 4, !alias.scope !43, !noalias !44
  %p_529 = tail call float @llvm.fmuladd.f32(float %_p_scalar_521, float %_p_scalar_526, float %_p_scalar_528)
  store float %p_529, ptr addrspace(1) %scevgep527, align 4, !alias.scope !43, !noalias !44
  br i1 %81, label %polly.stmt.for.body11.i534, label %polly.cond548

polly.cond548:                                    ; preds = %polly.stmt.for.body11.i534, %polly.cond530
  br i1 %125, label %polly.cond566, label %polly.merge549

polly.merge549:                                   ; preds = %polly.stmt.for.body11.i570, %polly.cond566, %polly.cond548
  %polly.indvar_next514 = add nuw nsw i64 %polly.indvar513, 1
  %polly.loop_cond515.not.not = icmp slt i64 %polly.indvar513, %149
  br i1 %polly.loop_cond515.not.not, label %polly.cond530, label %polly.loop_if585.loopexit2, !llvm.loop !51

polly.stmt.for.body11.i534:                       ; preds = %polly.cond530
  %polly.access.Packed_B543 = getelementptr i8, ptr %polly.access.Packed_B525, i64 4
  %_p_scalar_544 = load float, ptr %polly.access.Packed_B543, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_546 = load float, ptr addrspace(1) %scevgep545, align 4, !alias.scope !43, !noalias !44
  %p_547 = tail call float @llvm.fmuladd.f32(float %_p_scalar_521, float %_p_scalar_544, float %_p_scalar_546)
  store float %p_547, ptr addrspace(1) %scevgep545, align 4, !alias.scope !43, !noalias !44
  br label %polly.cond548

polly.cond566:                                    ; preds = %polly.cond548
  %polly.access.Packed_A556 = getelementptr i8, ptr %polly.access.Packed_A520, i64 4
  %_p_scalar_557 = load float, ptr %polly.access.Packed_A556, align 4, !alias.scope !39, !noalias !40
  %_p_scalar_564 = load float, ptr addrspace(1) %scevgep563, align 4, !alias.scope !43, !noalias !44
  %p_565 = tail call float @llvm.fmuladd.f32(float %_p_scalar_557, float %_p_scalar_526, float %_p_scalar_564)
  store float %p_565, ptr addrspace(1) %scevgep563, align 4, !alias.scope !43, !noalias !44
  br i1 %81, label %polly.stmt.for.body11.i570, label %polly.merge549

polly.stmt.for.body11.i570:                       ; preds = %polly.cond566
  %polly.access.Packed_B579 = getelementptr i8, ptr %polly.access.Packed_B525, i64 4
  %_p_scalar_580 = load float, ptr %polly.access.Packed_B579, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_582 = load float, ptr addrspace(1) %scevgep581, align 4, !alias.scope !43, !noalias !44
  %p_583 = tail call float @llvm.fmuladd.f32(float %_p_scalar_557, float %_p_scalar_580, float %_p_scalar_582)
  store float %p_583, ptr addrspace(1) %scevgep581, align 4, !alias.scope !43, !noalias !44
  br label %polly.merge549

polly.loop_if585.loopexit:                        ; preds = %polly.stmt.for.body11.i404
  %p_419.lcssa = phi float [ %p_419, %polly.stmt.for.body11.i404 ]
  store float %p_419.lcssa, ptr addrspace(1) %scevgep417, align 4, !alias.scope !43, !noalias !44
  br label %polly.loop_if585

polly.loop_if585.loopexit1:                       ; preds = %polly.merge488
  br label %polly.loop_if585

polly.loop_if585.loopexit2:                       ; preds = %polly.merge549
  br label %polly.loop_if585

polly.loop_if585:                                 ; preds = %polly.loop_if585.loopexit2, %polly.loop_if585.loopexit1, %polly.loop_if585.loopexit, %polly.loop_if508, %polly.loop_if424, %polly.loop_if396
  %219 = mul nsw i64 %polly.indvar109, -24
  %220 = add nsw i64 %219, %pexp.p_div_q584702
  %221 = tail call i64 @llvm.smin.i64(i64 %220, i64 24)
  %222 = add nsw i64 %221, -1
  %polly.loop_guard589 = icmp sgt i64 %220, 1
  br i1 %polly.loop_guard589, label %polly.loop_if593.preheader, label %polly.merge316

polly.loop_if593.preheader:                       ; preds = %polly.loop_if585
  br label %polly.loop_if593

polly.loop_exit596.loopexit:                      ; preds = %polly.merge642
  br label %polly.loop_exit596

polly.loop_exit596:                               ; preds = %polly.loop_exit596.loopexit, %polly.loop_if593
  %polly.indvar_next591 = add nuw nsw i64 %polly.indvar590, 1
  %polly.loop_cond592.not.not = icmp slt i64 %polly.indvar590, %222
  br i1 %polly.loop_cond592.not.not, label %polly.loop_if593, label %polly.merge316.loopexit

polly.loop_if593:                                 ; preds = %polly.loop_if593.preheader, %polly.loop_exit596
  %polly.indvar590 = phi i64 [ %polly.indvar_next591, %polly.loop_exit596 ], [ 1, %polly.loop_if593.preheader ]
  br i1 %polly.loop_guard597, label %polly.cond619.preheader, label %polly.loop_exit596

polly.cond619.preheader:                          ; preds = %polly.loop_if593
  %223 = shl nuw nsw i64 %polly.indvar590, 1
  %224 = add nuw nsw i64 %159, %223
  %.idx708 = shl i64 %polly.indvar590, 13
  %225 = getelementptr i8, ptr %Packed_A, i64 %.idx708
  %226 = mul i64 %13, %224
  %227 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %226
  %scevgep616 = getelementptr i8, ptr addrspace(1) %227, i64 %41
  %scevgep638 = getelementptr i8, ptr addrspace(1) %227, i64 %45
  %228 = add nuw nsw i64 %224, 2
  %.not = icmp slt i64 %_arg_size_, %228
  %229 = or disjoint i64 %224, 1
  %230 = mul i64 %13, %229
  %231 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %230
  %scevgep661 = getelementptr i8, ptr addrspace(1) %231, i64 %41
  %scevgep683 = getelementptr i8, ptr addrspace(1) %231, i64 %48
  br label %polly.cond619

polly.cond619:                                    ; preds = %polly.merge642, %polly.cond619.preheader
  %polly.indvar598 = phi i64 [ %polly.indvar_next599, %polly.merge642 ], [ 0, %polly.cond619.preheader ]
  %polly.access.Packed_A607.idx = shl i64 %polly.indvar598, 3
  %polly.access.Packed_A607 = getelementptr i8, ptr %225, i64 %polly.access.Packed_A607.idx
  %_p_scalar_608 = load float, ptr %polly.access.Packed_A607, align 4, !alias.scope !39, !noalias !40
  %polly.access.add.Packed_B611 = add nsw i64 %polly.access.mul.Packed_B610, %polly.indvar598
  %polly.access.Packed_B614.idx = mul i64 %polly.access.add.Packed_B611, 12
  %polly.access.Packed_B614 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B614.idx
  %_p_scalar_615 = load float, ptr %polly.access.Packed_B614, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_617 = load float, ptr addrspace(1) %scevgep616, align 4, !alias.scope !43, !noalias !44
  %p_618 = tail call float @llvm.fmuladd.f32(float %_p_scalar_608, float %_p_scalar_615, float %_p_scalar_617)
  store float %p_618, ptr addrspace(1) %scevgep616, align 4, !alias.scope !43, !noalias !44
  br i1 %42, label %polly.stmt.for.body11.i624, label %polly.cond641

polly.cond641:                                    ; preds = %polly.stmt.for.body11.i624, %polly.cond619
  br i1 %.not, label %polly.merge642, label %polly.cond664

polly.merge642:                                   ; preds = %polly.stmt.for.body11.i669, %polly.cond664, %polly.cond641
  %polly.indvar_next599 = add nuw nsw i64 %polly.indvar598, 1
  %polly.loop_cond600.not.not = icmp slt i64 %polly.indvar598, %158
  br i1 %polly.loop_cond600.not.not, label %polly.cond619, label %polly.loop_exit596.loopexit, !llvm.loop !52

polly.stmt.for.body11.i624:                       ; preds = %polly.cond619
  %polly.access.add.Packed_B633 = add nsw i64 %polly.access.mul.Packed_B632, %polly.indvar598
  %.idx703 = mul i64 %polly.access.add.Packed_B633, 12
  %232 = getelementptr i8, ptr %Packed_B, i64 %.idx703
  %polly.access.Packed_B636 = getelementptr i8, ptr %232, i64 4
  %_p_scalar_637 = load float, ptr %polly.access.Packed_B636, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_639 = load float, ptr addrspace(1) %scevgep638, align 4, !alias.scope !43, !noalias !44
  %p_640 = tail call float @llvm.fmuladd.f32(float %_p_scalar_608, float %_p_scalar_637, float %_p_scalar_639)
  store float %p_640, ptr addrspace(1) %scevgep638, align 4, !alias.scope !43, !noalias !44
  br label %polly.cond641

polly.cond664:                                    ; preds = %polly.cond641
  %polly.access.Packed_A652 = getelementptr i8, ptr %polly.access.Packed_A607, i64 4
  %_p_scalar_653 = load float, ptr %polly.access.Packed_A652, align 4, !alias.scope !39, !noalias !40
  %_p_scalar_662 = load float, ptr addrspace(1) %scevgep661, align 4, !alias.scope !43, !noalias !44
  %p_663 = tail call float @llvm.fmuladd.f32(float %_p_scalar_653, float %_p_scalar_615, float %_p_scalar_662)
  store float %p_663, ptr addrspace(1) %scevgep661, align 4, !alias.scope !43, !noalias !44
  br i1 %42, label %polly.stmt.for.body11.i669, label %polly.merge642

polly.stmt.for.body11.i669:                       ; preds = %polly.cond664
  %polly.access.add.Packed_B678 = add nsw i64 %polly.access.mul.Packed_B677, %polly.indvar598
  %.idx704 = mul i64 %polly.access.add.Packed_B678, 12
  %233 = getelementptr i8, ptr %Packed_B, i64 %.idx704
  %polly.access.Packed_B681 = getelementptr i8, ptr %233, i64 4
  %_p_scalar_682 = load float, ptr %polly.access.Packed_B681, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_684 = load float, ptr addrspace(1) %scevgep683, align 4, !alias.scope !43, !noalias !44
  %p_685 = tail call float @llvm.fmuladd.f32(float %_p_scalar_653, float %_p_scalar_682, float %_p_scalar_684)
  store float %p_685, ptr addrspace(1) %scevgep683, align 4, !alias.scope !43, !noalias !44
  br label %polly.merge642
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS15Polybench_2mm_2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_C, ptr addrspace(1) noundef align 4 %_arg_raw_D, ptr addrspace(1) noundef align 4 %_arg_raw_E) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
polly.split_new_and_old:
  %Packed_B = alloca [256 x [1024 x [3 x float]]], align 64
  %Packed_A = alloca [24 x [1024 x [2 x float]]], align 64
  %0 = icmp slt i64 %_arg_size_, 0
  %1 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_size_, i64 -1)
  %.obit = extractvalue { i64, i1 } %1, 1
  %.res = extractvalue { i64, i1 } %1, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %_arg_size_)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state4 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %_arg_size_)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.overflow.state5 = or i1 %polly.overflow.state4, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %polly.access.add..res
  %2 = icmp ugt ptr addrspace(1) %polly.access., %_arg_raw_E
  %polly.access.26 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %polly.access.add..res
  %3 = icmp ugt ptr addrspace(1) %polly.access.26, %_arg_raw_C
  %.not725 = and i1 %2, %3
  %.not723 = or i1 %0, %.not725
  %polly.access.47 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %polly.access.add..res
  %4 = icmp ugt ptr addrspace(1) %polly.access.47, %_arg_raw_E
  %5 = icmp ugt ptr addrspace(1) %polly.access.26, %_arg_raw_D
  %.not727 = and i1 %4, %5
  %.not721 = or i1 %.not723, %.not727
  %polly.rtc.result.not = or i1 %.not721, %polly.overflow.state5
  br i1 %polly.rtc.result.not, label %for.cond.i.preheader, label %polly.loop_if

for.cond.i.preheader:                             ; preds = %polly.split_new_and_old
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.cond.cleanup11.i
  %i.0.i = phi i64 [ %inc39.i, %for.cond.cleanup11.i ], [ 0, %for.cond.i.preheader ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %6 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %for.cond2.i.preheader
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond8.i

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %6, i64 %j.0.i
  store float 0.000000e+00, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !17
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !53

for.cond8.i:                                      ; preds = %for.cond.cleanup17.i, %for.cond8.i.preheader
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup17.i ], [ 0, %for.cond8.i.preheader ]
  %cmp10.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp10.i, label %for.cond14.i.preheader, label %for.cond.cleanup11.i

for.cond14.i.preheader:                           ; preds = %for.cond8.i
  %arrayidx22.i = getelementptr float, ptr addrspace(1) %7, i64 %k.0.i
  %mul24.i = mul i64 %k.0.i, %_arg_size_
  %8 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %mul24.i
  br label %for.cond14.i

for.cond.cleanup11.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !54

for.cond14.i:                                     ; preds = %for.body18.i, %for.cond14.i.preheader
  %j13.0.i = phi i64 [ %inc33.i, %for.body18.i ], [ 0, %for.cond14.i.preheader ]
  %cmp16.i = icmp ult i64 %j13.0.i, %_arg_size_
  br i1 %cmp16.i, label %for.body18.i, label %for.cond.cleanup17.i

for.cond.cleanup17.i:                             ; preds = %for.cond14.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !55

for.body18.i:                                     ; preds = %for.cond14.i
  %9 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !17
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %8, i64 %j13.0.i
  %10 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !17
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %6, i64 %j13.0.i
  %11 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !17
  %12 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %11)
  store float %12, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !17
  %inc33.i = add nuw i64 %j13.0.i, 1
  br label %for.cond14.i, !llvm.loop !56

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit: ; preds = %for.cond.i
  br label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit3: ; preds = %polly.loop_exit111
  br label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit3, %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit, %polly.loop_if100
  ret void

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %polly.fdiv_q.shr = ashr i64 %.res, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_if100

polly.loop_exit80:                                ; preds = %polly.loop_exit87
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader79, label %polly.loop_if100.loopexit

polly.loop_preheader:                             ; preds = %polly.loop_if
  %13 = shl i64 %_arg_size_, 2
  %pexp.p_div_q728 = lshr i64 %.res, 5
  br label %polly.loop_preheader79

polly.loop_exit87.loopexit:                       ; preds = %polly.loop_exit95
  br label %polly.loop_exit87

polly.loop_exit87:                                ; preds = %polly.loop_exit87.loopexit, %polly.loop_if84
  %polly.indvar_next82 = add nuw nsw i64 %polly.indvar81, 1
  %polly.loop_cond83.not.not = icmp ult i64 %polly.indvar81, %pexp.p_div_q728
  br i1 %polly.loop_cond83.not.not, label %polly.loop_if84, label %polly.loop_exit80

polly.loop_preheader79:                           ; preds = %polly.loop_preheader, %polly.loop_exit80
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit80 ]
  %14 = shl nsw i64 %polly.indvar, 5
  %15 = xor i64 %14, -1
  %16 = add nsw i64 %_arg_size_, %15
  %17 = tail call i64 @llvm.smin.i64(i64 %16, i64 31)
  %polly.loop_guard88 = icmp sgt i64 %16, -1
  br label %polly.loop_if84

polly.loop_if84:                                  ; preds = %polly.loop_preheader79, %polly.loop_exit87
  %polly.indvar81 = phi i64 [ 0, %polly.loop_preheader79 ], [ %polly.indvar_next82, %polly.loop_exit87 ]
  %18 = mul i64 %polly.indvar81, -32
  %19 = add i64 %.res, %18
  %smin = call i64 @llvm.smin.i64(i64 %19, i64 31)
  %smax = call i64 @llvm.smax.i64(i64 %smin, i64 0)
  %20 = add nuw nsw i64 %smax, 1
  br i1 %polly.loop_guard88, label %polly.loop_if92.preheader, label %polly.loop_exit87

polly.loop_if92.preheader:                        ; preds = %polly.loop_if84
  %21 = shl nsw i64 %polly.indvar81, 5
  %22 = xor i64 %21, -1
  %23 = add nsw i64 %_arg_size_, %22
  %24 = tail call i64 @llvm.smin.i64(i64 %23, i64 31)
  %polly.loop_guard96 = icmp sgt i64 %23, -1
  br label %polly.loop_if92

polly.loop_exit95.loopexit:                       ; preds = %middle.block, %polly.stmt.for.body6.i
  br label %polly.loop_exit95

polly.loop_exit95:                                ; preds = %polly.loop_exit95.loopexit, %polly.loop_if92
  %polly.indvar_next90 = add nuw nsw i64 %polly.indvar89, 1
  %polly.loop_cond91.not.not = icmp slt i64 %polly.indvar89, %17
  br i1 %polly.loop_cond91.not.not, label %polly.loop_if92, label %polly.loop_exit87.loopexit

polly.loop_if92:                                  ; preds = %polly.loop_exit95, %polly.loop_if92.preheader
  %polly.indvar89 = phi i64 [ %polly.indvar_next90, %polly.loop_exit95 ], [ 0, %polly.loop_if92.preheader ]
  br i1 %polly.loop_guard96, label %polly.stmt.for.body6.i.preheader, label %polly.loop_exit95

polly.stmt.for.body6.i.preheader:                 ; preds = %polly.loop_if92
  %25 = add nuw nsw i64 %14, %polly.indvar89
  %26 = mul i64 %13, %25
  %27 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %26
  %28 = call i64 @llvm.vscale.i64()
  %29 = mul i64 %28, 4
  %min.iters.check = icmp ult i64 %20, %29
  br i1 %min.iters.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %polly.stmt.for.body6.i.preheader
  %30 = call i64 @llvm.vscale.i64()
  %31 = mul i64 %30, 4
  %n.mod.vf = urem i64 %20, %31
  %n.vec = sub i64 %20, %n.mod.vf
  %32 = call i64 @llvm.vscale.i64()
  %33 = mul i64 %32, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = add i64 %index, 0
  %35 = add nuw nsw i64 %21, %34
  %36 = shl i64 %35, 2
  %37 = getelementptr i8, ptr addrspace(1) %27, i64 %36
  %38 = getelementptr float, ptr addrspace(1) %37, i32 0
  store <vscale x 4 x float> zeroinitializer, ptr addrspace(1) %38, align 4, !alias.scope !57, !noalias !60
  %index.next = add nuw i64 %index, %33
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !65

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %20, %n.vec
  br i1 %cmp.n, label %polly.loop_exit95.loopexit, label %scalar.ph

scalar.ph:                                        ; preds = %polly.stmt.for.body6.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %polly.stmt.for.body6.i.preheader ]
  br label %polly.stmt.for.body6.i

polly.stmt.for.body6.i:                           ; preds = %polly.stmt.for.body6.i, %scalar.ph
  %polly.indvar97 = phi i64 [ %polly.indvar_next98, %polly.stmt.for.body6.i ], [ %bc.resume.val, %scalar.ph ]
  %40 = add nuw nsw i64 %21, %polly.indvar97
  %41 = shl i64 %40, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %27, i64 %41
  store float 0.000000e+00, ptr addrspace(1) %scevgep, align 4, !alias.scope !57, !noalias !60
  %polly.indvar_next98 = add nuw nsw i64 %polly.indvar97, 1
  %polly.loop_cond99.not.not = icmp slt i64 %polly.indvar97, %24
  br i1 %polly.loop_cond99.not.not, label %polly.stmt.for.body6.i, label %polly.loop_exit95.loopexit, !llvm.loop !66

polly.loop_if100.loopexit:                        ; preds = %polly.loop_exit80
  br label %polly.loop_if100

polly.loop_if100:                                 ; preds = %polly.loop_if100.loopexit, %polly.loop_if
  %pexp.fdiv_q.1 = add nsw i64 %_arg_size_, -768
  %pexp.fdiv_q.2 = icmp slt i64 %_arg_size_, 1
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 %pexp.fdiv_q.1, i64 %.res
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 768
  %polly.loop_guard104 = icmp sgt i64 %pexp.fdiv_q.3, -768
  br i1 %polly.loop_guard104, label %polly.loop_preheader102, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

polly.loop_exit111:                               ; preds = %polly.loop_exit140
  %polly.indvar_next106 = add nuw nsw i64 %polly.indvar105, 1
  %polly.loop_cond107.not.not = icmp slt i64 %polly.indvar105, %pexp.fdiv_q.4
  br i1 %polly.loop_cond107.not.not, label %polly.loop_preheader110, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit.loopexit3

polly.loop_preheader102:                          ; preds = %polly.loop_if100
  %42 = shl i64 %_arg_size_, 2
  %pexp.p_div_q108729 = lshr i64 %.res, 10
  %pexp.p_div_q137 = udiv i64 %.res, 48
  %pexp.p_div_q167 = udiv i64 %_arg_size_, 3
  %pexp.p_div_q176732 = lshr i64 %_arg_size_, 1
  %43 = and i64 %_arg_size_, 1
  %44 = icmp eq i64 %43, 0
  %pexp.div = lshr exact i64 %.res, 1
  %45 = mul i64 %42, %.res
  %46 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %45
  %47 = mul i64 %pexp.p_div_q167, 3
  %pexp.pdiv_r352.decomposed = sub i64 %_arg_size_, %47
  %48 = icmp ne i64 %pexp.pdiv_r352.decomposed, 0
  %49 = add nsw i64 %_arg_size_, -4
  %pexp.div358 = sdiv exact i64 %49, 3
  %50 = mul i64 %42, %.res
  %51 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %50
  %52 = shl i64 %.res, 2
  %53 = shl i64 %.res, 2
  %54 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r465 = urem i64 %54, 3
  %55 = sub nuw nsw i64 %_arg_size_, %pexp.pdiv_r465
  %pexp.p_div_q472 = udiv i64 %.res, 3
  %56 = shl i64 %pexp.p_div_q472, 10
  %57 = shl i64 %55, 2
  %58 = add nuw nsw i64 %_arg_size_, 1
  %pexp.zdiv_r486 = urem i64 %58, 3
  %59 = icmp eq i64 %pexp.zdiv_r486, 0
  %invariant.gep753 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %57
  %60 = add nsw i64 %_arg_size_, -2
  %pexp.div493 = udiv exact i64 %60, 3
  %61 = shl i64 %pexp.div493, 10
  %62 = shl i64 %.res, 2
  %pexp.div443 = sdiv exact i64 %.res, 3
  %63 = shl i64 %pexp.div443, 10
  %64 = add i64 %42, 4
  %65 = mul i64 %64, %.res
  %scevgep450 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %65
  %66 = add nuw nsw i64 %_arg_size_, 1
  %pexp.p_div_q617736 = lshr i64 %66, 1
  %67 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r634 = urem i64 %67, 3
  %68 = sub nsw i64 %_arg_size_, %pexp.pdiv_r634
  %pexp.p_div_q642 = udiv i64 %.res, 3
  %69 = shl i64 %pexp.p_div_q642, 10
  %70 = shl i64 %68, 2
  %pexp.zdiv_r656 = urem i64 %66, 3
  %71 = icmp eq i64 %pexp.zdiv_r656, 0
  %72 = add nsw i64 %_arg_size_, -2
  %pexp.div664 = sdiv exact i64 %72, 3
  %73 = shl i64 %pexp.div664, 10
  %74 = shl i64 %.res, 2
  %75 = add nsw i64 %_arg_size_, -2
  %pexp.div709 = sdiv exact i64 %75, 3
  %76 = shl i64 %pexp.div709, 10
  %77 = shl i64 %.res, 2
  br label %polly.loop_preheader110

polly.loop_exit140:                               ; preds = %polly.merge349
  %polly.indvar_next113 = add nuw nsw i64 %polly.indvar112, 1
  %polly.loop_cond114.not.not = icmp ult i64 %polly.indvar112, %pexp.p_div_q108729
  br i1 %polly.loop_cond114.not.not, label %polly.loop_if115, label %polly.loop_exit111

polly.loop_preheader110:                          ; preds = %polly.loop_preheader102, %polly.loop_exit111
  %polly.indvar105 = phi i64 [ 0, %polly.loop_preheader102 ], [ %polly.indvar_next106, %polly.loop_exit111 ]
  %78 = mul nuw i64 %polly.indvar105, 768
  %79 = add i64 %78, 767
  %smin17 = call i64 @llvm.smin.i64(i64 %79, i64 %.res)
  %smax18 = call i64 @llvm.smax.i64(i64 %smin17, i64 %78)
  %80 = mul i64 %polly.indvar105, -768
  %81 = add i64 %80, 1
  %82 = add i64 %smax18, %81
  %83 = mul nuw nsw i64 %polly.indvar105, 768
  %84 = add nuw nsw i64 %83, 767
  %85 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %84)
  %polly.loop_guard127.not.not = icmp sgt i64 %_arg_size_, %83
  %86 = shl i64 %polly.indvar105, 18
  %87 = shl i64 %polly.indvar105, 8
  %88 = xor i64 %87, -1
  %89 = add i64 %pexp.p_div_q167, %88
  %90 = tail call i64 @llvm.smin.i64(i64 %89, i64 255)
  %polly.loop_guard172 = icmp sgt i64 %89, -1
  %91 = mul nuw nsw i64 %polly.indvar105, 768
  %92 = mul nuw nsw i64 %polly.indvar105, 768
  %93 = mul nuw nsw i64 %polly.indvar105, 768
  %94 = or disjoint i64 %93, 2
  %95 = icmp sge i64 %94, %_arg_size_
  %96 = add nuw nsw i64 %93, 767
  %97 = icmp sge i64 %96, %_arg_size_
  %98 = or disjoint i64 %93, 3
  %99 = icmp sge i64 %_arg_size_, %98
  %100 = and i1 %99, %97
  %101 = shl nsw i64 %polly.indvar105, 8
  %102 = sub nsw i64 %pexp.div358, %101
  %103 = tail call i64 @llvm.smin.i64(i64 %102, i64 255)
  %polly.loop_guard363 = icmp sgt i64 %102, -1
  %104 = and i1 %97, %48
  %105 = or disjoint i64 %93, 49
  %106 = icmp sge i64 %_arg_size_, %105
  %107 = or disjoint i64 %93, 4
  %108 = icmp sge i64 %_arg_size_, %107
  %109 = mul i64 %polly.indvar105, 3072
  %110 = icmp eq i64 %94, %_arg_size_
  %111 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B473 = sub i64 %56, %111
  %polly.access.mul.Packed_B494 = sub i64 %61, %111
  %112 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B444 = sub i64 %63, %112
  %113 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B643 = sub i64 %69, %113
  %polly.access.mul.Packed_B665 = sub i64 %73, %113
  %polly.access.mul.Packed_B710 = sub i64 %76, %113
  br label %polly.loop_if115

polly.loop_if115:                                 ; preds = %polly.loop_preheader110, %polly.loop_exit140
  %polly.indvar112 = phi i64 [ 0, %polly.loop_preheader110 ], [ %polly.indvar_next113, %polly.loop_exit140 ]
  %114 = shl i64 %polly.indvar112, 10
  %115 = add i64 %114, 1023
  %smin4 = call i64 @llvm.smin.i64(i64 %115, i64 %.res)
  %smax5 = call i64 @llvm.smax.i64(i64 %smin4, i64 %114)
  %116 = mul i64 %polly.indvar112, -1024
  %117 = add i64 %116, 1
  %118 = add i64 %smax5, %117
  %119 = shl i64 %polly.indvar112, 10
  %120 = or disjoint i64 %119, 1023
  %121 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %120)
  %polly.loop_guard119.not.not = icmp sgt i64 %_arg_size_, %119
  br i1 %polly.loop_guard119.not.not, label %polly.loop_if123.preheader, label %polly.loop_preheader139

polly.loop_if123.preheader:                       ; preds = %polly.loop_if115
  br label %polly.loop_if123

polly.loop_exit126.loopexit:                      ; preds = %middle.block19, %polly.loop_header124
  br label %polly.loop_exit126

polly.loop_exit126:                               ; preds = %polly.loop_exit126.loopexit, %polly.loop_if123
  %polly.indvar_next121 = add nuw nsw i64 %polly.indvar120, 1
  %polly.loop_cond122.not.not = icmp slt i64 %polly.indvar120, %121
  br i1 %polly.loop_cond122.not.not, label %polly.loop_if123, label %polly.loop_preheader139.loopexit

polly.loop_if123:                                 ; preds = %polly.loop_if123.preheader, %polly.loop_exit126
  %polly.indvar120 = phi i64 [ %polly.indvar_next121, %polly.loop_exit126 ], [ %119, %polly.loop_if123.preheader ]
  br i1 %polly.loop_guard127.not.not, label %polly.loop_header124.preheader, label %polly.loop_exit126

polly.loop_header124.preheader:                   ; preds = %polly.loop_if123
  %polly.access.mul.131 = mul nuw nsw i64 %polly.indvar120, %_arg_size_
  %122 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %polly.access.mul.131
  %123 = sub i64 %polly.indvar120, %119
  %124 = call i64 @llvm.vscale.i64()
  %125 = mul i64 %124, 4
  %min.iters.check21 = icmp ult i64 %82, %125
  br i1 %min.iters.check21, label %scalar.ph20, label %vector.ph22

vector.ph22:                                      ; preds = %polly.loop_header124.preheader
  %126 = call i64 @llvm.vscale.i64()
  %127 = mul i64 %126, 4
  %n.mod.vf23 = urem i64 %82, %127
  %n.vec24 = sub i64 %82, %n.mod.vf23
  %ind.end25 = add i64 %83, %n.vec24
  %128 = call i64 @llvm.vscale.i64()
  %129 = mul i64 %128, 4
  %.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %83, i64 0
  %.splat = shufflevector <vscale x 4 x i64> %.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %130 = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
  %131 = add <vscale x 4 x i64> %130, zeroinitializer
  %132 = mul <vscale x 4 x i64> %131, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %induction = add <vscale x 4 x i64> %.splat, %132
  %133 = call i64 @llvm.vscale.i64()
  %134 = mul i64 %133, 4
  %135 = mul i64 1, %134
  %.splatinsert30 = insertelement <vscale x 4 x i64> poison, i64 %135, i64 0
  %.splat31 = shufflevector <vscale x 4 x i64> %.splatinsert30, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %86, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x i64> %broadcast.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert33 = insertelement <vscale x 4 x i64> poison, i64 %123, i64 0
  %broadcast.splat34 = shufflevector <vscale x 4 x i64> %broadcast.splatinsert33, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph22
  %index29 = phi i64 [ 0, %vector.ph22 ], [ %index.next35, %vector.body28 ]
  %vec.ind = phi <vscale x 4 x i64> [ %induction, %vector.ph22 ], [ %vec.ind.next, %vector.body28 ]
  %offset.idx32 = add i64 %83, %index29
  %136 = add i64 %offset.idx32, 0
  %137 = getelementptr float, ptr addrspace(1) %122, i64 %136
  %138 = getelementptr float, ptr addrspace(1) %137, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %138, align 4, !alias.scope !67, !noalias !68
  %139 = freeze <vscale x 4 x i64> %vec.ind
  %140 = udiv <vscale x 4 x i64> %139, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %141 = shl <vscale x 4 x i64> %140, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 10, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %142 = sub <vscale x 4 x i64> %141, %broadcast.splat
  %143 = add nsw <vscale x 4 x i64> %142, %broadcast.splat34
  %144 = mul <vscale x 4 x i64> %140, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %145 = sub <vscale x 4 x i64> %139, %144
  %146 = mul <vscale x 4 x i64> %143, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 12, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %147 = getelementptr i8, ptr %Packed_B, <vscale x 4 x i64> %146
  %148 = getelementptr float, <vscale x 4 x ptr> %147, <vscale x 4 x i64> %145
  call void @llvm.masked.scatter.nxv4f32.nxv4p0(<vscale x 4 x float> %wide.load, <vscale x 4 x ptr> %148, i32 4, <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 true, i64 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer)), !alias.scope !69, !noalias !70
  %index.next35 = add nuw i64 %index29, %129
  %vec.ind.next = add <vscale x 4 x i64> %vec.ind, %.splat31
  %149 = icmp eq i64 %index.next35, %n.vec24
  br i1 %149, label %middle.block19, label %vector.body28, !llvm.loop !71

middle.block19:                                   ; preds = %vector.body28
  %cmp.n27 = icmp eq i64 %82, %n.vec24
  br i1 %cmp.n27, label %polly.loop_exit126.loopexit, label %scalar.ph20

scalar.ph20:                                      ; preds = %polly.loop_header124.preheader, %middle.block19
  %bc.resume.val26 = phi i64 [ %ind.end25, %middle.block19 ], [ %83, %polly.loop_header124.preheader ]
  br label %polly.loop_header124

polly.loop_header124:                             ; preds = %polly.loop_header124, %scalar.ph20
  %polly.indvar128 = phi i64 [ %polly.indvar_next129, %polly.loop_header124 ], [ %bc.resume.val26, %scalar.ph20 ]
  %polly.access.133 = getelementptr float, ptr addrspace(1) %122, i64 %polly.indvar128
  %polly.access.133.load = load float, ptr addrspace(1) %polly.access.133, align 4, !alias.scope !67, !noalias !68
  %polly.indvar128.frozen = freeze i64 %polly.indvar128
  %pexp.p_div_q134 = udiv i64 %polly.indvar128.frozen, 3
  %150 = shl i64 %pexp.p_div_q134, 10
  %polly.access.mul.Packed_B = sub i64 %150, %86
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %123
  %151 = mul i64 %pexp.p_div_q134, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar128.frozen, %151
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %152 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %152, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.133.load, ptr %polly.access.Packed_B, align 4, !alias.scope !69, !noalias !70
  %polly.indvar_next129 = add nuw nsw i64 %polly.indvar128, 1
  %polly.loop_cond130.not.not = icmp slt i64 %polly.indvar128, %85
  br i1 %polly.loop_cond130.not.not, label %polly.loop_header124, label %polly.loop_exit126.loopexit, !llvm.loop !72

polly.cond.loopexit:                              ; preds = %polly.loop_exit155
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_if144
  %153 = or disjoint i64 %188, 2
  %154 = icmp sge i64 %_arg_size_, %153
  %brmerge.not = select i1 %154, i1 %polly.loop_guard172, i1 false
  br i1 %brmerge.not, label %polly.loop_if177.preheader, label %polly.cond348

polly.cond348.loopexit:                           ; preds = %polly.merge287
  br label %polly.cond348

polly.cond348:                                    ; preds = %polly.cond348.loopexit, %polly.cond
  %155 = and i1 %95, %154
  %156 = or disjoint i64 %188, 3
  %157 = icmp sge i64 %_arg_size_, %156
  %158 = and i1 %97, %157
  %159 = and i1 %100, %154
  %160 = or i1 %158, %159
  %161 = and i1 %160, %48
  %162 = or i1 %155, %161
  %163 = or disjoint i64 %188, 1
  %164 = icmp eq i64 %163, %_arg_size_
  %165 = or i1 %162, %164
  br i1 %165, label %polly.cond354, label %polly.merge349

polly.merge349.loopexit:                          ; preds = %polly.loop_exit629
  br label %polly.merge349

polly.merge349:                                   ; preds = %polly.merge349.loopexit, %polly.loop_if618, %polly.cond420, %polly.cond348
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond143.not.not = icmp ult i64 %polly.indvar141, %pexp.p_div_q137
  br i1 %polly.loop_cond143.not.not, label %polly.loop_if144, label %polly.loop_exit140

polly.loop_preheader139.loopexit:                 ; preds = %polly.loop_exit126
  br label %polly.loop_preheader139

polly.loop_preheader139:                          ; preds = %polly.loop_preheader139.loopexit, %polly.loop_if115
  %166 = shl i64 %polly.indvar112, 11
  %167 = xor i64 %119, -1
  %168 = add nsw i64 %_arg_size_, %167
  %169 = tail call i64 @llvm.smin.i64(i64 %168, i64 1023)
  %polly.loop_guard189 = icmp sgt i64 %168, -1
  %170 = xor i64 %119, -1
  %171 = add nsw i64 %_arg_size_, %170
  %172 = tail call i64 @llvm.smin.i64(i64 %171, i64 1023)
  %polly.loop_guard294 = icmp slt i64 %171, 0
  %173 = xor i64 %119, -1
  %174 = add nsw i64 %_arg_size_, %173
  %175 = tail call i64 @llvm.smin.i64(i64 %174, i64 1023)
  %polly.loop_guard371 = icmp sgt i64 %174, -1
  %176 = xor i64 %119, -1
  %177 = add nsw i64 %_arg_size_, %176
  %178 = tail call i64 @llvm.smin.i64(i64 %177, i64 1023)
  %polly.loop_guard545 = icmp sgt i64 %177, -1
  %179 = xor i64 %119, -1
  %180 = add nsw i64 %_arg_size_, %179
  %181 = tail call i64 @llvm.smin.i64(i64 %180, i64 1023)
  %polly.loop_guard461 = icmp sgt i64 %180, -1
  %182 = xor i64 %119, -1
  %183 = add nsw i64 %_arg_size_, %182
  %184 = tail call i64 @llvm.smin.i64(i64 %183, i64 1023)
  %polly.loop_guard433 = icmp sgt i64 %183, -1
  %185 = xor i64 %119, -1
  %186 = add nsw i64 %_arg_size_, %185
  %187 = tail call i64 @llvm.smin.i64(i64 %186, i64 1023)
  %polly.loop_guard630 = icmp sgt i64 %186, -1
  br label %polly.loop_if144

polly.loop_if144:                                 ; preds = %polly.loop_preheader139, %polly.merge349
  %polly.indvar141 = phi i64 [ 0, %polly.loop_preheader139 ], [ %polly.indvar_next142, %polly.merge349 ]
  %188 = mul nuw nsw i64 %polly.indvar141, 48
  %189 = add nuw nsw i64 %188, 47
  %190 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %189)
  %polly.loop_guard148.not.not = icmp sgt i64 %_arg_size_, %188
  br i1 %polly.loop_guard148.not.not, label %polly.loop_if152.preheader, label %polly.cond

polly.loop_if152.preheader:                       ; preds = %polly.loop_if144
  %191 = mul i64 %polly.indvar141, 2251799813685224
  br label %polly.loop_if152

polly.loop_exit155.loopexit:                      ; preds = %middle.block6, %polly.loop_header153
  br label %polly.loop_exit155

polly.loop_exit155:                               ; preds = %polly.loop_exit155.loopexit, %polly.loop_if152
  %polly.indvar_next150 = add nuw nsw i64 %polly.indvar149, 1
  %polly.loop_cond151.not.not = icmp slt i64 %polly.indvar149, %190
  br i1 %polly.loop_cond151.not.not, label %polly.loop_if152, label %polly.cond.loopexit

polly.loop_if152:                                 ; preds = %polly.loop_exit155, %polly.loop_if152.preheader
  %polly.indvar149 = phi i64 [ %polly.indvar_next150, %polly.loop_exit155 ], [ %188, %polly.loop_if152.preheader ]
  br i1 %polly.loop_guard119.not.not, label %polly.loop_header153.preheader, label %polly.loop_exit155

polly.loop_header153.preheader:                   ; preds = %polly.loop_if152
  %polly.access.mul.160 = mul nuw nsw i64 %polly.indvar149, %_arg_size_
  %192 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %polly.access.mul.160
  %pexp.p_div_q163730 = lshr i64 %polly.indvar149, 1
  %193 = add i64 %191, %pexp.p_div_q163730
  %pexp.pdiv_r165 = and i64 %polly.indvar149, 1
  %.idx731 = shl i64 %193, 13
  %194 = getelementptr i8, ptr %Packed_A, i64 %.idx731
  %invariant.gep = getelementptr float, ptr %194, i64 %pexp.pdiv_r165
  %min.iters.check8 = icmp ult i64 %118, 2
  br i1 %min.iters.check8, label %scalar.ph7, label %vector.ph9

vector.ph9:                                       ; preds = %polly.loop_header153.preheader
  %n.mod.vf10 = urem i64 %118, 2
  %n.vec11 = sub i64 %118, %n.mod.vf10
  %ind.end = add i64 %119, %n.vec11
  br label %vector.body14

vector.body14:                                    ; preds = %vector.body14, %vector.ph9
  %index15 = phi i64 [ 0, %vector.ph9 ], [ %index.next16, %vector.body14 ]
  %offset.idx = add i64 %119, %index15
  %195 = add i64 %offset.idx, 0
  %196 = add i64 %offset.idx, 1
  %197 = getelementptr float, ptr addrspace(1) %192, i64 %195
  %198 = getelementptr float, ptr addrspace(1) %192, i64 %196
  %199 = load float, ptr addrspace(1) %197, align 4, !alias.scope !73, !noalias !74
  %200 = load float, ptr addrspace(1) %198, align 4, !alias.scope !73, !noalias !74
  %201 = shl nuw i64 %195, 1
  %202 = shl nuw i64 %196, 1
  %203 = sub i64 %201, %166
  %204 = sub i64 %202, %166
  %205 = getelementptr float, ptr %invariant.gep, i64 %203
  %206 = getelementptr float, ptr %invariant.gep, i64 %204
  store float %199, ptr %205, align 4, !alias.scope !75, !noalias !76
  store float %200, ptr %206, align 4, !alias.scope !75, !noalias !76
  %index.next16 = add nuw i64 %index15, 2
  %207 = icmp eq i64 %index.next16, %n.vec11
  br i1 %207, label %middle.block6, label %vector.body14, !llvm.loop !77

middle.block6:                                    ; preds = %vector.body14
  %cmp.n13 = icmp eq i64 %118, %n.vec11
  br i1 %cmp.n13, label %polly.loop_exit155.loopexit, label %scalar.ph7

scalar.ph7:                                       ; preds = %polly.loop_header153.preheader, %middle.block6
  %bc.resume.val12 = phi i64 [ %ind.end, %middle.block6 ], [ %119, %polly.loop_header153.preheader ]
  br label %polly.loop_header153

polly.loop_header153:                             ; preds = %polly.loop_header153, %scalar.ph7
  %polly.indvar157 = phi i64 [ %polly.indvar_next158, %polly.loop_header153 ], [ %bc.resume.val12, %scalar.ph7 ]
  %polly.access.162 = getelementptr float, ptr addrspace(1) %192, i64 %polly.indvar157
  %polly.access.162.load = load float, ptr addrspace(1) %polly.access.162, align 4, !alias.scope !73, !noalias !74
  %208 = shl nuw i64 %polly.indvar157, 1
  %209 = sub i64 %208, %166
  %gep = getelementptr float, ptr %invariant.gep, i64 %209
  store float %polly.access.162.load, ptr %gep, align 4, !alias.scope !75, !noalias !76
  %polly.indvar_next158 = add nuw nsw i64 %polly.indvar157, 1
  %polly.loop_cond159.not.not = icmp slt i64 %polly.indvar157, %121
  br i1 %polly.loop_cond159.not.not, label %polly.loop_header153, label %polly.loop_exit155.loopexit, !llvm.loop !78

polly.loop_if177.preheader:                       ; preds = %polly.cond
  %210 = mul nsw i64 %polly.indvar141, -24
  %211 = add nsw i64 %210, %pexp.p_div_q176732
  %212 = tail call i64 @llvm.smin.i64(i64 %211, i64 24)
  %213 = add nsw i64 %212, -1
  %polly.loop_guard181 = icmp sgt i64 %211, 0
  %214 = icmp slt i64 %189, %_arg_size_
  %.not762 = or i1 %214, %44
  %.neg = mul i64 %polly.indvar141, 2251799813685224
  %215 = add i64 %.neg, %pexp.div
  %.idx733 = shl i64 %215, 13
  %216 = getelementptr i8, ptr %Packed_A, i64 %.idx733
  br label %polly.loop_if177

polly.cond286.loopexit:                           ; preds = %polly.loop_exit188
  br label %polly.cond286

polly.cond286:                                    ; preds = %polly.cond286.loopexit, %polly.loop_if177
  %brmerge757 = select i1 %.not762, i1 true, i1 %polly.loop_guard294
  br i1 %brmerge757, label %polly.merge287, label %polly.stmt.for.body18.i331.preheader

polly.merge287.loopexit:                          ; preds = %polly.stmt.for.body18.i331
  %p_313.lcssa = phi float [ %p_313, %polly.stmt.for.body18.i331 ]
  %p_330.lcssa = phi float [ %p_330, %polly.stmt.for.body18.i331 ]
  %p_347.lcssa = phi float [ %p_347, %polly.stmt.for.body18.i331 ]
  store float %p_313.lcssa, ptr addrspace(1) %scevgep311, align 4, !alias.scope !57, !noalias !60
  store float %p_330.lcssa, ptr addrspace(1) %scevgep328, align 4, !alias.scope !57, !noalias !60
  store float %p_347.lcssa, ptr addrspace(1) %scevgep345, align 4, !alias.scope !57, !noalias !60
  br label %polly.merge287

polly.merge287:                                   ; preds = %polly.merge287.loopexit, %polly.cond286
  %polly.indvar_next174 = add nuw nsw i64 %polly.indvar173, 1
  %polly.loop_cond175.not.not = icmp slt i64 %polly.indvar173, %90
  br i1 %polly.loop_cond175.not.not, label %polly.loop_if177, label %polly.cond348.loopexit

polly.loop_if177:                                 ; preds = %polly.merge287, %polly.loop_if177.preheader
  %polly.indvar173 = phi i64 [ %polly.indvar_next174, %polly.merge287 ], [ 0, %polly.loop_if177.preheader ]
  br i1 %polly.loop_guard181, label %polly.loop_if185.preheader, label %polly.cond286

polly.loop_if185.preheader:                       ; preds = %polly.loop_if177
  %217 = mul nuw nsw i64 %polly.indvar173, 3
  %218 = add nuw nsw i64 %91, %217
  %polly.access.mul.Packed_B198 = shl nsw i64 %polly.indvar173, 10
  %219 = shl i64 %218, 2
  %220 = add i64 %219, 4
  %221 = add i64 %219, 8
  br label %polly.loop_if185

polly.loop_exit188.loopexit:                      ; preds = %polly.stmt.for.body18.i270
  br label %polly.loop_exit188

polly.loop_exit188:                               ; preds = %polly.loop_exit188.loopexit, %polly.loop_if185
  %polly.indvar_next183 = add nuw nsw i64 %polly.indvar182, 1
  %polly.loop_cond184.not.not = icmp slt i64 %polly.indvar182, %213
  br i1 %polly.loop_cond184.not.not, label %polly.loop_if185, label %polly.cond286.loopexit

polly.loop_if185:                                 ; preds = %polly.loop_exit188, %polly.loop_if185.preheader
  %polly.indvar182 = phi i64 [ %polly.indvar_next183, %polly.loop_exit188 ], [ 0, %polly.loop_if185.preheader ]
  br i1 %polly.loop_guard189, label %polly.stmt.for.body18.i270.preheader, label %polly.loop_exit188

polly.stmt.for.body18.i270.preheader:             ; preds = %polly.loop_if185
  %222 = shl nuw nsw i64 %polly.indvar182, 1
  %223 = add nuw nsw i64 %188, %222
  %.idx741 = shl i64 %polly.indvar182, 13
  %224 = getelementptr i8, ptr %Packed_A, i64 %.idx741
  %225 = mul i64 %42, %223
  %226 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %225
  %scevgep204 = getelementptr i8, ptr addrspace(1) %226, i64 %219
  %scevgep219 = getelementptr i8, ptr addrspace(1) %226, i64 %220
  %scevgep235 = getelementptr i8, ptr addrspace(1) %226, i64 %221
  %227 = or disjoint i64 %223, 1
  %228 = mul i64 %42, %227
  %229 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %228
  %scevgep251 = getelementptr i8, ptr addrspace(1) %229, i64 %219
  %scevgep267 = getelementptr i8, ptr addrspace(1) %229, i64 %220
  %scevgep283 = getelementptr i8, ptr addrspace(1) %229, i64 %221
  br label %polly.stmt.for.body18.i270

polly.stmt.for.body18.i270:                       ; preds = %polly.stmt.for.body18.i270, %polly.stmt.for.body18.i270.preheader
  %polly.indvar190 = phi i64 [ %polly.indvar_next191, %polly.stmt.for.body18.i270 ], [ 0, %polly.stmt.for.body18.i270.preheader ]
  %polly.access.Packed_A197.idx = shl i64 %polly.indvar190, 3
  %polly.access.Packed_A197 = getelementptr i8, ptr %224, i64 %polly.access.Packed_A197.idx
  %_p_scalar_ = load float, ptr %polly.access.Packed_A197, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B199 = add nuw nsw i64 %polly.access.mul.Packed_B198, %polly.indvar190
  %polly.access.Packed_B202.idx = mul i64 %polly.access.add.Packed_B199, 12
  %polly.access.Packed_B202 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B202.idx
  %_p_scalar_203 = load float, ptr %polly.access.Packed_B202, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_205 = load float, ptr addrspace(1) %scevgep204, align 4, !alias.scope !57, !noalias !60
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_203, float %_p_scalar_205)
  store float %p_, ptr addrspace(1) %scevgep204, align 4, !alias.scope !57, !noalias !60
  %polly.access.Packed_B217 = getelementptr i8, ptr %polly.access.Packed_B202, i64 4
  %_p_scalar_218 = load float, ptr %polly.access.Packed_B217, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_220 = load float, ptr addrspace(1) %scevgep219, align 4, !alias.scope !57, !noalias !60
  %p_221 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_218, float %_p_scalar_220)
  store float %p_221, ptr addrspace(1) %scevgep219, align 4, !alias.scope !57, !noalias !60
  %polly.access.Packed_B233 = getelementptr i8, ptr %polly.access.Packed_B202, i64 8
  %_p_scalar_234 = load float, ptr %polly.access.Packed_B233, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_236 = load float, ptr addrspace(1) %scevgep235, align 4, !alias.scope !57, !noalias !60
  %p_237 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_234, float %_p_scalar_236)
  store float %p_237, ptr addrspace(1) %scevgep235, align 4, !alias.scope !57, !noalias !60
  %polly.access.Packed_A243 = getelementptr i8, ptr %polly.access.Packed_A197, i64 4
  %_p_scalar_244 = load float, ptr %polly.access.Packed_A243, align 4, !alias.scope !75, !noalias !76
  %_p_scalar_252 = load float, ptr addrspace(1) %scevgep251, align 4, !alias.scope !57, !noalias !60
  %p_253 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_203, float %_p_scalar_252)
  store float %p_253, ptr addrspace(1) %scevgep251, align 4, !alias.scope !57, !noalias !60
  %_p_scalar_268 = load float, ptr addrspace(1) %scevgep267, align 4, !alias.scope !57, !noalias !60
  %p_269 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_218, float %_p_scalar_268)
  store float %p_269, ptr addrspace(1) %scevgep267, align 4, !alias.scope !57, !noalias !60
  %_p_scalar_284 = load float, ptr addrspace(1) %scevgep283, align 4, !alias.scope !57, !noalias !60
  %p_285 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_234, float %_p_scalar_284)
  store float %p_285, ptr addrspace(1) %scevgep283, align 4, !alias.scope !57, !noalias !60
  %polly.indvar_next191 = add nuw nsw i64 %polly.indvar190, 1
  %polly.loop_cond192.not.not = icmp slt i64 %polly.indvar190, %169
  br i1 %polly.loop_cond192.not.not, label %polly.stmt.for.body18.i270, label %polly.loop_exit188.loopexit, !llvm.loop !79

polly.stmt.for.body18.i331.preheader:             ; preds = %polly.cond286
  %230 = mul nuw nsw i64 %polly.indvar173, 3
  %231 = add nuw nsw i64 %92, %230
  %polly.access.mul.Packed_B305 = shl nsw i64 %polly.indvar173, 10
  %232 = shl i64 %231, 2
  %scevgep311 = getelementptr i8, ptr addrspace(1) %46, i64 %232
  %scevgep328 = getelementptr i8, ptr addrspace(1) %scevgep311, i64 4
  %scevgep345 = getelementptr i8, ptr addrspace(1) %scevgep311, i64 8
  %scevgep311.promoted = load float, ptr addrspace(1) %scevgep311, align 4, !alias.scope !57, !noalias !60
  %scevgep328.promoted = load float, ptr addrspace(1) %scevgep328, align 4, !alias.scope !57, !noalias !60
  %scevgep345.promoted = load float, ptr addrspace(1) %scevgep345, align 4, !alias.scope !57, !noalias !60
  br label %polly.stmt.for.body18.i331

polly.stmt.for.body18.i331:                       ; preds = %polly.stmt.for.body18.i331, %polly.stmt.for.body18.i331.preheader
  %p_347748 = phi float [ %p_347, %polly.stmt.for.body18.i331 ], [ %scevgep345.promoted, %polly.stmt.for.body18.i331.preheader ]
  %p_330747 = phi float [ %p_330, %polly.stmt.for.body18.i331 ], [ %scevgep328.promoted, %polly.stmt.for.body18.i331.preheader ]
  %_p_scalar_312746 = phi float [ %p_313, %polly.stmt.for.body18.i331 ], [ %scevgep311.promoted, %polly.stmt.for.body18.i331.preheader ]
  %polly.indvar295 = phi i64 [ %polly.indvar_next296, %polly.stmt.for.body18.i331 ], [ 0, %polly.stmt.for.body18.i331.preheader ]
  %polly.access.Packed_A303.idx = shl i64 %polly.indvar295, 3
  %polly.access.Packed_A303 = getelementptr i8, ptr %216, i64 %polly.access.Packed_A303.idx
  %_p_scalar_304 = load float, ptr %polly.access.Packed_A303, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B306 = add nuw nsw i64 %polly.access.mul.Packed_B305, %polly.indvar295
  %polly.access.Packed_B309.idx = mul i64 %polly.access.add.Packed_B306, 12
  %polly.access.Packed_B309 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B309.idx
  %_p_scalar_310 = load float, ptr %polly.access.Packed_B309, align 4, !alias.scope !69, !noalias !70
  %p_313 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_310, float %_p_scalar_312746)
  %polly.access.Packed_B326 = getelementptr i8, ptr %polly.access.Packed_B309, i64 4
  %_p_scalar_327 = load float, ptr %polly.access.Packed_B326, align 4, !alias.scope !69, !noalias !70
  %p_330 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_327, float %p_330747)
  %polly.access.Packed_B343 = getelementptr i8, ptr %polly.access.Packed_B309, i64 8
  %_p_scalar_344 = load float, ptr %polly.access.Packed_B343, align 4, !alias.scope !69, !noalias !70
  %p_347 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_344, float %p_347748)
  %polly.indvar_next296 = add nuw nsw i64 %polly.indvar295, 1
  %polly.loop_cond297.not.not = icmp slt i64 %polly.indvar295, %172
  br i1 %polly.loop_cond297.not.not, label %polly.stmt.for.body18.i331, label %polly.merge287.loopexit, !llvm.loop !80

polly.cond354:                                    ; preds = %polly.cond348
  %brmerge759.not = select i1 %164, i1 %polly.loop_guard363, i1 false
  br i1 %brmerge759.not, label %polly.loop_if367.preheader, label %polly.cond420

polly.loop_if367.preheader:                       ; preds = %polly.cond354
  br label %polly.loop_if367

polly.cond420.loopexit:                           ; preds = %polly.loop_exit370
  br label %polly.cond420

polly.cond420:                                    ; preds = %polly.cond420.loopexit, %polly.cond354
  br i1 %104, label %polly.cond425, label %polly.merge349

polly.loop_exit370.loopexit:                      ; preds = %polly.stmt.for.body18.i405
  %p_389.lcssa = phi float [ %p_389, %polly.stmt.for.body18.i405 ]
  %p_404.lcssa = phi float [ %p_404, %polly.stmt.for.body18.i405 ]
  %p_419.lcssa = phi float [ %p_419, %polly.stmt.for.body18.i405 ]
  store float %p_389.lcssa, ptr addrspace(1) %scevgep387, align 4, !alias.scope !57, !noalias !60
  store float %p_404.lcssa, ptr addrspace(1) %scevgep402, align 4, !alias.scope !57, !noalias !60
  store float %p_419.lcssa, ptr addrspace(1) %scevgep417, align 4, !alias.scope !57, !noalias !60
  br label %polly.loop_exit370

polly.loop_exit370:                               ; preds = %polly.loop_if367, %polly.loop_exit370.loopexit
  %polly.indvar_next365 = add nuw nsw i64 %polly.indvar364, 1
  %polly.loop_cond366.not.not = icmp slt i64 %polly.indvar364, %103
  br i1 %polly.loop_cond366.not.not, label %polly.loop_if367, label %polly.cond420.loopexit

polly.loop_if367:                                 ; preds = %polly.loop_if367.preheader, %polly.loop_exit370
  %polly.indvar364 = phi i64 [ %polly.indvar_next365, %polly.loop_exit370 ], [ 0, %polly.loop_if367.preheader ]
  br i1 %polly.loop_guard371, label %polly.stmt.for.body18.i405.preheader, label %polly.loop_exit370

polly.stmt.for.body18.i405.preheader:             ; preds = %polly.loop_if367
  %233 = mul nuw nsw i64 %polly.indvar364, 3
  %234 = add nuw nsw i64 %93, %233
  %polly.access.mul.Packed_B381 = shl nsw i64 %polly.indvar364, 10
  %235 = shl i64 %234, 2
  %scevgep387 = getelementptr i8, ptr addrspace(1) %51, i64 %235
  %scevgep402 = getelementptr i8, ptr addrspace(1) %scevgep387, i64 4
  %scevgep417 = getelementptr i8, ptr addrspace(1) %scevgep387, i64 8
  %scevgep387.promoted = load float, ptr addrspace(1) %scevgep387, align 4, !alias.scope !57, !noalias !60
  %scevgep402.promoted = load float, ptr addrspace(1) %scevgep402, align 4, !alias.scope !57, !noalias !60
  %scevgep417.promoted = load float, ptr addrspace(1) %scevgep417, align 4, !alias.scope !57, !noalias !60
  br label %polly.stmt.for.body18.i405

polly.stmt.for.body18.i405:                       ; preds = %polly.stmt.for.body18.i405, %polly.stmt.for.body18.i405.preheader
  %p_419751 = phi float [ %p_419, %polly.stmt.for.body18.i405 ], [ %scevgep417.promoted, %polly.stmt.for.body18.i405.preheader ]
  %p_404750 = phi float [ %p_404, %polly.stmt.for.body18.i405 ], [ %scevgep402.promoted, %polly.stmt.for.body18.i405.preheader ]
  %_p_scalar_388749 = phi float [ %p_389, %polly.stmt.for.body18.i405 ], [ %scevgep387.promoted, %polly.stmt.for.body18.i405.preheader ]
  %polly.indvar372 = phi i64 [ %polly.indvar_next373, %polly.stmt.for.body18.i405 ], [ 0, %polly.stmt.for.body18.i405.preheader ]
  %polly.access.Packed_A379.idx = shl i64 %polly.indvar372, 3
  %polly.access.Packed_A379 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A379.idx
  %_p_scalar_380 = load float, ptr %polly.access.Packed_A379, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B382 = add nuw nsw i64 %polly.access.mul.Packed_B381, %polly.indvar372
  %polly.access.Packed_B385.idx = mul i64 %polly.access.add.Packed_B382, 12
  %polly.access.Packed_B385 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B385.idx
  %_p_scalar_386 = load float, ptr %polly.access.Packed_B385, align 4, !alias.scope !69, !noalias !70
  %p_389 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_386, float %_p_scalar_388749)
  %polly.access.Packed_B400 = getelementptr i8, ptr %polly.access.Packed_B385, i64 4
  %_p_scalar_401 = load float, ptr %polly.access.Packed_B400, align 4, !alias.scope !69, !noalias !70
  %p_404 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_401, float %p_404750)
  %polly.access.Packed_B415 = getelementptr i8, ptr %polly.access.Packed_B385, i64 8
  %_p_scalar_416 = load float, ptr %polly.access.Packed_B415, align 4, !alias.scope !69, !noalias !70
  %p_419 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_416, float %p_419751)
  %polly.indvar_next373 = add nuw nsw i64 %polly.indvar372, 1
  %polly.loop_cond374.not.not = icmp slt i64 %polly.indvar372, %175
  br i1 %polly.loop_cond374.not.not, label %polly.stmt.for.body18.i405, label %polly.loop_exit370.loopexit, !llvm.loop !81

polly.cond425:                                    ; preds = %polly.cond420
  %236 = and i1 %106, %164
  br i1 %236, label %polly.loop_if429, label %polly.cond453

polly.cond453:                                    ; preds = %polly.cond425
  %237 = and i1 %108, %154
  br i1 %237, label %polly.loop_if457, label %polly.loop_if541

polly.loop_if429:                                 ; preds = %polly.cond425
  br i1 %polly.loop_guard433, label %polly.stmt.for.body18.i437.preheader, label %polly.loop_if618

polly.stmt.for.body18.i437.preheader:             ; preds = %polly.loop_if429
  %scevgep450.promoted = load float, ptr addrspace(1) %scevgep450, align 4, !alias.scope !57, !noalias !60
  br label %polly.stmt.for.body18.i437

polly.stmt.for.body18.i437:                       ; preds = %polly.stmt.for.body18.i437, %polly.stmt.for.body18.i437.preheader
  %p_452752 = phi float [ %p_452, %polly.stmt.for.body18.i437 ], [ %scevgep450.promoted, %polly.stmt.for.body18.i437.preheader ]
  %polly.indvar434 = phi i64 [ %polly.indvar_next435, %polly.stmt.for.body18.i437 ], [ 0, %polly.stmt.for.body18.i437.preheader ]
  %polly.access.Packed_A441.idx = shl i64 %polly.indvar434, 3
  %polly.access.Packed_A441 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A441.idx
  %_p_scalar_442 = load float, ptr %polly.access.Packed_A441, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B445 = add nsw i64 %polly.access.mul.Packed_B444, %polly.indvar434
  %polly.access.Packed_B448.idx = mul i64 %polly.access.add.Packed_B445, 12
  %polly.access.Packed_B448 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B448.idx
  %_p_scalar_449 = load float, ptr %polly.access.Packed_B448, align 4, !alias.scope !69, !noalias !70
  %p_452 = tail call float @llvm.fmuladd.f32(float %_p_scalar_442, float %_p_scalar_449, float %p_452752)
  %polly.indvar_next435 = add nuw nsw i64 %polly.indvar434, 1
  %polly.loop_cond436.not.not = icmp slt i64 %polly.indvar434, %184
  br i1 %polly.loop_cond436.not.not, label %polly.stmt.for.body18.i437, label %polly.loop_if618.loopexit, !llvm.loop !82

polly.loop_if457:                                 ; preds = %polly.cond453
  br i1 %polly.loop_guard461, label %polly.cond482.preheader, label %polly.loop_if618

polly.cond482.preheader:                          ; preds = %polly.loop_if457
  %238 = mul i64 %42, %188
  %239 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %238
  %scevgep479 = getelementptr i8, ptr addrspace(1) %239, i64 %57
  %240 = mul i64 %42, %163
  %gep754 = getelementptr i8, ptr addrspace(1) %invariant.gep753, i64 %240
  %scevgep500 = getelementptr i8, ptr addrspace(1) %239, i64 %62
  %241 = mul i64 %42, %163
  %242 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %241
  %scevgep517 = getelementptr i8, ptr addrspace(1) %242, i64 %57
  %scevgep538 = getelementptr i8, ptr addrspace(1) %242, i64 %62
  br label %polly.cond482

polly.cond482:                                    ; preds = %polly.merge521, %polly.cond482.preheader
  %polly.indvar462 = phi i64 [ %polly.indvar_next463, %polly.merge521 ], [ 0, %polly.cond482.preheader ]
  %polly.access.Packed_A470.idx = shl i64 %polly.indvar462, 3
  %polly.access.Packed_A470 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A470.idx
  %_p_scalar_471 = load float, ptr %polly.access.Packed_A470, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B474 = add nsw i64 %polly.access.mul.Packed_B473, %polly.indvar462
  %polly.access.Packed_B477.idx = mul i64 %polly.access.add.Packed_B474, 12
  %polly.access.Packed_B477 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B477.idx
  %_p_scalar_478 = load float, ptr %polly.access.Packed_B477, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_480 = load float, ptr addrspace(1) %scevgep479, align 4, !alias.scope !57, !noalias !60
  %p_481 = tail call float @llvm.fmuladd.f32(float %_p_scalar_471, float %_p_scalar_478, float %_p_scalar_480)
  store float %p_481, ptr addrspace(1) %scevgep479, align 4, !alias.scope !57, !noalias !60
  br i1 %59, label %polly.stmt.for.body18.i487, label %polly.merge521.critedge

polly.merge521.critedge:                          ; preds = %polly.cond482
  %polly.access.Packed_A508.c = getelementptr i8, ptr %polly.access.Packed_A470, i64 4
  %_p_scalar_509.c = load float, ptr %polly.access.Packed_A508.c, align 4, !alias.scope !75, !noalias !76
  %_p_scalar_518.c = load float, ptr addrspace(1) %gep754, align 4, !alias.scope !57, !noalias !60
  %p_519.c = tail call float @llvm.fmuladd.f32(float %_p_scalar_509.c, float %_p_scalar_478, float %_p_scalar_518.c)
  store float %p_519.c, ptr addrspace(1) %gep754, align 4, !alias.scope !57, !noalias !60
  br label %polly.merge521

polly.merge521:                                   ; preds = %polly.stmt.for.body18.i487, %polly.merge521.critedge
  %polly.indvar_next463 = add nuw nsw i64 %polly.indvar462, 1
  %polly.loop_cond464.not.not = icmp slt i64 %polly.indvar462, %181
  br i1 %polly.loop_cond464.not.not, label %polly.cond482, label %polly.loop_if618.loopexit1, !llvm.loop !83

polly.stmt.for.body18.i487:                       ; preds = %polly.cond482
  %polly.access.add.Packed_B495 = add nsw i64 %polly.access.mul.Packed_B494, %polly.indvar462
  %.idx734 = mul i64 %polly.access.add.Packed_B495, 12
  %243 = getelementptr i8, ptr %Packed_B, i64 %.idx734
  %polly.access.Packed_B498 = getelementptr i8, ptr %243, i64 4
  %_p_scalar_499 = load float, ptr %polly.access.Packed_B498, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_501 = load float, ptr addrspace(1) %scevgep500, align 4, !alias.scope !57, !noalias !60
  %p_502 = tail call float @llvm.fmuladd.f32(float %_p_scalar_471, float %_p_scalar_499, float %_p_scalar_501)
  store float %p_502, ptr addrspace(1) %scevgep500, align 4, !alias.scope !57, !noalias !60
  %polly.access.Packed_A508 = getelementptr i8, ptr %polly.access.Packed_A470, i64 4
  %_p_scalar_509 = load float, ptr %polly.access.Packed_A508, align 4, !alias.scope !75, !noalias !76
  %_p_scalar_518 = load float, ptr addrspace(1) %scevgep517, align 4, !alias.scope !57, !noalias !60
  %p_519 = tail call float @llvm.fmuladd.f32(float %_p_scalar_509, float %_p_scalar_478, float %_p_scalar_518)
  store float %p_519, ptr addrspace(1) %scevgep517, align 4, !alias.scope !57, !noalias !60
  %_p_scalar_539 = load float, ptr addrspace(1) %scevgep538, align 4, !alias.scope !57, !noalias !60
  %p_540 = tail call float @llvm.fmuladd.f32(float %_p_scalar_509, float %_p_scalar_499, float %_p_scalar_539)
  store float %p_540, ptr addrspace(1) %scevgep538, align 4, !alias.scope !57, !noalias !60
  br label %polly.merge521

polly.loop_if541:                                 ; preds = %polly.cond453
  br i1 %polly.loop_guard545, label %polly.cond563.preheader, label %polly.loop_if618

polly.cond563.preheader:                          ; preds = %polly.loop_if541
  %244 = mul i64 %42, %188
  %245 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %244
  %scevgep560 = getelementptr i8, ptr addrspace(1) %245, i64 %109
  %scevgep578 = getelementptr i8, ptr addrspace(1) %245, i64 %52
  %246 = mul i64 %42, %163
  %247 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %246
  %scevgep596 = getelementptr i8, ptr addrspace(1) %247, i64 %109
  %scevgep614 = getelementptr i8, ptr addrspace(1) %247, i64 %53
  br label %polly.cond563

polly.cond563:                                    ; preds = %polly.merge582, %polly.cond563.preheader
  %polly.indvar546 = phi i64 [ %polly.indvar_next547, %polly.merge582 ], [ 0, %polly.cond563.preheader ]
  %polly.access.Packed_A553.idx = shl i64 %polly.indvar546, 3
  %polly.access.Packed_A553 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A553.idx
  %_p_scalar_554 = load float, ptr %polly.access.Packed_A553, align 4, !alias.scope !75, !noalias !76
  %polly.access.Packed_B558.idx = mul i64 %polly.indvar546, 12
  %polly.access.Packed_B558 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B558.idx
  %_p_scalar_559 = load float, ptr %polly.access.Packed_B558, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_561 = load float, ptr addrspace(1) %scevgep560, align 4, !alias.scope !57, !noalias !60
  %p_562 = tail call float @llvm.fmuladd.f32(float %_p_scalar_554, float %_p_scalar_559, float %_p_scalar_561)
  store float %p_562, ptr addrspace(1) %scevgep560, align 4, !alias.scope !57, !noalias !60
  br i1 %110, label %polly.stmt.for.body18.i567, label %polly.cond581

polly.cond581:                                    ; preds = %polly.stmt.for.body18.i567, %polly.cond563
  br i1 %154, label %polly.cond599, label %polly.merge582

polly.merge582:                                   ; preds = %polly.stmt.for.body18.i603, %polly.cond599, %polly.cond581
  %polly.indvar_next547 = add nuw nsw i64 %polly.indvar546, 1
  %polly.loop_cond548.not.not = icmp slt i64 %polly.indvar546, %178
  br i1 %polly.loop_cond548.not.not, label %polly.cond563, label %polly.loop_if618.loopexit2, !llvm.loop !84

polly.stmt.for.body18.i567:                       ; preds = %polly.cond563
  %polly.access.Packed_B576 = getelementptr i8, ptr %polly.access.Packed_B558, i64 4
  %_p_scalar_577 = load float, ptr %polly.access.Packed_B576, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_579 = load float, ptr addrspace(1) %scevgep578, align 4, !alias.scope !57, !noalias !60
  %p_580 = tail call float @llvm.fmuladd.f32(float %_p_scalar_554, float %_p_scalar_577, float %_p_scalar_579)
  store float %p_580, ptr addrspace(1) %scevgep578, align 4, !alias.scope !57, !noalias !60
  br label %polly.cond581

polly.cond599:                                    ; preds = %polly.cond581
  %polly.access.Packed_A589 = getelementptr i8, ptr %polly.access.Packed_A553, i64 4
  %_p_scalar_590 = load float, ptr %polly.access.Packed_A589, align 4, !alias.scope !75, !noalias !76
  %_p_scalar_597 = load float, ptr addrspace(1) %scevgep596, align 4, !alias.scope !57, !noalias !60
  %p_598 = tail call float @llvm.fmuladd.f32(float %_p_scalar_590, float %_p_scalar_559, float %_p_scalar_597)
  store float %p_598, ptr addrspace(1) %scevgep596, align 4, !alias.scope !57, !noalias !60
  br i1 %110, label %polly.stmt.for.body18.i603, label %polly.merge582

polly.stmt.for.body18.i603:                       ; preds = %polly.cond599
  %polly.access.Packed_B612 = getelementptr i8, ptr %polly.access.Packed_B558, i64 4
  %_p_scalar_613 = load float, ptr %polly.access.Packed_B612, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_615 = load float, ptr addrspace(1) %scevgep614, align 4, !alias.scope !57, !noalias !60
  %p_616 = tail call float @llvm.fmuladd.f32(float %_p_scalar_590, float %_p_scalar_613, float %_p_scalar_615)
  store float %p_616, ptr addrspace(1) %scevgep614, align 4, !alias.scope !57, !noalias !60
  br label %polly.merge582

polly.loop_if618.loopexit:                        ; preds = %polly.stmt.for.body18.i437
  %p_452.lcssa = phi float [ %p_452, %polly.stmt.for.body18.i437 ]
  store float %p_452.lcssa, ptr addrspace(1) %scevgep450, align 4, !alias.scope !57, !noalias !60
  br label %polly.loop_if618

polly.loop_if618.loopexit1:                       ; preds = %polly.merge521
  br label %polly.loop_if618

polly.loop_if618.loopexit2:                       ; preds = %polly.merge582
  br label %polly.loop_if618

polly.loop_if618:                                 ; preds = %polly.loop_if618.loopexit2, %polly.loop_if618.loopexit1, %polly.loop_if618.loopexit, %polly.loop_if541, %polly.loop_if457, %polly.loop_if429
  %248 = mul nsw i64 %polly.indvar141, -24
  %249 = add nsw i64 %248, %pexp.p_div_q617736
  %250 = tail call i64 @llvm.smin.i64(i64 %249, i64 24)
  %251 = add nsw i64 %250, -1
  %polly.loop_guard622 = icmp sgt i64 %249, 1
  br i1 %polly.loop_guard622, label %polly.loop_if626.preheader, label %polly.merge349

polly.loop_if626.preheader:                       ; preds = %polly.loop_if618
  br label %polly.loop_if626

polly.loop_exit629.loopexit:                      ; preds = %polly.merge675
  br label %polly.loop_exit629

polly.loop_exit629:                               ; preds = %polly.loop_exit629.loopexit, %polly.loop_if626
  %polly.indvar_next624 = add nuw nsw i64 %polly.indvar623, 1
  %polly.loop_cond625.not.not = icmp slt i64 %polly.indvar623, %251
  br i1 %polly.loop_cond625.not.not, label %polly.loop_if626, label %polly.merge349.loopexit

polly.loop_if626:                                 ; preds = %polly.loop_if626.preheader, %polly.loop_exit629
  %polly.indvar623 = phi i64 [ %polly.indvar_next624, %polly.loop_exit629 ], [ 1, %polly.loop_if626.preheader ]
  br i1 %polly.loop_guard630, label %polly.cond652.preheader, label %polly.loop_exit629

polly.cond652.preheader:                          ; preds = %polly.loop_if626
  %252 = shl nuw nsw i64 %polly.indvar623, 1
  %253 = add nuw nsw i64 %188, %252
  %.idx742 = shl i64 %polly.indvar623, 13
  %254 = getelementptr i8, ptr %Packed_A, i64 %.idx742
  %255 = mul i64 %42, %253
  %256 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %255
  %scevgep649 = getelementptr i8, ptr addrspace(1) %256, i64 %70
  %scevgep671 = getelementptr i8, ptr addrspace(1) %256, i64 %74
  %257 = add nuw nsw i64 %253, 2
  %.not = icmp slt i64 %_arg_size_, %257
  %258 = or disjoint i64 %253, 1
  %259 = mul i64 %42, %258
  %260 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %259
  %scevgep694 = getelementptr i8, ptr addrspace(1) %260, i64 %70
  %scevgep716 = getelementptr i8, ptr addrspace(1) %260, i64 %77
  br label %polly.cond652

polly.cond652:                                    ; preds = %polly.merge675, %polly.cond652.preheader
  %polly.indvar631 = phi i64 [ %polly.indvar_next632, %polly.merge675 ], [ 0, %polly.cond652.preheader ]
  %polly.access.Packed_A640.idx = shl i64 %polly.indvar631, 3
  %polly.access.Packed_A640 = getelementptr i8, ptr %254, i64 %polly.access.Packed_A640.idx
  %_p_scalar_641 = load float, ptr %polly.access.Packed_A640, align 4, !alias.scope !75, !noalias !76
  %polly.access.add.Packed_B644 = add nsw i64 %polly.access.mul.Packed_B643, %polly.indvar631
  %polly.access.Packed_B647.idx = mul i64 %polly.access.add.Packed_B644, 12
  %polly.access.Packed_B647 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B647.idx
  %_p_scalar_648 = load float, ptr %polly.access.Packed_B647, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_650 = load float, ptr addrspace(1) %scevgep649, align 4, !alias.scope !57, !noalias !60
  %p_651 = tail call float @llvm.fmuladd.f32(float %_p_scalar_641, float %_p_scalar_648, float %_p_scalar_650)
  store float %p_651, ptr addrspace(1) %scevgep649, align 4, !alias.scope !57, !noalias !60
  br i1 %71, label %polly.stmt.for.body18.i657, label %polly.cond674

polly.cond674:                                    ; preds = %polly.stmt.for.body18.i657, %polly.cond652
  br i1 %.not, label %polly.merge675, label %polly.cond697

polly.merge675:                                   ; preds = %polly.stmt.for.body18.i702, %polly.cond697, %polly.cond674
  %polly.indvar_next632 = add nuw nsw i64 %polly.indvar631, 1
  %polly.loop_cond633.not.not = icmp slt i64 %polly.indvar631, %187
  br i1 %polly.loop_cond633.not.not, label %polly.cond652, label %polly.loop_exit629.loopexit, !llvm.loop !85

polly.stmt.for.body18.i657:                       ; preds = %polly.cond652
  %polly.access.add.Packed_B666 = add nsw i64 %polly.access.mul.Packed_B665, %polly.indvar631
  %.idx737 = mul i64 %polly.access.add.Packed_B666, 12
  %261 = getelementptr i8, ptr %Packed_B, i64 %.idx737
  %polly.access.Packed_B669 = getelementptr i8, ptr %261, i64 4
  %_p_scalar_670 = load float, ptr %polly.access.Packed_B669, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_672 = load float, ptr addrspace(1) %scevgep671, align 4, !alias.scope !57, !noalias !60
  %p_673 = tail call float @llvm.fmuladd.f32(float %_p_scalar_641, float %_p_scalar_670, float %_p_scalar_672)
  store float %p_673, ptr addrspace(1) %scevgep671, align 4, !alias.scope !57, !noalias !60
  br label %polly.cond674

polly.cond697:                                    ; preds = %polly.cond674
  %polly.access.Packed_A685 = getelementptr i8, ptr %polly.access.Packed_A640, i64 4
  %_p_scalar_686 = load float, ptr %polly.access.Packed_A685, align 4, !alias.scope !75, !noalias !76
  %_p_scalar_695 = load float, ptr addrspace(1) %scevgep694, align 4, !alias.scope !57, !noalias !60
  %p_696 = tail call float @llvm.fmuladd.f32(float %_p_scalar_686, float %_p_scalar_648, float %_p_scalar_695)
  store float %p_696, ptr addrspace(1) %scevgep694, align 4, !alias.scope !57, !noalias !60
  br i1 %71, label %polly.stmt.for.body18.i702, label %polly.merge675

polly.stmt.for.body18.i702:                       ; preds = %polly.cond697
  %polly.access.add.Packed_B711 = add nsw i64 %polly.access.mul.Packed_B710, %polly.indvar631
  %.idx738 = mul i64 %polly.access.add.Packed_B711, 12
  %262 = getelementptr i8, ptr %Packed_B, i64 %.idx738
  %polly.access.Packed_B714 = getelementptr i8, ptr %262, i64 4
  %_p_scalar_715 = load float, ptr %polly.access.Packed_B714, align 4, !alias.scope !69, !noalias !70
  %_p_scalar_717 = load float, ptr addrspace(1) %scevgep716, align 4, !alias.scope !57, !noalias !60
  %p_718 = tail call float @llvm.fmuladd.f32(float %_p_scalar_686, float %_p_scalar_715, float %_p_scalar_717)
  store float %p_718, ptr addrspace(1) %scevgep716, align 4, !alias.scope !57, !noalias !60
  br label %polly.merge675
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64() #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.nxv4f32.nxv4p0(<vscale x 4 x float>, <vscale x 4 x ptr>, i32 immarg, <vscale x 4 x i1>) #5

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="2mm.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #2 = { "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(write) }

!llvm.module.flags = !{!0, !1, !2}
!opencl.spir.version = !{!3}
!spirv.Source = !{!4}
!llvm.ident = !{!5}
!llvm.errno.tbaa = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"sycl-device", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 1, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{!"clang version 22.0.0git (https://github.com/intel/llvm.git 6e0e7a8370a01dedb88f7f860e2affb811fc0690)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{i32 -1, i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false, i1 false}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.vectorize.enable", i32 0}
!16 = distinct !{!16, !14, !15}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !8, i64 0}
!19 = distinct !{!19, !14, !20, !21, !22, !15}
!20 = !{!"llvm.loop.vectorize.width", i32 4}
!21 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!22 = !{!"llvm.loop.interleave.count", i32 1}
!23 = !{!24}
!24 = distinct !{!24, !25, !"polly.alias.scope.MemRef1"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28, !29, !30}
!27 = distinct !{!27, !25, !"polly.alias.scope.MemRef0"}
!28 = distinct !{!28, !25, !"polly.alias.scope.MemRef2"}
!29 = distinct !{!29, !25, !"polly.alias.scope.Packed_B"}
!30 = distinct !{!30, !25, !"polly.alias.scope.Packed_A"}
!31 = !{!29}
!32 = !{!27, !24, !28, !30}
!33 = distinct !{!33, !34, !35}
!34 = !{!"llvm.loop.isvectorized", i32 1}
!35 = !{!"llvm.loop.unroll.runtime.disable"}
!36 = distinct !{!36, !35, !34}
!37 = !{!27}
!38 = !{!24, !28, !29, !30}
!39 = !{!30}
!40 = !{!27, !24, !28, !29}
!41 = distinct !{!41, !34, !35}
!42 = distinct !{!42, !34}
!43 = !{!28}
!44 = !{!27, !24, !29, !30}
!45 = distinct !{!45, !46}
!46 = !{!"llvm.loop.vectorize.enable", i1 false}
!47 = distinct !{!47, !46}
!48 = distinct !{!48, !46}
!49 = distinct !{!49, !46}
!50 = distinct !{!50, !46}
!51 = distinct !{!51, !46}
!52 = distinct !{!52, !46}
!53 = distinct !{!53, !14, !15}
!54 = distinct !{!54, !14, !15}
!55 = distinct !{!55, !14, !15}
!56 = distinct !{!56, !14, !20, !21, !22, !15}
!57 = !{!58}
!58 = distinct !{!58, !59, !"polly.alias.scope.MemRef0"}
!59 = distinct !{!59, !"polly.alias.scope.domain"}
!60 = !{!61, !62, !63, !64}
!61 = distinct !{!61, !59, !"polly.alias.scope.MemRef1"}
!62 = distinct !{!62, !59, !"polly.alias.scope.MemRef2"}
!63 = distinct !{!63, !59, !"polly.alias.scope.Packed_B"}
!64 = distinct !{!64, !59, !"polly.alias.scope.Packed_A"}
!65 = distinct !{!65, !34, !35}
!66 = distinct !{!66, !35, !34}
!67 = !{!62}
!68 = !{!58, !61, !63, !64}
!69 = !{!63}
!70 = !{!58, !61, !62, !64}
!71 = distinct !{!71, !34, !35}
!72 = distinct !{!72, !35, !34}
!73 = !{!61}
!74 = !{!58, !62, !63, !64}
!75 = !{!64}
!76 = !{!58, !61, !62, !63}
!77 = distinct !{!77, !34, !35}
!78 = distinct !{!78, !34}
!79 = distinct !{!79, !46}
!80 = distinct !{!80, !46}
!81 = distinct !{!81, !46}
!82 = distinct !{!82, !46}
!83 = distinct !{!83, !46}
!84 = distinct !{!84, !46}
!85 = distinct !{!85, !46}
