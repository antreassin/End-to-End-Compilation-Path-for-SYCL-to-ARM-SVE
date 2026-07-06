; ModuleID = '2mm.cpp'
source_filename = "2mm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS15Polybench_2mm_1 = comdat any

$_ZTS15Polybench_2mm_2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS15Polybench_2mm_1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
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
  br i1 %polly.rtc.result.not, label %for.cond.i, label %polly.loop_if

for.cond.i:                                       ; preds = %polly.split_new_and_old, %for.cond.cleanup5.i
  %i.0.i = phi i64 [ %inc26.i, %for.cond.cleanup5.i ], [ 0, %polly.split_new_and_old ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %6 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.cond.cleanup10.i
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

for.cond7.i:                                      ; preds = %for.cond7.i.preheader, %for.body11.i
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

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %polly.loop_exit79, %for.cond.i, %polly.loop_if
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
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader78, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

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
  %49 = mul nuw nsw i64 %polly.indvar, 768
  %50 = add nuw nsw i64 %49, 767
  %51 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %50)
  %polly.loop_guard95.not.not = icmp sgt i64 %_arg_size_, %49
  %52 = shl i64 %polly.indvar, 18
  %53 = shl i64 %polly.indvar, 8
  %54 = xor i64 %53, -1
  %55 = add i64 %pexp.p_div_q135, %54
  %56 = tail call i64 @llvm.smin.i64(i64 %55, i64 255)
  %polly.loop_guard140 = icmp sgt i64 %55, -1
  %57 = mul nuw nsw i64 %polly.indvar, 768
  %58 = mul nuw nsw i64 %polly.indvar, 768
  %59 = mul nuw nsw i64 %polly.indvar, 768
  %60 = or disjoint i64 %59, 2
  %61 = icmp sge i64 %60, %_arg_size_
  %62 = add nuw nsw i64 %59, 767
  %63 = icmp sge i64 %62, %_arg_size_
  %64 = or disjoint i64 %59, 3
  %65 = icmp sge i64 %_arg_size_, %64
  %66 = and i1 %65, %63
  %67 = shl nsw i64 %polly.indvar, 8
  %68 = sub nsw i64 %pexp.div325, %67
  %69 = tail call i64 @llvm.smin.i64(i64 %68, i64 255)
  %polly.loop_guard330 = icmp sgt i64 %68, -1
  %70 = and i1 %63, %19
  %71 = or disjoint i64 %59, 49
  %72 = icmp sge i64 %_arg_size_, %71
  %73 = or disjoint i64 %59, 4
  %74 = icmp sge i64 %_arg_size_, %73
  %75 = mul i64 %polly.indvar, 3072
  %76 = icmp eq i64 %60, %_arg_size_
  %77 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B440 = sub i64 %27, %77
  %polly.access.mul.Packed_B461 = sub i64 %32, %77
  %78 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B411 = sub i64 %34, %78
  %79 = shl i64 %polly.indvar, 18
  %polly.access.mul.Packed_B610 = sub i64 %40, %79
  %polly.access.mul.Packed_B632 = sub i64 %44, %79
  %polly.access.mul.Packed_B677 = sub i64 %47, %79
  br label %polly.loop_if83

polly.loop_if83:                                  ; preds = %polly.loop_preheader78, %polly.loop_exit108
  %polly.indvar80 = phi i64 [ 0, %polly.loop_preheader78 ], [ %polly.indvar_next81, %polly.loop_exit108 ]
  %80 = shl i64 %polly.indvar80, 10
  %81 = or disjoint i64 %80, 1023
  %82 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %81)
  %polly.loop_guard87.not.not = icmp sgt i64 %_arg_size_, %80
  br i1 %polly.loop_guard87.not.not, label %polly.loop_if91, label %polly.loop_preheader107

polly.loop_exit94:                                ; preds = %polly.loop_header92, %polly.loop_if91
  %polly.indvar_next89 = add nuw nsw i64 %polly.indvar88, 1
  %polly.loop_cond90.not.not = icmp slt i64 %polly.indvar88, %82
  br i1 %polly.loop_cond90.not.not, label %polly.loop_if91, label %polly.loop_preheader107

polly.loop_if91:                                  ; preds = %polly.loop_if83, %polly.loop_exit94
  %polly.indvar88 = phi i64 [ %polly.indvar_next89, %polly.loop_exit94 ], [ %80, %polly.loop_if83 ]
  br i1 %polly.loop_guard95.not.not, label %polly.loop_header92.preheader, label %polly.loop_exit94

polly.loop_header92.preheader:                    ; preds = %polly.loop_if91
  %polly.access.mul.99 = mul nuw nsw i64 %polly.indvar88, %_arg_size_
  %83 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.mul.99
  %84 = sub i64 %polly.indvar88, %80
  br label %polly.loop_header92

polly.loop_header92:                              ; preds = %polly.loop_header92.preheader, %polly.loop_header92
  %polly.indvar96 = phi i64 [ %polly.indvar_next97, %polly.loop_header92 ], [ %49, %polly.loop_header92.preheader ]
  %polly.access.101 = getelementptr float, ptr addrspace(1) %83, i64 %polly.indvar96
  %polly.access.101.load = load float, ptr addrspace(1) %polly.access.101, align 4, !alias.scope !23, !noalias !26
  %polly.indvar96.frozen = freeze i64 %polly.indvar96
  %pexp.p_div_q102 = udiv i64 %polly.indvar96.frozen, 3
  %85 = shl i64 %pexp.p_div_q102, 10
  %polly.access.mul.Packed_B = sub i64 %85, %52
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %84
  %86 = mul i64 %pexp.p_div_q102, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar96.frozen, %86
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %87 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %87, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.101.load, ptr %polly.access.Packed_B, align 4, !alias.scope !31, !noalias !32
  %polly.indvar_next97 = add nuw nsw i64 %polly.indvar96, 1
  %polly.loop_cond98.not.not = icmp slt i64 %polly.indvar96, %51
  br i1 %polly.loop_cond98.not.not, label %polly.loop_header92, label %polly.loop_exit94

polly.cond:                                       ; preds = %polly.loop_exit123, %polly.loop_if112
  %88 = or disjoint i64 %123, 2
  %89 = icmp sge i64 %_arg_size_, %88
  %brmerge.not = select i1 %89, i1 %polly.loop_guard140, i1 false
  br i1 %brmerge.not, label %polly.loop_if145.preheader, label %polly.cond315

polly.cond315:                                    ; preds = %polly.cond, %polly.merge254
  %90 = and i1 %61, %89
  %91 = or disjoint i64 %123, 3
  %92 = icmp sge i64 %_arg_size_, %91
  %93 = and i1 %63, %92
  %94 = and i1 %66, %89
  %95 = or i1 %93, %94
  %96 = and i1 %95, %19
  %97 = or i1 %90, %96
  %98 = or disjoint i64 %123, 1
  %99 = icmp eq i64 %98, %_arg_size_
  %100 = or i1 %97, %99
  br i1 %100, label %polly.cond321, label %polly.merge316

polly.merge316:                                   ; preds = %polly.loop_exit596, %polly.cond387, %polly.loop_if585, %polly.cond315
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %polly.loop_cond111.not.not = icmp ult i64 %polly.indvar109, %pexp.p_div_q105
  br i1 %polly.loop_cond111.not.not, label %polly.loop_if112, label %polly.loop_exit108

polly.loop_preheader107:                          ; preds = %polly.loop_exit94, %polly.loop_if83
  %101 = shl i64 %polly.indvar80, 11
  %102 = xor i64 %80, -1
  %103 = add nsw i64 %_arg_size_, %102
  %104 = tail call i64 @llvm.smin.i64(i64 %103, i64 1023)
  %polly.loop_guard157 = icmp sgt i64 %103, -1
  %105 = xor i64 %80, -1
  %106 = add nsw i64 %_arg_size_, %105
  %107 = tail call i64 @llvm.smin.i64(i64 %106, i64 1023)
  %polly.loop_guard261 = icmp slt i64 %106, 0
  %108 = xor i64 %80, -1
  %109 = add nsw i64 %_arg_size_, %108
  %110 = tail call i64 @llvm.smin.i64(i64 %109, i64 1023)
  %polly.loop_guard338 = icmp sgt i64 %109, -1
  %111 = xor i64 %80, -1
  %112 = add nsw i64 %_arg_size_, %111
  %113 = tail call i64 @llvm.smin.i64(i64 %112, i64 1023)
  %polly.loop_guard512 = icmp sgt i64 %112, -1
  %114 = xor i64 %80, -1
  %115 = add nsw i64 %_arg_size_, %114
  %116 = tail call i64 @llvm.smin.i64(i64 %115, i64 1023)
  %polly.loop_guard428 = icmp sgt i64 %115, -1
  %117 = xor i64 %80, -1
  %118 = add nsw i64 %_arg_size_, %117
  %119 = tail call i64 @llvm.smin.i64(i64 %118, i64 1023)
  %polly.loop_guard400 = icmp sgt i64 %118, -1
  %120 = xor i64 %80, -1
  %121 = add nsw i64 %_arg_size_, %120
  %122 = tail call i64 @llvm.smin.i64(i64 %121, i64 1023)
  %polly.loop_guard597 = icmp sgt i64 %121, -1
  br label %polly.loop_if112

polly.loop_if112:                                 ; preds = %polly.loop_preheader107, %polly.merge316
  %polly.indvar109 = phi i64 [ 0, %polly.loop_preheader107 ], [ %polly.indvar_next110, %polly.merge316 ]
  %123 = mul nuw nsw i64 %polly.indvar109, 48
  %124 = add nuw nsw i64 %123, 47
  %125 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %124)
  %polly.loop_guard116.not.not = icmp sgt i64 %_arg_size_, %123
  br i1 %polly.loop_guard116.not.not, label %polly.loop_if120.preheader, label %polly.cond

polly.loop_if120.preheader:                       ; preds = %polly.loop_if112
  %126 = mul i64 %polly.indvar109, 2251799813685224
  br label %polly.loop_if120

polly.loop_exit123:                               ; preds = %polly.loop_header121, %polly.loop_if120
  %polly.indvar_next118 = add nuw nsw i64 %polly.indvar117, 1
  %polly.loop_cond119.not.not = icmp slt i64 %polly.indvar117, %125
  br i1 %polly.loop_cond119.not.not, label %polly.loop_if120, label %polly.cond

polly.loop_if120:                                 ; preds = %polly.loop_if120.preheader, %polly.loop_exit123
  %polly.indvar117 = phi i64 [ %polly.indvar_next118, %polly.loop_exit123 ], [ %123, %polly.loop_if120.preheader ]
  br i1 %polly.loop_guard87.not.not, label %polly.loop_header121.preheader, label %polly.loop_exit123

polly.loop_header121.preheader:                   ; preds = %polly.loop_if120
  %polly.access.mul.128 = mul nuw nsw i64 %polly.indvar117, %_arg_size_
  %127 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.mul.128
  %pexp.p_div_q131696 = lshr i64 %polly.indvar117, 1
  %128 = add i64 %126, %pexp.p_div_q131696
  %pexp.pdiv_r133 = and i64 %polly.indvar117, 1
  %.idx697 = shl i64 %128, 13
  %129 = getelementptr i8, ptr %Packed_A, i64 %.idx697
  %invariant.gep = getelementptr float, ptr %129, i64 %pexp.pdiv_r133
  br label %polly.loop_header121

polly.loop_header121:                             ; preds = %polly.loop_header121.preheader, %polly.loop_header121
  %polly.indvar125 = phi i64 [ %polly.indvar_next126, %polly.loop_header121 ], [ %80, %polly.loop_header121.preheader ]
  %polly.access.130 = getelementptr float, ptr addrspace(1) %127, i64 %polly.indvar125
  %polly.access.130.load = load float, ptr addrspace(1) %polly.access.130, align 4, !alias.scope !33, !noalias !34
  %130 = shl nuw i64 %polly.indvar125, 1
  %131 = sub i64 %130, %101
  %gep = getelementptr float, ptr %invariant.gep, i64 %131
  store float %polly.access.130.load, ptr %gep, align 4, !alias.scope !35, !noalias !36
  %polly.indvar_next126 = add nuw nsw i64 %polly.indvar125, 1
  %polly.loop_cond127.not.not = icmp slt i64 %polly.indvar125, %82
  br i1 %polly.loop_cond127.not.not, label %polly.loop_header121, label %polly.loop_exit123

polly.loop_if145.preheader:                       ; preds = %polly.cond
  %132 = mul nsw i64 %polly.indvar109, -24
  %133 = add nsw i64 %132, %pexp.p_div_q144698
  %134 = tail call i64 @llvm.smin.i64(i64 %133, i64 24)
  %135 = add nsw i64 %134, -1
  %polly.loop_guard149 = icmp sgt i64 %133, 0
  %136 = icmp slt i64 %124, %_arg_size_
  %.not728 = or i1 %136, %15
  %.neg = mul i64 %polly.indvar109, 2251799813685224
  %137 = add i64 %.neg, %pexp.div
  %.idx699 = shl i64 %137, 13
  %138 = getelementptr i8, ptr %Packed_A, i64 %.idx699
  br label %polly.loop_if145

