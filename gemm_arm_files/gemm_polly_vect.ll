; ModuleID = '<stdin>'
source_filename = "gemm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS4Gemm = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS4Gemm(i64 noundef %_arg_NI_, i64 noundef %_arg_NJ_, i64 noundef %_arg_NK_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
polly.split_new_and_old:
  %Packed_B = alloca [256 x [1024 x [3 x float]]], align 64
  %Packed_A = alloca [24 x [1024 x [2 x float]]], align 64
  %0 = icmp slt i64 %_arg_NI_, 0
  %1 = icmp sgt i64 %_arg_NI_, 0
  %2 = or i64 %_arg_NJ_, %_arg_NK_
  %3 = icmp slt i64 %2, 0
  %4 = and i1 %1, %3
  %5 = or i1 %0, %4
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_NI_, i64 -1)
  %.obit = extractvalue { i64, i1 } %6, 1
  %.res = extractvalue { i64, i1 } %6, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %_arg_NK_)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %_arg_NK_)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %7 = or i1 %polly.access.mul..obit, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.add..res
  %8 = icmp ugt ptr addrspace(1) %polly.access., %_arg_raw_C
  %polly.access.mul.16 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %_arg_NJ_)
  %polly.access.mul..obit17 = extractvalue { i64, i1 } %polly.access.mul.16, 1
  %polly.access.mul..res19 = extractvalue { i64, i1 } %polly.access.mul.16, 0
  %polly.access.add.20 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res19, i64 %_arg_NJ_)
  %polly.access.add..obit21 = extractvalue { i64, i1 } %polly.access.add.20, 1
  %polly.access.add..res23 = extractvalue { i64, i1 } %polly.access.add.20, 0
  %polly.access.24 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %polly.access.add..res23
  %9 = icmp ugt ptr addrspace(1) %polly.access.24, %_arg_raw_A
  %.not736 = and i1 %8, %9
  %.not731 = or i1 %5, %.not736
  %10 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_NK_, i64 -1)
  %.obit34 = extractvalue { i64, i1 } %10, 1
  %11 = or i1 %7, %.obit34
  %.res36 = extractvalue { i64, i1 } %10, 0
  %polly.access.mul.37 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res36, i64 %_arg_NJ_)
  %polly.access.mul..obit38 = extractvalue { i64, i1 } %polly.access.mul.37, 1
  %12 = or i1 %11, %polly.access.mul..obit38
  %polly.access.mul..res40 = extractvalue { i64, i1 } %polly.access.mul.37, 0
  %polly.access.add.41 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res40, i64 %_arg_NJ_)
  %polly.access.add..obit42 = extractvalue { i64, i1 } %polly.access.add.41, 1
  %13 = or i1 %12, %polly.access.add..obit42
  %14 = or i1 %13, %.obit
  %15 = or i1 %14, %polly.access.mul..obit17
  %polly.overflow.state43 = or i1 %15, %polly.access.add..obit21
  %polly.access.add..res44 = extractvalue { i64, i1 } %polly.access.add.41, 0
  %polly.access.45 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.add..res44
  %16 = icmp ugt ptr addrspace(1) %polly.access.45, %_arg_raw_C
  %17 = icmp ugt ptr addrspace(1) %polly.access.24, %_arg_raw_B
  %.not738 = and i1 %16, %17
  %.not733 = or i1 %.not731, %.not738
  %polly.rtc.result.not = or i1 %.not733, %polly.overflow.state43
  br i1 %polly.rtc.result.not, label %for.cond.i.preheader, label %polly.loop_if

for.cond.i.preheader:                             ; preds = %polly.split_new_and_old
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.cond.cleanup10.i
  %i.0.i = phi i64 [ %inc39.i, %for.cond.cleanup10.i ], [ 0, %for.cond.i.preheader ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_NI_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_NJ_
  %18 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body5.i, %for.cond2.i.preheader
  %j.0.i = phi i64 [ %inc.i, %for.body5.i ], [ 0, %for.cond2.i.preheader ]
  %cmp3.i = icmp ult i64 %j.0.i, %_arg_NJ_
  br i1 %cmp3.i, label %for.body5.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %mul13.i = mul i64 %i.0.i, %_arg_NK_
  %19 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul13.i
  br label %for.cond8.i

for.body5.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %18, i64 %j.0.i
  %20 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %mul7.i = fmul float %20, 2.123000e+03
  store float %mul7.i, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !15

for.cond8.i:                                      ; preds = %for.cond.cleanup21.i, %for.cond8.i.preheader
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup21.i ], [ 0, %for.cond8.i.preheader ]
  %cmp9.i = icmp ult i64 %k.0.i, %_arg_NK_
  br i1 %cmp9.i, label %for.body11.i, label %for.cond.cleanup10.i

for.cond.cleanup10.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !18

for.body11.i:                                     ; preds = %for.cond8.i
  %arrayidx15.i = getelementptr float, ptr addrspace(1) %19, i64 %k.0.i
  %21 = load float, ptr addrspace(1) %arrayidx15.i, align 4, !tbaa !13
  %mul16.i = fmul float %21, 3.241200e+04
  %mul24.i = mul i64 %k.0.i, %_arg_NJ_
  %22 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul24.i
  br label %for.cond18.i

for.cond18.i:                                     ; preds = %for.body22.i, %for.body11.i
  %j17.0.i = phi i64 [ 0, %for.body11.i ], [ %inc33.i, %for.body22.i ]
  %cmp20.i = icmp ult i64 %j17.0.i, %_arg_NJ_
  br i1 %cmp20.i, label %for.body22.i, label %for.cond.cleanup21.i

for.cond.cleanup21.i:                             ; preds = %for.cond18.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !19

for.body22.i:                                     ; preds = %for.cond18.i
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %22, i64 %j17.0.i
  %23 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !13
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %18, i64 %j17.0.i
  %24 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %25 = tail call float @llvm.fmuladd.f32(float %mul16.i, float %23, float %24)
  store float %25, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %inc33.i = add nuw i64 %j17.0.i, 1
  br label %for.cond18.i, !llvm.loop !20

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit: ; preds = %for.cond.i
  br label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit2: ; preds = %polly.loop_exit113
  br label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit2, %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit, %polly.loop_if101, %polly.cond
  ret void

polly.cond.loopexit:                              ; preds = %polly.loop_exit80
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_if
  br i1 %1, label %polly.loop_if101, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %polly.fdiv_q.shr = ashr i64 %.res, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.cond

polly.loop_exit80.loopexit:                       ; preds = %polly.loop_exit88
  br label %polly.loop_exit80

polly.loop_exit80:                                ; preds = %polly.loop_exit80.loopexit, %polly.loop_if77
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_if77, label %polly.cond.loopexit

polly.loop_preheader:                             ; preds = %polly.loop_if
  %26 = shl i64 %_arg_NJ_, 2
  %27 = add nsw i64 %_arg_NJ_, -1
  %polly.fdiv_q.shr76 = ashr i64 %27, 5
  %polly.loop_guard81 = icmp sgt i64 %polly.fdiv_q.shr76, -1
  %28 = shl i64 %_arg_NJ_, 7
  %29 = shl i64 %_arg_NJ_, 2
  br label %polly.loop_if77

polly.loop_if77:                                  ; preds = %polly.loop_preheader, %polly.loop_exit80
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit80 ]
  %30 = mul i64 %28, %polly.indvar
  br i1 %polly.loop_guard81, label %polly.loop_if85.preheader, label %polly.loop_exit80

polly.loop_if85.preheader:                        ; preds = %polly.loop_if77
  %31 = shl nsw i64 %polly.indvar, 5
  %32 = xor i64 %31, -1
  %33 = add nsw i64 %_arg_NI_, %32
  %34 = tail call i64 @llvm.smin.i64(i64 %33, i64 31)
  %polly.loop_guard89 = icmp sgt i64 %33, -1
  br label %polly.loop_if85

polly.loop_exit88.loopexit:                       ; preds = %polly.loop_exit96
  br label %polly.loop_exit88

polly.loop_exit88:                                ; preds = %polly.loop_exit88.loopexit, %polly.loop_if85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %polly.loop_cond84.not.not = icmp slt i64 %polly.indvar82, %polly.fdiv_q.shr76
  br i1 %polly.loop_cond84.not.not, label %polly.loop_if85, label %polly.loop_exit80.loopexit

polly.loop_if85:                                  ; preds = %polly.loop_exit88, %polly.loop_if85.preheader
  %polly.indvar82 = phi i64 [ %polly.indvar_next83, %polly.loop_exit88 ], [ 0, %polly.loop_if85.preheader ]
  %35 = mul nsw i64 %polly.indvar82, -32
  %36 = add i64 %27, %35
  %smin4 = call i64 @llvm.smin.i64(i64 %36, i64 31)
  %smax5 = call i64 @llvm.smax.i64(i64 %smin4, i64 0)
  %37 = add nuw nsw i64 %smax5, 1
  %38 = mul nsw i64 %polly.indvar82, -32
  %39 = add i64 %27, %38
  %smin = call i64 @llvm.smin.i64(i64 %39, i64 31)
  %smax = call i64 @llvm.smax.i64(i64 %smin, i64 0)
  %40 = shl i64 %polly.indvar82, 7
  %41 = add i64 %30, %40
  br i1 %polly.loop_guard89, label %polly.loop_if93.preheader, label %polly.loop_exit88

