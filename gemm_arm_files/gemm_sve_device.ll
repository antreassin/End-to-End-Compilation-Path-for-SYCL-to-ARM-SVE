; ModuleID = 'gemm.cpp'
source_filename = "gemm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS4Gemm = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS4Gemm(i64 noundef %_arg_NI_, i64 noundef %_arg_NJ_, i64 noundef %_arg_NK_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup10.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc39.i, %for.cond.cleanup10.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_NI_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_NJ_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body5.i
  %j.0.i = phi i64 [ %inc.i, %for.body5.i ], [ 0, %for.cond2.i.preheader ]
  %cmp3.i = icmp ult i64 %j.0.i, %_arg_NJ_
  br i1 %cmp3.i, label %for.body5.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %mul13.i = mul i64 %i.0.i, %_arg_NK_
  %1 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul13.i
  %mul29.i = mul i64 %i.0.i, %_arg_NJ_
  %2 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul29.i
  br label %for.cond8.i

for.body5.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %3 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %mul7.i = fmul float %3, 2.123000e+03
  store float %mul7.i, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !15

for.cond8.i:                                      ; preds = %for.cond8.i.preheader, %for.cond.cleanup21.i
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup21.i ], [ 0, %for.cond8.i.preheader ]
  %cmp9.i = icmp ult i64 %k.0.i, %_arg_NK_
  br i1 %cmp9.i, label %for.body11.i, label %for.cond.cleanup10.i

for.cond.cleanup10.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !17

for.body11.i:                                     ; preds = %for.cond8.i
  %arrayidx15.i = getelementptr float, ptr addrspace(1) %1, i64 %k.0.i
  %4 = load float, ptr addrspace(1) %arrayidx15.i, align 4, !tbaa !13
  %mul16.i = fmul float %4, 3.241200e+04
  %mul24.i = mul i64 %k.0.i, %_arg_NJ_
  %5 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul24.i
  br label %for.cond18.i

for.cond18.i:                                     ; preds = %for.body22.i, %for.body11.i
  %j17.0.i = phi i64 [ 0, %for.body11.i ], [ %inc33.i, %for.body22.i ]
  %cmp20.i = icmp ult i64 %j17.0.i, %_arg_NJ_
  br i1 %cmp20.i, label %for.body22.i, label %for.cond.cleanup21.i

for.cond.cleanup21.i:                             ; preds = %for.cond18.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !18

for.body22.i:                                     ; preds = %for.cond18.i
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %5, i64 %j17.0.i
  %6 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !13
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %2, i64 %j17.0.i
  %7 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %8 = tail call float @llvm.fmuladd.f32(float %mul16.i, float %6, float %7)
  store float %8, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %inc33.i = add nuw i64 %j17.0.i, 1
  br label %for.cond18.i, !llvm.loop !19

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="gemm.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!10 = !{i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false, i1 false, i1 false, i1 false}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16, !20, !21, !22, !23}
!20 = !{!"llvm.loop.vectorize.width", i32 4}
!21 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!22 = !{!"llvm.loop.interleave.count", i32 1}
!23 = !{!"llvm.loop.vectorize.enable", i1 true}