polly.cond253:                                    ; preds = %polly.loop_exit156, %polly.loop_if145
  %brmerge723 = select i1 %.not728, i1 true, i1 %polly.loop_guard261
  br i1 %brmerge723, label %polly.merge254, label %polly.stmt.for.body11.i298.preheader

polly.merge254.loopexit:                          ; preds = %polly.stmt.for.body11.i298
  store float %p_280, ptr addrspace(1) %scevgep278, align 4, !alias.scope !37, !noalias !38
  store float %p_297, ptr addrspace(1) %scevgep295, align 4, !alias.scope !37, !noalias !38
  store float %p_314, ptr addrspace(1) %scevgep312, align 4, !alias.scope !37, !noalias !38
  br label %polly.merge254

polly.merge254:                                   ; preds = %polly.cond253, %polly.merge254.loopexit
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond143.not.not = icmp slt i64 %polly.indvar141, %56
  br i1 %polly.loop_cond143.not.not, label %polly.loop_if145, label %polly.cond315

polly.loop_if145:                                 ; preds = %polly.loop_if145.preheader, %polly.merge254
  %polly.indvar141 = phi i64 [ %polly.indvar_next142, %polly.merge254 ], [ 0, %polly.loop_if145.preheader ]
  br i1 %polly.loop_guard149, label %polly.loop_if153.preheader, label %polly.cond253

polly.loop_if153.preheader:                       ; preds = %polly.loop_if145
  %139 = mul nuw nsw i64 %polly.indvar141, 3
  %140 = add nuw nsw i64 %57, %139
  %polly.access.mul.Packed_B166 = shl nsw i64 %polly.indvar141, 10
  %141 = shl i64 %140, 2
  %142 = add i64 %141, 4
  %143 = add i64 %141, 8
  br label %polly.loop_if153

polly.loop_exit156:                               ; preds = %polly.stmt.for.body11.i237, %polly.loop_if153
  %polly.indvar_next151 = add nuw nsw i64 %polly.indvar150, 1
  %polly.loop_cond152.not.not = icmp slt i64 %polly.indvar150, %135
  br i1 %polly.loop_cond152.not.not, label %polly.loop_if153, label %polly.cond253

polly.loop_if153:                                 ; preds = %polly.loop_if153.preheader, %polly.loop_exit156
  %polly.indvar150 = phi i64 [ %polly.indvar_next151, %polly.loop_exit156 ], [ 0, %polly.loop_if153.preheader ]
  br i1 %polly.loop_guard157, label %polly.stmt.for.body11.i237.preheader, label %polly.loop_exit156

polly.stmt.for.body11.i237.preheader:             ; preds = %polly.loop_if153
  %144 = shl nuw nsw i64 %polly.indvar150, 1
  %145 = add nuw nsw i64 %123, %144
  %.idx707 = shl i64 %polly.indvar150, 13
  %146 = getelementptr i8, ptr %Packed_A, i64 %.idx707
  %147 = mul i64 %13, %145
  %148 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %147
  %scevgep = getelementptr i8, ptr addrspace(1) %148, i64 %141
  %scevgep186 = getelementptr i8, ptr addrspace(1) %148, i64 %142
  %scevgep202 = getelementptr i8, ptr addrspace(1) %148, i64 %143
  %149 = or disjoint i64 %145, 1
  %150 = mul i64 %13, %149
  %151 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %150
  %scevgep218 = getelementptr i8, ptr addrspace(1) %151, i64 %141
  %scevgep234 = getelementptr i8, ptr addrspace(1) %151, i64 %142
  %scevgep250 = getelementptr i8, ptr addrspace(1) %151, i64 %143
  br label %polly.stmt.for.body11.i237

polly.stmt.for.body11.i237:                       ; preds = %polly.stmt.for.body11.i237.preheader, %polly.stmt.for.body11.i237
  %polly.indvar158 = phi i64 [ %polly.indvar_next159, %polly.stmt.for.body11.i237 ], [ 0, %polly.stmt.for.body11.i237.preheader ]
  %polly.access.Packed_A165.idx = shl i64 %polly.indvar158, 3
  %polly.access.Packed_A165 = getelementptr i8, ptr %146, i64 %polly.access.Packed_A165.idx
  %_p_scalar_ = load float, ptr %polly.access.Packed_A165, align 4, !alias.scope !35, !noalias !36
  %polly.access.add.Packed_B167 = add nuw nsw i64 %polly.access.mul.Packed_B166, %polly.indvar158
  %polly.access.Packed_B170.idx = mul i64 %polly.access.add.Packed_B167, 12
  %polly.access.Packed_B170 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B170.idx
  %_p_scalar_171 = load float, ptr %polly.access.Packed_B170, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_172 = load float, ptr addrspace(1) %scevgep, align 4, !alias.scope !37, !noalias !38
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_171, float %_p_scalar_172)
  store float %p_, ptr addrspace(1) %scevgep, align 4, !alias.scope !37, !noalias !38
  %polly.access.Packed_B184 = getelementptr i8, ptr %polly.access.Packed_B170, i64 4
  %_p_scalar_185 = load float, ptr %polly.access.Packed_B184, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_187 = load float, ptr addrspace(1) %scevgep186, align 4, !alias.scope !37, !noalias !38
  %p_188 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_185, float %_p_scalar_187)
  store float %p_188, ptr addrspace(1) %scevgep186, align 4, !alias.scope !37, !noalias !38
  %polly.access.Packed_B200 = getelementptr i8, ptr %polly.access.Packed_B170, i64 8
  %_p_scalar_201 = load float, ptr %polly.access.Packed_B200, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_203 = load float, ptr addrspace(1) %scevgep202, align 4, !alias.scope !37, !noalias !38
  %p_204 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_201, float %_p_scalar_203)
  store float %p_204, ptr addrspace(1) %scevgep202, align 4, !alias.scope !37, !noalias !38
  %polly.access.Packed_A210 = getelementptr i8, ptr %polly.access.Packed_A165, i64 4
  %_p_scalar_211 = load float, ptr %polly.access.Packed_A210, align 4, !alias.scope !35, !noalias !36
  %_p_scalar_219 = load float, ptr addrspace(1) %scevgep218, align 4, !alias.scope !37, !noalias !38
  %p_220 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_171, float %_p_scalar_219)
  store float %p_220, ptr addrspace(1) %scevgep218, align 4, !alias.scope !37, !noalias !38
  %_p_scalar_235 = load float, ptr addrspace(1) %scevgep234, align 4, !alias.scope !37, !noalias !38
  %p_236 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_185, float %_p_scalar_235)
  store float %p_236, ptr addrspace(1) %scevgep234, align 4, !alias.scope !37, !noalias !38
  %_p_scalar_251 = load float, ptr addrspace(1) %scevgep250, align 4, !alias.scope !37, !noalias !38
  %p_252 = tail call float @llvm.fmuladd.f32(float %_p_scalar_211, float %_p_scalar_201, float %_p_scalar_251)
  store float %p_252, ptr addrspace(1) %scevgep250, align 4, !alias.scope !37, !noalias !38
  %polly.indvar_next159 = add nuw nsw i64 %polly.indvar158, 1
  %polly.loop_cond160.not.not = icmp slt i64 %polly.indvar158, %104
  br i1 %polly.loop_cond160.not.not, label %polly.stmt.for.body11.i237, label %polly.loop_exit156, !llvm.loop !39

polly.stmt.for.body11.i298.preheader:             ; preds = %polly.cond253
  %152 = mul nuw nsw i64 %polly.indvar141, 3
  %153 = add nuw nsw i64 %58, %152
  %polly.access.mul.Packed_B272 = shl nsw i64 %polly.indvar141, 10
  %154 = shl i64 %153, 2
  %scevgep278 = getelementptr i8, ptr addrspace(1) %17, i64 %154
  %scevgep295 = getelementptr i8, ptr addrspace(1) %scevgep278, i64 4
  %scevgep312 = getelementptr i8, ptr addrspace(1) %scevgep278, i64 8
  %scevgep278.promoted = load float, ptr addrspace(1) %scevgep278, align 4, !alias.scope !37, !noalias !38
  %scevgep295.promoted = load float, ptr addrspace(1) %scevgep295, align 4, !alias.scope !37, !noalias !38
  %scevgep312.promoted = load float, ptr addrspace(1) %scevgep312, align 4, !alias.scope !37, !noalias !38
  br label %polly.stmt.for.body11.i298

polly.stmt.for.body11.i298:                       ; preds = %polly.stmt.for.body11.i298.preheader, %polly.stmt.for.body11.i298
  %p_314714 = phi float [ %p_314, %polly.stmt.for.body11.i298 ], [ %scevgep312.promoted, %polly.stmt.for.body11.i298.preheader ]
  %p_297713 = phi float [ %p_297, %polly.stmt.for.body11.i298 ], [ %scevgep295.promoted, %polly.stmt.for.body11.i298.preheader ]
  %_p_scalar_279712 = phi float [ %p_280, %polly.stmt.for.body11.i298 ], [ %scevgep278.promoted, %polly.stmt.for.body11.i298.preheader ]
  %polly.indvar262 = phi i64 [ %polly.indvar_next263, %polly.stmt.for.body11.i298 ], [ 0, %polly.stmt.for.body11.i298.preheader ]
  %polly.access.Packed_A270.idx = shl i64 %polly.indvar262, 3
  %polly.access.Packed_A270 = getelementptr i8, ptr %138, i64 %polly.access.Packed_A270.idx
  %_p_scalar_271 = load float, ptr %polly.access.Packed_A270, align 4, !alias.scope !35, !noalias !36
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
  %polly.loop_cond264.not.not = icmp slt i64 %polly.indvar262, %107
  br i1 %polly.loop_cond264.not.not, label %polly.stmt.for.body11.i298, label %polly.merge254.loopexit, !llvm.loop !41

polly.cond321:                                    ; preds = %polly.cond315
  %brmerge725.not = select i1 %99, i1 %polly.loop_guard330, i1 false
  br i1 %brmerge725.not, label %polly.loop_if334, label %polly.cond387

polly.cond387:                                    ; preds = %polly.cond321, %polly.loop_exit337
  br i1 %70, label %polly.cond392, label %polly.merge316

polly.loop_exit337.loopexit:                      ; preds = %polly.stmt.for.body11.i372
  store float %p_356, ptr addrspace(1) %scevgep354, align 4, !alias.scope !37, !noalias !38
  store float %p_371, ptr addrspace(1) %scevgep369, align 4, !alias.scope !37, !noalias !38
  store float %p_386, ptr addrspace(1) %scevgep384, align 4, !alias.scope !37, !noalias !38
  br label %polly.loop_exit337

polly.loop_exit337:                               ; preds = %polly.loop_exit337.loopexit, %polly.loop_if334
  %polly.indvar_next332 = add nuw nsw i64 %polly.indvar331, 1
  %polly.loop_cond333.not.not = icmp slt i64 %polly.indvar331, %69
  br i1 %polly.loop_cond333.not.not, label %polly.loop_if334, label %polly.cond387

polly.loop_if334:                                 ; preds = %polly.cond321, %polly.loop_exit337
  %polly.indvar331 = phi i64 [ %polly.indvar_next332, %polly.loop_exit337 ], [ 0, %polly.cond321 ]
  br i1 %polly.loop_guard338, label %polly.stmt.for.body11.i372.preheader, label %polly.loop_exit337

polly.stmt.for.body11.i372.preheader:             ; preds = %polly.loop_if334
  %155 = mul nuw nsw i64 %polly.indvar331, 3
  %156 = add nuw nsw i64 %59, %155
  %polly.access.mul.Packed_B348 = shl nsw i64 %polly.indvar331, 10
  %157 = shl i64 %156, 2
  %scevgep354 = getelementptr i8, ptr addrspace(1) %22, i64 %157
  %scevgep369 = getelementptr i8, ptr addrspace(1) %scevgep354, i64 4
  %scevgep384 = getelementptr i8, ptr addrspace(1) %scevgep354, i64 8
  %scevgep354.promoted = load float, ptr addrspace(1) %scevgep354, align 4, !alias.scope !37, !noalias !38
  %scevgep369.promoted = load float, ptr addrspace(1) %scevgep369, align 4, !alias.scope !37, !noalias !38
  %scevgep384.promoted = load float, ptr addrspace(1) %scevgep384, align 4, !alias.scope !37, !noalias !38
  br label %polly.stmt.for.body11.i372

polly.stmt.for.body11.i372:                       ; preds = %polly.stmt.for.body11.i372.preheader, %polly.stmt.for.body11.i372
  %p_386717 = phi float [ %p_386, %polly.stmt.for.body11.i372 ], [ %scevgep384.promoted, %polly.stmt.for.body11.i372.preheader ]
  %p_371716 = phi float [ %p_371, %polly.stmt.for.body11.i372 ], [ %scevgep369.promoted, %polly.stmt.for.body11.i372.preheader ]
  %_p_scalar_355715 = phi float [ %p_356, %polly.stmt.for.body11.i372 ], [ %scevgep354.promoted, %polly.stmt.for.body11.i372.preheader ]
  %polly.indvar339 = phi i64 [ %polly.indvar_next340, %polly.stmt.for.body11.i372 ], [ 0, %polly.stmt.for.body11.i372.preheader ]
  %polly.access.Packed_A346.idx = shl i64 %polly.indvar339, 3
  %polly.access.Packed_A346 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A346.idx
  %_p_scalar_347 = load float, ptr %polly.access.Packed_A346, align 4, !alias.scope !35, !noalias !36
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
  %polly.loop_cond341.not.not = icmp slt i64 %polly.indvar339, %110
  br i1 %polly.loop_cond341.not.not, label %polly.stmt.for.body11.i372, label %polly.loop_exit337.loopexit, !llvm.loop !42

