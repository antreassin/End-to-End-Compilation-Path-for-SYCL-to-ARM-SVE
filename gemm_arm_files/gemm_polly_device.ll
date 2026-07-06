; ModuleID = 'gemm.cpp'
source_filename = "gemm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS4Gemm = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS4Gemm(i64 noundef %_arg_NI_, i64 noundef %_arg_NJ_, i64 noundef %_arg_NK_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
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
  br i1 %polly.rtc.result.not, label %for.cond.i, label %polly.loop_if

for.cond.i:                                       ; preds = %polly.split_new_and_old, %for.cond.cleanup10.i
  %i.0.i = phi i64 [ %inc39.i, %for.cond.cleanup10.i ], [ 0, %polly.split_new_and_old ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_NI_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_NJ_
  %18 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body5.i
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

for.cond8.i:                                      ; preds = %for.cond8.i.preheader, %for.cond.cleanup21.i
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

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %polly.loop_exit113, %for.cond.i, %polly.cond, %polly.loop_if101
  ret void

polly.cond:                                       ; preds = %polly.loop_exit80, %polly.loop_if
  br i1 %1, label %polly.loop_if101, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %polly.fdiv_q.shr = ashr i64 %.res, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.cond

polly.loop_exit80:                                ; preds = %polly.loop_exit88, %polly.loop_if77
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_if77, label %polly.cond

polly.loop_preheader:                             ; preds = %polly.loop_if
  %26 = shl i64 %_arg_NJ_, 2
  %27 = add nsw i64 %_arg_NJ_, -1
  %polly.fdiv_q.shr76 = ashr i64 %27, 5
  %polly.loop_guard81 = icmp sgt i64 %polly.fdiv_q.shr76, -1
  br label %polly.loop_if77

polly.loop_if77:                                  ; preds = %polly.loop_preheader, %polly.loop_exit80
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit80 ]
  br i1 %polly.loop_guard81, label %polly.loop_if85.preheader, label %polly.loop_exit80

polly.loop_if85.preheader:                        ; preds = %polly.loop_if77
  %28 = shl nsw i64 %polly.indvar, 5
  %29 = xor i64 %28, -1
  %30 = add nsw i64 %_arg_NI_, %29
  %31 = tail call i64 @llvm.smin.i64(i64 %30, i64 31)
  %polly.loop_guard89 = icmp sgt i64 %30, -1
  br label %polly.loop_if85

polly.loop_exit88:                                ; preds = %polly.loop_exit96, %polly.loop_if85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %polly.loop_cond84.not.not = icmp slt i64 %polly.indvar82, %polly.fdiv_q.shr76
  br i1 %polly.loop_cond84.not.not, label %polly.loop_if85, label %polly.loop_exit80

polly.loop_if85:                                  ; preds = %polly.loop_if85.preheader, %polly.loop_exit88
  %polly.indvar82 = phi i64 [ %polly.indvar_next83, %polly.loop_exit88 ], [ 0, %polly.loop_if85.preheader ]
  br i1 %polly.loop_guard89, label %polly.loop_if93.preheader, label %polly.loop_exit88

polly.loop_if93.preheader:                        ; preds = %polly.loop_if85
  %32 = shl nsw i64 %polly.indvar82, 5
  %33 = xor i64 %32, -1
  %34 = add i64 %_arg_NJ_, %33
  %35 = tail call i64 @llvm.smin.i64(i64 %34, i64 31)
  %polly.loop_guard97 = icmp sgt i64 %34, -1
  br label %polly.loop_if93

polly.loop_exit96:                                ; preds = %polly.stmt.for.body5.i, %polly.loop_if93
  %polly.indvar_next91 = add nuw nsw i64 %polly.indvar90, 1
  %polly.loop_cond92.not.not = icmp slt i64 %polly.indvar90, %31
  br i1 %polly.loop_cond92.not.not, label %polly.loop_if93, label %polly.loop_exit88

polly.loop_if93:                                  ; preds = %polly.loop_if93.preheader, %polly.loop_exit96
  %polly.indvar90 = phi i64 [ %polly.indvar_next91, %polly.loop_exit96 ], [ 0, %polly.loop_if93.preheader ]
  br i1 %polly.loop_guard97, label %polly.stmt.for.body5.i.preheader, label %polly.loop_exit96

polly.stmt.for.body5.i.preheader:                 ; preds = %polly.loop_if93
  %36 = add nuw nsw i64 %28, %polly.indvar90
  %37 = mul i64 %26, %36
  %38 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %37
  br label %polly.stmt.for.body5.i

polly.stmt.for.body5.i:                           ; preds = %polly.stmt.for.body5.i.preheader, %polly.stmt.for.body5.i
  %polly.indvar98 = phi i64 [ %polly.indvar_next99, %polly.stmt.for.body5.i ], [ 0, %polly.stmt.for.body5.i.preheader ]
  %39 = add nuw nsw i64 %32, %polly.indvar98
  %40 = shl i64 %39, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %38, i64 %40
  %_p_scalar_ = load float, ptr addrspace(1) %scevgep, align 4, !alias.scope !24, !noalias !27
  %p_mul7.i = fmul float %_p_scalar_, 2.123000e+03
  store float %p_mul7.i, ptr addrspace(1) %scevgep, align 4, !alias.scope !24, !noalias !27
  %polly.indvar_next99 = add nuw nsw i64 %polly.indvar98, 1
  %polly.loop_cond100.not.not = icmp slt i64 %polly.indvar98, %35
  br i1 %polly.loop_cond100.not.not, label %polly.stmt.for.body5.i, label %polly.loop_exit96

