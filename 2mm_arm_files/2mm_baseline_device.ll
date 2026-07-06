; ModuleID = '2mm.cpp'
source_filename = "2mm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS15Polybench_2mm_1 = comdat any

$_ZTS15Polybench_2mm_2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS15Polybench_2mm_1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc26.i, %for.cond.cleanup5.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %1 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.cond.cleanup10.i
  %k.0.i = phi i64 [ %inc23.i, %for.cond.cleanup10.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.cond7.i.preheader, label %for.cond.cleanup5.i

for.cond7.i.preheader:                            ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %k.0.i
  %mul14.i = mul i64 %k.0.i, %_arg_size_
  %2 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul14.i
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
  br label %for.cond2.i, !llvm.loop !15

for.body11.i:                                     ; preds = %for.cond7.i
  %3 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !16
  %arrayidx16.i = getelementptr float, ptr addrspace(1) %2, i64 %j.0.i
  %4 = load float, ptr addrspace(1) %arrayidx16.i, align 4, !tbaa !16
  %arrayidx21.i = getelementptr float, ptr addrspace(1) %1, i64 %j.0.i
  %5 = load float, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !16
  %6 = tail call float @llvm.fmuladd.f32(float %3, float %4, float %5)
  store float %6, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !16
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond7.i, !llvm.loop !18

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS15Polybench_2mm_2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_C, ptr addrspace(1) noundef align 4 %_arg_raw_D, ptr addrspace(1) noundef align 4 %_arg_raw_E) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup11.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc39.i, %for.cond.cleanup11.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body6.i
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %mul20.i = mul i64 %i.0.i, %_arg_size_
  %1 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul20.i
  %2 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul20.i
  br label %for.cond8.i

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  store float 0.000000e+00, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !16
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !23

for.cond8.i:                                      ; preds = %for.cond8.i.preheader, %for.cond.cleanup17.i
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup17.i ], [ 0, %for.cond8.i.preheader ]
  %cmp10.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp10.i, label %for.cond14.i.preheader, label %for.cond.cleanup11.i

for.cond14.i.preheader:                           ; preds = %for.cond8.i
  %arrayidx22.i = getelementptr float, ptr addrspace(1) %1, i64 %k.0.i
  %mul24.i = mul i64 %k.0.i, %_arg_size_
  %3 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %mul24.i
  br label %for.cond14.i

for.cond.cleanup11.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !24

for.cond14.i:                                     ; preds = %for.cond14.i.preheader, %for.body18.i
  %j13.0.i = phi i64 [ %inc33.i, %for.body18.i ], [ 0, %for.cond14.i.preheader ]
  %cmp16.i = icmp ult i64 %j13.0.i, %_arg_size_
  br i1 %cmp16.i, label %for.body18.i, label %for.cond.cleanup17.i

for.cond.cleanup17.i:                             ; preds = %for.cond14.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !25

for.body18.i:                                     ; preds = %for.cond14.i
  %4 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !16
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %3, i64 %j13.0.i
  %5 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !16
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %2, i64 %j13.0.i
  %6 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !16
  %7 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %6)
  store float %7, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !16
  %inc33.i = add nuw i64 %j13.0.i, 1
  br label %for.cond14.i, !llvm.loop !26

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="2mm.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!15 = distinct !{!15, !14}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !8, i64 0}
!18 = distinct !{!18, !14, !19, !20, !21, !22}
!19 = !{!"llvm.loop.vectorize.width", i32 4}
!20 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!21 = !{!"llvm.loop.interleave.count", i32 1}
!22 = !{!"llvm.loop.vectorize.enable", i1 true}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14, !19, !20, !21, !22}