polly.cond392:                                    ; preds = %polly.cond387
  %158 = and i1 %72, %99
  br i1 %158, label %polly.loop_if396, label %polly.cond420

polly.cond420:                                    ; preds = %polly.cond392
  %159 = and i1 %74, %89
  br i1 %159, label %polly.loop_if424, label %polly.loop_if508

polly.loop_if396:                                 ; preds = %polly.cond392
  br i1 %polly.loop_guard400, label %polly.stmt.for.body11.i404.preheader, label %polly.loop_if585

polly.stmt.for.body11.i404.preheader:             ; preds = %polly.loop_if396
  %scevgep417.promoted = load float, ptr addrspace(1) %scevgep417, align 4, !alias.scope !37, !noalias !38
  br label %polly.stmt.for.body11.i404

polly.stmt.for.body11.i404:                       ; preds = %polly.stmt.for.body11.i404.preheader, %polly.stmt.for.body11.i404
  %p_419718 = phi float [ %p_419, %polly.stmt.for.body11.i404 ], [ %scevgep417.promoted, %polly.stmt.for.body11.i404.preheader ]
  %polly.indvar401 = phi i64 [ %polly.indvar_next402, %polly.stmt.for.body11.i404 ], [ 0, %polly.stmt.for.body11.i404.preheader ]
  %polly.access.Packed_A408.idx = shl i64 %polly.indvar401, 3
  %polly.access.Packed_A408 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A408.idx
  %_p_scalar_409 = load float, ptr %polly.access.Packed_A408, align 4, !alias.scope !35, !noalias !36
  %polly.access.add.Packed_B412 = add nsw i64 %polly.access.mul.Packed_B411, %polly.indvar401
  %polly.access.Packed_B415.idx = mul i64 %polly.access.add.Packed_B412, 12
  %polly.access.Packed_B415 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B415.idx
  %_p_scalar_416 = load float, ptr %polly.access.Packed_B415, align 4, !alias.scope !31, !noalias !32
  %p_419 = tail call float @llvm.fmuladd.f32(float %_p_scalar_409, float %_p_scalar_416, float %p_419718)
  %polly.indvar_next402 = add nuw nsw i64 %polly.indvar401, 1
  %polly.loop_cond403.not.not = icmp slt i64 %polly.indvar401, %119
  br i1 %polly.loop_cond403.not.not, label %polly.stmt.for.body11.i404, label %polly.loop_if585.loopexit, !llvm.loop !43

polly.loop_if424:                                 ; preds = %polly.cond420
  br i1 %polly.loop_guard428, label %polly.cond449.preheader, label %polly.loop_if585

polly.cond449.preheader:                          ; preds = %polly.loop_if424
  %160 = mul i64 %13, %123
  %161 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %160
  %scevgep446 = getelementptr i8, ptr addrspace(1) %161, i64 %28
  %162 = mul i64 %13, %98
  %gep720 = getelementptr i8, ptr addrspace(1) %invariant.gep719, i64 %162
  %scevgep467 = getelementptr i8, ptr addrspace(1) %161, i64 %33
  %163 = mul i64 %13, %98
  %164 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %163
  %scevgep484 = getelementptr i8, ptr addrspace(1) %164, i64 %28
  %scevgep505 = getelementptr i8, ptr addrspace(1) %164, i64 %33
  br label %polly.cond449

polly.cond449:                                    ; preds = %polly.cond449.preheader, %polly.merge488
  %polly.indvar429 = phi i64 [ %polly.indvar_next430, %polly.merge488 ], [ 0, %polly.cond449.preheader ]
  %polly.access.Packed_A437.idx = shl i64 %polly.indvar429, 3
  %polly.access.Packed_A437 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A437.idx
  %_p_scalar_438 = load float, ptr %polly.access.Packed_A437, align 4, !alias.scope !35, !noalias !36
  %polly.access.add.Packed_B441 = add nsw i64 %polly.access.mul.Packed_B440, %polly.indvar429
  %polly.access.Packed_B444.idx = mul i64 %polly.access.add.Packed_B441, 12
  %polly.access.Packed_B444 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B444.idx
  %_p_scalar_445 = load float, ptr %polly.access.Packed_B444, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_447 = load float, ptr addrspace(1) %scevgep446, align 4, !alias.scope !37, !noalias !38
  %p_448 = tail call float @llvm.fmuladd.f32(float %_p_scalar_438, float %_p_scalar_445, float %_p_scalar_447)
  store float %p_448, ptr addrspace(1) %scevgep446, align 4, !alias.scope !37, !noalias !38
  br i1 %30, label %polly.stmt.for.body11.i454, label %polly.merge488.critedge

polly.merge488.critedge:                          ; preds = %polly.cond449
  %polly.access.Packed_A475.c = getelementptr i8, ptr %polly.access.Packed_A437, i64 4
  %_p_scalar_476.c = load float, ptr %polly.access.Packed_A475.c, align 4, !alias.scope !35, !noalias !36
  %_p_scalar_485.c = load float, ptr addrspace(1) %gep720, align 4, !alias.scope !37, !noalias !38
  %p_486.c = tail call float @llvm.fmuladd.f32(float %_p_scalar_476.c, float %_p_scalar_445, float %_p_scalar_485.c)
  store float %p_486.c, ptr addrspace(1) %gep720, align 4, !alias.scope !37, !noalias !38
  br label %polly.merge488

polly.merge488:                                   ; preds = %polly.merge488.critedge, %polly.stmt.for.body11.i454
  %polly.indvar_next430 = add nuw nsw i64 %polly.indvar429, 1
  %polly.loop_cond431.not.not = icmp slt i64 %polly.indvar429, %116
  br i1 %polly.loop_cond431.not.not, label %polly.cond449, label %polly.loop_if585, !llvm.loop !44

polly.stmt.for.body11.i454:                       ; preds = %polly.cond449
  %polly.access.add.Packed_B462 = add nsw i64 %polly.access.mul.Packed_B461, %polly.indvar429
  %.idx700 = mul i64 %polly.access.add.Packed_B462, 12
  %165 = getelementptr i8, ptr %Packed_B, i64 %.idx700
  %polly.access.Packed_B465 = getelementptr i8, ptr %165, i64 4
  %_p_scalar_466 = load float, ptr %polly.access.Packed_B465, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_468 = load float, ptr addrspace(1) %scevgep467, align 4, !alias.scope !37, !noalias !38
  %p_469 = tail call float @llvm.fmuladd.f32(float %_p_scalar_438, float %_p_scalar_466, float %_p_scalar_468)
  store float %p_469, ptr addrspace(1) %scevgep467, align 4, !alias.scope !37, !noalias !38
  %polly.access.Packed_A475 = getelementptr i8, ptr %polly.access.Packed_A437, i64 4
  %_p_scalar_476 = load float, ptr %polly.access.Packed_A475, align 4, !alias.scope !35, !noalias !36
  %_p_scalar_485 = load float, ptr addrspace(1) %scevgep484, align 4, !alias.scope !37, !noalias !38
  %p_486 = tail call float @llvm.fmuladd.f32(float %_p_scalar_476, float %_p_scalar_445, float %_p_scalar_485)
  store float %p_486, ptr addrspace(1) %scevgep484, align 4, !alias.scope !37, !noalias !38
  %_p_scalar_506 = load float, ptr addrspace(1) %scevgep505, align 4, !alias.scope !37, !noalias !38
  %p_507 = tail call float @llvm.fmuladd.f32(float %_p_scalar_476, float %_p_scalar_466, float %_p_scalar_506)
  store float %p_507, ptr addrspace(1) %scevgep505, align 4, !alias.scope !37, !noalias !38
  br label %polly.merge488

polly.loop_if508:                                 ; preds = %polly.cond420
  br i1 %polly.loop_guard512, label %polly.cond530.preheader, label %polly.loop_if585

polly.cond530.preheader:                          ; preds = %polly.loop_if508
  %166 = mul i64 %13, %123
  %167 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %166
  %scevgep527 = getelementptr i8, ptr addrspace(1) %167, i64 %75
  %scevgep545 = getelementptr i8, ptr addrspace(1) %167, i64 %23
  %168 = mul i64 %13, %98
  %169 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %168
  %scevgep563 = getelementptr i8, ptr addrspace(1) %169, i64 %75
  %scevgep581 = getelementptr i8, ptr addrspace(1) %169, i64 %24
  br label %polly.cond530

polly.cond530:                                    ; preds = %polly.cond530.preheader, %polly.merge549
  %polly.indvar513 = phi i64 [ %polly.indvar_next514, %polly.merge549 ], [ 0, %polly.cond530.preheader ]
  %polly.access.Packed_A520.idx = shl i64 %polly.indvar513, 3
  %polly.access.Packed_A520 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A520.idx
  %_p_scalar_521 = load float, ptr %polly.access.Packed_A520, align 4, !alias.scope !35, !noalias !36
  %polly.access.Packed_B525.idx = mul i64 %polly.indvar513, 12
  %polly.access.Packed_B525 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B525.idx
  %_p_scalar_526 = load float, ptr %polly.access.Packed_B525, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_528 = load float, ptr addrspace(1) %scevgep527, align 4, !alias.scope !37, !noalias !38
  %p_529 = tail call float @llvm.fmuladd.f32(float %_p_scalar_521, float %_p_scalar_526, float %_p_scalar_528)
  store float %p_529, ptr addrspace(1) %scevgep527, align 4, !alias.scope !37, !noalias !38
  br i1 %76, label %polly.stmt.for.body11.i534, label %polly.cond548

polly.cond548:                                    ; preds = %polly.cond530, %polly.stmt.for.body11.i534
  br i1 %89, label %polly.cond566, label %polly.merge549

polly.merge549:                                   ; preds = %polly.cond566, %polly.cond548, %polly.stmt.for.body11.i570
  %polly.indvar_next514 = add nuw nsw i64 %polly.indvar513, 1
  %polly.loop_cond515.not.not = icmp slt i64 %polly.indvar513, %113
  br i1 %polly.loop_cond515.not.not, label %polly.cond530, label %polly.loop_if585, !llvm.loop !45

polly.stmt.for.body11.i534:                       ; preds = %polly.cond530
  %polly.access.Packed_B543 = getelementptr i8, ptr %polly.access.Packed_B525, i64 4
  %_p_scalar_544 = load float, ptr %polly.access.Packed_B543, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_546 = load float, ptr addrspace(1) %scevgep545, align 4, !alias.scope !37, !noalias !38
  %p_547 = tail call float @llvm.fmuladd.f32(float %_p_scalar_521, float %_p_scalar_544, float %_p_scalar_546)
  store float %p_547, ptr addrspace(1) %scevgep545, align 4, !alias.scope !37, !noalias !38
  br label %polly.cond548

polly.cond566:                                    ; preds = %polly.cond548
  %polly.access.Packed_A556 = getelementptr i8, ptr %polly.access.Packed_A520, i64 4
  %_p_scalar_557 = load float, ptr %polly.access.Packed_A556, align 4, !alias.scope !35, !noalias !36
  %_p_scalar_564 = load float, ptr addrspace(1) %scevgep563, align 4, !alias.scope !37, !noalias !38
  %p_565 = tail call float @llvm.fmuladd.f32(float %_p_scalar_557, float %_p_scalar_526, float %_p_scalar_564)
  store float %p_565, ptr addrspace(1) %scevgep563, align 4, !alias.scope !37, !noalias !38
  br i1 %76, label %polly.stmt.for.body11.i570, label %polly.merge549

polly.stmt.for.body11.i570:                       ; preds = %polly.cond566
  %polly.access.Packed_B579 = getelementptr i8, ptr %polly.access.Packed_B525, i64 4
  %_p_scalar_580 = load float, ptr %polly.access.Packed_B579, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_582 = load float, ptr addrspace(1) %scevgep581, align 4, !alias.scope !37, !noalias !38
  %p_583 = tail call float @llvm.fmuladd.f32(float %_p_scalar_557, float %_p_scalar_580, float %_p_scalar_582)
  store float %p_583, ptr addrspace(1) %scevgep581, align 4, !alias.scope !37, !noalias !38
  br label %polly.merge549

polly.loop_if585.loopexit:                        ; preds = %polly.stmt.for.body11.i404
  store float %p_419, ptr addrspace(1) %scevgep417, align 4, !alias.scope !37, !noalias !38
  br label %polly.loop_if585