polly.loop_if101:                                 ; preds = %polly.cond
  %41 = add nsw i64 %_arg_NJ_, -1
  %pexp.fdiv_q.1 = add nsw i64 %_arg_NJ_, -768
  %pexp.fdiv_q.2 = icmp slt i64 %_arg_NJ_, 1
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 %pexp.fdiv_q.1, i64 %41
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 768
  %polly.loop_guard105 = icmp sgt i64 %pexp.fdiv_q.3, -768
  br i1 %polly.loop_guard105, label %polly.loop_preheader103, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_exit113:                               ; preds = %polly.loop_exit147, %polly.loop_if110
  %polly.indvar_next107 = add nuw nsw i64 %polly.indvar106, 1
  %polly.loop_cond108.not.not = icmp slt i64 %polly.indvar106, %pexp.fdiv_q.4
  br i1 %polly.loop_cond108.not.not, label %polly.loop_if110, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_preheader103:                          ; preds = %polly.loop_if101
  %42 = shl i64 %_arg_NJ_, 2
  %polly.fdiv_q.shr109 = ashr i64 %.res36, 10
  %polly.loop_guard114 = icmp sgt i64 %polly.fdiv_q.shr109, -1
  %pexp.fdiv_q.4143 = sdiv i64 %.res, 48
  %pexp.p_div_q179 = udiv i64 %_arg_NJ_, 3
  %pexp.p_div_q188741 = lshr i64 %_arg_NI_, 1
  %43 = and i64 %_arg_NI_, 1
  %44 = icmp eq i64 %43, 0
  %pexp.div = lshr exact i64 %.res, 1
  %45 = mul i64 %42, %.res
  %46 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %45
  %pexp.p_div_q379 = udiv i64 %_arg_NJ_, 3
  %47 = mul i64 %pexp.p_div_q379, 3
  %pexp.pdiv_r373.decomposed = sub i64 %_arg_NJ_, %47
  %48 = icmp ne i64 %pexp.pdiv_r373.decomposed, 0
  %49 = mul i64 %42, %.res
  %50 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %49
  %51 = add nuw nsw i64 %_arg_NJ_, 3
  %pexp.pdiv_r461 = urem i64 %51, 3
  %52 = sub nuw nsw i64 %_arg_NJ_, %pexp.pdiv_r461
  %pexp.p_div_q469 = udiv i64 %41, 3
  %53 = shl i64 %pexp.p_div_q469, 10
  %54 = shl i64 %52, 2
  %55 = add nuw nsw i64 %_arg_NJ_, 1
  %pexp.zdiv_r483 = urem i64 %55, 3
  %56 = icmp eq i64 %pexp.zdiv_r483, 0
  %57 = add nsw i64 %_arg_NJ_, -2
  %pexp.div491 = udiv exact i64 %57, 3
  %58 = shl i64 %pexp.div491, 10
  %59 = shl i64 %41, 2
  %60 = add nsw i64 %_arg_NJ_, -2
  %pexp.div535 = udiv exact i64 %60, 3
  %61 = shl i64 %pexp.div535, 10
  %62 = shl i64 %41, 2
  %63 = shl i64 %41, 2
  %64 = shl i64 %41, 2
  %65 = add nuw nsw i64 %_arg_NI_, 1
  %pexp.p_div_q625745 = lshr i64 %65, 1
  %66 = add nsw i64 %_arg_NJ_, 3
  %pexp.pdiv_r642 = urem i64 %66, 3
  %67 = sub nsw i64 %_arg_NJ_, %pexp.pdiv_r642
  %pexp.p_div_q651 = udiv i64 %41, 3
  %68 = shl i64 %pexp.p_div_q651, 10
  %69 = shl i64 %67, 2
  %70 = add nsw i64 %_arg_NJ_, 1
  %pexp.zdiv_r665 = srem i64 %70, 3
  %71 = icmp eq i64 %pexp.zdiv_r665, 0
  %72 = add nsw i64 %_arg_NJ_, -2
  %pexp.div674 = sdiv exact i64 %72, 3
  %73 = shl i64 %pexp.div674, 10
  %74 = shl i64 %41, 2
  %75 = add nsw i64 %_arg_NJ_, -2
  %pexp.div721 = sdiv exact i64 %75, 3
  %76 = shl i64 %pexp.div721, 10
  %77 = shl i64 %41, 2
  br label %polly.loop_if110

polly.loop_if110:                                 ; preds = %polly.loop_preheader103, %polly.loop_exit113
  %polly.indvar106 = phi i64 [ 0, %polly.loop_preheader103 ], [ %polly.indvar_next107, %polly.loop_exit113 ]
  br i1 %polly.loop_guard114, label %polly.loop_if118.preheader, label %polly.loop_exit113

polly.loop_if118.preheader:                       ; preds = %polly.loop_if110
  %78 = mul nuw nsw i64 %polly.indvar106, 768
  %79 = add nuw nsw i64 %78, 767
  %80 = tail call i64 @llvm.smin.i64(i64 %41, i64 %79)
  %polly.loop_guard130.not.not = icmp sgt i64 %_arg_NJ_, %78
  %81 = shl i64 %polly.indvar106, 18
  %82 = shl i64 %polly.indvar106, 8
  %83 = xor i64 %82, -1
  %84 = add i64 %pexp.p_div_q179, %83
  %85 = tail call i64 @llvm.smin.i64(i64 %84, i64 255)
  %polly.loop_guard184 = icmp sgt i64 %84, -1
  %86 = mul nuw nsw i64 %polly.indvar106, 768
  %87 = mul nuw nsw i64 %polly.indvar106, 768
  %88 = mul nuw nsw i64 %polly.indvar106, 768
  %89 = or disjoint i64 %88, 2
  %90 = icmp sge i64 %89, %_arg_NJ_
  %91 = add nuw nsw i64 %88, 767
  %92 = icmp sge i64 %91, %_arg_NJ_
  %93 = or disjoint i64 %88, 3
  %94 = icmp sge i64 %_arg_NJ_, %93
  %95 = and i1 %94, %92
  %96 = shl i64 %polly.indvar106, 8
  %97 = xor i64 %96, -1
  %98 = add i64 %pexp.p_div_q379, %97
  %99 = tail call i64 @llvm.smin.i64(i64 %98, i64 255)
  %polly.loop_guard384 = icmp sgt i64 %98, -1
  %100 = and i1 %92, %48
  %101 = or disjoint i64 %88, 4
  %.not = icmp slt i64 %_arg_NJ_, %101
  %102 = shl i64 %polly.indvar106, 18
  %polly.access.mul.Packed_B470 = sub i64 %53, %102
  %polly.access.mul.Packed_B492 = sub i64 %58, %102
  %polly.access.mul.Packed_B536 = sub i64 %61, %102
  %103 = mul i64 %polly.indvar106, 3072
  %104 = icmp eq i64 %89, %_arg_NJ_
  %105 = shl i64 %polly.indvar106, 18
  %polly.access.mul.Packed_B652 = sub i64 %68, %105
  %polly.access.mul.Packed_B675 = sub i64 %73, %105
  %polly.access.mul.Packed_B722 = sub i64 %76, %105
  br label %polly.loop_if118

polly.loop_exit147:                               ; preds = %polly.merge370
  %polly.indvar_next116 = add nuw nsw i64 %polly.indvar115, 1
  %polly.loop_cond117.not.not = icmp slt i64 %polly.indvar115, %polly.fdiv_q.shr109
  br i1 %polly.loop_cond117.not.not, label %polly.loop_if118, label %polly.loop_exit113

polly.loop_if118:                                 ; preds = %polly.loop_if118.preheader, %polly.loop_exit147
  %polly.indvar115 = phi i64 [ %polly.indvar_next116, %polly.loop_exit147 ], [ 0, %polly.loop_if118.preheader ]
  %106 = shl i64 %polly.indvar115, 10
  %107 = or disjoint i64 %106, 1023
  %108 = tail call i64 @llvm.smin.i64(i64 %.res36, i64 %107)
  %polly.loop_guard122.not.not = icmp sgt i64 %_arg_NK_, %106
  br i1 %polly.loop_guard122.not.not, label %polly.loop_if126, label %polly.loop_if144

polly.loop_exit129:                               ; preds = %polly.loop_header127, %polly.loop_if126
  %polly.indvar_next124 = add nuw nsw i64 %polly.indvar123, 1
  %polly.loop_cond125.not.not = icmp slt i64 %polly.indvar123, %108
  br i1 %polly.loop_cond125.not.not, label %polly.loop_if126, label %polly.loop_if144

