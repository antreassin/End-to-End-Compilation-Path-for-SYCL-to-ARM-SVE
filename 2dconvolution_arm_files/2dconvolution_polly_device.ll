; ModuleID = '2dconvolution.cpp'
source_filename = "2dconvolution.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS6conv2D = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS6conv2D(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
polly.split_new_and_old:
  %sub.i = add i64 %_arg_size_, -1
  %0 = icmp slt i64 %_arg_size_, 1
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %sub.i, i64 %_arg_size_)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %_arg_size_)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %1 = or i1 %polly.access.mul..obit, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.add..res
  %polly.access.add.8 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_size_, i64 1)
  %polly.access.add..obit9 = extractvalue { i64, i1 } %polly.access.add.8, 1
  %2 = or i1 %1, %polly.access.add..obit9
  %polly.access.add..res11 = extractvalue { i64, i1 } %polly.access.add.8, 0
  %polly.access.12 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.add..res11
  %3 = icmp ugt ptr addrspace(1) %polly.access., %polly.access.12
  %4 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_size_, i64 -2)
  %.obit13 = extractvalue { i64, i1 } %4, 1
  %5 = or i1 %2, %.obit13
  %.res15 = extractvalue { i64, i1 } %4, 0
  %polly.access.mul.16 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res15, i64 %_arg_size_)
  %polly.access.mul..obit17 = extractvalue { i64, i1 } %polly.access.mul.16, 1
  %polly.overflow.state18 = or i1 %5, %polly.access.mul..obit17
  %polly.access.mul..res19 = extractvalue { i64, i1 } %polly.access.mul.16, 0
  %polly.access.add.23 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res19, i64 %sub.i)
  %polly.access.add..obit24 = extractvalue { i64, i1 } %polly.access.add.23, 1
  %polly.overflow.state25 = or i1 %polly.overflow.state18, %polly.access.add..obit24
  %polly.access.add..res26 = extractvalue { i64, i1 } %polly.access.add.23, 0
  %polly.access.27 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %polly.access.add..res26
  %6 = icmp ugt ptr addrspace(1) %polly.access.27, %_arg_raw_A
  %.not95 = and i1 %3, %6
  %.not93 = or i1 %0, %.not95
  %polly.rtc.result.not = or i1 %.not93, %polly.overflow.state25
  br i1 %polly.rtc.result.not, label %for.cond.i, label %polly.loop_if

for.cond.i:                                       ; preds = %for.cond2.i, %polly.split_new_and_old
  %i.0.i = phi i64 [ 1, %polly.split_new_and_old ], [ %add19.i, %for.cond2.i ]
  %cmp.i = icmp ult i64 %i.0.i, %sub.i
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %sub8.i = add i64 %i.0.i, -1
  %mul.i = mul i64 %sub8.i, %_arg_size_
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %mul14.i = mul i64 %i.0.i, %_arg_size_
  %8 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul14.i
  %add19.i = add nuw i64 %i.0.i, 1
  %mul21.i = mul i64 %add19.i, %_arg_size_
  %9 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul21.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body7.i
  %j.0.i = phi i64 [ %add50.i, %for.body7.i ], [ 1, %for.cond2.i.preheader ]
  %cmp5.i = icmp ult i64 %j.0.i, %sub.i
  br i1 %cmp5.i, label %for.body7.i, label %for.cond.i, !llvm.loop !13