polly.loop_if585:                                 ; preds = %polly.merge549, %polly.merge488, %polly.loop_if585.loopexit, %polly.loop_if396, %polly.loop_if424, %polly.loop_if508
  %170 = mul nsw i64 %polly.indvar109, -24
  %171 = add nsw i64 %170, %pexp.p_div_q584702
  %172 = tail call i64 @llvm.smin.i64(i64 %171, i64 24)
  %173 = add nsw i64 %172, -1
  %polly.loop_guard589 = icmp sgt i64 %171, 1
  br i1 %polly.loop_guard589, label %polly.loop_if593, label %polly.merge316

polly.loop_exit596:                               ; preds = %polly.merge642, %polly.loop_if593
  %polly.indvar_next591 = add nuw nsw i64 %polly.indvar590, 1
  %polly.loop_cond592.not.not = icmp slt i64 %polly.indvar590, %173
  br i1 %polly.loop_cond592.not.not, label %polly.loop_if593, label %polly.merge316

polly.loop_if593:                                 ; preds = %polly.loop_if585, %polly.loop_exit596
  %polly.indvar590 = phi i64 [ %polly.indvar_next591, %polly.loop_exit596 ], [ 1, %polly.loop_if585 ]
  br i1 %polly.loop_guard597, label %polly.cond619.preheader, label %polly.loop_exit596

polly.cond619.preheader:                          ; preds = %polly.loop_if593
  %174 = shl nuw nsw i64 %polly.indvar590, 1
  %175 = add nuw nsw i64 %123, %174
  %.idx708 = shl i64 %polly.indvar590, 13
  %176 = getelementptr i8, ptr %Packed_A, i64 %.idx708
  %177 = mul i64 %13, %175
  %178 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %177
  %scevgep616 = getelementptr i8, ptr addrspace(1) %178, i64 %41
  %scevgep638 = getelementptr i8, ptr addrspace(1) %178, i64 %45
  %179 = add nuw nsw i64 %175, 2
  %.not = icmp slt i64 %_arg_size_, %179
  %180 = or disjoint i64 %175, 1
  %181 = mul i64 %13, %180
  %182 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %181
  %scevgep661 = getelementptr i8, ptr addrspace(1) %182, i64 %41
  %scevgep683 = getelementptr i8, ptr addrspace(1) %182, i64 %48
  br label %polly.cond619

polly.cond619:                                    ; preds = %polly.cond619.preheader, %polly.merge642
  %polly.indvar598 = phi i64 [ %polly.indvar_next599, %polly.merge642 ], [ 0, %polly.cond619.preheader ]
  %polly.access.Packed_A607.idx = shl i64 %polly.indvar598, 3
  %polly.access.Packed_A607 = getelementptr i8, ptr %176, i64 %polly.access.Packed_A607.idx
  %_p_scalar_608 = load float, ptr %polly.access.Packed_A607, align 4, !alias.scope !35, !noalias !36
  %polly.access.add.Packed_B611 = add nsw i64 %polly.access.mul.Packed_B610, %polly.indvar598
  %polly.access.Packed_B614.idx = mul i64 %polly.access.add.Packed_B611, 12
  %polly.access.Packed_B614 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B614.idx
  %_p_scalar_615 = load float, ptr %polly.access.Packed_B614, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_617 = load float, ptr addrspace(1) %scevgep616, align 4, !alias.scope !37, !noalias !38
  %p_618 = tail call float @llvm.fmuladd.f32(float %_p_scalar_608, float %_p_scalar_615, float %_p_scalar_617)
  store float %p_618, ptr addrspace(1) %scevgep616, align 4, !alias.scope !37, !noalias !38
  br i1 %42, label %polly.stmt.for.body11.i624, label %polly.cond641

polly.cond641:                                    ; preds = %polly.cond619, %polly.stmt.for.body11.i624
  br i1 %.not, label %polly.merge642, label %polly.cond664

polly.merge642:                                   ; preds = %polly.cond664, %polly.cond641, %polly.stmt.for.body11.i669
  %polly.indvar_next599 = add nuw nsw i64 %polly.indvar598, 1
  %polly.loop_cond600.not.not = icmp slt i64 %polly.indvar598, %122
  br i1 %polly.loop_cond600.not.not, label %polly.cond619, label %polly.loop_exit596, !llvm.loop !46

polly.stmt.for.body11.i624:                       ; preds = %polly.cond619
  %polly.access.add.Packed_B633 = add nsw i64 %polly.access.mul.Packed_B632, %polly.indvar598
  %.idx703 = mul i64 %polly.access.add.Packed_B633, 12
  %183 = getelementptr i8, ptr %Packed_B, i64 %.idx703
  %polly.access.Packed_B636 = getelementptr i8, ptr %183, i64 4
  %_p_scalar_637 = load float, ptr %polly.access.Packed_B636, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_639 = load float, ptr addrspace(1) %scevgep638, align 4, !alias.scope !37, !noalias !38
  %p_640 = tail call float @llvm.fmuladd.f32(float %_p_scalar_608, float %_p_scalar_637, float %_p_scalar_639)
  store float %p_640, ptr addrspace(1) %scevgep638, align 4, !alias.scope !37, !noalias !38
  br label %polly.cond641

polly.cond664:                                    ; preds = %polly.cond641
  %polly.access.Packed_A652 = getelementptr i8, ptr %polly.access.Packed_A607, i64 4
  %_p_scalar_653 = load float, ptr %polly.access.Packed_A652, align 4, !alias.scope !35, !noalias !36
  %_p_scalar_662 = load float, ptr addrspace(1) %scevgep661, align 4, !alias.scope !37, !noalias !38
  %p_663 = tail call float @llvm.fmuladd.f32(float %_p_scalar_653, float %_p_scalar_615, float %_p_scalar_662)
  store float %p_663, ptr addrspace(1) %scevgep661, align 4, !alias.scope !37, !noalias !38
  br i1 %42, label %polly.stmt.for.body11.i669, label %polly.merge642

polly.stmt.for.body11.i669:                       ; preds = %polly.cond664
  %polly.access.add.Packed_B678 = add nsw i64 %polly.access.mul.Packed_B677, %polly.indvar598
  %.idx704 = mul i64 %polly.access.add.Packed_B678, 12
  %184 = getelementptr i8, ptr %Packed_B, i64 %.idx704
  %polly.access.Packed_B681 = getelementptr i8, ptr %184, i64 4
  %_p_scalar_682 = load float, ptr %polly.access.Packed_B681, align 4, !alias.scope !31, !noalias !32
  %_p_scalar_684 = load float, ptr addrspace(1) %scevgep683, align 4, !alias.scope !37, !noalias !38
  %p_685 = tail call float @llvm.fmuladd.f32(float %_p_scalar_653, float %_p_scalar_682, float %_p_scalar_684)
  store float %p_685, ptr addrspace(1) %scevgep683, align 4, !alias.scope !37, !noalias !38
  br label %polly.merge642
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS15Polybench_2mm_2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_C, ptr addrspace(1) noundef align 4 %_arg_raw_D, ptr addrspace(1) noundef align 4 %_arg_raw_E) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
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
  br i1 %polly.rtc.result.not, label %for.cond.i, label %polly.loop_if

for.cond.i:                                       ; preds = %polly.split_new_and_old, %for.cond.cleanup11.i
  %i.0.i = phi i64 [ %inc39.i, %for.cond.cleanup11.i ], [ 0, %polly.split_new_and_old ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %6 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body6.i
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
  br label %for.cond2.i, !llvm.loop !47

for.cond8.i:                                      ; preds = %for.cond8.i.preheader, %for.cond.cleanup17.i
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
  br label %for.cond.i, !llvm.loop !48

for.cond14.i:                                     ; preds = %for.cond14.i.preheader, %for.body18.i
  %j13.0.i = phi i64 [ %inc33.i, %for.body18.i ], [ 0, %for.cond14.i.preheader ]
  %cmp16.i = icmp ult i64 %j13.0.i, %_arg_size_
  br i1 %cmp16.i, label %for.body18.i, label %for.cond.cleanup17.i

for.cond.cleanup17.i:                             ; preds = %for.cond14.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !49

for.body18.i:                                     ; preds = %for.cond14.i
  %9 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !17
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %8, i64 %j13.0.i
  %10 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !17
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %6, i64 %j13.0.i
  %11 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !17
  %12 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %11)
  store float %12, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !17
  %inc33.i = add nuw i64 %j13.0.i, 1
  br label %for.cond14.i, !llvm.loop !50

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %polly.loop_exit111, %for.cond.i, %polly.loop_if100
  ret void

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %polly.fdiv_q.shr = ashr i64 %.res, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_if100

polly.loop_exit80:                                ; preds = %polly.loop_exit87
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader79, label %polly.loop_if100

polly.loop_preheader:                             ; preds = %polly.loop_if
  %13 = shl i64 %_arg_size_, 2
  %pexp.p_div_q728 = lshr i64 %.res, 5
  br label %polly.loop_preheader79

polly.loop_exit87:                                ; preds = %polly.loop_exit95, %polly.loop_if84
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
  br i1 %polly.loop_guard88, label %polly.loop_if92.preheader, label %polly.loop_exit87

polly.loop_if92.preheader:                        ; preds = %polly.loop_if84
  %18 = shl nsw i64 %polly.indvar81, 5
  %19 = xor i64 %18, -1
  %20 = add nsw i64 %_arg_size_, %19
  %21 = tail call i64 @llvm.smin.i64(i64 %20, i64 31)
  %polly.loop_guard96 = icmp sgt i64 %20, -1
  br label %polly.loop_if92

polly.loop_exit95:                                ; preds = %polly.stmt.for.body6.i, %polly.loop_if92
  %polly.indvar_next90 = add nuw nsw i64 %polly.indvar89, 1
  %polly.loop_cond91.not.not = icmp slt i64 %polly.indvar89, %17
  br i1 %polly.loop_cond91.not.not, label %polly.loop_if92, label %polly.loop_exit87

polly.loop_if92:                                  ; preds = %polly.loop_if92.preheader, %polly.loop_exit95
  %polly.indvar89 = phi i64 [ %polly.indvar_next90, %polly.loop_exit95 ], [ 0, %polly.loop_if92.preheader ]
  br i1 %polly.loop_guard96, label %polly.stmt.for.body6.i.preheader, label %polly.loop_exit95

polly.stmt.for.body6.i.preheader:                 ; preds = %polly.loop_if92
  %22 = add nuw nsw i64 %14, %polly.indvar89
  %23 = mul i64 %13, %22
  %24 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %23
  br label %polly.stmt.for.body6.i

polly.stmt.for.body6.i:                           ; preds = %polly.stmt.for.body6.i.preheader, %polly.stmt.for.body6.i
  %polly.indvar97 = phi i64 [ %polly.indvar_next98, %polly.stmt.for.body6.i ], [ 0, %polly.stmt.for.body6.i.preheader ]
  %25 = add nuw nsw i64 %18, %polly.indvar97
  %26 = shl i64 %25, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %24, i64 %26
  store float 0.000000e+00, ptr addrspace(1) %scevgep, align 4, !alias.scope !51, !noalias !54
  %polly.indvar_next98 = add nuw nsw i64 %polly.indvar97, 1
  %polly.loop_cond99.not.not = icmp slt i64 %polly.indvar97, %21
  br i1 %polly.loop_cond99.not.not, label %polly.stmt.for.body6.i, label %polly.loop_exit95

polly.loop_if100:                                 ; preds = %polly.loop_exit80, %polly.loop_if
  %pexp.fdiv_q.1 = add nsw i64 %_arg_size_, -768
  %pexp.fdiv_q.2 = icmp slt i64 %_arg_size_, 1
  %pexp.fdiv_q.3 = select i1 %pexp.fdiv_q.2, i64 %pexp.fdiv_q.1, i64 %.res
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 768
  %polly.loop_guard104 = icmp sgt i64 %pexp.fdiv_q.3, -768
  br i1 %polly.loop_guard104, label %polly.loop_preheader102, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

polly.loop_exit111:                               ; preds = %polly.loop_exit140
  %polly.indvar_next106 = add nuw nsw i64 %polly.indvar105, 1
  %polly.loop_cond107.not.not = icmp slt i64 %polly.indvar105, %pexp.fdiv_q.4
  br i1 %polly.loop_cond107.not.not, label %polly.loop_preheader110, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