polly.loop_if126:                                 ; preds = %polly.loop_if118, %polly.loop_exit129
  %polly.indvar123 = phi i64 [ %polly.indvar_next124, %polly.loop_exit129 ], [ %106, %polly.loop_if118 ]
  br i1 %polly.loop_guard130.not.not, label %polly.loop_header127.preheader, label %polly.loop_exit129

polly.loop_header127.preheader:                   ; preds = %polly.loop_if126
  %polly.access.mul.134 = mul nsw i64 %polly.indvar123, %_arg_NJ_
  %109 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.mul.134
  %110 = sub i64 %polly.indvar123, %106
  br label %polly.loop_header127

polly.loop_header127:                             ; preds = %polly.loop_header127.preheader, %polly.loop_header127
  %polly.indvar131 = phi i64 [ %polly.indvar_next132, %polly.loop_header127 ], [ %78, %polly.loop_header127.preheader ]
  %polly.access.136 = getelementptr float, ptr addrspace(1) %109, i64 %polly.indvar131
  %polly.access.136.load = load float, ptr addrspace(1) %polly.access.136, align 4, !alias.scope !32, !noalias !33
  %polly.indvar131.frozen = freeze i64 %polly.indvar131
  %pexp.p_div_q = udiv i64 %polly.indvar131.frozen, 3
  %111 = shl i64 %pexp.p_div_q, 10
  %polly.access.mul.Packed_B = sub i64 %111, %81
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %110
  %112 = mul i64 %pexp.p_div_q, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar131.frozen, %112
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %113 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %113, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.136.load, ptr %polly.access.Packed_B, align 4, !alias.scope !34, !noalias !35
  %polly.indvar_next132 = add nuw nsw i64 %polly.indvar131, 1
  %polly.loop_cond133.not.not = icmp slt i64 %polly.indvar131, %80
  br i1 %polly.loop_cond133.not.not, label %polly.loop_header127, label %polly.loop_exit129

polly.loop_if144:                                 ; preds = %polly.loop_exit129, %polly.loop_if118
  %114 = shl i64 %polly.indvar115, 11
  %115 = xor i64 %106, -1
  %116 = add i64 %_arg_NK_, %115
  %117 = tail call i64 @llvm.smin.i64(i64 %116, i64 1023)
  %polly.loop_guard201 = icmp sgt i64 %116, -1
  %118 = xor i64 %106, -1
  %119 = add i64 %_arg_NK_, %118
  %120 = tail call i64 @llvm.smin.i64(i64 %119, i64 1023)
  %polly.loop_guard312 = icmp slt i64 %119, 0
  %121 = xor i64 %106, -1
  %122 = add i64 %_arg_NK_, %121
  %123 = tail call i64 @llvm.smin.i64(i64 %122, i64 1023)
  %polly.loop_guard392 = icmp sgt i64 %122, -1
  %124 = xor i64 %106, -1
  %125 = add i64 %_arg_NK_, %124
  %126 = tail call i64 @llvm.smin.i64(i64 %125, i64 1023)
  %polly.loop_guard457 = icmp sgt i64 %125, -1
  %127 = xor i64 %106, -1
  %128 = add i64 %_arg_NK_, %127
  %129 = tail call i64 @llvm.smin.i64(i64 %128, i64 1023)
  %polly.loop_guard549 = icmp sgt i64 %128, -1
  %130 = xor i64 %106, -1
  %131 = add i64 %_arg_NK_, %130
  %132 = tail call i64 @llvm.smin.i64(i64 %131, i64 1023)
  %polly.loop_guard638 = icmp sgt i64 %131, -1
  br label %polly.loop_if152

polly.cond175:                                    ; preds = %polly.loop_exit163, %polly.loop_if152
  %133 = or disjoint i64 %146, 2
  %134 = icmp sge i64 %_arg_NI_, %133
  %brmerge.not = select i1 %134, i1 %polly.loop_guard184, i1 false
  br i1 %brmerge.not, label %polly.loop_if189.preheader, label %polly.cond369

polly.cond369:                                    ; preds = %polly.cond175, %polly.merge305
  %135 = and i1 %90, %134
  %136 = or disjoint i64 %146, 3
  %137 = icmp sge i64 %_arg_NI_, %136
  %138 = and i1 %92, %137
  %139 = and i1 %95, %134
  %140 = or i1 %138, %139
  %141 = and i1 %140, %48
  %142 = or i1 %135, %141
  %143 = or disjoint i64 %146, 1
  %144 = icmp eq i64 %143, %_arg_NI_
  %145 = or i1 %142, %144
  br i1 %145, label %polly.cond375, label %polly.merge370

polly.merge370:                                   ; preds = %polly.loop_exit637, %polly.cond444, %polly.loop_if626, %polly.cond369
  %polly.indvar_next150 = add nuw nsw i64 %polly.indvar149, 1
  %polly.loop_cond151.not.not = icmp slt i64 %polly.indvar149, %pexp.fdiv_q.4143
  br i1 %polly.loop_cond151.not.not, label %polly.loop_if152, label %polly.loop_exit147

polly.loop_if152:                                 ; preds = %polly.loop_if144, %polly.merge370
  %polly.indvar149 = phi i64 [ %polly.indvar_next150, %polly.merge370 ], [ 0, %polly.loop_if144 ]
  %146 = mul nuw nsw i64 %polly.indvar149, 48
  %147 = add nuw nsw i64 %146, 47
  %148 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %147)
  %polly.loop_guard156.not.not = icmp sgt i64 %_arg_NI_, %146
  br i1 %polly.loop_guard156.not.not, label %polly.loop_if160.preheader, label %polly.cond175

polly.loop_if160.preheader:                       ; preds = %polly.loop_if152
  %149 = mul i64 %polly.indvar149, 2251799813685224
  br label %polly.loop_if160

polly.loop_exit163:                               ; preds = %polly.loop_header161, %polly.loop_if160
  %polly.indvar_next158 = add nuw nsw i64 %polly.indvar157, 1
  %polly.loop_cond159.not.not = icmp slt i64 %polly.indvar157, %148
  br i1 %polly.loop_cond159.not.not, label %polly.loop_if160, label %polly.cond175

polly.loop_if160:                                 ; preds = %polly.loop_if160.preheader, %polly.loop_exit163
  %polly.indvar157 = phi i64 [ %polly.indvar_next158, %polly.loop_exit163 ], [ %146, %polly.loop_if160.preheader ]
  br i1 %polly.loop_guard122.not.not, label %polly.loop_header161.preheader, label %polly.loop_exit163