polly.loop_if93.preheader:                        ; preds = %polly.loop_if85
  %42 = shl nsw i64 %polly.indvar82, 5
  %43 = xor i64 %42, -1
  %44 = add i64 %_arg_NJ_, %43
  %45 = tail call i64 @llvm.smin.i64(i64 %44, i64 31)
  %polly.loop_guard97 = icmp sgt i64 %44, -1
  br label %polly.loop_if93

polly.loop_exit96.loopexit:                       ; preds = %middle.block, %polly.stmt.for.body5.i
  br label %polly.loop_exit96

polly.loop_exit96:                                ; preds = %polly.loop_exit96.loopexit, %polly.loop_if93
  %polly.indvar_next91 = add nuw nsw i64 %polly.indvar90, 1
  %polly.loop_cond92.not.not = icmp slt i64 %polly.indvar90, %34
  br i1 %polly.loop_cond92.not.not, label %polly.loop_if93, label %polly.loop_exit88.loopexit

polly.loop_if93:                                  ; preds = %polly.loop_exit96, %polly.loop_if93.preheader
  %polly.indvar90 = phi i64 [ %polly.indvar_next91, %polly.loop_exit96 ], [ 0, %polly.loop_if93.preheader ]
  %46 = mul i64 %29, %polly.indvar90
  %47 = add i64 %41, %46
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %47
  br i1 %polly.loop_guard97, label %polly.stmt.for.body5.i.preheader, label %polly.loop_exit96

polly.stmt.for.body5.i.preheader:                 ; preds = %polly.loop_if93
  %48 = add nuw nsw i64 %31, %polly.indvar90
  %49 = mul i64 %26, %48
  %50 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %49
  %51 = call i64 @llvm.vscale.i64()
  %52 = mul i64 %51, 4
  %53 = call i64 @llvm.umax.i64(i64 8, i64 %52)
  %min.iters.check = icmp ult i64 %37, %53
  br i1 %min.iters.check, label %scalar.ph, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %polly.stmt.for.body5.i.preheader
  %mul = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 4, i64 %smax)
  %mul.result = extractvalue { i64, i1 } %mul, 0
  %mul.overflow = extractvalue { i64, i1 } %mul, 1
  %54 = sub i64 0, %mul.result
  %55 = getelementptr i8, ptr addrspace(1) %scevgep3, i64 %mul.result
  %56 = icmp ult ptr addrspace(1) %55, %scevgep3
  %57 = or i1 %56, %mul.overflow
  br i1 %57, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.scevcheck
  %58 = call i64 @llvm.vscale.i64()
  %59 = mul i64 %58, 4
  %n.mod.vf = urem i64 %37, %59
  %n.vec = sub i64 %37, %n.mod.vf
  %60 = call i64 @llvm.vscale.i64()
  %61 = mul i64 %60, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %62 = add i64 %index, 0
  %63 = add nuw nsw i64 %42, %62
  %64 = shl i64 %63, 2
  %65 = getelementptr i8, ptr addrspace(1) %50, i64 %64
  %66 = getelementptr float, ptr addrspace(1) %65, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %66, align 4, !alias.scope !24, !noalias !27
  %67 = fmul <vscale x 4 x float> %wide.load, shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 2.123000e+03, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
  store <vscale x 4 x float> %67, ptr addrspace(1) %66, align 4, !alias.scope !24, !noalias !27
  %index.next = add nuw i64 %index, %61
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !32

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %37, %n.vec
  br i1 %cmp.n, label %polly.loop_exit96.loopexit, label %scalar.ph

scalar.ph:                                        ; preds = %vector.scevcheck, %polly.stmt.for.body5.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %polly.stmt.for.body5.i.preheader ], [ 0, %vector.scevcheck ]
  br label %polly.stmt.for.body5.i

polly.stmt.for.body5.i:                           ; preds = %polly.stmt.for.body5.i, %scalar.ph
  %polly.indvar98 = phi i64 [ %polly.indvar_next99, %polly.stmt.for.body5.i ], [ %bc.resume.val, %scalar.ph ]
  %69 = add nuw nsw i64 %42, %polly.indvar98
  %70 = shl i64 %69, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %50, i64 %70
  %_p_scalar_ = load float, ptr addrspace(1) %scevgep, align 4, !alias.scope !24, !noalias !27
  %p_mul7.i = fmul float %_p_scalar_, 2.123000e+03
  store float %p_mul7.i, ptr addrspace(1) %scevgep, align 4, !alias.scope !24, !noalias !27
  %polly.indvar_next99 = add nuw nsw i64 %polly.indvar98, 1
  %polly.loop_cond100.not.not = icmp slt i64 %polly.indvar98, %45
  br i1 %polly.loop_cond100.not.not, label %polly.stmt.for.body5.i, label %polly.loop_exit96.loopexit, !llvm.loop !35

polly.loop_if101:                                 ; preds = %polly.cond
  %71 = add i64 %_arg_NJ_, -1
  %pexp.fdiv_q.1 = add nsw i64 %_arg_NJ_, -768
  %pexp.fdiv_q.2 = icmp slt i64 %_arg_NJ_, 1
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 %pexp.fdiv_q.1, i64 %71
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 768
  %polly.loop_guard105 = icmp sgt i64 %pexp.fdiv_q.3, -768
  br i1 %polly.loop_guard105, label %polly.loop_preheader103, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_exit113.loopexit:                      ; preds = %polly.loop_exit147
  br label %polly.loop_exit113

polly.loop_exit113:                               ; preds = %polly.loop_exit113.loopexit, %polly.loop_if110
  %polly.indvar_next107 = add nuw nsw i64 %polly.indvar106, 1
  %polly.loop_cond108.not.not = icmp slt i64 %polly.indvar106, %pexp.fdiv_q.4
  br i1 %polly.loop_cond108.not.not, label %polly.loop_if110, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit2

polly.loop_preheader103:                          ; preds = %polly.loop_if101
  %72 = shl i64 %_arg_NJ_, 2
  %polly.fdiv_q.shr109 = ashr i64 %.res36, 10
  %polly.loop_guard114 = icmp sgt i64 %polly.fdiv_q.shr109, -1
  %pexp.fdiv_q.4143 = sdiv i64 %.res, 48
  %pexp.p_div_q179 = udiv i64 %_arg_NJ_, 3
  %pexp.p_div_q188741 = lshr i64 %_arg_NI_, 1
  %73 = and i64 %_arg_NI_, 1
  %74 = icmp eq i64 %73, 0
  %pexp.div = lshr exact i64 %.res, 1
  %75 = mul i64 %72, %.res
  %76 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %75
  %pexp.p_div_q379 = udiv i64 %_arg_NJ_, 3
  %77 = mul i64 %pexp.p_div_q379, 3
  %pexp.pdiv_r373.decomposed = sub i64 %_arg_NJ_, %77
  %78 = icmp ne i64 %pexp.pdiv_r373.decomposed, 0
  %79 = mul i64 %72, %.res
  %80 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %79
  %81 = add nuw nsw i64 %_arg_NJ_, 3
  %pexp.pdiv_r461 = urem i64 %81, 3
  %82 = sub nuw nsw i64 %_arg_NJ_, %pexp.pdiv_r461
  %pexp.p_div_q469 = udiv i64 %71, 3
  %83 = shl i64 %pexp.p_div_q469, 10
  %84 = shl i64 %82, 2
  %85 = add nuw nsw i64 %_arg_NJ_, 1
  %pexp.zdiv_r483 = urem i64 %85, 3
  %86 = icmp eq i64 %pexp.zdiv_r483, 0
  %87 = add nsw i64 %_arg_NJ_, -2
  %pexp.div491 = udiv exact i64 %87, 3
  %88 = shl i64 %pexp.div491, 10
  %89 = shl i64 %71, 2
  %90 = add nsw i64 %_arg_NJ_, -2
  %pexp.div535 = udiv exact i64 %90, 3
  %91 = shl i64 %pexp.div535, 10
  %92 = shl i64 %71, 2
  %93 = shl i64 %71, 2
  %94 = shl i64 %71, 2
  %95 = add nuw nsw i64 %_arg_NI_, 1
  %pexp.p_div_q625745 = lshr i64 %95, 1
  %96 = add nsw i64 %_arg_NJ_, 3
  %pexp.pdiv_r642 = urem i64 %96, 3
  %97 = sub nsw i64 %_arg_NJ_, %pexp.pdiv_r642
  %pexp.p_div_q651 = udiv i64 %71, 3
  %98 = shl i64 %pexp.p_div_q651, 10
  %99 = shl i64 %97, 2
  %100 = add nsw i64 %_arg_NJ_, 1
  %pexp.zdiv_r665 = srem i64 %100, 3
  %101 = icmp eq i64 %pexp.zdiv_r665, 0
  %102 = add nsw i64 %_arg_NJ_, -2
  %pexp.div674 = sdiv exact i64 %102, 3
  %103 = shl i64 %pexp.div674, 10
  %104 = shl i64 %71, 2
  %105 = add nsw i64 %_arg_NJ_, -2
  %pexp.div721 = sdiv exact i64 %105, 3
  %106 = shl i64 %pexp.div721, 10
  %107 = shl i64 %71, 2
  br label %polly.loop_if110

polly.loop_if110:                                 ; preds = %polly.loop_preheader103, %polly.loop_exit113
  %polly.indvar106 = phi i64 [ 0, %polly.loop_preheader103 ], [ %polly.indvar_next107, %polly.loop_exit113 ]
  %108 = mul nuw i64 %polly.indvar106, 768
  %109 = add i64 %108, 767
  %smin19 = call i64 @llvm.smin.i64(i64 %109, i64 %71)
  %smax20 = call i64 @llvm.smax.i64(i64 %smin19, i64 %108)
  %110 = mul i64 %polly.indvar106, -768
  %111 = add i64 %110, 1
  %112 = add i64 %smax20, %111
  br i1 %polly.loop_guard114, label %polly.loop_if118.preheader, label %polly.loop_exit113