polly.loop_preheader102:                          ; preds = %polly.loop_if100
  %27 = shl i64 %_arg_size_, 2
  %pexp.p_div_q108729 = lshr i64 %.res, 10
  %pexp.p_div_q137 = udiv i64 %.res, 48
  %pexp.p_div_q167 = udiv i64 %_arg_size_, 3
  %pexp.p_div_q176732 = lshr i64 %_arg_size_, 1
  %28 = and i64 %_arg_size_, 1
  %29 = icmp eq i64 %28, 0
  %pexp.div = lshr exact i64 %.res, 1
  %30 = mul i64 %27, %.res
  %31 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %30
  %32 = mul i64 %pexp.p_div_q167, 3
  %pexp.pdiv_r352.decomposed = sub i64 %_arg_size_, %32
  %33 = icmp ne i64 %pexp.pdiv_r352.decomposed, 0
  %34 = add nsw i64 %_arg_size_, -4
  %pexp.div358 = sdiv exact i64 %34, 3
  %35 = mul i64 %27, %.res
  %36 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %35
  %37 = shl i64 %.res, 2
  %38 = shl i64 %.res, 2
  %39 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r465 = urem i64 %39, 3
  %40 = sub nuw nsw i64 %_arg_size_, %pexp.pdiv_r465
  %pexp.p_div_q472 = udiv i64 %.res, 3
  %41 = shl i64 %pexp.p_div_q472, 10
  %42 = shl i64 %40, 2
  %43 = add nuw nsw i64 %_arg_size_, 1
  %pexp.zdiv_r486 = urem i64 %43, 3
  %44 = icmp eq i64 %pexp.zdiv_r486, 0
  %invariant.gep753 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %42
  %45 = add nsw i64 %_arg_size_, -2
  %pexp.div493 = udiv exact i64 %45, 3
  %46 = shl i64 %pexp.div493, 10
  %47 = shl i64 %.res, 2
  %pexp.div443 = sdiv exact i64 %.res, 3
  %48 = shl i64 %pexp.div443, 10
  %49 = add i64 %27, 4
  %50 = mul i64 %49, %.res
  %scevgep450 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %50
  %51 = add nuw nsw i64 %_arg_size_, 1
  %pexp.p_div_q617736 = lshr i64 %51, 1
  %52 = add nuw nsw i64 %_arg_size_, 3
  %pexp.pdiv_r634 = urem i64 %52, 3
  %53 = sub nsw i64 %_arg_size_, %pexp.pdiv_r634
  %pexp.p_div_q642 = udiv i64 %.res, 3
  %54 = shl i64 %pexp.p_div_q642, 10
  %55 = shl i64 %53, 2
  %pexp.zdiv_r656 = urem i64 %51, 3
  %56 = icmp eq i64 %pexp.zdiv_r656, 0
  %57 = add nsw i64 %_arg_size_, -2
  %pexp.div664 = sdiv exact i64 %57, 3
  %58 = shl i64 %pexp.div664, 10
  %59 = shl i64 %.res, 2
  %60 = add nsw i64 %_arg_size_, -2
  %pexp.div709 = sdiv exact i64 %60, 3
  %61 = shl i64 %pexp.div709, 10
  %62 = shl i64 %.res, 2
  br label %polly.loop_preheader110

polly.loop_exit140:                               ; preds = %polly.merge349
  %polly.indvar_next113 = add nuw nsw i64 %polly.indvar112, 1
  %polly.loop_cond114.not.not = icmp ult i64 %polly.indvar112, %pexp.p_div_q108729
  br i1 %polly.loop_cond114.not.not, label %polly.loop_if115, label %polly.loop_exit111

polly.loop_preheader110:                          ; preds = %polly.loop_preheader102, %polly.loop_exit111
  %polly.indvar105 = phi i64 [ 0, %polly.loop_preheader102 ], [ %polly.indvar_next106, %polly.loop_exit111 ]
  %63 = mul nuw nsw i64 %polly.indvar105, 768
  %64 = add nuw nsw i64 %63, 767
  %65 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %64)
  %polly.loop_guard127.not.not = icmp sgt i64 %_arg_size_, %63
  %66 = shl i64 %polly.indvar105, 18
  %67 = shl i64 %polly.indvar105, 8
  %68 = xor i64 %67, -1
  %69 = add i64 %pexp.p_div_q167, %68
  %70 = tail call i64 @llvm.smin.i64(i64 %69, i64 255)
  %polly.loop_guard172 = icmp sgt i64 %69, -1
  %71 = mul nuw nsw i64 %polly.indvar105, 768
  %72 = mul nuw nsw i64 %polly.indvar105, 768
  %73 = mul nuw nsw i64 %polly.indvar105, 768
  %74 = or disjoint i64 %73, 2
  %75 = icmp sge i64 %74, %_arg_size_
  %76 = add nuw nsw i64 %73, 767
  %77 = icmp sge i64 %76, %_arg_size_
  %78 = or disjoint i64 %73, 3
  %79 = icmp sge i64 %_arg_size_, %78
  %80 = and i1 %79, %77
  %81 = shl nsw i64 %polly.indvar105, 8
  %82 = sub nsw i64 %pexp.div358, %81
  %83 = tail call i64 @llvm.smin.i64(i64 %82, i64 255)
  %polly.loop_guard363 = icmp sgt i64 %82, -1
  %84 = and i1 %77, %33
  %85 = or disjoint i64 %73, 49
  %86 = icmp sge i64 %_arg_size_, %85
  %87 = or disjoint i64 %73, 4
  %88 = icmp sge i64 %_arg_size_, %87
  %89 = mul i64 %polly.indvar105, 3072
  %90 = icmp eq i64 %74, %_arg_size_
  %91 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B473 = sub i64 %41, %91
  %polly.access.mul.Packed_B494 = sub i64 %46, %91
  %92 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B444 = sub i64 %48, %92
  %93 = shl i64 %polly.indvar105, 18
  %polly.access.mul.Packed_B643 = sub i64 %54, %93
  %polly.access.mul.Packed_B665 = sub i64 %58, %93
  %polly.access.mul.Packed_B710 = sub i64 %61, %93
  br label %polly.loop_if115

polly.loop_if115:                                 ; preds = %polly.loop_preheader110, %polly.loop_exit140
  %polly.indvar112 = phi i64 [ 0, %polly.loop_preheader110 ], [ %polly.indvar_next113, %polly.loop_exit140 ]
  %94 = shl i64 %polly.indvar112, 10
  %95 = or disjoint i64 %94, 1023
  %96 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %95)
  %polly.loop_guard119.not.not = icmp sgt i64 %_arg_size_, %94
  br i1 %polly.loop_guard119.not.not, label %polly.loop_if123, label %polly.loop_preheader139

polly.loop_exit126:                               ; preds = %polly.loop_header124, %polly.loop_if123
  %polly.indvar_next121 = add nuw nsw i64 %polly.indvar120, 1
  %polly.loop_cond122.not.not = icmp slt i64 %polly.indvar120, %96
  br i1 %polly.loop_cond122.not.not, label %polly.loop_if123, label %polly.loop_preheader139

polly.loop_if123:                                 ; preds = %polly.loop_if115, %polly.loop_exit126
  %polly.indvar120 = phi i64 [ %polly.indvar_next121, %polly.loop_exit126 ], [ %94, %polly.loop_if115 ]
  br i1 %polly.loop_guard127.not.not, label %polly.loop_header124.preheader, label %polly.loop_exit126

polly.loop_header124.preheader:                   ; preds = %polly.loop_if123
  %polly.access.mul.131 = mul nuw nsw i64 %polly.indvar120, %_arg_size_
  %97 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %polly.access.mul.131
  %98 = sub i64 %polly.indvar120, %94
  br label %polly.loop_header124

polly.loop_header124:                             ; preds = %polly.loop_header124.preheader, %polly.loop_header124
  %polly.indvar128 = phi i64 [ %polly.indvar_next129, %polly.loop_header124 ], [ %63, %polly.loop_header124.preheader ]
  %polly.access.133 = getelementptr float, ptr addrspace(1) %97, i64 %polly.indvar128
  %polly.access.133.load = load float, ptr addrspace(1) %polly.access.133, align 4, !alias.scope !59, !noalias !60
  %polly.indvar128.frozen = freeze i64 %polly.indvar128
  %pexp.p_div_q134 = udiv i64 %polly.indvar128.frozen, 3
  %99 = shl i64 %pexp.p_div_q134, 10
  %polly.access.mul.Packed_B = sub i64 %99, %66
  %polly.access.add.Packed_B = add nsw i64 %polly.access.mul.Packed_B, %98
  %100 = mul i64 %pexp.p_div_q134, 3
  %pexp.pdiv_r.decomposed = sub i64 %polly.indvar128.frozen, %100
  %.idx = mul i64 %polly.access.add.Packed_B, 12
  %101 = getelementptr i8, ptr %Packed_B, i64 %.idx
  %polly.access.Packed_B = getelementptr float, ptr %101, i64 %pexp.pdiv_r.decomposed
  store float %polly.access.133.load, ptr %polly.access.Packed_B, align 4, !alias.scope !61, !noalias !62
  %polly.indvar_next129 = add nuw nsw i64 %polly.indvar128, 1
  %polly.loop_cond130.not.not = icmp slt i64 %polly.indvar128, %65
  br i1 %polly.loop_cond130.not.not, label %polly.loop_header124, label %polly.loop_exit126

polly.cond:                                       ; preds = %polly.loop_exit155, %polly.loop_if144
  %102 = or disjoint i64 %137, 2
  %103 = icmp sge i64 %_arg_size_, %102
  %brmerge.not = select i1 %103, i1 %polly.loop_guard172, i1 false
  br i1 %brmerge.not, label %polly.loop_if177.preheader, label %polly.cond348

polly.cond348:                                    ; preds = %polly.cond, %polly.merge287
  %104 = and i1 %75, %103
  %105 = or disjoint i64 %137, 3
  %106 = icmp sge i64 %_arg_size_, %105
  %107 = and i1 %77, %106
  %108 = and i1 %80, %103
  %109 = or i1 %107, %108
  %110 = and i1 %109, %33
  %111 = or i1 %104, %110
  %112 = or disjoint i64 %137, 1
  %113 = icmp eq i64 %112, %_arg_size_
  %114 = or i1 %111, %113
  br i1 %114, label %polly.cond354, label %polly.merge349

polly.merge349:                                   ; preds = %polly.loop_exit629, %polly.cond420, %polly.loop_if618, %polly.cond348
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond143.not.not = icmp ult i64 %polly.indvar141, %pexp.p_div_q137
  br i1 %polly.loop_cond143.not.not, label %polly.loop_if144, label %polly.loop_exit140

polly.loop_preheader139:                          ; preds = %polly.loop_exit126, %polly.loop_if115
  %115 = shl i64 %polly.indvar112, 11
  %116 = xor i64 %94, -1
  %117 = add nsw i64 %_arg_size_, %116
  %118 = tail call i64 @llvm.smin.i64(i64 %117, i64 1023)
  %polly.loop_guard189 = icmp sgt i64 %117, -1
  %119 = xor i64 %94, -1
  %120 = add nsw i64 %_arg_size_, %119
  %121 = tail call i64 @llvm.smin.i64(i64 %120, i64 1023)
  %polly.loop_guard294 = icmp slt i64 %120, 0
  %122 = xor i64 %94, -1
  %123 = add nsw i64 %_arg_size_, %122
  %124 = tail call i64 @llvm.smin.i64(i64 %123, i64 1023)
  %polly.loop_guard371 = icmp sgt i64 %123, -1
  %125 = xor i64 %94, -1
  %126 = add nsw i64 %_arg_size_, %125
  %127 = tail call i64 @llvm.smin.i64(i64 %126, i64 1023)
  %polly.loop_guard545 = icmp sgt i64 %126, -1
  %128 = xor i64 %94, -1
  %129 = add nsw i64 %_arg_size_, %128
  %130 = tail call i64 @llvm.smin.i64(i64 %129, i64 1023)
  %polly.loop_guard461 = icmp sgt i64 %129, -1
  %131 = xor i64 %94, -1
  %132 = add nsw i64 %_arg_size_, %131
  %133 = tail call i64 @llvm.smin.i64(i64 %132, i64 1023)
  %polly.loop_guard433 = icmp sgt i64 %132, -1
  %134 = xor i64 %94, -1
  %135 = add nsw i64 %_arg_size_, %134
  %136 = tail call i64 @llvm.smin.i64(i64 %135, i64 1023)
  %polly.loop_guard630 = icmp sgt i64 %135, -1
  br label %polly.loop_if144

polly.loop_if144:                                 ; preds = %polly.loop_preheader139, %polly.merge349
  %polly.indvar141 = phi i64 [ 0, %polly.loop_preheader139 ], [ %polly.indvar_next142, %polly.merge349 ]
  %137 = mul nuw nsw i64 %polly.indvar141, 48
  %138 = add nuw nsw i64 %137, 47
  %139 = tail call i64 @llvm.smin.i64(i64 %.res, i64 %138)
  %polly.loop_guard148.not.not = icmp sgt i64 %_arg_size_, %137
  br i1 %polly.loop_guard148.not.not, label %polly.loop_if152.preheader, label %polly.cond

polly.loop_if152.preheader:                       ; preds = %polly.loop_if144
  %140 = mul i64 %polly.indvar141, 2251799813685224
  br label %polly.loop_if152

polly.loop_exit155:                               ; preds = %polly.loop_header153, %polly.loop_if152
  %polly.indvar_next150 = add nuw nsw i64 %polly.indvar149, 1
  %polly.loop_cond151.not.not = icmp slt i64 %polly.indvar149, %139
  br i1 %polly.loop_cond151.not.not, label %polly.loop_if152, label %polly.cond

polly.loop_if152:                                 ; preds = %polly.loop_if152.preheader, %polly.loop_exit155
  %polly.indvar149 = phi i64 [ %polly.indvar_next150, %polly.loop_exit155 ], [ %137, %polly.loop_if152.preheader ]
  br i1 %polly.loop_guard119.not.not, label %polly.loop_header153.preheader, label %polly.loop_exit155