polly.loop_header161.preheader:                   ; preds = %polly.loop_if160
  %polly.access.mul.168 = mul nsw i64 %polly.indvar157, %_arg_NK_
  %150 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.mul.168
  %pexp.p_div_q171739 = lshr i64 %polly.indvar157, 1
  %151 = add i64 %149, %pexp.p_div_q171739
  %pexp.pdiv_r173 = and i64 %polly.indvar157, 1
  %.idx740 = shl i64 %151, 13
  %152 = getelementptr i8, ptr %Packed_A, i64 %.idx740
  %invariant.gep = getelementptr float, ptr %152, i64 %pexp.pdiv_r173
  br label %polly.loop_header161

polly.loop_header161:                             ; preds = %polly.loop_header161.preheader, %polly.loop_header161
  %polly.indvar165 = phi i64 [ %polly.indvar_next166, %polly.loop_header161 ], [ %106, %polly.loop_header161.preheader ]
  %polly.access.170 = getelementptr float, ptr addrspace(1) %150, i64 %polly.indvar165
  %polly.access.170.load = load float, ptr addrspace(1) %polly.access.170, align 4, !alias.scope !36, !noalias !37
  %153 = shl nuw i64 %polly.indvar165, 1
  %154 = sub i64 %153, %114
  %gep = getelementptr float, ptr %invariant.gep, i64 %154
  store float %polly.access.170.load, ptr %gep, align 4, !alias.scope !38, !noalias !39
  %polly.indvar_next166 = add nuw nsw i64 %polly.indvar165, 1
  %polly.loop_cond167.not.not = icmp slt i64 %polly.indvar165, %108
  br i1 %polly.loop_cond167.not.not, label %polly.loop_header161, label %polly.loop_exit163

polly.loop_if189.preheader:                       ; preds = %polly.cond175
  %155 = mul nsw i64 %polly.indvar149, -24
  %156 = add nsw i64 %155, %pexp.p_div_q188741
  %157 = tail call i64 @llvm.smin.i64(i64 %156, i64 24)
  %158 = add nsw i64 %157, -1
  %polly.loop_guard193 = icmp sgt i64 %156, 0
  %159 = icmp slt i64 %147, %_arg_NI_
  %.not768 = or i1 %159, %44
  %.neg = mul i64 %polly.indvar149, 2251799813685224
  %160 = add i64 %.neg, %pexp.div
  %.idx742 = shl i64 %160, 13
  %161 = getelementptr i8, ptr %Packed_A, i64 %.idx742
  br label %polly.loop_if189

polly.cond304:                                    ; preds = %polly.loop_exit200, %polly.loop_if189
  %brmerge763 = or i1 %.not768, %polly.loop_guard312
  br i1 %brmerge763, label %polly.merge305, label %polly.stmt.for.body22.i351.preheader

polly.merge305.loopexit:                          ; preds = %polly.stmt.for.body22.i351
  store float %p_332, ptr addrspace(1) %scevgep330, align 4, !alias.scope !24, !noalias !27
  store float %p_350, ptr addrspace(1) %scevgep348, align 4, !alias.scope !24, !noalias !27
  store float %p_368, ptr addrspace(1) %scevgep366, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge305

polly.merge305:                                   ; preds = %polly.cond304, %polly.merge305.loopexit
  %polly.indvar_next186 = add nuw nsw i64 %polly.indvar185, 1
  %polly.loop_cond187.not.not = icmp slt i64 %polly.indvar185, %85
  br i1 %polly.loop_cond187.not.not, label %polly.loop_if189, label %polly.cond369

polly.loop_if189:                                 ; preds = %polly.loop_if189.preheader, %polly.merge305
  %polly.indvar185 = phi i64 [ %polly.indvar_next186, %polly.merge305 ], [ 0, %polly.loop_if189.preheader ]
  br i1 %polly.loop_guard193, label %polly.loop_if197.preheader, label %polly.cond304

polly.loop_if197.preheader:                       ; preds = %polly.loop_if189
  %162 = mul nuw nsw i64 %polly.indvar185, 3
  %163 = add nuw nsw i64 %86, %162
  %polly.access.mul.Packed_B211 = shl nsw i64 %polly.indvar185, 10
  %164 = shl i64 %163, 2
  %165 = add i64 %164, 4
  %166 = add i64 %164, 8
  br label %polly.loop_if197

polly.loop_exit200:                               ; preds = %polly.stmt.for.body22.i287, %polly.loop_if197
  %polly.indvar_next195 = add nuw nsw i64 %polly.indvar194, 1
  %polly.loop_cond196.not.not = icmp slt i64 %polly.indvar194, %158
  br i1 %polly.loop_cond196.not.not, label %polly.loop_if197, label %polly.cond304

polly.loop_if197:                                 ; preds = %polly.loop_if197.preheader, %polly.loop_exit200
  %polly.indvar194 = phi i64 [ %polly.indvar_next195, %polly.loop_exit200 ], [ 0, %polly.loop_if197.preheader ]
  br i1 %polly.loop_guard201, label %polly.stmt.for.body22.i287.preheader, label %polly.loop_exit200

polly.stmt.for.body22.i287.preheader:             ; preds = %polly.loop_if197
  %167 = shl nuw nsw i64 %polly.indvar194, 1
  %168 = add nuw nsw i64 %146, %167
  %.idx751 = shl i64 %polly.indvar194, 13
  %169 = getelementptr i8, ptr %Packed_A, i64 %.idx751
  %170 = mul i64 %42, %168
  %171 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %170
  %scevgep217 = getelementptr i8, ptr addrspace(1) %171, i64 %164
  %scevgep233 = getelementptr i8, ptr addrspace(1) %171, i64 %165
  %scevgep250 = getelementptr i8, ptr addrspace(1) %171, i64 %166
  %172 = or disjoint i64 %168, 1
  %173 = mul i64 %42, %172
  %174 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %173
  %scevgep267 = getelementptr i8, ptr addrspace(1) %174, i64 %164
  %scevgep284 = getelementptr i8, ptr addrspace(1) %174, i64 %165
  %scevgep301 = getelementptr i8, ptr addrspace(1) %174, i64 %166
  br label %polly.stmt.for.body22.i287