polly.loop_if118.preheader:                       ; preds = %polly.loop_if110
  %113 = mul nuw nsw i64 %polly.indvar106, 768
  %114 = add nuw nsw i64 %113, 767
  %115 = tail call i64 @llvm.smin.i64(i64 %71, i64 %114)
  %polly.loop_guard130.not.not = icmp sgt i64 %_arg_NJ_, %113
  %116 = shl i64 %polly.indvar106, 18
  %117 = shl i64 %polly.indvar106, 8
  %118 = xor i64 %117, -1
  %119 = add i64 %pexp.p_div_q179, %118
  %120 = tail call i64 @llvm.smin.i64(i64 %119, i64 255)
  %polly.loop_guard184 = icmp sgt i64 %119, -1
  %121 = mul nuw nsw i64 %polly.indvar106, 768
  %122 = mul nuw nsw i64 %polly.indvar106, 768
  %123 = mul nuw nsw i64 %polly.indvar106, 768
  %124 = or disjoint i64 %123, 2
  %125 = icmp sge i64 %124, %_arg_NJ_
  %126 = add nuw nsw i64 %123, 767
  %127 = icmp sge i64 %126, %_arg_NJ_
  %128 = or disjoint i64 %123, 3
  %129 = icmp sge i64 %_arg_NJ_, %128
  %130 = and i1 %129, %127
  %131 = shl i64 %polly.indvar106, 8
  %132 = xor i64 %131, -1
  %133 = add i64 %pexp.p_div_q379, %132
  %134 = tail call i64 @llvm.smin.i64(i64 %133, i64 255)
  %polly.loop_guard384 = icmp sgt i64 %133, -1
  %135 = and i1 %127, %78
  %136 = or disjoint i64 %123, 4
  %.not = icmp slt i64 %_arg_NJ_, %136
  %137 = shl i64 %polly.indvar106, 18
  %polly.access.mul.Packed_B470 = sub i64 %83, %137
  %polly.access.mul.Packed_B492 = sub i64 %88, %137
  %polly.access.mul.Packed_B536 = sub i64 %91, %137
  %138 = mul i64 %polly.indvar106, 3072
  %139 = icmp eq i64 %124, %_arg_NJ_
  %140 = shl i64 %polly.indvar106, 18
  %polly.access.mul.Packed_B652 = sub i64 %98, %140
  %polly.access.mul.Packed_B675 = sub i64 %103, %140
  %polly.access.mul.Packed_B722 = sub i64 %106, %140
  br label %polly.loop_if118

polly.loop_exit147:                               ; preds = %polly.merge370
  %polly.indvar_next116 = add nuw nsw i64 %polly.indvar115, 1
  %polly.loop_cond117.not.not = icmp slt i64 %polly.indvar115, %polly.fdiv_q.shr109
  br i1 %polly.loop_cond117.not.not, label %polly.loop_if118, label %polly.loop_exit113.loopexit

polly.loop_if118:                                 ; preds = %polly.loop_exit147, %polly.loop_if118.preheader
  %polly.indvar115 = phi i64 [ %polly.indvar_next116, %polly.loop_exit147 ], [ 0, %polly.loop_if118.preheader ]
  %141 = shl nuw i64 %polly.indvar115, 10
  %142 = add i64 %141, 1023
  %smin6 = call i64 @llvm.smin.i64(i64 %142, i64 %.res36)
  %smax7 = call i64 @llvm.smax.i64(i64 %smin6, i64 %141)
  %143 = mul nsw i64 %polly.indvar115, -1024
  %144 = add i64 %143, 1
  %145 = add i64 %smax7, %144
  %146 = shl i64 %polly.indvar115, 10
  %147 = or disjoint i64 %146, 1023
  %148 = tail call i64 @llvm.smin.i64(i64 %.res36, i64 %147)
  %polly.loop_guard122.not.not = icmp sgt i64 %_arg_NK_, %146
  br i1 %polly.loop_guard122.not.not, label %polly.loop_if126.preheader, label %polly.loop_if144

polly.loop_if126.preheader:                       ; preds = %polly.loop_if118
  br label %polly.loop_if126

polly.loop_exit129.loopexit:                      ; preds = %middle.block21, %polly.loop_header127
  br label %polly.loop_exit129

polly.loop_exit129:                               ; preds = %polly.loop_exit129.loopexit, %polly.loop_if126
  %polly.indvar_next124 = add nuw nsw i64 %polly.indvar123, 1
  %polly.loop_cond125.not.not = icmp slt i64 %polly.indvar123, %148
  br i1 %polly.loop_cond125.not.not, label %polly.loop_if126, label %polly.loop_if144.loopexit

polly.loop_if126:                                 ; preds = %polly.loop_if126.preheader, %polly.loop_exit129
  %polly.indvar123 = phi i64 [ %polly.indvar_next124, %polly.loop_exit129 ], [ %146, %polly.loop_if126.preheader ]
  br i1 %polly.loop_guard130.not.not, label %polly.loop_header127.preheader, label %polly.loop_exit129

polly.loop_header127.preheader:                   ; preds = %polly.loop_if126
  %polly.access.mul.134 = mul nsw i64 %polly.indvar123, %_arg_NJ_
  %149 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.mul.134
  %150 = sub i64 %polly.indvar123, %146
  %151 = call i64 @llvm.vscale.i64()
  %152 = mul i64 %151, 4
  %min.iters.check23 = icmp ult i64 %112, %152
  br i1 %min.iters.check23, label %scalar.ph22, label %vector.ph24

vector.ph24:                                      ; preds = %polly.loop_header127.preheader
  %153 = call i64 @llvm.vscale.i64()
  %154 = mul i64 %153, 4
  %n.mod.vf25 = urem i64 %112, %154
  %n.vec26 = sub i64 %112, %n.mod.vf25
  %ind.end27 = add i64 %113, %n.vec26
  %155 = call i64 @llvm.vscale.i64()
  %156 = mul i64 %155, 4
  %.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %113, i64 0
  %.splat = shufflevector <vscale x 4 x i64> %.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %157 = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
  %158 = add <vscale x 4 x i64> %157, zeroinitializer
  %159 = mul <vscale x 4 x i64> %158, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %induction = add <vscale x 4 x i64> %.splat, %159
  %160 = call i64 @llvm.vscale.i64()
  %161 = mul i64 %160, 4
  %162 = mul i64 1, %161
  %.splatinsert32 = insertelement <vscale x 4 x i64> poison, i64 %162, i64 0
  %.splat33 = shufflevector <vscale x 4 x i64> %.splatinsert32, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %116, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x i64> %broadcast.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  %broadcast.splatinsert36 = insertelement <vscale x 4 x i64> poison, i64 %150, i64 0
  %broadcast.splat37 = shufflevector <vscale x 4 x i64> %broadcast.splatinsert36, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  br label %vector.body30

vector.body30:                                    ; preds = %vector.body30, %vector.ph24
  %index31 = phi i64 [ 0, %vector.ph24 ], [ %index.next38, %vector.body30 ]
  %vec.ind = phi <vscale x 4 x i64> [ %induction, %vector.ph24 ], [ %vec.ind.next, %vector.body30 ]
  %offset.idx34 = add i64 %113, %index31
  %163 = add i64 %offset.idx34, 0
  %164 = getelementptr float, ptr addrspace(1) %149, i64 %163
  %165 = getelementptr float, ptr addrspace(1) %164, i32 0
  %wide.load35 = load <vscale x 4 x float>, ptr addrspace(1) %165, align 4, !alias.scope !36, !noalias !37
  %166 = freeze <vscale x 4 x i64> %vec.ind
  %167 = udiv <vscale x 4 x i64> %166, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %168 = shl <vscale x 4 x i64> %167, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 10, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %169 = sub <vscale x 4 x i64> %168, %broadcast.splat
  %170 = add nsw <vscale x 4 x i64> %169, %broadcast.splat37
  %171 = mul <vscale x 4 x i64> %167, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 3, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %172 = sub <vscale x 4 x i64> %166, %171
  %173 = mul <vscale x 4 x i64> %170, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 12, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %174 = getelementptr i8, ptr %Packed_B, <vscale x 4 x i64> %173
  %175 = getelementptr float, <vscale x 4 x ptr> %174, <vscale x 4 x i64> %172
  call void @llvm.masked.scatter.nxv4f32.nxv4p0(<vscale x 4 x float> %wide.load35, <vscale x 4 x ptr> %175, i32 4, <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 true, i64 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer)), !alias.scope !38, !noalias !39
  %index.next38 = add nuw i64 %index31, %156
  %vec.ind.next = add <vscale x 4 x i64> %vec.ind, %.splat33
  %176 = icmp eq i64 %index.next38, %n.vec26
  br i1 %176, label %middle.block21, label %vector.body30, !llvm.loop !40

middle.block21:                                   ; preds = %vector.body30
  %cmp.n29 = icmp eq i64 %112, %n.vec26
  br i1 %cmp.n29, label %polly.loop_exit129.loopexit, label %scalar.ph22

scalar.ph22:                                      ; preds = %polly.loop_header127.preheader, %middle.block21
  %bc.resume.val28 = phi i64 [ %ind.end27, %middle.block21 ], [ %113, %polly.loop_header127.preheader ]
  br label %polly.loop_header127