polly.loop_header153.preheader:                   ; preds = %polly.loop_if152
  %polly.access.mul.160 = mul nuw nsw i64 %polly.indvar149, %_arg_size_
  %141 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %polly.access.mul.160
  %pexp.p_div_q163730 = lshr i64 %polly.indvar149, 1
  %142 = add i64 %140, %pexp.p_div_q163730
  %pexp.pdiv_r165 = and i64 %polly.indvar149, 1
  %.idx731 = shl i64 %142, 13
  %143 = getelementptr i8, ptr %Packed_A, i64 %.idx731
  %invariant.gep = getelementptr float, ptr %143, i64 %pexp.pdiv_r165
  br label %polly.loop_header153

polly.loop_header153:                             ; preds = %polly.loop_header153.preheader, %polly.loop_header153
  %polly.indvar157 = phi i64 [ %polly.indvar_next158, %polly.loop_header153 ], [ %94, %polly.loop_header153.preheader ]
  %polly.access.162 = getelementptr float, ptr addrspace(1) %141, i64 %polly.indvar157
  %polly.access.162.load = load float, ptr addrspace(1) %polly.access.162, align 4, !alias.scope !63, !noalias !64
  %144 = shl nuw i64 %polly.indvar157, 1
  %145 = sub i64 %144, %115
  %gep = getelementptr float, ptr %invariant.gep, i64 %145
  store float %polly.access.162.load, ptr %gep, align 4, !alias.scope !65, !noalias !66
  %polly.indvar_next158 = add nuw nsw i64 %polly.indvar157, 1
  %polly.loop_cond159.not.not = icmp slt i64 %polly.indvar157, %96
  br i1 %polly.loop_cond159.not.not, label %polly.loop_header153, label %polly.loop_exit155

polly.loop_if177.preheader:                       ; preds = %polly.cond
  %146 = mul nsw i64 %polly.indvar141, -24
  %147 = add nsw i64 %146, %pexp.p_div_q176732
  %148 = tail call i64 @llvm.smin.i64(i64 %147, i64 24)
  %149 = add nsw i64 %148, -1
  %polly.loop_guard181 = icmp sgt i64 %147, 0
  %150 = icmp slt i64 %138, %_arg_size_
  %.not762 = or i1 %150, %29
  %.neg = mul i64 %polly.indvar141, 2251799813685224
  %151 = add i64 %.neg, %pexp.div
  %.idx733 = shl i64 %151, 13
  %152 = getelementptr i8, ptr %Packed_A, i64 %.idx733
  br label %polly.loop_if177

polly.cond286:                                    ; preds = %polly.loop_exit188, %polly.loop_if177
  %brmerge757 = select i1 %.not762, i1 true, i1 %polly.loop_guard294
  br i1 %brmerge757, label %polly.merge287, label %polly.stmt.for.body18.i331.preheader

polly.merge287.loopexit:                          ; preds = %polly.stmt.for.body18.i331
  store float %p_313, ptr addrspace(1) %scevgep311, align 4, !alias.scope !51, !noalias !54
  store float %p_330, ptr addrspace(1) %scevgep328, align 4, !alias.scope !51, !noalias !54
  store float %p_347, ptr addrspace(1) %scevgep345, align 4, !alias.scope !51, !noalias !54
  br label %polly.merge287

polly.merge287:                                   ; preds = %polly.cond286, %polly.merge287.loopexit
  %polly.indvar_next174 = add nuw nsw i64 %polly.indvar173, 1
  %polly.loop_cond175.not.not = icmp slt i64 %polly.indvar173, %70
  br i1 %polly.loop_cond175.not.not, label %polly.loop_if177, label %polly.cond348

polly.loop_if177:                                 ; preds = %polly.loop_if177.preheader, %polly.merge287
  %polly.indvar173 = phi i64 [ %polly.indvar_next174, %polly.merge287 ], [ 0, %polly.loop_if177.preheader ]
  br i1 %polly.loop_guard181, label %polly.loop_if185.preheader, label %polly.cond286

polly.loop_if185.preheader:                       ; preds = %polly.loop_if177
  %153 = mul nuw nsw i64 %polly.indvar173, 3
  %154 = add nuw nsw i64 %71, %153
  %polly.access.mul.Packed_B198 = shl nsw i64 %polly.indvar173, 10
  %155 = shl i64 %154, 2
  %156 = add i64 %155, 4
  %157 = add i64 %155, 8
  br label %polly.loop_if185

polly.loop_exit188:                               ; preds = %polly.stmt.for.body18.i270, %polly.loop_if185
  %polly.indvar_next183 = add nuw nsw i64 %polly.indvar182, 1
  %polly.loop_cond184.not.not = icmp slt i64 %polly.indvar182, %149
  br i1 %polly.loop_cond184.not.not, label %polly.loop_if185, label %polly.cond286

polly.loop_if185:                                 ; preds = %polly.loop_if185.preheader, %polly.loop_exit188
  %polly.indvar182 = phi i64 [ %polly.indvar_next183, %polly.loop_exit188 ], [ 0, %polly.loop_if185.preheader ]
  br i1 %polly.loop_guard189, label %polly.stmt.for.body18.i270.preheader, label %polly.loop_exit188

polly.stmt.for.body18.i270.preheader:             ; preds = %polly.loop_if185
  %158 = shl nuw nsw i64 %polly.indvar182, 1
  %159 = add nuw nsw i64 %137, %158
  %.idx741 = shl i64 %polly.indvar182, 13
  %160 = getelementptr i8, ptr %Packed_A, i64 %.idx741
  %161 = mul i64 %27, %159
  %162 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %161
  %scevgep204 = getelementptr i8, ptr addrspace(1) %162, i64 %155
  %scevgep219 = getelementptr i8, ptr addrspace(1) %162, i64 %156
  %scevgep235 = getelementptr i8, ptr addrspace(1) %162, i64 %157
  %163 = or disjoint i64 %159, 1
  %164 = mul i64 %27, %163
  %165 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %164
  %scevgep251 = getelementptr i8, ptr addrspace(1) %165, i64 %155
  %scevgep267 = getelementptr i8, ptr addrspace(1) %165, i64 %156
  %scevgep283 = getelementptr i8, ptr addrspace(1) %165, i64 %157
  br label %polly.stmt.for.body18.i270

polly.stmt.for.body18.i270:                       ; preds = %polly.stmt.for.body18.i270.preheader, %polly.stmt.for.body18.i270
  %polly.indvar190 = phi i64 [ %polly.indvar_next191, %polly.stmt.for.body18.i270 ], [ 0, %polly.stmt.for.body18.i270.preheader ]
  %polly.access.Packed_A197.idx = shl i64 %polly.indvar190, 3
  %polly.access.Packed_A197 = getelementptr i8, ptr %160, i64 %polly.access.Packed_A197.idx
  %_p_scalar_ = load float, ptr %polly.access.Packed_A197, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B199 = add nuw nsw i64 %polly.access.mul.Packed_B198, %polly.indvar190
  %polly.access.Packed_B202.idx = mul i64 %polly.access.add.Packed_B199, 12
  %polly.access.Packed_B202 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B202.idx
  %_p_scalar_203 = load float, ptr %polly.access.Packed_B202, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_205 = load float, ptr addrspace(1) %scevgep204, align 4, !alias.scope !51, !noalias !54
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_203, float %_p_scalar_205)
  store float %p_, ptr addrspace(1) %scevgep204, align 4, !alias.scope !51, !noalias !54
  %polly.access.Packed_B217 = getelementptr i8, ptr %polly.access.Packed_B202, i64 4
  %_p_scalar_218 = load float, ptr %polly.access.Packed_B217, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_220 = load float, ptr addrspace(1) %scevgep219, align 4, !alias.scope !51, !noalias !54
  %p_221 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_218, float %_p_scalar_220)
  store float %p_221, ptr addrspace(1) %scevgep219, align 4, !alias.scope !51, !noalias !54
  %polly.access.Packed_B233 = getelementptr i8, ptr %polly.access.Packed_B202, i64 8
  %_p_scalar_234 = load float, ptr %polly.access.Packed_B233, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_236 = load float, ptr addrspace(1) %scevgep235, align 4, !alias.scope !51, !noalias !54
  %p_237 = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_234, float %_p_scalar_236)
  store float %p_237, ptr addrspace(1) %scevgep235, align 4, !alias.scope !51, !noalias !54
  %polly.access.Packed_A243 = getelementptr i8, ptr %polly.access.Packed_A197, i64 4
  %_p_scalar_244 = load float, ptr %polly.access.Packed_A243, align 4, !alias.scope !65, !noalias !66
  %_p_scalar_252 = load float, ptr addrspace(1) %scevgep251, align 4, !alias.scope !51, !noalias !54
  %p_253 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_203, float %_p_scalar_252)
  store float %p_253, ptr addrspace(1) %scevgep251, align 4, !alias.scope !51, !noalias !54
  %_p_scalar_268 = load float, ptr addrspace(1) %scevgep267, align 4, !alias.scope !51, !noalias !54
  %p_269 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_218, float %_p_scalar_268)
  store float %p_269, ptr addrspace(1) %scevgep267, align 4, !alias.scope !51, !noalias !54
  %_p_scalar_284 = load float, ptr addrspace(1) %scevgep283, align 4, !alias.scope !51, !noalias !54
  %p_285 = tail call float @llvm.fmuladd.f32(float %_p_scalar_244, float %_p_scalar_234, float %_p_scalar_284)
  store float %p_285, ptr addrspace(1) %scevgep283, align 4, !alias.scope !51, !noalias !54
  %polly.indvar_next191 = add nuw nsw i64 %polly.indvar190, 1
  %polly.loop_cond192.not.not = icmp slt i64 %polly.indvar190, %118
  br i1 %polly.loop_cond192.not.not, label %polly.stmt.for.body18.i270, label %polly.loop_exit188, !llvm.loop !67

polly.stmt.for.body18.i331.preheader:             ; preds = %polly.cond286
  %166 = mul nuw nsw i64 %polly.indvar173, 3
  %167 = add nuw nsw i64 %72, %166
  %polly.access.mul.Packed_B305 = shl nsw i64 %polly.indvar173, 10
  %168 = shl i64 %167, 2
  %scevgep311 = getelementptr i8, ptr addrspace(1) %31, i64 %168
  %scevgep328 = getelementptr i8, ptr addrspace(1) %scevgep311, i64 4
  %scevgep345 = getelementptr i8, ptr addrspace(1) %scevgep311, i64 8
  %scevgep311.promoted = load float, ptr addrspace(1) %scevgep311, align 4, !alias.scope !51, !noalias !54
  %scevgep328.promoted = load float, ptr addrspace(1) %scevgep328, align 4, !alias.scope !51, !noalias !54
  %scevgep345.promoted = load float, ptr addrspace(1) %scevgep345, align 4, !alias.scope !51, !noalias !54
  br label %polly.stmt.for.body18.i331

polly.stmt.for.body18.i331:                       ; preds = %polly.stmt.for.body18.i331.preheader, %polly.stmt.for.body18.i331
  %p_347748 = phi float [ %p_347, %polly.stmt.for.body18.i331 ], [ %scevgep345.promoted, %polly.stmt.for.body18.i331.preheader ]
  %p_330747 = phi float [ %p_330, %polly.stmt.for.body18.i331 ], [ %scevgep328.promoted, %polly.stmt.for.body18.i331.preheader ]
  %_p_scalar_312746 = phi float [ %p_313, %polly.stmt.for.body18.i331 ], [ %scevgep311.promoted, %polly.stmt.for.body18.i331.preheader ]
  %polly.indvar295 = phi i64 [ %polly.indvar_next296, %polly.stmt.for.body18.i331 ], [ 0, %polly.stmt.for.body18.i331.preheader ]
  %polly.access.Packed_A303.idx = shl i64 %polly.indvar295, 3
  %polly.access.Packed_A303 = getelementptr i8, ptr %152, i64 %polly.access.Packed_A303.idx
  %_p_scalar_304 = load float, ptr %polly.access.Packed_A303, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B306 = add nuw nsw i64 %polly.access.mul.Packed_B305, %polly.indvar295
  %polly.access.Packed_B309.idx = mul i64 %polly.access.add.Packed_B306, 12
  %polly.access.Packed_B309 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B309.idx
  %_p_scalar_310 = load float, ptr %polly.access.Packed_B309, align 4, !alias.scope !61, !noalias !62
  %p_313 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_310, float %_p_scalar_312746)
  %polly.access.Packed_B326 = getelementptr i8, ptr %polly.access.Packed_B309, i64 4
  %_p_scalar_327 = load float, ptr %polly.access.Packed_B326, align 4, !alias.scope !61, !noalias !62
  %p_330 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_327, float %p_330747)
  %polly.access.Packed_B343 = getelementptr i8, ptr %polly.access.Packed_B309, i64 8
  %_p_scalar_344 = load float, ptr %polly.access.Packed_B343, align 4, !alias.scope !61, !noalias !62
  %p_347 = tail call float @llvm.fmuladd.f32(float %_p_scalar_304, float %_p_scalar_344, float %p_347748)
  %polly.indvar_next296 = add nuw nsw i64 %polly.indvar295, 1
  %polly.loop_cond297.not.not = icmp slt i64 %polly.indvar295, %121
  br i1 %polly.loop_cond297.not.not, label %polly.stmt.for.body18.i331, label %polly.merge287.loopexit, !llvm.loop !68