polly.stmt.for.body22.i287:                       ; preds = %polly.stmt.for.body22.i287.preheader, %polly.stmt.for.body22.i287
  %polly.indvar202 = phi i64 [ %polly.indvar_next203, %polly.stmt.for.body22.i287 ], [ 0, %polly.stmt.for.body22.i287.preheader ]
  %polly.access.Packed_A209.idx = shl i64 %polly.indvar202, 3
  %polly.access.Packed_A209 = getelementptr i8, ptr %169, i64 %polly.access.Packed_A209.idx
  %_p_scalar_210 = load float, ptr %polly.access.Packed_A209, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i = fmul float %_p_scalar_210, 3.241200e+04
  %polly.access.add.Packed_B212 = add nuw nsw i64 %polly.access.mul.Packed_B211, %polly.indvar202
  %polly.access.Packed_B215.idx = mul i64 %polly.access.add.Packed_B212, 12
  %polly.access.Packed_B215 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B215.idx
  %_p_scalar_216 = load float, ptr %polly.access.Packed_B215, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_218 = load float, ptr addrspace(1) %scevgep217, align 4, !alias.scope !24, !noalias !27
  %p_ = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_216, float %_p_scalar_218)
  store float %p_, ptr addrspace(1) %scevgep217, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_B231 = getelementptr i8, ptr %polly.access.Packed_B215, i64 4
  %_p_scalar_232 = load float, ptr %polly.access.Packed_B231, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_234 = load float, ptr addrspace(1) %scevgep233, align 4, !alias.scope !24, !noalias !27
  %p_235 = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_232, float %_p_scalar_234)
  store float %p_235, ptr addrspace(1) %scevgep233, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_B248 = getelementptr i8, ptr %polly.access.Packed_B215, i64 8
  %_p_scalar_249 = load float, ptr %polly.access.Packed_B248, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_251 = load float, ptr addrspace(1) %scevgep250, align 4, !alias.scope !24, !noalias !27
  %p_252 = tail call float @llvm.fmuladd.f32(float %p_mul16.i, float %_p_scalar_249, float %_p_scalar_251)
  store float %p_252, ptr addrspace(1) %scevgep250, align 4, !alias.scope !24, !noalias !27
  %polly.access.Packed_A258 = getelementptr i8, ptr %polly.access.Packed_A209, i64 4
  %_p_scalar_259 = load float, ptr %polly.access.Packed_A258, align 4, !alias.scope !38, !noalias !39
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
  %polly.loop_cond204.not.not = icmp slt i64 %polly.indvar202, %117
  br i1 %polly.loop_cond204.not.not, label %polly.stmt.for.body22.i287, label %polly.loop_exit200, !llvm.loop !40

polly.stmt.for.body22.i351.preheader:             ; preds = %polly.cond304
  %175 = mul nuw nsw i64 %polly.indvar185, 3
  %176 = add nuw nsw i64 %87, %175
  %polly.access.mul.Packed_B324 = shl nsw i64 %polly.indvar185, 10
  %177 = shl i64 %176, 2
  %scevgep330 = getelementptr i8, ptr addrspace(1) %46, i64 %177
  %scevgep348 = getelementptr i8, ptr addrspace(1) %scevgep330, i64 4
  %scevgep366 = getelementptr i8, ptr addrspace(1) %scevgep330, i64 8
  %scevgep330.promoted = load float, ptr addrspace(1) %scevgep330, align 4, !alias.scope !24, !noalias !27
  %scevgep348.promoted = load float, ptr addrspace(1) %scevgep348, align 4, !alias.scope !24, !noalias !27
  %scevgep366.promoted = load float, ptr addrspace(1) %scevgep366, align 4, !alias.scope !24, !noalias !27
  br label %polly.stmt.for.body22.i351

polly.stmt.for.body22.i351:                       ; preds = %polly.stmt.for.body22.i351.preheader, %polly.stmt.for.body22.i351
  %p_368757 = phi float [ %p_368, %polly.stmt.for.body22.i351 ], [ %scevgep366.promoted, %polly.stmt.for.body22.i351.preheader ]
  %p_350756 = phi float [ %p_350, %polly.stmt.for.body22.i351 ], [ %scevgep348.promoted, %polly.stmt.for.body22.i351.preheader ]
  %_p_scalar_331755 = phi float [ %p_332, %polly.stmt.for.body22.i351 ], [ %scevgep330.promoted, %polly.stmt.for.body22.i351.preheader ]
  %polly.indvar313 = phi i64 [ %polly.indvar_next314, %polly.stmt.for.body22.i351 ], [ 0, %polly.stmt.for.body22.i351.preheader ]
  %polly.access.Packed_A321.idx = shl i64 %polly.indvar313, 3
  %polly.access.Packed_A321 = getelementptr i8, ptr %161, i64 %polly.access.Packed_A321.idx
  %_p_scalar_322 = load float, ptr %polly.access.Packed_A321, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i323 = fmul float %_p_scalar_322, 3.241200e+04
  %polly.access.add.Packed_B325 = add nuw nsw i64 %polly.access.mul.Packed_B324, %polly.indvar313
  %polly.access.Packed_B328.idx = mul i64 %polly.access.add.Packed_B325, 12
  %polly.access.Packed_B328 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B328.idx
  %_p_scalar_329 = load float, ptr %polly.access.Packed_B328, align 4, !alias.scope !34, !noalias !35
  %p_332 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_329, float %_p_scalar_331755)
  %polly.access.Packed_B346 = getelementptr i8, ptr %polly.access.Packed_B328, i64 4
  %_p_scalar_347 = load float, ptr %polly.access.Packed_B346, align 4, !alias.scope !34, !noalias !35
  %p_350 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_347, float %p_350756)
  %polly.access.Packed_B364 = getelementptr i8, ptr %polly.access.Packed_B328, i64 8
  %_p_scalar_365 = load float, ptr %polly.access.Packed_B364, align 4, !alias.scope !34, !noalias !35
  %p_368 = tail call float @llvm.fmuladd.f32(float %p_mul16.i323, float %_p_scalar_365, float %p_368757)
  %polly.indvar_next314 = add nuw nsw i64 %polly.indvar313, 1
  %polly.loop_cond315.not.not = icmp slt i64 %polly.indvar313, %120
  br i1 %polly.loop_cond315.not.not, label %polly.stmt.for.body22.i351, label %polly.merge305.loopexit, !llvm.loop !42

polly.cond375:                                    ; preds = %polly.cond369
  %brmerge765.not = select i1 %144, i1 %polly.loop_guard384, i1 false
  br i1 %brmerge765.not, label %polly.loop_if388, label %polly.cond444

polly.cond444:                                    ; preds = %polly.cond375, %polly.loop_exit391
  br i1 %100, label %polly.cond449, label %polly.merge370

polly.loop_exit391.loopexit:                      ; preds = %polly.stmt.for.body22.i428
  store float %p_411, ptr addrspace(1) %scevgep409, align 4, !alias.scope !24, !noalias !27
  store float %p_427, ptr addrspace(1) %scevgep425, align 4, !alias.scope !24, !noalias !27
  store float %p_443, ptr addrspace(1) %scevgep441, align 4, !alias.scope !24, !noalias !27
  br label %polly.loop_exit391

polly.loop_exit391:                               ; preds = %polly.loop_exit391.loopexit, %polly.loop_if388
  %polly.indvar_next386 = add nuw nsw i64 %polly.indvar385, 1
  %polly.loop_cond387.not.not = icmp slt i64 %polly.indvar385, %99
  br i1 %polly.loop_cond387.not.not, label %polly.loop_if388, label %polly.cond444

polly.loop_if388:                                 ; preds = %polly.cond375, %polly.loop_exit391
  %polly.indvar385 = phi i64 [ %polly.indvar_next386, %polly.loop_exit391 ], [ 0, %polly.cond375 ]
  br i1 %polly.loop_guard392, label %polly.stmt.for.body22.i428.preheader, label %polly.loop_exit391