polly.loop_header127:                             ; preds = %polly.loop_header127, %scalar.ph22
  %polly.indvar131 = phi i64 [ %polly.indvar_next132, %polly.loop_header127 ], [ %bc.resume.val28, %scalar.ph22 ]
  %polly.access.136 = getelementptr float, ptr addrspace(1) %149, i64 %polly.indvar131
  %polly.access.136.load = load float, ptr addrspace(1) %polly.access.136, align 4, !alias.scope !36, !noalias !37
  %polly.indvar131.frozen = freeze i64 %polly.indvar131
  %pexp.p_div_q = udiv i64 %polly.indvar131.frozen, 3
  %177 = shl i64 %pexp.p_div_q, 10
  %polly.access.mul.Packed_B = sub i64 %177, %116
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %150
  %178 = mul i64 %pexp.p_div_q, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar131.frozen, %178
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %179 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %179, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.136.load, ptr %polly.access.Packed_B, align 4, !alias.scope !38, !noalias !39
  %polly.indvar_next132 = add nuw nsw i64 %polly.indvar131, 1
  %polly.loop_cond133.not.not = icmp slt i64 %polly.indvar131, %115
  br i1 %polly.loop_cond133.not.not, label %polly.loop_header127, label %polly.loop_exit129.loopexit, !llvm.loop !41

polly.loop_if144.loopexit:                        ; preds = %polly.loop_exit129
  br label %polly.loop_if144

polly.loop_if144:                                 ; preds = %polly.loop_if144.loopexit, %polly.loop_if118
  %180 = shl i64 %polly.indvar115, 11
  %181 = xor i64 %146, -1
  %182 = add i64 %_arg_NK_, %181
  %183 = tail call i64 @llvm.smin.i64(i64 %182, i64 1023)
  %polly.loop_guard201 = icmp sgt i64 %182, -1
  %184 = xor i64 %146, -1
  %185 = add i64 %_arg_NK_, %184
  %186 = tail call i64 @llvm.smin.i64(i64 %185, i64 1023)
  %polly.loop_guard312 = icmp slt i64 %185, 0
  %187 = xor i64 %146, -1
  %188 = add i64 %_arg_NK_, %187
  %189 = tail call i64 @llvm.smin.i64(i64 %188, i64 1023)
  %polly.loop_guard392 = icmp sgt i64 %188, -1
  %190 = xor i64 %146, -1
  %191 = add i64 %_arg_NK_, %190
  %192 = tail call i64 @llvm.smin.i64(i64 %191, i64 1023)
  %polly.loop_guard457 = icmp sgt i64 %191, -1
  %193 = xor i64 %146, -1
  %194 = add i64 %_arg_NK_, %193
  %195 = tail call i64 @llvm.smin.i64(i64 %194, i64 1023)
  %polly.loop_guard549 = icmp sgt i64 %194, -1
  %196 = xor i64 %146, -1
  %197 = add i64 %_arg_NK_, %196
  %198 = tail call i64 @llvm.smin.i64(i64 %197, i64 1023)
  %polly.loop_guard638 = icmp sgt i64 %197, -1
  br label %polly.loop_if152

polly.cond175.loopexit:                           ; preds = %polly.loop_exit163
  br label %polly.cond175

polly.cond175:                                    ; preds = %polly.cond175.loopexit, %polly.loop_if152
  %199 = or disjoint i64 %212, 2
  %200 = icmp sge i64 %_arg_NI_, %199
  %brmerge.not = select i1 %200, i1 %polly.loop_guard184, i1 false
  br i1 %brmerge.not, label %polly.loop_if189.preheader, label %polly.cond369

polly.cond369.loopexit:                           ; preds = %polly.merge305
  br label %polly.cond369

polly.cond369:                                    ; preds = %polly.cond369.loopexit, %polly.cond175
  %201 = and i1 %125, %200
  %202 = or disjoint i64 %212, 3
  %203 = icmp sge i64 %_arg_NI_, %202
  %204 = and i1 %127, %203
  %205 = and i1 %130, %200
  %206 = or i1 %204, %205
  %207 = and i1 %206, %78
  %208 = or i1 %201, %207
  %209 = or disjoint i64 %212, 1
  %210 = icmp eq i64 %209, %_arg_NI_
  %211 = or i1 %208, %210
  br i1 %211, label %polly.cond375, label %polly.merge370

polly.merge370.loopexit:                          ; preds = %polly.loop_exit637
  br label %polly.merge370

polly.merge370:                                   ; preds = %polly.merge370.loopexit, %polly.loop_if626, %polly.cond444, %polly.cond369
  %polly.indvar_next150 = add nuw nsw i64 %polly.indvar149, 1
  %polly.loop_cond151.not.not = icmp slt i64 %polly.indvar149, %pexp.fdiv_q.4143
  br i1 %polly.loop_cond151.not.not, label %polly.loop_if152, label %polly.loop_exit147

polly.loop_if152:                                 ; preds = %polly.merge370, %polly.loop_if144
  %polly.indvar149 = phi i64 [ %polly.indvar_next150, %polly.merge370 ], [ 0, %polly.loop_if144 ]
  %212 = mul nuw nsw i64 %polly.indvar149, 48
  %213 = add nuw nsw i64 %212, 47
  %214 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %213)
  %polly.loop_guard156.not.not = icmp sgt i64 %_arg_NI_, %212
  br i1 %polly.loop_guard156.not.not, label %polly.loop_if160.preheader, label %polly.cond175

polly.loop_if160.preheader:                       ; preds = %polly.loop_if152
  %215 = mul i64 %polly.indvar149, 2251799813685224
  br label %polly.loop_if160

polly.loop_exit163.loopexit:                      ; preds = %middle.block8, %polly.loop_header161
  br label %polly.loop_exit163

polly.loop_exit163:                               ; preds = %polly.loop_exit163.loopexit, %polly.loop_if160
  %polly.indvar_next158 = add nuw nsw i64 %polly.indvar157, 1
  %polly.loop_cond159.not.not = icmp slt i64 %polly.indvar157, %214
  br i1 %polly.loop_cond159.not.not, label %polly.loop_if160, label %polly.cond175.loopexit

polly.loop_if160:                                 ; preds = %polly.loop_exit163, %polly.loop_if160.preheader
  %polly.indvar157 = phi i64 [ %polly.indvar_next158, %polly.loop_exit163 ], [ %212, %polly.loop_if160.preheader ]
  br i1 %polly.loop_guard122.not.not, label %polly.loop_header161.preheader, label %polly.loop_exit163

polly.loop_header161.preheader:                   ; preds = %polly.loop_if160
  %polly.access.mul.168 = mul nsw i64 %polly.indvar157, %_arg_NK_
  %216 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.mul.168
  %pexp.p_div_q171739 = lshr i64 %polly.indvar157, 1
  %217 = add i64 %215, %pexp.p_div_q171739
  %pexp.pdiv_r173 = and i64 %polly.indvar157, 1
  %.idx740 = shl i64 %217, 13
  %218 = getelementptr i8, ptr %Packed_A, i64 %.idx740
  %invariant.gep = getelementptr float, ptr %218, i64 %pexp.pdiv_r173
  %min.iters.check10 = icmp ult i64 %145, 2
  br i1 %min.iters.check10, label %scalar.ph9, label %vector.ph11

vector.ph11:                                      ; preds = %polly.loop_header161.preheader
  %n.mod.vf12 = urem i64 %145, 2
  %n.vec13 = sub i64 %145, %n.mod.vf12
  %ind.end = add i64 %146, %n.vec13
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16, %vector.ph11
  %index17 = phi i64 [ 0, %vector.ph11 ], [ %index.next18, %vector.body16 ]
  %offset.idx = add i64 %146, %index17
  %219 = add i64 %offset.idx, 0
  %220 = add i64 %offset.idx, 1
  %221 = getelementptr float, ptr addrspace(1) %216, i64 %219
  %222 = getelementptr float, ptr addrspace(1) %216, i64 %220
  %223 = load float, ptr addrspace(1) %221, align 4, !alias.scope !42, !noalias !43
  %224 = load float, ptr addrspace(1) %222, align 4, !alias.scope !42, !noalias !43
  %225 = shl nuw i64 %219, 1
  %226 = shl nuw i64 %220, 1
  %227 = sub i64 %225, %180
  %228 = sub i64 %226, %180
  %229 = getelementptr float, ptr %invariant.gep, i64 %227
  %230 = getelementptr float, ptr %invariant.gep, i64 %228
  store float %223, ptr %229, align 4, !alias.scope !44, !noalias !45
  store float %224, ptr %230, align 4, !alias.scope !44, !noalias !45
  %index.next18 = add nuw i64 %index17, 2
  %231 = icmp eq i64 %index.next18, %n.vec13
  br i1 %231, label %middle.block8, label %vector.body16, !llvm.loop !46

middle.block8:                                    ; preds = %vector.body16
  %cmp.n15 = icmp eq i64 %145, %n.vec13
  br i1 %cmp.n15, label %polly.loop_exit163.loopexit, label %scalar.ph9

scalar.ph9:                                       ; preds = %polly.loop_header161.preheader, %middle.block8
  %bc.resume.val14 = phi i64 [ %ind.end, %middle.block8 ], [ %146, %polly.loop_header161.preheader ]
  br label %polly.loop_header161

