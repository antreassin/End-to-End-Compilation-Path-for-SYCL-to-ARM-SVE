; ModuleID = '<stdin>'
source_filename = "bicg.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS5Bicg1 = comdat any

$_ZTS5Bicg2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS5Bicg1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_r, ptr addrspace(1) noundef align 4 %_arg_raw_s) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
polly.split_new_and_old:
  %0 = icmp ugt i64 %_arg_size_, 2305843009213693952
  %polly.access. = getelementptr float, ptr addrspace(1) %_arg_raw_r, i64 %_arg_size_
  %1 = icmp ugt ptr addrspace(1) %polly.access., %_arg_raw_s
  %polly.access.3 = getelementptr float, ptr addrspace(1) %_arg_raw_s, i64 %_arg_size_
  %2 = icmp ugt ptr addrspace(1) %polly.access.3, %_arg_raw_r
  %.not51 = and i1 %1, %2
  %.not49 = or i1 %0, %.not51
  %3 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %_arg_size_, i64 -1)
  %.obit = extractvalue { i64, i1 } %3, 1
  %.res = extractvalue { i64, i1 } %3, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %_arg_size_)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state5 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %_arg_size_)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.overflow.state6 = or i1 %polly.overflow.state5, %polly.access.add..obit
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access.7 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %polly.access.add..res
  %4 = icmp ugt ptr addrspace(1) %polly.access.7, %_arg_raw_s
  %5 = icmp ugt ptr addrspace(1) %polly.access.3, %_arg_raw_A
  %.not53 = and i1 %4, %5
  %.not47 = or i1 %.not49, %.not53
  %polly.rtc.result.not = or i1 %.not47, %polly.overflow.state6
  br i1 %polly.rtc.result.not, label %for.cond.i.preheader, label %polly.loop_if

for.cond.i.preheader:                             ; preds = %polly.split_new_and_old
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.cond.cleanup5.i
  %i.0.i = phi i64 [ %inc12.i, %for.cond.cleanup5.i ], [ 0, %for.cond.i.preheader ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %6 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_r, i64 %i.0.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %for.cond2.i.preheader
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %6, i64 %j.0.i
  %7 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !16
  %8 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !16
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_s, i64 %j.0.i
  %9 = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !16
  %10 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %9)
  store float %10, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !16
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !18

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit: ; preds = %for.cond.i
  br label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit1: ; preds = %polly.loop_exit21
  br label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit1, %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit, %polly.loop_if
  ret void

polly.loop_if:                                    ; preds = %polly.split_new_and_old
  %polly.fdiv_q.shr = ashr i64 %.res, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

polly.loop_exit21:                                ; preds = %polly.loop_exit28
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %polly.loop_cond.not.not = icmp slt i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %polly.loop_cond.not.not, label %polly.loop_preheader20, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit.loopexit1

polly.loop_preheader:                             ; preds = %polly.loop_if
  %11 = shl nuw i64 %_arg_size_, 2
  %pexp.p_div_q54 = lshr i64 %.res, 5
  br label %polly.loop_preheader20

polly.loop_exit28.loopexit:                       ; preds = %polly.loop_exit36
  br label %polly.loop_exit28

polly.loop_exit28:                                ; preds = %polly.loop_exit28.loopexit, %polly.loop_if25
  %polly.indvar_next23 = add nuw nsw i64 %polly.indvar22, 1
  %polly.loop_cond24.not.not = icmp ult i64 %polly.indvar22, %pexp.p_div_q54
  br i1 %polly.loop_cond24.not.not, label %polly.loop_if25, label %polly.loop_exit21

polly.loop_preheader20:                           ; preds = %polly.loop_preheader, %polly.loop_exit21
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit21 ]
  %12 = shl nsw i64 %polly.indvar, 5
  %13 = xor i64 %12, -1
  %14 = add nsw i64 %_arg_size_, %13
  %15 = tail call i64 @llvm.smin.i64(i64 %14, i64 31)
  %polly.loop_guard29 = icmp sgt i64 %14, -1
  br label %polly.loop_if25

polly.loop_if25:                                  ; preds = %polly.loop_preheader20, %polly.loop_exit28
  %polly.indvar22 = phi i64 [ 0, %polly.loop_preheader20 ], [ %polly.indvar_next23, %polly.loop_exit28 ]
  br i1 %polly.loop_guard29, label %polly.loop_if33.preheader, label %polly.loop_exit28

polly.loop_if33.preheader:                        ; preds = %polly.loop_if25
  %16 = shl nsw i64 %polly.indvar22, 5
  %17 = xor i64 %16, -1
  %18 = add nsw i64 %_arg_size_, %17
  %19 = tail call i64 @llvm.smin.i64(i64 %18, i64 31)
  %polly.loop_guard37 = icmp sgt i64 %18, -1
  br label %polly.loop_if33