polly.stmt.for.body22.i428.preheader:             ; preds = %polly.loop_if388
  %178 = mul nuw nsw i64 %polly.indvar385, 3
  %179 = add nuw nsw i64 %88, %178
  %polly.access.mul.Packed_B403 = shl nsw i64 %polly.indvar385, 10
  %180 = shl i64 %179, 2
  %scevgep409 = getelementptr i8, ptr addrspace(1) %50, i64 %180
  %scevgep425 = getelementptr i8, ptr addrspace(1) %scevgep409, i64 4
  %scevgep441 = getelementptr i8, ptr addrspace(1) %scevgep409, i64 8
  %scevgep409.promoted = load float, ptr addrspace(1) %scevgep409, align 4, !alias.scope !24, !noalias !27
  %scevgep425.promoted = load float, ptr addrspace(1) %scevgep425, align 4, !alias.scope !24, !noalias !27
  %scevgep441.promoted = load float, ptr addrspace(1) %scevgep441, align 4, !alias.scope !24, !noalias !27
  br label %polly.stmt.for.body22.i428

polly.stmt.for.body22.i428:                       ; preds = %polly.stmt.for.body22.i428.preheader, %polly.stmt.for.body22.i428
  %p_443760 = phi float [ %p_443, %polly.stmt.for.body22.i428 ], [ %scevgep441.promoted, %polly.stmt.for.body22.i428.preheader ]
  %p_427759 = phi float [ %p_427, %polly.stmt.for.body22.i428 ], [ %scevgep425.promoted, %polly.stmt.for.body22.i428.preheader ]
  %_p_scalar_410758 = phi float [ %p_411, %polly.stmt.for.body22.i428 ], [ %scevgep409.promoted, %polly.stmt.for.body22.i428.preheader ]
  %polly.indvar393 = phi i64 [ %polly.indvar_next394, %polly.stmt.for.body22.i428 ], [ 0, %polly.stmt.for.body22.i428.preheader ]
  %polly.access.Packed_A400.idx = shl i64 %polly.indvar393, 3
  %polly.access.Packed_A400 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A400.idx
  %_p_scalar_401 = load float, ptr %polly.access.Packed_A400, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i402 = fmul float %_p_scalar_401, 3.241200e+04
  %polly.access.add.Packed_B404 = add nuw nsw i64 %polly.access.mul.Packed_B403, %polly.indvar393
  %polly.access.Packed_B407.idx = mul i64 %polly.access.add.Packed_B404, 12
  %polly.access.Packed_B407 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B407.idx
  %_p_scalar_408 = load float, ptr %polly.access.Packed_B407, align 4, !alias.scope !34, !noalias !35
  %p_411 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_408, float %_p_scalar_410758)
  %polly.access.Packed_B423 = getelementptr i8, ptr %polly.access.Packed_B407, i64 4
  %_p_scalar_424 = load float, ptr %polly.access.Packed_B423, align 4, !alias.scope !34, !noalias !35
  %p_427 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_424, float %p_427759)
  %polly.access.Packed_B439 = getelementptr i8, ptr %polly.access.Packed_B407, i64 8
  %_p_scalar_440 = load float, ptr %polly.access.Packed_B439, align 4, !alias.scope !34, !noalias !35
  %p_443 = tail call float @llvm.fmuladd.f32(float %p_mul16.i402, float %_p_scalar_440, float %p_443760)
  %polly.indvar_next394 = add nuw nsw i64 %polly.indvar393, 1
  %polly.loop_cond395.not.not = icmp slt i64 %polly.indvar393, %123
  br i1 %polly.loop_cond395.not.not, label %polly.stmt.for.body22.i428, label %polly.loop_exit391.loopexit, !llvm.loop !43

polly.cond449:                                    ; preds = %polly.cond444
  br i1 %.not, label %polly.loop_if545, label %polly.loop_if453

polly.loop_if453:                                 ; preds = %polly.cond449
  br i1 %polly.loop_guard457, label %polly.cond479.preheader, label %polly.loop_if626

polly.cond479.preheader:                          ; preds = %polly.loop_if453
  %181 = mul i64 %42, %146
  %182 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %181
  %scevgep476 = getelementptr i8, ptr addrspace(1) %182, i64 %54
  %scevgep498 = getelementptr i8, ptr addrspace(1) %182, i64 %59
  %183 = mul i64 %42, %143
  %184 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %183
  %scevgep520 = getelementptr i8, ptr addrspace(1) %184, i64 %54
  %scevgep542 = getelementptr i8, ptr addrspace(1) %184, i64 %62
  br label %polly.cond479

polly.cond479:                                    ; preds = %polly.cond479.preheader, %polly.merge502
  %polly.indvar458 = phi i64 [ %polly.indvar_next459, %polly.merge502 ], [ 0, %polly.cond479.preheader ]
  %polly.access.Packed_A466.idx = shl i64 %polly.indvar458, 3
  %polly.access.Packed_A466 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A466.idx
  %_p_scalar_467 = load float, ptr %polly.access.Packed_A466, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i468 = fmul float %_p_scalar_467, 3.241200e+04
  %polly.access.add.Packed_B471 = add nsw i64 %polly.access.mul.Packed_B470, %polly.indvar458
  %polly.access.Packed_B474.idx = mul i64 %polly.access.add.Packed_B471, 12
  %polly.access.Packed_B474 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B474.idx
  %_p_scalar_475 = load float, ptr %polly.access.Packed_B474, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_477 = load float, ptr addrspace(1) %scevgep476, align 4, !alias.scope !24, !noalias !27
  %p_478 = tail call float @llvm.fmuladd.f32(float %p_mul16.i468, float %_p_scalar_475, float %_p_scalar_477)
  store float %p_478, ptr addrspace(1) %scevgep476, align 4, !alias.scope !24, !noalias !27
  br i1 %56, label %polly.stmt.for.body22.i484, label %polly.cond501

polly.cond501:                                    ; preds = %polly.cond479, %polly.stmt.for.body22.i484
  br i1 %134, label %polly.cond523, label %polly.merge502

polly.merge502:                                   ; preds = %polly.cond523, %polly.cond501, %polly.stmt.for.body22.i528
  %polly.indvar_next459 = add nuw nsw i64 %polly.indvar458, 1
  %polly.loop_cond460.not.not = icmp slt i64 %polly.indvar458, %126
  br i1 %polly.loop_cond460.not.not, label %polly.cond479, label %polly.loop_if626, !llvm.loop !44

polly.stmt.for.body22.i484:                       ; preds = %polly.cond479
  %polly.access.add.Packed_B493 = add nsw i64 %polly.access.mul.Packed_B492, %polly.indvar458
  %.idx743 = mul i64 %polly.access.add.Packed_B493, 12
  %185 = getelementptr i8, ptr %Packed_B, i64 %.idx743
  %polly.access.Packed_B496 = getelementptr i8, ptr %185, i64 4
  %_p_scalar_497 = load float, ptr %polly.access.Packed_B496, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_499 = load float, ptr addrspace(1) %scevgep498, align 4, !alias.scope !24, !noalias !27
  %p_500 = tail call float @llvm.fmuladd.f32(float %p_mul16.i468, float %_p_scalar_497, float %_p_scalar_499)
  store float %p_500, ptr addrspace(1) %scevgep498, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond501