polly.cond354:                                    ; preds = %polly.cond348
  %brmerge759.not = select i1 %113, i1 %polly.loop_guard363, i1 false
  br i1 %brmerge759.not, label %polly.loop_if367, label %polly.cond420

polly.cond420:                                    ; preds = %polly.cond354, %polly.loop_exit370
  br i1 %84, label %polly.cond425, label %polly.merge349

polly.loop_exit370.loopexit:                      ; preds = %polly.stmt.for.body18.i405
  store float %p_389, ptr addrspace(1) %scevgep387, align 4, !alias.scope !51, !noalias !54
  store float %p_404, ptr addrspace(1) %scevgep402, align 4, !alias.scope !51, !noalias !54
  store float %p_419, ptr addrspace(1) %scevgep417, align 4, !alias.scope !51, !noalias !54
  br label %polly.loop_exit370

polly.loop_exit370:                               ; preds = %polly.loop_exit370.loopexit, %polly.loop_if367
  %polly.indvar_next365 = add nuw nsw i64 %polly.indvar364, 1
  %polly.loop_cond366.not.not = icmp slt i64 %polly.indvar364, %83
  br i1 %polly.loop_cond366.not.not, label %polly.loop_if367, label %polly.cond420

polly.loop_if367:                                 ; preds = %polly.cond354, %polly.loop_exit370
  %polly.indvar364 = phi i64 [ %polly.indvar_next365, %polly.loop_exit370 ], [ 0, %polly.cond354 ]
  br i1 %polly.loop_guard371, label %polly.stmt.for.body18.i405.preheader, label %polly.loop_exit370

polly.stmt.for.body18.i405.preheader:             ; preds = %polly.loop_if367
  %169 = mul nuw nsw i64 %polly.indvar364, 3
  %170 = add nuw nsw i64 %73, %169
  %polly.access.mul.Packed_B381 = shl nsw i64 %polly.indvar364, 10
  %171 = shl i64 %170, 2
  %scevgep387 = getelementptr i8, ptr addrspace(1) %36, i64 %171
  %scevgep402 = getelementptr i8, ptr addrspace(1) %scevgep387, i64 4
  %scevgep417 = getelementptr i8, ptr addrspace(1) %scevgep387, i64 8
  %scevgep387.promoted = load float, ptr addrspace(1) %scevgep387, align 4, !alias.scope !51, !noalias !54
  %scevgep402.promoted = load float, ptr addrspace(1) %scevgep402, align 4, !alias.scope !51, !noalias !54
  %scevgep417.promoted = load float, ptr addrspace(1) %scevgep417, align 4, !alias.scope !51, !noalias !54
  br label %polly.stmt.for.body18.i405

polly.stmt.for.body18.i405:                       ; preds = %polly.stmt.for.body18.i405.preheader, %polly.stmt.for.body18.i405
  %p_419751 = phi float [ %p_419, %polly.stmt.for.body18.i405 ], [ %scevgep417.promoted, %polly.stmt.for.body18.i405.preheader ]
  %p_404750 = phi float [ %p_404, %polly.stmt.for.body18.i405 ], [ %scevgep402.promoted, %polly.stmt.for.body18.i405.preheader ]
  %_p_scalar_388749 = phi float [ %p_389, %polly.stmt.for.body18.i405 ], [ %scevgep387.promoted, %polly.stmt.for.body18.i405.preheader ]
  %polly.indvar372 = phi i64 [ %polly.indvar_next373, %polly.stmt.for.body18.i405 ], [ 0, %polly.stmt.for.body18.i405.preheader ]
  %polly.access.Packed_A379.idx = shl i64 %polly.indvar372, 3
  %polly.access.Packed_A379 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A379.idx
  %_p_scalar_380 = load float, ptr %polly.access.Packed_A379, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B382 = add nuw nsw i64 %polly.access.mul.Packed_B381, %polly.indvar372
  %polly.access.Packed_B385.idx = mul i64 %polly.access.add.Packed_B382, 12
  %polly.access.Packed_B385 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B385.idx
  %_p_scalar_386 = load float, ptr %polly.access.Packed_B385, align 4, !alias.scope !61, !noalias !62
  %p_389 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_386, float %_p_scalar_388749)
  %polly.access.Packed_B400 = getelementptr i8, ptr %polly.access.Packed_B385, i64 4
  %_p_scalar_401 = load float, ptr %polly.access.Packed_B400, align 4, !alias.scope !61, !noalias !62
  %p_404 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_401, float %p_404750)
  %polly.access.Packed_B415 = getelementptr i8, ptr %polly.access.Packed_B385, i64 8
  %_p_scalar_416 = load float, ptr %polly.access.Packed_B415, align 4, !alias.scope !61, !noalias !62
  %p_419 = tail call float @llvm.fmuladd.f32(float %_p_scalar_380, float %_p_scalar_416, float %p_419751)
  %polly.indvar_next373 = add nuw nsw i64 %polly.indvar372, 1
  %polly.loop_cond374.not.not = icmp slt i64 %polly.indvar372, %124
  br i1 %polly.loop_cond374.not.not, label %polly.stmt.for.body18.i405, label %polly.loop_exit370.loopexit, !llvm.loop !69

polly.cond425:                                    ; preds = %polly.cond420
  %172 = and i1 %86, %113
  br i1 %172, label %polly.loop_if429, label %polly.cond453

polly.cond453:                                    ; preds = %polly.cond425
  %173 = and i1 %88, %103
  br i1 %173, label %polly.loop_if457, label %polly.loop_if541

polly.loop_if429:                                 ; preds = %polly.cond425
  br i1 %polly.loop_guard433, label %polly.stmt.for.body18.i437.preheader, label %polly.loop_if618

polly.stmt.for.body18.i437.preheader:             ; preds = %polly.loop_if429
  %scevgep450.promoted = load float, ptr addrspace(1) %scevgep450, align 4, !alias.scope !51, !noalias !54
  br label %polly.stmt.for.body18.i437

polly.stmt.for.body18.i437:                       ; preds = %polly.stmt.for.body18.i437.preheader, %polly.stmt.for.body18.i437
  %p_452752 = phi float [ %p_452, %polly.stmt.for.body18.i437 ], [ %scevgep450.promoted, %polly.stmt.for.body18.i437.preheader ]
  %polly.indvar434 = phi i64 [ %polly.indvar_next435, %polly.stmt.for.body18.i437 ], [ 0, %polly.stmt.for.body18.i437.preheader ]
  %polly.access.Packed_A441.idx = shl i64 %polly.indvar434, 3
  %polly.access.Packed_A441 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A441.idx
  %_p_scalar_442 = load float, ptr %polly.access.Packed_A441, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B445 = add nsw i64 %polly.access.mul.Packed_B444, %polly.indvar434
  %polly.access.Packed_B448.idx = mul i64 %polly.access.add.Packed_B445, 12
  %polly.access.Packed_B448 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B448.idx
  %_p_scalar_449 = load float, ptr %polly.access.Packed_B448, align 4, !alias.scope !61, !noalias !62
  %p_452 = tail call float @llvm.fmuladd.f32(float %_p_scalar_442, float %_p_scalar_449, float %p_452752)
  %polly.indvar_next435 = add nuw nsw i64 %polly.indvar434, 1
  %polly.loop_cond436.not.not = icmp slt i64 %polly.indvar434, %133
  br i1 %polly.loop_cond436.not.not, label %polly.stmt.for.body18.i437, label %polly.loop_if618.loopexit, !llvm.loop !70

polly.loop_if457:                                 ; preds = %polly.cond453
  br i1 %polly.loop_guard461, label %polly.cond482.preheader, label %polly.loop_if618

polly.cond482.preheader:                          ; preds = %polly.loop_if457
  %174 = mul i64 %27, %137
  %175 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %174
  %scevgep479 = getelementptr i8, ptr addrspace(1) %175, i64 %42
  %176 = mul i64 %27, %112
  %gep754 = getelementptr i8, ptr addrspace(1) %invariant.gep753, i64 %176
  %scevgep500 = getelementptr i8, ptr addrspace(1) %175, i64 %47
  %177 = mul i64 %27, %112
  %178 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %177
  %scevgep517 = getelementptr i8, ptr addrspace(1) %178, i64 %42
  %scevgep538 = getelementptr i8, ptr addrspace(1) %178, i64 %47
  br label %polly.cond482

polly.cond482:                                    ; preds = %polly.cond482.preheader, %polly.merge521
  %polly.indvar462 = phi i64 [ %polly.indvar_next463, %polly.merge521 ], [ 0, %polly.cond482.preheader ]
  %polly.access.Packed_A470.idx = shl i64 %polly.indvar462, 3
  %polly.access.Packed_A470 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A470.idx
  %_p_scalar_471 = load float, ptr %polly.access.Packed_A470, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B474 = add nsw i64 %polly.access.mul.Packed_B473, %polly.indvar462
  %polly.access.Packed_B477.idx = mul i64 %polly.access.add.Packed_B474, 12
  %polly.access.Packed_B477 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B477.idx
  %_p_scalar_478 = load float, ptr %polly.access.Packed_B477, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_480 = load float, ptr addrspace(1) %scevgep479, align 4, !alias.scope !51, !noalias !54
  %p_481 = tail call float @llvm.fmuladd.f32(float %_p_scalar_471, float %_p_scalar_478, float %_p_scalar_480)
  store float %p_481, ptr addrspace(1) %scevgep479, align 4, !alias.scope !51, !noalias !54
  br i1 %44, label %polly.stmt.for.body18.i487, label %polly.merge521.critedge

polly.merge521.critedge:                          ; preds = %polly.cond482
  %polly.access.Packed_A508.c = getelementptr i8, ptr %polly.access.Packed_A470, i64 4
  %_p_scalar_509.c = load float, ptr %polly.access.Packed_A508.c, align 4, !alias.scope !65, !noalias !66
  %_p_scalar_518.c = load float, ptr addrspace(1) %gep754, align 4, !alias.scope !51, !noalias !54
  %p_519.c = tail call float @llvm.fmuladd.f32(float %_p_scalar_509.c, float %_p_scalar_478, float %_p_scalar_518.c)
  store float %p_519.c, ptr addrspace(1) %gep754, align 4, !alias.scope !51, !noalias !54
  br label %polly.merge521

polly.merge521:                                   ; preds = %polly.merge521.critedge, %polly.stmt.for.body18.i487
  %polly.indvar_next463 = add nuw nsw i64 %polly.indvar462, 1
  %polly.loop_cond464.not.not = icmp slt i64 %polly.indvar462, %130
  br i1 %polly.loop_cond464.not.not, label %polly.cond482, label %polly.loop_if618, !llvm.loop !71

polly.stmt.for.body18.i487:                       ; preds = %polly.cond482
  %polly.access.add.Packed_B495 = add nsw i64 %polly.access.mul.Packed_B494, %polly.indvar462
  %.idx734 = mul i64 %polly.access.add.Packed_B495, 12
  %179 = getelementptr i8, ptr %Packed_B, i64 %.idx734
  %polly.access.Packed_B498 = getelementptr i8, ptr %179, i64 4
  %_p_scalar_499 = load float, ptr %polly.access.Packed_B498, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_501 = load float, ptr addrspace(1) %scevgep500, align 4, !alias.scope !51, !noalias !54
  %p_502 = tail call float @llvm.fmuladd.f32(float %_p_scalar_471, float %_p_scalar_499, float %_p_scalar_501)
  store float %p_502, ptr addrspace(1) %scevgep500, align 4, !alias.scope !51, !noalias !54
  %polly.access.Packed_A508 = getelementptr i8, ptr %polly.access.Packed_A470, i64 4
  %_p_scalar_509 = load float, ptr %polly.access.Packed_A508, align 4, !alias.scope !65, !noalias !66
  %_p_scalar_518 = load float, ptr addrspace(1) %scevgep517, align 4, !alias.scope !51, !noalias !54
  %p_519 = tail call float @llvm.fmuladd.f32(float %_p_scalar_509, float %_p_scalar_478, float %_p_scalar_518)
  store float %p_519, ptr addrspace(1) %scevgep517, align 4, !alias.scope !51, !noalias !54
  %_p_scalar_539 = load float, ptr addrspace(1) %scevgep538, align 4, !alias.scope !51, !noalias !54
  %p_540 = tail call float @llvm.fmuladd.f32(float %_p_scalar_509, float %_p_scalar_499, float %_p_scalar_539)
  store float %p_540, ptr addrspace(1) %scevgep538, align 4, !alias.scope !51, !noalias !54
  br label %polly.merge521

polly.loop_if541:                                 ; preds = %polly.cond453
  br i1 %polly.loop_guard545, label %polly.cond563.preheader, label %polly.loop_if618

polly.cond563.preheader:                          ; preds = %polly.loop_if541
  %180 = mul i64 %27, %137
  %181 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %180
  %scevgep560 = getelementptr i8, ptr addrspace(1) %181, i64 %89
  %scevgep578 = getelementptr i8, ptr addrspace(1) %181, i64 %37
  %182 = mul i64 %27, %112
  %183 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %182
  %scevgep596 = getelementptr i8, ptr addrspace(1) %183, i64 %89
  %scevgep614 = getelementptr i8, ptr addrspace(1) %183, i64 %38
  br label %polly.cond563