polly.loop_header161:                             ; preds = %polly.loop_header161, %scalar.ph9
  %polly.indvar165 = phi i64 [ %polly.indvar_next166, %polly.loop_header161 ], [ %bc.resume.val14, %scalar.ph9 ]
  %polly.access.170 = getelementptr float, ptr addrspace(1) %216, i64 %polly.indvar165
  %polly.access.170.load = load float, ptr addrspace(1) %polly.access.170, align 4, !alias.scope !42, !noalias !43
  %232 = shl nuw i64 %polly.indvar165, 1
  %233 = sub i64 %232, %180
  %gep = getelementptr float, ptr %invariant.gep, i64 %233
  store float %polly.access.170.load, ptr %gep, align 4, !alias.scope !44, !noalias !45
  %polly.indvar_next166 = add nuw nsw i64 %polly.indvar165, 1
  %polly.loop_cond167.not.not = icmp slt i64 %polly.indvar165, %148
  br i1 %polly.loop_cond167.not.not, label %polly.loop_header161, label %polly.loop_exit163.loopexit, !llvm.loop !47

polly.loop_if189.preheader:                       ; preds = %polly.cond175
  %234 = mul nsw i64 %polly.indvar149, -24
  %235 = add nsw i64 %234, %pexp.p_div_q188741
  %236 = tail call i64 @llvm.smin.i64(i64 %235, i64 24)
  %237 = add nsw i64 %236, -1
  %polly.loop_guard193 = icmp sgt i64 %235, 0
  %238 = icmp slt i64 %213, %_arg_NI_
  %.not768 = or i1 %238, %74
  %.neg = mul i64 %polly.indvar149, 2251799813685224
  %239 = add i64 %.neg, %pexp.div
  %.idx742 = shl i64 %239, 13
  %240 = getelementptr i8, ptr %Packed_A, i64 %.idx742
  br label %polly.loop_if189

polly.cond304.loopexit:                           ; preds = %polly.loop_exit200
  br label %polly.cond304

polly.cond304:                                    ; preds = %polly.cond304.loopexit, %polly.loop_if189
  %brmerge763 = or i1 %.not768, %polly.loop_guard312
  br i1 %brmerge763, label %polly.merge305, label %polly.stmt.for.body22.i351.preheader

polly.merge305.loopexit:                          ; preds = %polly.stmt.for.body22.i351
  %p_332.lcssa = phi float [ %p_332, %polly.stmt.for.body22.i351 ]
  %p_350.lcssa = phi float [ %p_350, %polly.stmt.for.body22.i351 ]
  %p_368.lcssa = phi float [ %p_368, %polly.stmt.for.body22.i351 ]
  store float %p_332.lcssa, ptr addrspace(1) %scevgep330, align 4, !alias.scope !24, !noalias !27
  store float %p_350.lcssa, ptr addrspace(1) %scevgep348, align 4, !alias.scope !24, !noalias !27
  store float %p_368.lcssa, ptr addrspace(1) %scevgep366, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge305

polly.merge305:                                   ; preds = %polly.merge305.loopexit, %polly.cond304
  %polly.indvar_next186 = add nuw nsw i64 %polly.indvar185, 1
  %polly.loop_cond187.not.not = icmp slt i64 %polly.indvar185, %120
  br i1 %polly.loop_cond187.not.not, label %polly.loop_if189, label %polly.cond369.loopexit

polly.loop_if189:                                 ; preds = %polly.merge305, %polly.loop_if189.preheader
  %polly.indvar185 = phi i64 [ %polly.indvar_next186, %polly.merge305 ], [ 0, %polly.loop_if189.preheader ]
  br i1 %polly.loop_guard193, label %polly.loop_if197.preheader, label %polly.cond304

polly.loop_if197.preheader:                       ; preds = %polly.loop_if189
  %241 = mul nuw nsw i64 %polly.indvar185, 3
  %242 = add nuw nsw i64 %121, %241
  %polly.access.mul.Packed_B211 = shl nsw i64 %polly.indvar185, 10
  %243 = shl i64 %242, 2
  %244 = add i64 %243, 4
  %245 = add i64 %243, 8
  br label %polly.loop_if197

polly.loop_exit200.loopexit:                      ; preds = %polly.stmt.for.body22.i287
  br label %polly.loop_exit200

polly.loop_exit200:                               ; preds = %polly.loop_exit200.loopexit, %polly.loop_if197
  %polly.indvar_next195 = add nuw nsw i64 %polly.indvar194, 1
  %polly.loop_cond196.not.not = icmp slt i64 %polly.indvar194, %237
  br i1 %polly.loop_cond196.not.not, label %polly.loop_if197, label %polly.cond304.loopexit

polly.loop_if197:                                 ; preds = %polly.loop_exit200, %polly.loop_if197.preheader
  %polly.indvar194 = phi i64 [ %polly.indvar_next195, %polly.loop_exit200 ], [ 0, %polly.loop_if197.preheader ]
  br i1 %polly.loop_guard201, label %polly.stmt.for.body22.i287.preheader, label %polly.loop_exit200

polly.stmt.for.body22.i287.preheader:             ; preds = %polly.loop_if197
  %246 = shl nuw nsw i64 %polly.indvar194, 1
  %247 = add nuw nsw i64 %212, %246
  %.idx751 = shl i64 %polly.indvar194, 13
  %248 = getelementptr i8, ptr %Packed_A, i64 %.idx751
  %249 = mul i64 %72, %247
  %250 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %249
  %scevgep217 = getelementptr i8, ptr addrspace(1) %250, i64 %243
  %scevgep233 = getelementptr i8, ptr addrspace(1) %250, i64 %244
  %scevgep250 = getelementptr i8, ptr addrspace(1) %250, i64 %245
  %251 = or disjoint i64 %247, 1
  %252 = mul i64 %72, %251
  %253 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %252
  %scevgep267 = getelementptr i8, ptr addrspace(1) %253, i64 %243
  %scevgep284 = getelementptr i8, ptr addrspace(1) %253, i64 %244
  %scevgep301 = getelementptr i8, ptr addrspace(1) %253, i64 %245
  br label %polly.stmt.for.body22.i287

polly.stmt.for.body22.i287:                       ; preds = %polly.stmt.for.body22.i287, %polly.stmt.for.body22.i287.preheader
  %polly.indvar202 = phi i64 [ %polly.indvar_next203, %polly.stmt.for.body22.i287 ], [ 0, %polly.stmt.for.body22.i287.preheader ]
  %polly.access.Packed_A209.idx = shl i64 %polly.indvar202, 3
  %polly.access.Packed_A209 = getelementptr i8, ptr %248, i64 %polly.access.Packed_A209.idx
  %_p_scalar_210 = load float, ptr %polly.access.Packed_A209, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i = fmul float %_p_scalar_210, 3.241200e+04
  %polly.access.add.Packed_B212 = add nuw nsw i64 %polly.access.mul.Packed_B211, %polly.indvar202
  %polly.access.Packed_B215.idx = mul i64 %polly.access.add.Packed_B212, 12
  %polly.access.Packed_B215 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B215.idx
  %_p_scalar_216 = load float, ptr %polly.access.Packed_B215, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_218 = load float, ptr addrspace(1) %scevgep217, align 4, !alias.scope !24, !noalias !27
  %p_ = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_216, float %_p_scalar_218)
  store float %p_, ptr addrspace(1) %scevgep217, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_B231 = getelementptr i8, ptr %polly.access.Packed_B215, i64 4
  %_p_scalar_232 = load float, ptr %polly.access.Packed_B231, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_234 = load float, ptr addrspace(1) %scevgep233, align 4, !alias.scope !24, !noalias !27
  %p_235 = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_232, float %_p_scalar_234)
  store float %p_235, ptr addrspace(1) %scevgep233, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_B248 = getelementptr i8, ptr %polly.access.Packed_B215, i64 8
  %_p_scalar_249 = load float, ptr %polly.access.Packed_B248, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_251 = load float, ptr addrspace(1) %scevgep250, align 4, !alias.scope !24, !noalias !27
  %p_252 = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_249, float %_p_scalar_251)
  store float %p_252, ptr addrspace(1) %scevgep250, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_A258 = getelementptr i8, ptr %polly.access.Packed_A209, i64 4
  %_p_scalar_259 = load float, ptr %polly.access.Packed_A258, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i260 = fmul float %_p_scalar_259, 3.241200e+04
  %_p_scalar_268 = load float, ptr addrspace(1) %scevgep267, align 4, !alias.scope !24, !noalias !27
  %p_269 = tail call float @llvm.fmuladd.f32(float %p_mul16.i260, float %_p_scalar_216, float %_p_scalar_268)
  store float %p_269, ptr addrspace(1) %scevgep267, align 4, !alias.scope !24, !noalias !27
  %_p_scalar_285 = load float, ptr addrspace(1) %scevgep284, align 4, !alias.scope !24, !noalias !27
  %p_286 = tail call float @llvm.fmuladd.f32(float %p_mul16.i260, float %_p_scalar_232, float %_p_scalar_285)
  store float %p_286, ptr addrspace(1) %scevgep284, align 4, !alias.scope !24, !noalias !27
  %_p_scalar_302 = load float, ptr addrspace(1) %scevgep301, align 4, !alias.scope !24, !noalias !27
  %p_303 = tail call float @llvm.fmuladd.f32(float %p_mul16.i260, float %_p_scalar_249, float %_p_scalar_302)
  store float %p_303, ptr addrspace(1) %scevgep301, align 4, !alias.scope !24, !noalias !27
  %polly.indvar_next203 = add nuw nsw i64 %polly.indvar202, 1
  %polly.loop_cond204.not.not = icmp slt i64 %polly.indvar202, %183
  br i1 %polly.loop_cond204.not.not, label %polly.stmt.for.body22.i287, label %polly.loop_exit200.loopexit, !llvm.loop !48