polly.cond523:                                    ; preds = %polly.cond501
  %polly.access.Packed_A510 = getelementptr i8, ptr %polly.access.Packed_A466, i64 4
  %_p_scalar_511 = load float, ptr %polly.access.Packed_A510, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i512 = fmul float %_p_scalar_511, 3.241200e+04
  %_p_scalar_521 = load float, ptr addrspace(1) %scevgep520, align 4, !alias.scope !24, !noalias !27
  %p_522 = tail call float @llvm.fmuladd.f32(float %p_mul16.i512, float %_p_scalar_475, float %_p_scalar_521)
  store float %p_522, ptr addrspace(1) %scevgep520, align 4, !alias.scope !24, !noalias !27
  br i1 %56, label %polly.stmt.for.body22.i528, label %polly.merge502

polly.stmt.for.body22.i528:                       ; preds = %polly.cond523
  %polly.access.add.Packed_B537 = add nsw i64 %polly.access.mul.Packed_B536, %polly.indvar458
  %.idx744 = mul i64 %polly.access.add.Packed_B537, 12
  %186 = getelementptr i8, ptr %Packed_B, i64 %.idx744
  %polly.access.Packed_B540 = getelementptr i8, ptr %186, i64 4
  %_p_scalar_541 = load float, ptr %polly.access.Packed_B540, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_543 = load float, ptr addrspace(1) %scevgep542, align 4, !alias.scope !24, !noalias !27
  %p_544 = tail call float @llvm.fmuladd.f32(float %p_mul16.i512, float %_p_scalar_541, float %_p_scalar_543)
  store float %p_544, ptr addrspace(1) %scevgep542, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge502

polly.loop_if545:                                 ; preds = %polly.cond449
  br i1 %polly.loop_guard549, label %polly.cond568.preheader, label %polly.loop_if626

polly.cond568.preheader:                          ; preds = %polly.loop_if545
  %187 = mul i64 %42, %146
  %188 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %187
  %scevgep565 = getelementptr i8, ptr addrspace(1) %188, i64 %103
  %scevgep584 = getelementptr i8, ptr addrspace(1) %188, i64 %63
  %189 = mul i64 %42, %143
  %190 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %189
  %scevgep603 = getelementptr i8, ptr addrspace(1) %190, i64 %103
  %scevgep622 = getelementptr i8, ptr addrspace(1) %190, i64 %64
  br label %polly.cond568

polly.cond568:                                    ; preds = %polly.cond568.preheader, %polly.merge588
  %polly.indvar550 = phi i64 [ %polly.indvar_next551, %polly.merge588 ], [ 0, %polly.cond568.preheader ]
  %polly.access.Packed_A557.idx = shl i64 %polly.indvar550, 3
  %polly.access.Packed_A557 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A557.idx
  %_p_scalar_558 = load float, ptr %polly.access.Packed_A557, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i559 = fmul float %_p_scalar_558, 3.241200e+04
  %polly.access.Packed_B563.idx = mul i64 %polly.indvar550, 12
  %polly.access.Packed_B563 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B563.idx
  %_p_scalar_564 = load float, ptr %polly.access.Packed_B563, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_566 = load float, ptr addrspace(1) %scevgep565, align 4, !alias.scope !24, !noalias !27
  %p_567 = tail call float @llvm.fmuladd.f32(float %p_mul16.i559, float %_p_scalar_564, float %_p_scalar_566)
  store float %p_567, ptr addrspace(1) %scevgep565, align 4, !alias.scope !24, !noalias !27
  br i1 %104, label %polly.stmt.for.body22.i572, label %polly.cond587

polly.cond587:                                    ; preds = %polly.cond568, %polly.stmt.for.body22.i572
  br i1 %134, label %polly.cond606, label %polly.merge588

polly.merge588:                                   ; preds = %polly.cond606, %polly.cond587, %polly.stmt.for.body22.i610
  %polly.indvar_next551 = add nuw nsw i64 %polly.indvar550, 1
  %polly.loop_cond552.not.not = icmp slt i64 %polly.indvar550, %129
  br i1 %polly.loop_cond552.not.not, label %polly.cond568, label %polly.loop_if626, !llvm.loop !45

polly.stmt.for.body22.i572:                       ; preds = %polly.cond568
  %polly.access.Packed_B582 = getelementptr i8, ptr %polly.access.Packed_B563, i64 4
  %_p_scalar_583 = load float, ptr %polly.access.Packed_B582, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_585 = load float, ptr addrspace(1) %scevgep584, align 4, !alias.scope !24, !noalias !27
  %p_586 = tail call float @llvm.fmuladd.f32(float %p_mul16.i559, float %_p_scalar_583, float %_p_scalar_585)
  store float %p_586, ptr addrspace(1) %scevgep584, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond587

polly.cond606:                                    ; preds = %polly.cond587
  %polly.access.Packed_A595 = getelementptr i8, ptr %polly.access.Packed_A557, i64 4
  %_p_scalar_596 = load float, ptr %polly.access.Packed_A595, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i597 = fmul float %_p_scalar_596, 3.241200e+04
  %_p_scalar_604 = load float, ptr addrspace(1) %scevgep603, align 4, !alias.scope !24, !noalias !27
  %p_605 = tail call float @llvm.fmuladd.f32(float %p_mul16.i597, float %_p_scalar_564, float %_p_scalar_604)
  store float %p_605, ptr addrspace(1) %scevgep603, align 4, !alias.scope !24, !noalias !27
  br i1 %104, label %polly.stmt.for.body22.i610, label %polly.merge588

polly.stmt.for.body22.i610:                       ; preds = %polly.cond606
  %polly.access.Packed_B620 = getelementptr i8, ptr %polly.access.Packed_B563, i64 4
  %_p_scalar_621 = load float, ptr %polly.access.Packed_B620, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_623 = load float, ptr addrspace(1) %scevgep622, align 4, !alias.scope !24, !noalias !27
  %p_624 = tail call float @llvm.fmuladd.f32(float %p_mul16.i597, float %_p_scalar_621, float %_p_scalar_623)
  store float %p_624, ptr addrspace(1) %scevgep622, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge588

polly.loop_if626:                                 ; preds = %polly.merge502, %polly.merge588, %polly.loop_if453, %polly.loop_if545
  %191 = mul nsw i64 %polly.indvar149, -24
  %192 = add nsw i64 %191, %pexp.p_div_q625745
  %193 = tail call i64 @llvm.smin.i64(i64 %192, i64 24)
  %194 = add nsw i64 %193, -1
  %polly.loop_guard630 = icmp sgt i64 %192, 1
  br i1 %polly.loop_guard630, label %polly.loop_if634, label %polly.merge370

