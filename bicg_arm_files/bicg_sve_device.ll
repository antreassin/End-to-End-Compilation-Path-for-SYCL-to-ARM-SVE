; ModuleID = 'bicg.cpp'
source_filename = "bicg.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS5Bicg1 = comdat any

$_ZTS5Bicg2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS5Bicg1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_r, ptr addrspace(1) noundef align 4 %_arg_raw_s) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc12.i, %for.cond.cleanup5.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_r, i64 %i.0.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body6.i
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %1 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %2 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !15
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_s, i64 %j.0.i
  %3 = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !15
  %4 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %3)
  store float %4, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !15
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !17

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS5Bicg2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_p, ptr addrspace(1) noundef align 4 %_arg_raw_q) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc12.i, %for.cond.cleanup5.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_q, i64 %i.0.i
  %arrayidx10.i.promoted = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !15
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body6.i
  %1 = phi float [ %4, %for.body6.i ], [ %arrayidx10.i.promoted, %for.cond2.i.preheader ]
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !22

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %2 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_p, i64 %j.0.i
  %3 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !15
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %1)
  store float %4, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !15
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !23

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="bicg.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none) }

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !8, i64 0}
!17 = distinct !{!17, !14, !18, !19, !20, !21}
!18 = !{!"llvm.loop.vectorize.width", i32 4}
!19 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!20 = !{!"llvm.loop.interleave.count", i32 1}
!21 = !{!"llvm.loop.vectorize.enable", i1 true}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !14, !18, !19, !20, !21}