polly.stmt.for.body22.i351.preheader:             ; preds = %polly.cond304
  %254 = mul nuw nsw i64 %polly.indvar185, 3
  %255 = add nuw nsw i64 %122, %254
  %polly.access.mul.Packed_B324 = shl nsw i64 %polly.indvar185, 10
  %256 = shl i64 %255, 2
  %scevgep330 = getelementptr i8, ptr addrspace(1) %76, i64 %256
  %scevgep348 = getelementptr i8, ptr addrspace(1) %scevgep330, i64 4
  %scevgep366 = getelementptr i8, ptr addrspace(1) %scevgep330, i64 8
  %scevgep330.promoted = load float, ptr addrspace(1) %scevgep330, align 4, !alias.scope !24, !noalias !27
  %scevgep348.promoted = load float, ptr addrspace(1) %scevgep348, align 4, !alias.scope !24, !noalias !27
  %scevgep366.promoted = load float, ptr addrspace(1) %scevgep366, align 4, !alias.scope !24, !noalias !27
  br label %polly.stmt.for.body22.i351

polly.stmt.for.body22.i351:                       ; preds = %polly.stmt.for.body22.i351, %polly.stmt.for.body22.i351.preheader
  %p_368757 = phi float [ %p_368, %polly.stmt.for.body22.i351 ], [ %scevgep366.promoted, %polly.stmt.for.body22.i351.preheader ]
  %p_350756 = phi float [ %p_350, %polly.stmt.for.body22.i351 ], [ %scevgep348.promoted, %polly.stmt.for.body22.i351.preheader ]
  %_p_scalar_331755 = phi float [ %p_332, %polly.stmt.for.body22.i351 ], [ %scevgep330.promoted, %polly.stmt.for.body22.i351.preheader ]
  %polly.indvar313 = phi i64 [ %polly.indvar_next314, %polly.stmt.for.body22.i351 ], [ 0, %polly.stmt.for.body22.i351.preheader ]
  %polly.access.Packed_A321.idx = shl i64 %polly.indvar313, 3
  %polly.access.Packed_A321 = getelementptr i8, ptr %240, i64 %polly.access.Packed_A321.idx
  %_p_scalar_322 = load float, ptr %polly.access.Packed_A321, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i323 = fmul float %_p_scalar_322, 3.241200e+04
  %polly.access.add.Packed_B325 = add nuw nsw i64 %polly.access.mul.Packed_B324, %polly.indvar313
  %polly.access.Packed_B328.idx = mul i64 %polly.access.add.Packed_B325, 12
  %polly.access.Packed_B328 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B328.idx
  %_p_scalar_329 = load float, ptr %polly.access.Packed_B328, align 4, !alias.scope !38, !noalias !39
  %p_332 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_329, float %_p_scalar_331755)
  %polly.access.Packed_B346 = getelementptr i8, ptr %polly.access.Packed_B328, i64 4
  %_p_scalar_347 = load float, ptr %polly.access.Packed_B346, align 4, !alias.scope !38, !noalias !39
  %p_350 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_347, float %p_350756)
  %polly.access.Packed_B364 = getelementptr i8, ptr %polly.access.Packed_B328, i64 8
  %_p_scalar_365 = load float, ptr %polly.access.Packed_B364, align 4, !alias.scope !38, !noalias !39
  %p_368 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_365, float %p_368757)
  %polly.indvar_next314 = add nuw nsw i64 %polly.indvar313, 1
  %polly.loop_cond315.not.not = icmp slt i64 %polly.indvar313, %186
  br i1 %polly.loop_cond315.not.not, label %polly.stmt.for.body22.i351, label %polly.merge305.loopexit, !llvm.loop !50

polly.cond375:                                    ; preds = %polly.cond369
  %brmerge765.not = select i1 %210, i1 %polly.loop_guard384, i1 false
  br i1 %brmerge765.not, label %polly.loop_if388.preheader, label %polly.cond444

polly.loop_if388.preheader:                       ; preds = %polly.cond375
  br label %polly.loop_if388

polly.cond444.loopexit:                           ; preds = %polly.loop_exit391
  br label %polly.cond444

polly.cond444:                                    ; preds = %polly.cond444.loopexit, %polly.cond375
  br i1 %135, label %polly.cond449, label %polly.merge370

polly.loop_exit391.loopexit:                      ; preds = %polly.stmt.for.body22.i428
  %p_411.lcssa = phi float [ %p_411, %polly.stmt.for.body22.i428 ]
  %p_427.lcssa = phi float [ %p_427, %polly.stmt.for.body22.i428 ]
  %p_443.lcssa = phi float [ %p_443, %polly.stmt.for.body22.i428 ]
  store float %p_411.lcssa, ptr addrspace(1) %scevgep409, align 4, !alias.scope !24, !noalias !27
  store float %p_427.lcssa, ptr addrspace(1) %scevgep425, align 4, !alias.scope !24, !noalias !27
  store float %p_443.lcssa, ptr addrspace(1) %scevgep441, align 4, !alias.scope !24, !noalias !27
  br label %polly.loop_exit391

polly.loop_exit391:                               ; preds = %polly.loop_if388, %polly.loop_exit391.loopexit
  %polly.indvar_next386 = add nuw nsw i64 %polly.indvar385, 1
  %polly.loop_cond387.not.not = icmp slt i64 %polly.indvar385, %134
  br i1 %polly.loop_cond387.not.not, label %polly.loop_if388, label %polly.cond444.loopexit

polly.loop_if388:                                 ; preds = %polly.loop_if388.preheader, %polly.loop_exit391
  %polly.indvar385 = phi i64 [ %polly.indvar_next386, %polly.loop_exit391 ], [ 0, %polly.loop_if388.preheader ]
  br i1 %polly.loop_guard392, label %polly.stmt.for.body22.i428.preheader, label %polly.loop_exit391

polly.stmt.for.body22.i428.preheader:             ; preds = %polly.loop_if388
  %257 = mul nuw nsw i64 %polly.indvar385, 3
  %258 = add nuw nsw i64 %123, %257
  %polly.access.mul.Packed_B403 = shl nsw i64 %polly.indvar385, 10
  %259 = shl i64 %258, 2
  %scevgep409 = getelementptr i8, ptr addrspace(1) %80, i64 %259
  %scevgep425 = getelementptr i8, ptr addrspace(1) %scevgep409, i64 4
  %scevgep441 = getelementptr i8, ptr addrspace(1) %scevgep409, i64 8
  %scevgep409.promoted = load float, ptr addrspace(1) %scevgep409, align 4, !alias.scope !24, !noalias !27
  %scevgep425.promoted = load float, ptr addrspace(1) %scevgep425, align 4, !alias.scope !24, !noalias !27
  %scevgep441.promoted = load float, ptr addrspace(1) %scevgep441, align 4, !alias.scope !24, !noalias !27
  br label %polly.stmt.for.body22.i428

polly.stmt.for.body22.i428:                       ; preds = %polly.stmt.for.body22.i428, %polly.stmt.for.body22.i428.preheader
  %p_443760 = phi float [ %p_443, %polly.stmt.for.body22.i428 ], [ %scevgep441.promoted, %polly.stmt.for.body22.i428.preheader ]
  %p_427759 = phi float [ %p_427, %polly.stmt.for.body22.i428 ], [ %scevgep425.promoted, %polly.stmt.for.body22.i428.preheader ]
  %_p_scalar_410758 = phi float [ %p_411, %polly.stmt.for.body22.i428 ], [ %scevgep409.promoted, %polly.stmt.for.body22.i428.preheader ]
  %polly.indvar393 = phi i64 [ %polly.indvar_next394, %polly.stmt.for.body22.i428 ], [ 0, %polly.stmt.for.body22.i428.preheader ]
  %polly.access.Packed_A400.idx = shl i64 %polly.indvar393, 3
  %polly.access.Packed_A400 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A400.idx
  %_p_scalar_401 = load float, ptr %polly.access.Packed_A400, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i402 = fmul float %_p_scalar_401, 3.241200e+04
  %polly.access.add.Packed_B404 = add nuw nsw i64 %polly.access.mul.Packed_B403, %polly.indvar393
  %polly.access.Packed_B407.idx = mul i64 %polly.access.add.Packed_B404, 12
  %polly.access.Packed_B407 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B407.idx
  %_p_scalar_408 = load float, ptr %polly.access.Packed_B407, align 4, !alias.scope !38, !noalias !39
  %p_411 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_408, float %_p_scalar_410758)
  %polly.access.Packed_B423 = getelementptr i8, ptr %polly.access.Packed_B407, i64 4
  %_p_scalar_424 = load float, ptr %polly.access.Packed_B423, align 4, !alias.scope !38, !noalias !39
  %p_427 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_424, float %p_427759)
  %polly.access.Packed_B439 = getelementptr i8, ptr %polly.access.Packed_B407, i64 8
  %_p_scalar_440 = load float, ptr %polly.access.Packed_B439, align 4, !alias.scope !38, !noalias !39
  %p_443 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_440, float %p_443760)
  %polly.indvar_next394 = add nuw nsw i64 %polly.indvar393, 1
  %polly.loop_cond395.not.not = icmp slt i64 %polly.indvar393, %189
  br i1 %polly.loop_cond395.not.not, label %polly.stmt.for.body22.i428, label %polly.loop_exit391.loopexit, !llvm.loop !51

polly.cond449:                                    ; preds = %polly.cond444
  br i1 %.not, label %polly.loop_if545, label %polly.loop_if453

