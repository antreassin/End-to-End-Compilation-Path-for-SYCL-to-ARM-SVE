; ModuleID = 'syrk.cpp'
source_filename = "syrk.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS6Syr2k2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS6Syr2k2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc32.i, %for.cond.cleanup5.i ]
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  %1 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.cond.cleanup12.i
  %j.0.i = phi i64 [ %inc29.i, %for.cond.cleanup12.i ], [ 0, %for.cond2.i.preheader ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc32.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %2 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %mul8.i = fmul float %2, 1.451200e+04
  store float %mul8.i, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %mul20.i = mul i64 %j.0.i, %_arg_size_
  %3 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul20.i
  br label %for.cond9.i

for.cond9.i:                                      ; preds = %for.body13.i, %for.body6.i
  %4 = phi float [ %mul8.i, %for.body6.i ], [ %7, %for.body13.i ]
  %k.0.i = phi i64 [ 0, %for.body6.i ], [ %inc.i, %for.body13.i ]
  %cmp11.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp11.i, label %for.body13.i, label %for.cond.cleanup12.i

for.cond.cleanup12.i:                             ; preds = %for.cond9.i
  %inc29.i = add i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !17

for.body13.i:                                     ; preds = %for.cond9.i
  %arrayidx17.i = getelementptr float, ptr addrspace(1) %1, i64 %k.0.i
  %5 = load float, ptr addrspace(1) %arrayidx17.i, align 4, !tbaa !15
  %mul18.i = fmul reassoc float %5, 1.230000e+02
  %arrayidx22.i = getelementptr float, ptr addrspace(1) %3, i64 %k.0.i
  %6 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !15
  %7 = tail call reassoc float @llvm.fmuladd.f32(float %mul18.i, float %6, float %4)
  store float %7, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %inc.i = add nuw i64 %k.0.i, 1
  br label %for.cond9.i, !llvm.loop !18

_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="syrk.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!10 = !{i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !8, i64 0}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14, !19, !20, !21, !22}
!19 = !{!"llvm.loop.vectorize.width", i32 4}
!20 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!21 = !{!"llvm.loop.interleave.count", i32 1}
!22 = !{!"llvm.loop.vectorize.enable", i1 true}