for.body7.i:                                      ; preds = %for.cond2.i
  %sub10.i = add i64 %j.0.i, -1
  %arrayidx.i = getelementptr float, ptr addrspace(1) %7, i64 %sub10.i
  %10 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !16
  %arrayidx17.i = getelementptr float, ptr addrspace(1) %8, i64 %sub10.i
  %11 = load float, ptr addrspace(1) %arrayidx17.i, align 4, !tbaa !16
  %mul18.i = fmul float %11, 0xBFD3333340000000
  %12 = tail call float @llvm.fmuladd.f32(float %10, float 0x3FC99999A0000000, float %mul18.i)
  %arrayidx24.i = getelementptr float, ptr addrspace(1) %9, i64 %sub10.i
  %13 = load float, ptr addrspace(1) %arrayidx24.i, align 4, !tbaa !16
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 0x3FD99999A0000000, float %12)
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %7, i64 %j.0.i
  %15 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !16
  %16 = tail call float @llvm.fmuladd.f32(float %15, float 5.000000e-01, float %14)
  %add37.i = add i64 %mul14.i, %j.0.i
  %arrayidx38.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_A, i64 %add37.i
  %17 = load float, ptr addrspace(1) %arrayidx38.i, align 4, !tbaa !16
  %18 = tail call float @llvm.fmuladd.f32(float %17, float 0x3FE3333340000000, float %16)
  %arrayidx45.i = getelementptr float, ptr addrspace(1) %9, i64 %j.0.i
  %19 = load float, ptr addrspace(1) %arrayidx45.i, align 4, !tbaa !16
  %20 = tail call float @llvm.fmuladd.f32(float %19, float 0x3FE6666660000000, float %18)
  %add50.i = add nuw i64 %j.0.i, 1
  %arrayidx52.i = getelementptr float, ptr addrspace(1) %7, i64 %add50.i
  %21 = load float, ptr addrspace(1) %arrayidx52.i, align 4, !tbaa !16
  %22 = tail call float @llvm.fmuladd.f32(float %21, float 0xBFE99999A0000000, float %20)
  %arrayidx59.i = getelementptr float, ptr addrspace(1) %8, i64 %add50.i
  %23 = load float, ptr addrspace(1) %arrayidx59.i, align 4, !tbaa !16
  %24 = tail call float @llvm.fmuladd.f32(float %23, float 0xBFECCCCCC0000000, float %22)
  %arrayidx66.i = getelementptr float, ptr addrspace(1) %9, i64 %add50.i
  %25 = load float, ptr addrspace(1) %arrayidx66.i, align 4, !tbaa !16
  %26 = tail call float @llvm.fmuladd.f32(float %25, float 0x3FB99999A0000000, float %24)
  %arrayidx71.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_B, i64 %add37.i
  store float %26, ptr addrspace(1) %arrayidx71.i, align 4, !tbaa !16
  br label %for.cond2.i, !llvm.loop !18

_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %polly.loop_exit39, %for.cond.i, %polly.loop_if
  ret void

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %27 = add nsw i64 %_arg_size_, -3
  %polly.fdiv_q.shr = ashr i64 %27, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_exit39:                                ; preds = %polly.loop_exit46
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader38, label %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_preheader:                             ; preds = %polly.loop_if
  %28 = shl i64 %_arg_size_, 2
  %scevgep64 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 4
  %scevgep76 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 8
  %scevgep88 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 4
  %pexp.p_div_q96 = lshr i64 %27, 5
  br label %polly.loop_preheader38

polly.loop_exit46:                                ; preds = %polly.loop_exit54, %polly.loop_if43
  %polly.indvar_next41 = add nuw nsw i64 %polly.indvar40, 1
  %polly.loop_cond42.not.not = icmp ult i64 %polly.indvar40, %pexp.p_div_q96
  br i1 %polly.loop_cond42.not.not, label %polly.loop_if43, label %polly.loop_exit39

polly.loop_preheader38:                           ; preds = %polly.loop_preheader, %polly.loop_exit39
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit39 ]
  %29 = shl nsw i64 %polly.indvar, 5
  %30 = sub nsw i64 %_arg_size_, %29
  %31 = tail call i64 @llvm.smin.i64(i64 %30, i64 34)
  %32 = add nsw i64 %31, -3
  %polly.loop_guard47 = icmp sgt i64 %30, 2
  br label %polly.loop_if43

polly.loop_if43:                                  ; preds = %polly.loop_preheader38, %polly.loop_exit46
  %polly.indvar40 = phi i64 [ 0, %polly.loop_preheader38 ], [ %polly.indvar_next41, %polly.loop_exit46 ]
  br i1 %polly.loop_guard47, label %polly.loop_if51.preheader, label %polly.loop_exit46

polly.loop_if51.preheader:                        ; preds = %polly.loop_if43
  %33 = shl nsw i64 %polly.indvar40, 5
  %34 = sub nsw i64 %_arg_size_, %33
  %35 = tail call i64 @llvm.smin.i64(i64 %34, i64 34)
  %36 = add nsw i64 %35, -3
  %polly.loop_guard55 = icmp sgt i64 %34, 2
  br label %polly.loop_if51

polly.loop_exit54:                                ; preds = %polly.stmt.for.body7.i, %polly.loop_if51
  %polly.indvar_next49 = add nuw nsw i64 %polly.indvar48, 1
  %polly.loop_cond50.not.not = icmp slt i64 %polly.indvar48, %32
  br i1 %polly.loop_cond50.not.not, label %polly.loop_if51, label %polly.loop_exit46

polly.loop_if51:                                  ; preds = %polly.loop_if51.preheader, %polly.loop_exit54
  %polly.indvar48 = phi i64 [ %polly.indvar_next49, %polly.loop_exit54 ], [ 0, %polly.loop_if51.preheader ]
  br i1 %polly.loop_guard55, label %polly.stmt.for.body7.i.preheader, label %polly.loop_exit54

polly.stmt.for.body7.i.preheader:                 ; preds = %polly.loop_if51
  %37 = add nuw nsw i64 %29, %polly.indvar48
  %38 = mul i64 %28, %37
  %39 = shl i64 %37, 2
  %40 = add i64 %39, 4
  %41 = mul i64 %_arg_size_, %40
  %42 = add i64 %39, 8
  %43 = mul i64 %_arg_size_, %42
  br label %polly.stmt.for.body7.i