polly.loop_exit637:                               ; preds = %polly.merge685, %polly.loop_if634
  %polly.indvar_next632 = add nuw nsw i64 %polly.indvar631, 1
  %polly.loop_cond633.not.not = icmp slt i64 %polly.indvar631, %194
  br i1 %polly.loop_cond633.not.not, label %polly.loop_if634, label %polly.merge370

polly.loop_if634:                                 ; preds = %polly.loop_if626, %polly.loop_exit637
  %polly.indvar631 = phi i64 [ %polly.indvar_next632, %polly.loop_exit637 ], [ 1, %polly.loop_if626 ]
  br i1 %polly.loop_guard638, label %polly.cond661.preheader, label %polly.loop_exit637

polly.cond661.preheader:                          ; preds = %polly.loop_if634
  %195 = shl nuw nsw i64 %polly.indvar631, 1
  %196 = add nuw nsw i64 %146, %195
  %.idx752 = shl i64 %polly.indvar631, 13
  %197 = getelementptr i8, ptr %Packed_A, i64 %.idx752
  %198 = mul i64 %42, %196
  %199 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %198
  %scevgep658 = getelementptr i8, ptr addrspace(1) %199, i64 %69
  %scevgep681 = getelementptr i8, ptr addrspace(1) %199, i64 %74
  %200 = add nuw nsw i64 %196, 2
  %.not747 = icmp slt i64 %_arg_NI_, %200
  %201 = or disjoint i64 %196, 1
  %202 = mul i64 %42, %201
  %203 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %202
  %scevgep705 = getelementptr i8, ptr addrspace(1) %203, i64 %69
  %scevgep728 = getelementptr i8, ptr addrspace(1) %203, i64 %77
  br label %polly.cond661

polly.cond661:                                    ; preds = %polly.cond661.preheader, %polly.merge685
  %polly.indvar639 = phi i64 [ %polly.indvar_next640, %polly.merge685 ], [ 0, %polly.cond661.preheader ]
  %polly.access.Packed_A648.idx = shl i64 %polly.indvar639, 3
  %polly.access.Packed_A648 = getelementptr i8, ptr %197, i64 %polly.access.Packed_A648.idx
  %_p_scalar_649 = load float, ptr %polly.access.Packed_A648, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i650 = fmul float %_p_scalar_649, 3.241200e+04
  %polly.access.add.Packed_B653 = add nsw i64 %polly.access.mul.Packed_B652, %polly.indvar639
  %polly.access.Packed_B656.idx = mul i64 %polly.access.add.Packed_B653, 12
  %polly.access.Packed_B656 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B656.idx
  %_p_scalar_657 = load float, ptr %polly.access.Packed_B656, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_659 = load float, ptr addrspace(1) %scevgep658, align 4, !alias.scope !24, !noalias !27
  %p_660 = tail call float @llvm.fmuladd.f32(float %p_mul16.i650, float %_p_scalar_657, float %_p_scalar_659)
  store float %p_660, ptr addrspace(1) %scevgep658, align 4, !alias.scope !24, !noalias !27
  br i1 %71, label %polly.stmt.for.body22.i666, label %polly.cond684

polly.cond684:                                    ; preds = %polly.cond661, %polly.stmt.for.body22.i666
  br i1 %.not747, label %polly.merge685, label %polly.cond708

polly.merge685:                                   ; preds = %polly.cond708, %polly.cond684, %polly.stmt.for.body22.i713
  %polly.indvar_next640 = add nuw nsw i64 %polly.indvar639, 1
  %polly.loop_cond641.not.not = icmp slt i64 %polly.indvar639, %132
  br i1 %polly.loop_cond641.not.not, label %polly.cond661, label %polly.loop_exit637, !llvm.loop !46

polly.stmt.for.body22.i666:                       ; preds = %polly.cond661
  %polly.access.add.Packed_B676 = add nsw i64 %polly.access.mul.Packed_B675, %polly.indvar639
  %.idx746 = mul i64 %polly.access.add.Packed_B676, 12
  %204 = getelementptr i8, ptr %Packed_B, i64 %.idx746
  %polly.access.Packed_B679 = getelementptr i8, ptr %204, i64 4
  %_p_scalar_680 = load float, ptr %polly.access.Packed_B679, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_682 = load float, ptr addrspace(1) %scevgep681, align 4, !alias.scope !24, !noalias !27
  %p_683 = tail call float @llvm.fmuladd.f32(float %p_mul16.i650, float %_p_scalar_680, float %_p_scalar_682)
  store float %p_683, ptr addrspace(1) %scevgep681, align 4, !alias.scope !24, !noalias !27
  br label %polly.cond684

polly.cond708:                                    ; preds = %polly.cond684
  %polly.access.Packed_A695 = getelementptr i8, ptr %polly.access.Packed_A648, i64 4
  %_p_scalar_696 = load float, ptr %polly.access.Packed_A695, align 4, !alias.scope !38, !noalias !39
  %p_mul16.i697 = fmul float %_p_scalar_696, 3.241200e+04
  %_p_scalar_706 = load float, ptr addrspace(1) %scevgep705, align 4, !alias.scope !24, !noalias !27
  %p_707 = tail call float @llvm.fmuladd.f32(float %p_mul16.i697, float %_p_scalar_657, float %_p_scalar_706)
  store float %p_707, ptr addrspace(1) %scevgep705, align 4, !alias.scope !24, !noalias !27
  br i1 %71, label %polly.stmt.for.body22.i713, label %polly.merge685

polly.stmt.for.body22.i713:                       ; preds = %polly.cond708
  %polly.access.add.Packed_B723 = add nsw i64 %polly.access.mul.Packed_B722, %polly.indvar639
  %.idx748 = mul i64 %polly.access.add.Packed_B723, 12
  %205 = getelementptr i8, ptr %Packed_B, i64 %.idx748
  %polly.access.Packed_B726 = getelementptr i8, ptr %205, i64 4
  %_p_scalar_727 = load float, ptr %polly.access.Packed_B726, align 4, !alias.scope !34, !noalias !35
  %_p_scalar_729 = load float, ptr addrspace(1) %scevgep728, align 4, !alias.scope !24, !noalias !27
  %p_730 = tail call float @llvm.fmuladd.f32(float %p_mul16.i697, float %_p_scalar_727, float %_p_scalar_729)
  store float %p_730, ptr addrspace(1) %scevgep728, align 4, !alias.scope !24, !noalias !27
  br label %polly.merge685
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #2

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #2

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #2

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="gemm.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback  nofree nosync nounwind speculatable willreturn memory(none) }

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
!32 = !{!29}
!33 = !{!25, !28, !30, !31}
!34 = !{!30}
!35 = !{!25, !28, !29, !31}
!36 = !{!28}
!37 = !{!25, !29, !30, !31}
!38 = !{!31}
!39 = !{!25, !28, !29, !30}
!40 = distinct !{!40, !41}
!41 = !{!"llvm.loop.vectorize.enable", i1 false}
!42 = distinct !{!42, !41}
!43 = distinct !{!43, !41}
!44 = distinct !{!44, !41}
!45 = distinct !{!45, !41}
!46 = distinct !{!46, !41}