polly.loop_if453:                                 ; preds = %polly.cond449
  br i1 %polly.loop_guard457, label %polly.cond479.preheader, label %polly.loop_if626

polly.cond479.preheader:                          ; preds = %polly.loop_if453
  %260 = mul i64 %72, %212
  %261 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %260
  %scevgep476 = getelementptr i8, ptr addrspace(1) %261, i64 %84
  %scevgep498 = getelementptr i8, ptr addrspace(1) %261, i64 %89
  %262 = mul i64 %72, %209
  %263 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %262
  %scevgep520 = getelementptr i8, ptr addrspace(1) %263, i64 %84
  %scevgep542 = getelementptr i8, ptr addrspace(1) %263, i64 %92
  br label %polly.cond479

polly.cond479:                                    ; preds = %polly.merge502, %polly.cond479.preheader
  %polly.indvar458 = phi i64 [ %polly.indvar_next459, %polly.merge502 ], [ 0, %polly.cond479.preheader ]
  %polly.access.Packed_A466.idx = shl i64 %polly.indvar458, 3
  %polly.access.Packed_A466 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A466.idx
  %_p_scalar_467 = load float, ptr %polly.access.Packed_A466, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i468 = fmul float %_p_scalar_467, 3.241200e+04
  %polly.access.add.Packed_B471 = add nsw i64 %polly.access.mul.Packed_B470, %polly.indvar458
  %polly.access.Packed_B474.idx = mul i64 %polly.access.add.Packed_B471, 12
  %polly.access.Packed_B474 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B474.idx
  %_p_scalar_475 = load float, ptr %polly.access.Packed_B474, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_477 = load float, ptr addrspace(1) %scevgep476, align 4, !alias.scope !24, !noalias !27
  %p_478 = tail call float @llvm.fmuladd.f32(float %p_mul16.i468, float %_p_scalar_475, float %_p_scalar_477)
  store float %p_478, ptr addrspace(1) %scevgep476, align 4, !alias.scope !24, !noalias !27
  br i1 %86, label %polly.stmt.for.body22.i484, label %polly.cond501

polly.cond501:                                    ; preds = %polly.stmt.for.body22.i484, %polly.cond479
  br i1 %200, label %polly.cond523, label %polly.merge502

polly.merge502:                                   ; preds = %polly.stmt.for.body22.i528, %polly.cond523, %polly.cond501
  %polly.indvar_next459 = add nuw nsw i64 %polly.indvar458, 1
  %polly.loop_cond460.not.not = icmp slt i64 %polly.indvar458, %192
  br i1 %polly.loop_cond460.not.not, label %polly.cond479, label %polly.loop_if626.loopexit1, !llvm.loop !52

polly.stmt.for.body22.i484:                       ; preds = %polly.cond479
  %polly.access.add.Packed_B493 = add nsw i64 %polly.access.mul.Packed_B492, %polly.indvar458
  %.idx743 = mul i64 %polly.access.add.Packed_B493, 12
  %264 = getelementptr i8, ptr %Packed_B, i64 %.idx743
  %polly.access.Packed_B496 = getelementptr i8, ptr %264, i64 4
  %_p_scalar_497 = load float, ptr %polly.access.Packed_B496, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_499 = load float, ptr addrspace(1) %scevgep498, align 4, !alias.scope !24, !noalias !27
  %p_500 = tail call float @llvm.fmuladd.f32(float %p_mul16.i468, float %_p_scalar_497, float %_p_scalar_499)
  store float %p_500, ptr addrspace(1) %scevgep498, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond501

polly.cond523:                                    ; preds = %polly.cond501
  %polly.access.Packed_A510 = getelementptr i8, ptr %polly.access.Packed_A466, i64 4
  %_p_scalar_511 = load float, ptr %polly.access.Packed_A510, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i512 = fmul float %_p_scalar_511, 3.241200e+04
  %_p_scalar_521 = load float, ptr addrspace(1) %scevgep520, align 4, !alias.scope !24, !noalias !27
  %p_522 = tail call float @llvm.fmuladd.f32(float %p_mul16.i512, float %_p_scalar_475, float %_p_scalar_521)
  store float %p_522, ptr addrspace(1) %scevgep520, align 4, !alias.scope !24, !noalias !27
  br i1 %86, label %polly.stmt.for.body22.i528, label %polly.merge502

polly.stmt.for.body22.i528:                       ; preds = %polly.cond523
  %polly.access.add.Packed_B537 = add nsw i64 %polly.access.mul.Packed_B536, %polly.indvar458
  %.idx744 = mul i64 %polly.access.add.Packed_B537, 12
  %265 = getelementptr i8, ptr %Packed_B, i64 %.idx744
  %polly.access.Packed_B540 = getelementptr i8, ptr %265, i64 4
  %_p_scalar_541 = load float, ptr %polly.access.Packed_B540, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_543 = load float, ptr addrspace(1) %scevgep542, align 4, !alias.scope !24, !noalias !27
  %p_544 = tail call float @llvm.fmuladd.f32(float %p_mul16.i512, float %_p_scalar_541, float %_p_scalar_543)
  store float %p_544, ptr addrspace(1) %scevgep542, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge502

polly.loop_if545:                                 ; preds = %polly.cond449
  br i1 %polly.loop_guard549, label %polly.cond568.preheader, label %polly.loop_if626

polly.cond568.preheader:                          ; preds = %polly.loop_if545
  %266 = mul i64 %72, %212
  %267 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %266
  %scevgep565 = getelementptr i8, ptr addrspace(1) %267, i64 %138
  %scevgep584 = getelementptr i8, ptr addrspace(1) %267, i64 %93
  %268 = mul i64 %72, %209
  %269 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %268
  %scevgep603 = getelementptr i8, ptr addrspace(1) %269, i64 %138
  %scevgep622 = getelementptr i8, ptr addrspace(1) %269, i64 %94
  br label %polly.cond568

polly.cond568:                                    ; preds = %polly.merge588, %polly.cond568.preheader
  %polly.indvar550 = phi i64 [ %polly.indvar_next551, %polly.merge588 ], [ 0, %polly.cond568.preheader ]
  %polly.access.Packed_A557.idx = shl i64 %polly.indvar550, 3
  %polly.access.Packed_A557 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A557.idx
  %_p_scalar_558 = load float, ptr %polly.access.Packed_A557, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i559 = fmul float %_p_scalar_558, 3.241200e+04
  %polly.access.Packed_B563.idx = mul i64 %polly.indvar550, 12
  %polly.access.Packed_B563 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B563.idx
  %_p_scalar_564 = load float, ptr %polly.access.Packed_B563, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_566 = load float, ptr addrspace(1) %scevgep565, align 4, !alias.scope !24, !noalias !27
  %p_567 = tail call float @llvm.fmuladd.f32(float %p_mul16.i559, float %_p_scalar_564, float %_p_scalar_566)
  store float %p_567, ptr addrspace(1) %scevgep565, align 4, !alias.scope !24, !noalias !27
  br i1 %139, label %polly.stmt.for.body22.i572, label %polly.cond587

polly.cond587:                                    ; preds = %polly.stmt.for.body22.i572, %polly.cond568
  br i1 %200, label %polly.cond606, label %polly.merge588

polly.merge588:                                   ; preds = %polly.stmt.for.body22.i610, %polly.cond606, %polly.cond587
  %polly.indvar_next551 = add nuw nsw i64 %polly.indvar550, 1
  %polly.loop_cond552.not.not = icmp slt i64 %polly.indvar550, %195
  br i1 %polly.loop_cond552.not.not, label %polly.cond568, label %polly.loop_if626.loopexit, !llvm.loop !53

polly.stmt.for.body22.i572:                       ; preds = %polly.cond568
  %polly.access.Packed_B582 = getelementptr i8, ptr %polly.access.Packed_B563, i64 4
  %_p_scalar_583 = load float, ptr %polly.access.Packed_B582, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_585 = load float, ptr addrspace(1) %scevgep584, align 4, !alias.scope !24, !noalias !27
  %p_586 = tail call float @llvm.fmuladd.f32(float %p_mul16.i559, float %_p_scalar_583, float %_p_scalar_585)
  store float %p_586, ptr addrspace(1) %scevgep584, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond587

polly.cond606:                                    ; preds = %polly.cond587
  %polly.access.Packed_A595 = getelementptr i8, ptr %polly.access.Packed_A557, i64 4
  %_p_scalar_596 = load float, ptr %polly.access.Packed_A595, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i597 = fmul float %_p_scalar_596, 3.241200e+04
  %_p_scalar_604 = load float, ptr addrspace(1) %scevgep603, align 4, !alias.scope !24, !noalias !27
  %p_605 = tail call float @llvm.fmuladd.f32(float %p_mul16.i597, float %_p_scalar_564, float %_p_scalar_604)
  store float %p_605, ptr addrspace(1) %scevgep603, align 4, !alias.scope !24, !noalias !27
  br i1 %139, label %polly.stmt.for.body22.i610, label %polly.merge588

polly.stmt.for.body22.i610:                       ; preds = %polly.cond606
  %polly.access.Packed_B620 = getelementptr i8, ptr %polly.access.Packed_B563, i64 4
  %_p_scalar_621 = load float, ptr %polly.access.Packed_B620, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_623 = load float, ptr addrspace(1) %scevgep622, align 4, !alias.scope !24, !noalias !27
  %p_624 = tail call float @llvm.fmuladd.f32(float %p_mul16.i597, float %_p_scalar_621, float %_p_scalar_623)
  store float %p_624, ptr addrspace(1) %scevgep622, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge588