polly.stmt.for.body7.i:                           ; preds = %polly.stmt.for.body7.i.preheader, %polly.stmt.for.body7.i
  %polly.indvar56 = phi i64 [ %polly.indvar_next57, %polly.stmt.for.body7.i ], [ 0, %polly.stmt.for.body7.i.preheader ]
  %44 = add nuw nsw i64 %33, %polly.indvar56
  %45 = shl i64 %44, 2
  %46 = add i64 %38, %45
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %46
  %_p_scalar_ = load float, ptr addrspace(1) %scevgep, align 4, !alias.scope !22, !noalias !25
  %47 = add i64 %41, %45
  %scevgep59 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %47
  %_p_scalar_60 = load float, ptr addrspace(1) %scevgep59, align 4, !alias.scope !22, !noalias !25
  %p_mul18.i = fmul float %_p_scalar_60, 0xBFD3333340000000
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float 0x3FC99999A0000000, float %p_mul18.i)
  %48 = add i64 %43, %45
  %scevgep61 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %48
  %_p_scalar_62 = load float, ptr addrspace(1) %scevgep61, align 4, !alias.scope !22, !noalias !25
  %p_63 = tail call float @llvm.fmuladd.f32(float %_p_scalar_62, float 0x3FD99999A0000000, float %p_)
  %scevgep65 = getelementptr i8, ptr addrspace(1) %scevgep64, i64 %46
  %_p_scalar_66 = load float, ptr addrspace(1) %scevgep65, align 4, !alias.scope !22, !noalias !25
  %p_67 = tail call float @llvm.fmuladd.f32(float %_p_scalar_66, float 5.000000e-01, float %p_63)
  %scevgep69 = getelementptr i8, ptr addrspace(1) %scevgep64, i64 %47
  %_p_scalar_70 = load float, ptr addrspace(1) %scevgep69, align 4, !alias.scope !22, !noalias !25
  %p_71 = tail call float @llvm.fmuladd.f32(float %_p_scalar_70, float 0x3FE3333340000000, float %p_67)
  %scevgep73 = getelementptr i8, ptr addrspace(1) %scevgep64, i64 %48
  %_p_scalar_74 = load float, ptr addrspace(1) %scevgep73, align 4, !alias.scope !22, !noalias !25
  %p_75 = tail call float @llvm.fmuladd.f32(float %_p_scalar_74, float 0x3FE6666660000000, float %p_71)
  %scevgep77 = getelementptr i8, ptr addrspace(1) %scevgep76, i64 %46
  %_p_scalar_78 = load float, ptr addrspace(1) %scevgep77, align 4, !alias.scope !22, !noalias !25
  %p_79 = tail call float @llvm.fmuladd.f32(float %_p_scalar_78, float 0xBFE99999A0000000, float %p_75)
  %scevgep81 = getelementptr i8, ptr addrspace(1) %scevgep76, i64 %47
  %_p_scalar_82 = load float, ptr addrspace(1) %scevgep81, align 4, !alias.scope !22, !noalias !25
  %p_83 = tail call float @llvm.fmuladd.f32(float %_p_scalar_82, float 0xBFECCCCCC0000000, float %p_79)
  %scevgep85 = getelementptr i8, ptr addrspace(1) %scevgep76, i64 %48
  %_p_scalar_86 = load float, ptr addrspace(1) %scevgep85, align 4, !alias.scope !22, !noalias !25
  %p_87 = tail call float @llvm.fmuladd.f32(float %_p_scalar_86, float 0x3FB99999A0000000, float %p_83)
  %scevgep89 = getelementptr i8, ptr addrspace(1) %scevgep88, i64 %47
  store float %p_87, ptr addrspace(1) %scevgep89, align 4, !alias.scope !25, !noalias !22
  %polly.indvar_next57 = add nuw nsw i64 %polly.indvar56, 1
  %polly.loop_cond58.not.not = icmp slt i64 %polly.indvar56, %36
  br i1 %polly.loop_cond58.not.not, label %polly.stmt.for.body7.i, label %polly.loop_exit54
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

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="2dconvolution.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!10 = !{i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.vectorize.enable", i32 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !8, i64 0}
!18 = distinct !{!18, !14, !19, !20, !21, !15}
!19 = !{!"llvm.loop.vectorize.width", i32 4}
!20 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!21 = !{!"llvm.loop.interleave.count", i32 1}
!22 = !{!23}
!23 = distinct !{!23, !24, !"polly.alias.scope.MemRef0"}
!24 = distinct !{!24, !"polly.alias.scope.domain"}
!25 = !{!26}
!26 = distinct !{!26, !24, !"polly.alias.scope.MemRef1"}