polly.loop_exit36.loopexit:                       ; preds = %polly.stmt.for.body6.i
  %p_.lcssa = phi float [ %p_, %polly.stmt.for.body6.i ]
  store float %p_.lcssa, ptr addrspace(1) %scevgep43, align 4, !alias.scope !22, !noalias !25
  br label %polly.loop_exit36

polly.loop_exit36:                                ; preds = %polly.loop_if33, %polly.loop_exit36.loopexit
  %polly.indvar_next31 = add nuw nsw i64 %polly.indvar30, 1
  %polly.loop_cond32.not.not = icmp slt i64 %polly.indvar30, %15
  br i1 %polly.loop_cond32.not.not, label %polly.loop_if33, label %polly.loop_exit28.loopexit

polly.loop_if33:                                  ; preds = %polly.loop_exit36, %polly.loop_if33.preheader
  %polly.indvar30 = phi i64 [ %polly.indvar_next31, %polly.loop_exit36 ], [ 0, %polly.loop_if33.preheader ]
  br i1 %polly.loop_guard37, label %polly.stmt.for.body6.i.preheader, label %polly.loop_exit36

polly.stmt.for.body6.i.preheader:                 ; preds = %polly.loop_if33
  %20 = add nuw nsw i64 %12, %polly.indvar30
  %21 = shl i64 %20, 2
  %invariant.gep = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %21
  %scevgep43 = getelementptr i8, ptr addrspace(1) %_arg_raw_s, i64 %21
  %scevgep43.promoted = load float, ptr addrspace(1) %scevgep43, align 4, !alias.scope !22, !noalias !25
  br label %polly.stmt.for.body6.i

polly.stmt.for.body6.i:                           ; preds = %polly.stmt.for.body6.i, %polly.stmt.for.body6.i.preheader
  %p_56 = phi float [ %p_, %polly.stmt.for.body6.i ], [ %scevgep43.promoted, %polly.stmt.for.body6.i.preheader ]
  %polly.indvar38 = phi i64 [ %polly.indvar_next39, %polly.stmt.for.body6.i ], [ 0, %polly.stmt.for.body6.i.preheader ]
  %22 = add nuw nsw i64 %16, %polly.indvar38
  %23 = mul i64 %11, %22
  %gep = getelementptr i8, ptr addrspace(1) %invariant.gep, i64 %23
  %_p_scalar_ = load float, ptr addrspace(1) %gep, align 4, !alias.scope !28, !noalias !29
  %24 = shl i64 %22, 2
  %scevgep41 = getelementptr i8, ptr addrspace(1) %_arg_raw_r, i64 %24
  %_p_scalar_42 = load float, ptr addrspace(1) %scevgep41, align 4, !alias.scope !30, !noalias !31
  %p_ = tail call float @llvm.fmuladd.f32(float %_p_scalar_, float %_p_scalar_42, float %p_56)
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %polly.loop_cond40.not.not = icmp slt i64 %polly.indvar38, %19
  br i1 %polly.loop_cond40.not.not, label %polly.stmt.for.body6.i, label %polly.loop_exit36.loopexit
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS5Bicg2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_p, ptr addrspace(1) noundef align 4 %_arg_raw_q) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
for.cond.i.pre_entry_bb:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %for.cond.i.pre_entry_bb
  %i.0.i = phi i64 [ %inc12.i, %for.cond.cleanup5.i ], [ 0, %for.cond.i.pre_entry_bb ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_q, i64 %i.0.i
  %arrayidx10.i.promoted = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !16
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %for.cond2.i.preheader
  %1 = phi float [ %4, %for.body6.i ], [ %arrayidx10.i.promoted, %for.cond2.i.preheader ]
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !32

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %2 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !16
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_p, i64 %j.0.i
  %3 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !16
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %1)
  store float %4, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !16
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !33

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "polly-optimized" "stack-protector-buffer-size"="8" "sycl-module-id"="bicg.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #2 = { "target-cpu"="neoverse-v2" "target-features"="+sve" }

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
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !8, i64 0}
!18 = distinct !{!18, !14, !19, !20, !21, !15}
!19 = !{!"llvm.loop.vectorize.width", i32 4}
!20 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!21 = !{!"llvm.loop.interleave.count", i32 1}
!22 = !{!23}
!23 = distinct !{!23, !24, !"polly.alias.scope.MemRef2"}
!24 = distinct !{!24, !"polly.alias.scope.domain"}
!25 = !{!26, !27}
!26 = distinct !{!26, !24, !"polly.alias.scope.MemRef0"}
!27 = distinct !{!27, !24, !"polly.alias.scope.MemRef1"}
!28 = !{!26}
!29 = !{!27, !23}
!30 = !{!27}
!31 = !{!26, !23}
!32 = distinct !{!32, !14, !15}
!33 = distinct !{!33, !14, !19, !20, !21, !15}