polly.cond563:                                    ; preds = %polly.cond563.preheader, %polly.merge582
  %polly.indvar546 = phi i64 [ %polly.indvar_next547, %polly.merge582 ], [ 0, %polly.cond563.preheader ]
  %polly.access.Packed_A553.idx = shl i64 %polly.indvar546, 3
  %polly.access.Packed_A553 = getelementptr i8, ptr %Packed_A, i64 %polly.access.Packed_A553.idx
  %_p_scalar_554 = load float, ptr %polly.access.Packed_A553, align 4, !alias.scope !65, !noalias !66
  %polly.access.Packed_B558.idx = mul i64 %polly.indvar546, 12
  %polly.access.Packed_B558 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B558.idx
  %_p_scalar_559 = load float, ptr %polly.access.Packed_B558, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_561 = load float, ptr addrspace(1) %scevgep560, align 4, !alias.scope !51, !noalias !54
  %p_562 = tail call float @llvm.fmuladd.f32(float %_p_scalar_554, float %_p_scalar_559, float %_p_scalar_561)
  store float %p_562, ptr addrspace(1) %scevgep560, align 4, !alias.scope !51, !noalias !54
  br i1 %90, label %polly.stmt.for.body18.i567, label %polly.cond581

polly.cond581:                                    ; preds = %polly.cond563, %polly.stmt.for.body18.i567
  br i1 %103, label %polly.cond599, label %polly.merge582

polly.merge582:                                   ; preds = %polly.cond599, %polly.cond581, %polly.stmt.for.body18.i603
  %polly.indvar_next547 = add nuw nsw i64 %polly.indvar546, 1
  %polly.loop_cond548.not.not = icmp slt i64 %polly.indvar546, %127
  br i1 %polly.loop_cond548.not.not, label %polly.cond563, label %polly.loop_if618, !llvm.loop !72

polly.stmt.for.body18.i567:                       ; preds = %polly.cond563
  %polly.access.Packed_B576 = getelementptr i8, ptr %polly.access.Packed_B558, i64 4
  %_p_scalar_577 = load float, ptr %polly.access.Packed_B576, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_579 = load float, ptr addrspace(1) %scevgep578, align 4, !alias.scope !51, !noalias !54
  %p_580 = tail call float @llvm.fmuladd.f32(float %_p_scalar_554, float %_p_scalar_577, float %_p_scalar_579)
  store float %p_580, ptr addrspace(1) %scevgep578, align 4, !alias.scope !51, !noalias !54
  br label %polly.cond581

polly.cond599:                                    ; preds = %polly.cond581
  %polly.access.Packed_A589 = getelementptr i8, ptr %polly.access.Packed_A553, i64 4
  %_p_scalar_590 = load float, ptr %polly.access.Packed_A589, align 4, !alias.scope !65, !noalias !66
  %_p_scalar_597 = load float, ptr addrspace(1) %scevgep596, align 4, !alias.scope !51, !noalias !54
  %p_598 = tail call float @llvm.fmuladd.f32(float %_p_scalar_590, float %_p_scalar_559, float %_p_scalar_597)
  store float %p_598, ptr addrspace(1) %scevgep596, align 4, !alias.scope !51, !noalias !54
  br i1 %90, label %polly.stmt.for.body18.i603, label %polly.merge582

polly.stmt.for.body18.i603:                       ; preds = %polly.cond599
  %polly.access.Packed_B612 = getelementptr i8, ptr %polly.access.Packed_B558, i64 4
  %_p_scalar_613 = load float, ptr %polly.access.Packed_B612, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_615 = load float, ptr addrspace(1) %scevgep614, align 4, !alias.scope !51, !noalias !54
  %p_616 = tail call float @llvm.fmuladd.f32(float %_p_scalar_590, float %_p_scalar_613, float %_p_scalar_615)
  store float %p_616, ptr addrspace(1) %scevgep614, align 4, !alias.scope !51, !noalias !54
  br label %polly.merge582

polly.loop_if618.loopexit:                        ; preds = %polly.stmt.for.body18.i437
  store float %p_452, ptr addrspace(1) %scevgep450, align 4, !alias.scope !51, !noalias !54
  br label %polly.loop_if618

polly.loop_if618:                                 ; preds = %polly.merge582, %polly.merge521, %polly.loop_if618.loopexit, %polly.loop_if429, %polly.loop_if457, %polly.loop_if541
  %184 = mul nsw i64 %polly.indvar141, -24
  %185 = add nsw i64 %184, %pexp.p_div_q617736
  %186 = tail call i64 @llvm.smin.i64(i64 %185, i64 24)
  %187 = add nsw i64 %186, -1
  %polly.loop_guard622 = icmp sgt i64 %185, 1
  br i1 %polly.loop_guard622, label %polly.loop_if626, label %polly.merge349

polly.loop_exit629:                               ; preds = %polly.merge675, %polly.loop_if626
  %polly.indvar_next624 = add nuw nsw i64 %polly.indvar623, 1
  %polly.loop_cond625.not.not = icmp slt i64 %polly.indvar623, %187
  br i1 %polly.loop_cond625.not.not, label %polly.loop_if626, label %polly.merge349

polly.loop_if626:                                 ; preds = %polly.loop_if618, %polly.loop_exit629
  %polly.indvar623 = phi i64 [ %polly.indvar_next624, %polly.loop_exit629 ], [ 1, %polly.loop_if618 ]
  br i1 %polly.loop_guard630, label %polly.cond652.preheader, label %polly.loop_exit629

polly.cond652.preheader:                          ; preds = %polly.loop_if626
  %188 = shl nuw nsw i64 %polly.indvar623, 1
  %189 = add nuw nsw i64 %137, %188
  %.idx742 = shl i64 %polly.indvar623, 13
  %190 = getelementptr i8, ptr %Packed_A, i64 %.idx742
  %191 = mul i64 %27, %189
  %192 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %191
  %scevgep649 = getelementptr i8, ptr addrspace(1) %192, i64 %55
  %scevgep671 = getelementptr i8, ptr addrspace(1) %192, i64 %59
  %193 = add nuw nsw i64 %189, 2
  %.not = icmp slt i64 %_arg_size_, %193
  %194 = or disjoint i64 %189, 1
  %195 = mul i64 %27, %194
  %196 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %195
  %scevgep694 = getelementptr i8, ptr addrspace(1) %196, i64 %55
  %scevgep716 = getelementptr i8, ptr addrspace(1) %196, i64 %62
  br label %polly.cond652

polly.cond652:                                    ; preds = %polly.cond652.preheader, %polly.merge675
  %polly.indvar631 = phi i64 [ %polly.indvar_next632, %polly.merge675 ], [ 0, %polly.cond652.preheader ]
  %polly.access.Packed_A640.idx = shl i64 %polly.indvar631, 3
  %polly.access.Packed_A640 = getelementptr i8, ptr %190, i64 %polly.access.Packed_A640.idx
  %_p_scalar_641 = load float, ptr %polly.access.Packed_A640, align 4, !alias.scope !65, !noalias !66
  %polly.access.add.Packed_B644 = add nsw i64 %polly.access.mul.Packed_B643, %polly.indvar631
  %polly.access.Packed_B647.idx = mul i64 %polly.access.add.Packed_B644, 12
  %polly.access.Packed_B647 = getelementptr i8, ptr %Packed_B, i64 %polly.access.Packed_B647.idx
  %_p_scalar_648 = load float, ptr %polly.access.Packed_B647, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_650 = load float, ptr addrspace(1) %scevgep649, align 4, !alias.scope !51, !noalias !54
  %p_651 = tail call float @llvm.fmuladd.f32(float %_p_scalar_641, float %_p_scalar_648, float %_p_scalar_650)
  store float %p_651, ptr addrspace(1) %scevgep649, align 4, !alias.scope !51, !noalias !54
  br i1 %56, label %polly.stmt.for.body18.i657, label %polly.cond674

polly.cond674:                                    ; preds = %polly.cond652, %polly.stmt.for.body18.i657
  br i1 %.not, label %polly.merge675, label %polly.cond697

polly.merge675:                                   ; preds = %polly.cond697, %polly.cond674, %polly.stmt.for.body18.i702
  %polly.indvar_next632 = add nuw nsw i64 %polly.indvar631, 1
  %polly.loop_cond633.not.not = icmp slt i64 %polly.indvar631, %136
  br i1 %polly.loop_cond633.not.not, label %polly.cond652, label %polly.loop_exit629, !llvm.loop !73

polly.stmt.for.body18.i657:                       ; preds = %polly.cond652
  %polly.access.add.Packed_B666 = add nsw i64 %polly.access.mul.Packed_B665, %polly.indvar631
  %.idx737 = mul i64 %polly.access.add.Packed_B666, 12
  %197 = getelementptr i8, ptr %Packed_B, i64 %.idx737
  %polly.access.Packed_B669 = getelementptr i8, ptr %197, i64 4
  %_p_scalar_670 = load float, ptr %polly.access.Packed_B669, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_672 = load float, ptr addrspace(1) %scevgep671, align 4, !alias.scope !51, !noalias !54
  %p_673 = tail call float @llvm.fmuladd.f32(float %_p_scalar_641, float %_p_scalar_670, float %_p_scalar_672)
  store float %p_673, ptr addrspace(1) %scevgep671, align 4, !alias.scope !51, !noalias !54
  br label %polly.cond674

polly.cond697:                                    ; preds = %polly.cond674
  %polly.access.Packed_A685 = getelementptr i8, ptr %polly.access.Packed_A640, i64 4
  %_p_scalar_686 = load float, ptr %polly.access.Packed_A685, align 4, !alias.scope !65, !noalias !66
  %_p_scalar_695 = load float, ptr addrspace(1) %scevgep694, align 4, !alias.scope !51, !noalias !54
  %p_696 = tail call float @llvm.fmuladd.f32(float %_p_scalar_686, float %_p_scalar_648, float %_p_scalar_695)
  store float %p_696, ptr addrspace(1) %scevgep694, align 4, !alias.scope !51, !noalias !54
  br i1 %56, label %polly.stmt.for.body18.i702, label %polly.merge675

polly.stmt.for.body18.i702:                       ; preds = %polly.cond697
  %polly.access.add.Packed_B711 = add nsw i64 %polly.access.mul.Packed_B710, %polly.indvar631
  %.idx738 = mul i64 %polly.access.add.Packed_B711, 12
  %198 = getelementptr i8, ptr %Packed_B, i64 %.idx738
  %polly.access.Packed_B714 = getelementptr i8, ptr %198, i64 4
  %_p_scalar_715 = load float, ptr %polly.access.Packed_B714, align 4, !alias.scope !61, !noalias !62
  %_p_scalar_717 = load float, ptr addrspace(1) %scevgep716, align 4, !alias.scope !51, !noalias !54
  %p_718 = tail call float @llvm.fmuladd.f32(float %_p_scalar_686, float %_p_scalar_715, float %_p_scalar_717)
  store float %p_718, ptr addrspace(1) %scevgep716, align 4, !alias.scope !51, !noalias !54
  br label %polly.merge675
}

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #2

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #2

; Function Attrs: nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #2

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="2mm.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!33 = !{!27}
!34 = !{!24, !28, !29, !30}
!35 = !{!30}
!36 = !{!27, !24, !28, !29}
!37 = !{!28}
!38 = !{!27, !24, !29, !30}
!39 = distinct !{!39, !40}
!40 = !{!"llvm.loop.vectorize.enable", i1 false}
!41 = distinct !{!41, !40}
!42 = distinct !{!42, !40}
!43 = distinct !{!43, !40}
!44 = distinct !{!44, !40}
!45 = distinct !{!45, !40}
!46 = distinct !{!46, !40}
!47 = distinct !{!47, !14, !15}
!48 = distinct !{!48, !14, !15}
!49 = distinct !{!49, !14, !15}
!50 = distinct !{!50, !14, !20, !21, !22, !15}
!51 = !{!52}
!52 = distinct !{!52, !53, !"polly.alias.scope.MemRef0"}
!53 = distinct !{!53, !"polly.alias.scope.domain"}
!54 = !{!55, !56, !57, !58}
!55 = distinct !{!55, !53, !"polly.alias.scope.MemRef1"}
!56 = distinct !{!56, !53, !"polly.alias.scope.MemRef2"}
!57 = distinct !{!57, !53, !"polly.alias.scope.Packed_B"}
!58 = distinct !{!58, !53, !"polly.alias.scope.Packed_A"}
!59 = !{!56}
!60 = !{!52, !55, !57, !58}
!61 = !{!57}
!62 = !{!52, !55, !56, !58}
!63 = !{!55}
!64 = !{!52, !56, !57, !58}
!65 = !{!58}
!66 = !{!52, !55, !56, !57}
!67 = distinct !{!67, !40}
!68 = distinct !{!68, !40}
!69 = distinct !{!69, !40}
!70 = distinct !{!70, !40}
!71 = distinct !{!71, !40}
!72 = distinct !{!72, !40}
!73 = distinct !{!73, !40}