polly.loop_if626.loopexit:                        ; preds = %polly.merge588
  br label %polly.loop_if626

polly.loop_if626.loopexit1:                       ; preds = %polly.merge502
  br label %polly.loop_if626

polly.loop_if626:                                 ; preds = %polly.loop_if626.loopexit1, %polly.loop_if626.loopexit, %polly.loop_if545, %polly.loop_if453
  %270 = mul nsw i64 %polly.indvar149, -24
  %271 = add nsw i64 %270, %pexp.p_div_q625745
  %272 = tail call i64 @llvm.smin.i64(i64 %271, i64 24)
  %273 = add nsw i64 %272, -1
  %polly.loop_guard630 = icmp sgt i64 %271, 1
  br i1 %polly.loop_guard630, label %polly.loop_if634.preheader, label %polly.merge370

polly.loop_if634.preheader:                       ; preds = %polly.loop_if626
  br label %polly.loop_if634

polly.loop_exit637.loopexit:                      ; preds = %polly.merge685
  br label %polly.loop_exit637

polly.loop_exit637:                               ; preds = %polly.loop_exit637.loopexit, %polly.loop_if634
  %polly.indvar_next632 = add nuw nsw i64 %polly.indvar631, 1
  %polly.loop_cond633.not.not = icmp slt i64 %polly.indvar631, %273
  br i1 %polly.loop_cond633.not.not, label %polly.loop_if634, label %polly.merge370.loopexit

polly.loop_if634:                                 ; preds = %polly.loop_if634.preheader, %polly.loop_exit637
  %polly.indvar631 = phi i64 [ %polly.indvar_next632, %polly.loop_exit637 ], [ 1, %polly.loop_if634.preheader ]
  br i1 %polly.loop_guard638, label %polly.cond661.preheader, label %polly.loop_exit637

polly.cond661.preheader:                          ; preds = %polly.loop_if634
  %274 = shl nuw nsw i64 %polly.indvar631, 1
  %275 = add nuw nsw i64 %212, %274
  %.idx752 = shl i64 %polly.indvar631, 13
  %276 = getelementptr i8, ptr %Packed_A, i64 %.idx752
  %277 = mul i64 %72, %275
  %278 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %277
  %scevgep658 = getelementptr i8, ptr addrspace(1) %278, i64 %99
  %scevgep681 = getelementptr i8, ptr addrspace(1) %278, i64 %104
  %279 = add nuw nsw i64 %275, 2
  %.not747 = icmp slt i64 %_arg_NI_, %279
  %280 = or disjoint i64 %275, 1
  %281 = mul i64 %72, %280
  %282 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %281
  %scevgep705 = getelementptr i8, ptr addrspace(1) %282, i64 %99
  %scevgep728 = getelementptr i8, ptr addrspace(1) %282, i64 %107
  br label %polly.cond661

polly.cond661:                                    ; preds = %polly.merge685, %polly.cond661.preheader
  %polly.indvar639 = phi i64 [ %polly.indvar_next640, %polly.merge685 ], [ 0, %polly.cond661.preheader ]
  %polly.access.Packed_A648.idx = shl i64 %polly.indvar639, 3
  %polly.access.Packed_A648 = getelementptr i8, ptr %276, i64 %polly.access.Packed_A648.idx
  %_p_scalar_649 = load float, ptr %polly.access.Packed_A648, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i650 = fmul float %_p_scalar_649, 3.241200e+04
  %polly.access.add.Packed_B653 = add nsw i64 %polly.access.mul.Packed_B652, %polly.indvar639
  %polly.access.Packed_B656.idx = mul i64 %polly.access.add.Packed_B653, 12
  %polly.access.Packed_B656 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B656.idx
  %_p_scalar_657 = load float, ptr %polly.access.Packed_B656, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_659 = load float, ptr addrspace(1) %scevgep658, align 4, !alias.scope !24, !noalias !27
  %p_660 = tail call float @llvm.fmuladd.f32(float %p_mul16.i650, float %_p_scalar_657, float %_p_scalar_659)
  store float %p_660, ptr addrspace(1) %scevgep658, align 4, !alias.scope !24, !noalias !27
  br i1 %101, label %polly.stmt.for.body22.i666, label %polly.cond684

polly.cond684:                                    ; preds = %polly.stmt.for.body22.i666, %polly.cond661
  br i1 %.not747, label %polly.merge685, label %polly.cond708

polly.merge685:                                   ; preds = %polly.stmt.for.body22.i713, %polly.cond708, %polly.cond684
  %polly.indvar_next640 = add nuw nsw i64 %polly.indvar639, 1
  %polly.loop_cond641.not.not = icmp slt i64 %polly.indvar639, %198
  br i1 %polly.loop_cond641.not.not, label %polly.cond661, label %polly.loop_exit637.loopexit, !llvm.loop !54

polly.stmt.for.body22.i666:                       ; preds = %polly.cond661
  %polly.access.add.Packed_B676 = add nsw i64 %polly.access.mul.Packed_B675, %polly.indvar639
  %.idx746 = mul i64 %polly.access.add.Packed_B676, 12
  %283 = getelementptr i8, ptr %Packed_B, i64 %.idx746
  %polly.access.Packed_B679 = getelementptr i8, ptr %283, i64 4
  %_p_scalar_680 = load float, ptr %polly.access.Packed_B679, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_682 = load float, ptr addrspace(1) %scevgep681, align 4, !alias.scope !24, !noalias !27
  %p_683 = tail call float @llvm.fmuladd.f32(float %p_mul16.i650, float %_p_scalar_680, float %_p_scalar_682)
  store float %p_683, ptr addrspace(1) %scevgep681, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond684

polly.cond708:                                    ; preds = %polly.cond684
  %polly.access.Packed_A695 = getelementptr i8, ptr %polly.access.Packed_A648, i64 4
  %_p_scalar_696 = load float, ptr %polly.access.Packed_A695, align 4, !alias.scope !44, !noalias !45
  %p_mul16.i697 = fmul float %_p_scalar_696, 3.241200e+04
  %_p_scalar_706 = load float, ptr addrspace(1) %scevgep705, align 4, !alias.scope !24, !noalias !27
  %p_707 = tail call float @llvm.fmuladd.f32(float %p_mul16.i697, float %_p_scalar_657, float %_p_scalar_706)
  store float %p_707, ptr addrspace(1) %scevgep705, align 4, !alias.scope !24, !noalias !27
  br i1 %101, label %polly.stmt.for.body22.i713, label %polly.merge685

polly.stmt.for.body22.i713:                       ; preds = %polly.cond708
  %polly.access.add.Packed_B723 = add nsw i64 %polly.access.mul.Packed_B722, %polly.indvar639
  %.idx748 = mul i64 %polly.access.add.Packed_B723, 12
  %284 = getelementptr i8, ptr %Packed_B, i64 %.idx748
  %polly.access.Packed_B726 = getelementptr i8, ptr %284, i64 4
  %_p_scalar_727 = load float, ptr %polly.access.Packed_B726, align 4, !alias.scope !38, !noalias !39
  %_p_scalar_729 = load float, ptr addrspace(1) %scevgep728, align 4, !alias.scope !24, !noalias !27
  %p_730 = tail call float @llvm.fmuladd.f32(float %p_mul16.i697, float %_p_scalar_727, float %_p_scalar_729)
  store float %p_730, ptr addrspace(1) %scevgep728, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge685
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64() #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.nxv4f32.nxv4p0(<vscale x 4 x float>, <vscale x 4 x ptr>, i32 immarg, <vscale x 4 x i1>) #5

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="gemm.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
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
!10 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false, i1 false, i1 false, i1 false}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.vectorize.enable", i32 0}
!18 = distinct !{!18, !16, !17}
!19 = distinct !{!19, !16, !17}
!20 = distinct !{!20, !16, !21, !22, !23, !17}
!21 = !{!"llvm.loop.vectorize.width", i32 4}
!22 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!23 = !{!"llvm.loop.interleave.count", i32 1}
!24 = !{!25}
!25 = distinct !{!25, !26, !"polly.alias.scope.MemRef0"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
!27 = !{!28, !29, !30, !31}
!28 = distinct !{!28, !26, !"polly.alias.scope.MemRef1"}
!29 = distinct !{!29, !26, !"polly.alias.scope.MemRef3"}
!30 = distinct !{!30, !26, !"polly.alias.scope.Packed_B"}
!31 = distinct !{!31, !26, !"polly.alias.scope.Packed_A"}
!32 = distinct !{!32, !33, !34}
!33 = !{!"llvm.loop.isvectorized", i32 1}
!34 = !{!"llvm.loop.unroll.runtime.disable"}
!35 = distinct !{!35, !33}
!36 = !{!29}
!37 = !{!25, !28, !30, !31}
!38 = !{!30}
!39 = !{!25, !28, !29, !31}
!40 = distinct !{!40, !33, !34}
!41 = distinct !{!41, !34, !33}
!42 = !{!28}
!43 = !{!25, !29, !30, !31}
!44 = !{!31}
!45 = !{!25, !28, !29, !30}
!46 = distinct !{!46, !33, !34}
!47 = distinct !{!47, !33}
!48 = distinct !{!48, !49}
!49 = !{!"llvm.loop.vectorize.enable", i1 false}
!50 = distinct !{!50, !49}
!51 = distinct !{!51, !49}
!52 = distinct !{!52, !49}
!53 = distinct !{!53, !49}
!54 = distinct !{!54, !49}
