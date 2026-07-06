; ModuleID = '2dconvolution.cpp'
source_filename = "2dconvolution.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "spir64-unknown-unknown"

$_ZTS6conv2D = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local  void @_ZTS6conv2D(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %sub.i = add i64 %_arg_size_, -1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup6.i, %entry
  %i.0.i = phi i64 [ 1, %entry ], [ %inc73.i, %for.cond.cleanup6.i ]
  %cmp.i = icmp ult i64 %i.0.i, %sub.i
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %sub8.i = add i64 %i.0.i, -1
  %mul.i = mul i64 %sub8.i, %_arg_size_
  %0 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %mul14.i = mul i64 %i.0.i, %_arg_size_
  %1 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul14.i
  %add19.i = add i64 %i.0.i, 1
  %mul21.i = mul i64 %add19.i, %_arg_size_
  %2 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul21.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.body7.i
  %j.0.i = phi i64 [ %add50.i, %for.body7.i ], [ 1, %for.cond2.i.preheader ]
  %cmp5.i = icmp ult i64 %j.0.i, %sub.i
  br i1 %cmp5.i, label %for.body7.i, label %for.cond.cleanup6.i

for.cond.cleanup6.i:                              ; preds = %for.cond2.i
  %inc73.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.body7.i:                                      ; preds = %for.cond2.i
  %sub10.i = add i64 %j.0.i, -1
  %arrayidx.i = getelementptr float, ptr addrspace(1) %0, i64 %sub10.i
  %3 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %arrayidx17.i = getelementptr float, ptr addrspace(1) %1, i64 %sub10.i
  %4 = load float, ptr addrspace(1) %arrayidx17.i, align 4, !tbaa !15
  %mul18.i = fmul float %4, 0xBFD3333340000000
  %5 = tail call float @llvm.fmuladd.f32(float %3, float 0x3FC99999A0000000, float %mul18.i)
  %arrayidx24.i = getelementptr float, ptr addrspace(1) %2, i64 %sub10.i
  %6 = load float, ptr addrspace(1) %arrayidx24.i, align 4, !tbaa !15
  %7 = tail call float @llvm.fmuladd.f32(float %6, float 0x3FD99999A0000000, float %5)
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %0, i64 %j.0.i
  %8 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !15
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 5.000000e-01, float %7)
  %add37.i = add i64 %mul14.i, %j.0.i
  %arrayidx38.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_A, i64 %add37.i
  %10 = load float, ptr addrspace(1) %arrayidx38.i, align 4, !tbaa !15
  %11 = tail call float @llvm.fmuladd.f32(float %10, float 0x3FE3333340000000, float %9)
  %arrayidx45.i = getelementptr float, ptr addrspace(1) %2, i64 %j.0.i
  %12 = load float, ptr addrspace(1) %arrayidx45.i, align 4, !tbaa !15
  %13 = tail call float @llvm.fmuladd.f32(float %12, float 0x3FE6666660000000, float %11)
  %add50.i = add nuw i64 %j.0.i, 1
  %arrayidx52.i = getelementptr float, ptr addrspace(1) %0, i64 %add50.i
  %14 = load float, ptr addrspace(1) %arrayidx52.i, align 4, !tbaa !15
  %15 = tail call float @llvm.fmuladd.f32(float %14, float 0xBFE99999A0000000, float %13)
  %arrayidx59.i = getelementptr float, ptr addrspace(1) %1, i64 %add50.i
  %16 = load float, ptr addrspace(1) %arrayidx59.i, align 4, !tbaa !15
  %17 = tail call float @llvm.fmuladd.f32(float %16, float 0xBFECCCCCC0000000, float %15)
  %arrayidx66.i = getelementptr float, ptr addrspace(1) %2, i64 %add50.i
  %18 = load float, ptr addrspace(1) %arrayidx66.i, align 4, !tbaa !15
  %19 = tail call float @llvm.fmuladd.f32(float %18, float 0x3FB99999A0000000, float %17)
  %arrayidx71.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_B, i64 %add37.i
  store float %19, ptr addrspace(1) %arrayidx71.i, align 4, !tbaa !15
  br label %for.cond2.i, !llvm.loop !17

_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: mustprogress nocallback  nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local  i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...)

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="2dconvolution.cpp" "sycl-optlevel"="3" "sycl-single-task" "uniform-work-group-size"="true" }
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
!17 = distinct !{!17, !14, !18, !19, !20, !21}
!18 = !{!"llvm.loop.vectorize.width", i32 4}
!19 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!20 = !{!"llvm.loop.interleave.count", i32 1}
!21 = !{!"llvm.loop.vectorize.enable", i1 true}
