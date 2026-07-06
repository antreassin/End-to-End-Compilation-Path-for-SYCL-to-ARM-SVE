; ModuleID = '<stdin>'
source_filename = "syrk.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS6Syr2k2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS6Syr2k2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_size_, 2
  %1 = shl i64 %_arg_size_, 2
  %2 = add i64 %1, 4
  %3 = add i64 %_arg_size_, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc32.i, %for.cond.cleanup5.i ]
  %4 = mul i64 %0, %i.0.i
  %5 = add i64 %4, 4
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %4
  %6 = add i64 %2, %4
  %scevgep5 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %6
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  %8 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond.cleanup12.i, %for.cond2.i.preheader
  %j.0.i = phi i64 [ %inc29.i, %for.cond.cleanup12.i ], [ 0, %for.cond2.i.preheader ]
  %9 = shl i64 %j.0.i, 2
  %10 = add i64 %4, %9
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %10
  %11 = add i64 %5, %9
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %11
  %12 = mul i64 %1, %j.0.i
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %12
  %13 = add i64 %2, %12
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %13
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc32.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !13

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %7, i64 %j.0.i
  %14 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %mul8.i = fmul float %14, 1.451200e+04
  store float %mul8.i, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %mul20.i = mul i64 %j.0.i, %_arg_size_
  %15 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul20.i
  %16 = call i64 @llvm.vscale.i64()
  %17 = mul i64 %16, 4
  %min.iters.check = icmp ule i64 %3, %17
  br i1 %min.iters.check, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body6.i
  %bound0 = icmp ult ptr addrspace(1) %scevgep, %scevgep3
  %bound1 = icmp ult ptr addrspace(1) %scevgep2, %scevgep1
  %found.conflict = and i1 %bound0, %bound1
  %bound06 = icmp ult ptr addrspace(1) %scevgep, %scevgep5
  %bound17 = icmp ult ptr addrspace(1) %scevgep4, %scevgep1
  %found.conflict8 = and i1 %bound06, %bound17
  %conflict.rdx = or i1 %found.conflict, %found.conflict8
  br i1 %conflict.rdx, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %18 = call i64 @llvm.vscale.i64()
  %19 = mul i64 %18, 4
  %n.mod.vf = urem i64 %3, %19
  %20 = icmp eq i64 %n.mod.vf, 0
  %21 = select i1 %20, i64 %19, i64 %n.mod.vf
  %n.vec = sub i64 %3, %21
  %22 = call i64 @llvm.vscale.i64()
  %23 = mul i64 %22, 4
  %24 = insertelement <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float -0.000000e+00, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), float %mul8.i, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 4 x float> [ %24, %vector.ph ], [ %31, %vector.body ]
  %25 = add i64 %index, 0
  %26 = getelementptr float, ptr addrspace(1) %8, i64 %25
  %27 = getelementptr float, ptr addrspace(1) %26, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %27, align 4, !tbaa !15, !alias.scope !17
  %28 = fmul reassoc <vscale x 4 x float> %wide.load, shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 1.230000e+02, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
  %29 = getelementptr float, ptr addrspace(1) %15, i64 %25
  %30 = getelementptr float, ptr addrspace(1) %29, i32 0
  %wide.load9 = load <vscale x 4 x float>, ptr addrspace(1) %30, align 4, !tbaa !15, !alias.scope !20
  %31 = call reassoc <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %28, <vscale x 4 x float> %wide.load9, <vscale x 4 x float> %vec.phi)
  %index.next = add nuw i64 %index, %23
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %33 = call reassoc float @llvm.vector.reduce.fadd.nxv4f32(float -0.000000e+00, <vscale x 4 x float> %31)
  store float %33, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %for.body6.i, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.body6.i ], [ 0, %vector.memcheck ]
  %bc.merge.rdx = phi float [ %mul8.i, %vector.memcheck ], [ %mul8.i, %for.body6.i ], [ %33, %middle.block ]
  br label %for.cond9.i

for.cond9.i:                                      ; preds = %for.body13.i, %scalar.ph
  %34 = phi float [ %bc.merge.rdx, %scalar.ph ], [ %37, %for.body13.i ]
  %k.0.i = phi i64 [ %bc.resume.val, %scalar.ph ], [ %inc.i, %for.body13.i ]
  %cmp11.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp11.i, label %for.body13.i, label %for.cond.cleanup12.i

for.cond.cleanup12.i:                             ; preds = %for.cond9.i
  %inc29.i = add i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !25

for.body13.i:                                     ; preds = %for.cond9.i
  %arrayidx17.i = getelementptr float, ptr addrspace(1) %8, i64 %k.0.i
  %35 = load float, ptr addrspace(1) %arrayidx17.i, align 4, !tbaa !15
  %mul18.i = fmul reassoc float %35, 1.230000e+02
  %arrayidx22.i = getelementptr float, ptr addrspace(1) %15, i64 %k.0.i
  %36 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !15
  %37 = tail call reassoc float @llvm.fmuladd.f32(float %mul18.i, float %36, float %34)
  store float %37, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !15
  %inc.i = add nuw i64 %k.0.i, 1
  br label %for.cond9.i, !llvm.loop !26

_ZZZN14Polybench_Syrk3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.nxv4f32(float, <vscale x 4 x float>) #4

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="syrk.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #2 = { "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !23, !24}
!23 = !{!"llvm.loop.isvectorized", i32 1}
!24 = !{!"llvm.loop.unroll.runtime.disable"}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14, !23}
