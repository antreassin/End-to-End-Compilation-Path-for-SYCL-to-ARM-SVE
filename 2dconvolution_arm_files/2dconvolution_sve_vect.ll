; ModuleID = '<stdin>'
source_filename = "2dconvolution.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS6conv2D = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS6conv2D(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %sub.i = add i64 %_arg_size_, -1
  %0 = shl i64 %_arg_size_, 2
  %1 = add i64 %0, 4
  %2 = shl i64 %_arg_size_, 2
  %3 = shl i64 %_arg_size_, 3
  %4 = mul i64 %_arg_size_, 12
  %5 = add i64 %4, 4
  %6 = add nuw nsw i64 %3, 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup6.i, %entry
  %indvar = phi i64 [ %indvar.next, %for.cond.cleanup6.i ], [ 0, %entry ]
  %i.0.i = phi i64 [ 1, %entry ], [ %inc73.i, %for.cond.cleanup6.i ]
  %7 = mul i64 %2, %indvar
  %8 = add i64 %1, %7
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %8
  %9 = add i64 %3, %7
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %9
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %9
  %10 = add i64 %5, %7
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %10
  %11 = add i64 %0, %7
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %11
  %12 = add i64 %6, %7
  %scevgep5 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %12
  %scevgep6 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %7
  %scevgep7 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %8
  %cmp.i = icmp ult i64 %i.0.i, %sub.i
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %sub8.i = add i64 %i.0.i, -1
  %mul.i = mul i64 %sub8.i, %_arg_size_
  %13 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %mul14.i = mul i64 %i.0.i, %_arg_size_
  %14 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul14.i
  %add19.i = add i64 %i.0.i, 1
  %mul21.i = mul i64 %add19.i, %_arg_size_
  %15 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul21.i
  %16 = call i64 @llvm.vscale.i64()
  %17 = mul i64 %16, 4
  %min.iters.check = icmp ule i64 %sub.i, %17
  br i1 %min.iters.check, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond2.i.preheader
  %bound0 = icmp ult ptr addrspace(1) %scevgep, %scevgep3
  %bound1 = icmp ult ptr addrspace(1) %scevgep2, %scevgep1
  %found.conflict = and i1 %bound0, %bound1
  %bound08 = icmp ult ptr addrspace(1) %scevgep, %scevgep5
  %bound19 = icmp ult ptr addrspace(1) %scevgep4, %scevgep1
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  %bound011 = icmp ult ptr addrspace(1) %scevgep, %scevgep7
  %bound112 = icmp ult ptr addrspace(1) %scevgep6, %scevgep1
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx14 = or i1 %conflict.rdx, %found.conflict13
  br i1 %conflict.rdx14, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %18 = call i64 @llvm.vscale.i64()
  %19 = mul i64 %18, 4
  %n.mod.vf = urem i64 %sub.i, %19
  %20 = icmp eq i64 %n.mod.vf, 0
  %21 = select i1 %20, i64 %19, i64 %n.mod.vf
  %n.vec = sub i64 %sub.i, %21
  %ind.end = add i64 1, %n.vec
  %22 = call i64 @llvm.vscale.i64()
  %23 = mul i64 %22, 4
  %24 = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
  %25 = add <vscale x 4 x i64> %24, zeroinitializer
  %26 = mul <vscale x 4 x i64> %25, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %induction = add <vscale x 4 x i64> shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer), %26
  %27 = call i64 @llvm.vscale.i64()
  %28 = mul i64 %27, 4
  %29 = mul i64 1, %28
  %.splatinsert = insertelement <vscale x 4 x i64> poison, i64 %29, i64 0
  %.splat = shufflevector <vscale x 4 x i64> %.splatinsert, <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <vscale x 4 x i64> [ %induction, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %offset.idx = add i64 1, %index
  %30 = add i64 %offset.idx, 0
  %31 = add i64 %30, -1
  %32 = getelementptr float, ptr addrspace(1) %13, i64 %31
  %33 = getelementptr float, ptr addrspace(1) %32, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %33, align 4, !tbaa !13, !alias.scope !15
  %34 = getelementptr float, ptr addrspace(1) %14, i64 %31
  %35 = getelementptr float, ptr addrspace(1) %34, i32 0
  %wide.load15 = load <vscale x 4 x float>, ptr addrspace(1) %35, align 4, !tbaa !13, !alias.scope !18
  %36 = fmul <vscale x 4 x float> %wide.load15, shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0xBFD3333340000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
  %37 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0x3FC99999A0000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %36)
  %38 = getelementptr float, ptr addrspace(1) %15, i64 %31
  %39 = getelementptr float, ptr addrspace(1) %38, i32 0
  %wide.load16 = load <vscale x 4 x float>, ptr addrspace(1) %39, align 4, !tbaa !13, !alias.scope !20
  %40 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load16, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0x3FD99999A0000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %37)
  %41 = getelementptr float, ptr addrspace(1) %13, i64 %30
  %42 = getelementptr float, ptr addrspace(1) %41, i32 0
  %wide.load17 = load <vscale x 4 x float>, ptr addrspace(1) %42, align 4, !tbaa !13, !alias.scope !15
  %43 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load17, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 5.000000e-01, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %40)
  %44 = add i64 %mul14.i, %30
  %45 = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_A, i64 %44
  %46 = getelementptr inbounds float, ptr addrspace(1) %45, i32 0
  %wide.load18 = load <vscale x 4 x float>, ptr addrspace(1) %46, align 4, !tbaa !13, !alias.scope !18
  %47 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load18, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0x3FE3333340000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %43)
  %48 = getelementptr float, ptr addrspace(1) %15, i64 %30
  %49 = getelementptr float, ptr addrspace(1) %48, i32 0
  %wide.load19 = load <vscale x 4 x float>, ptr addrspace(1) %49, align 4, !tbaa !13, !alias.scope !20
  %50 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load19, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0x3FE6666660000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %47)
  %51 = add nuw <vscale x 4 x i64> %vec.ind, shufflevector (<vscale x 4 x i64> insertelement (<vscale x 4 x i64> poison, i64 1, i64 0), <vscale x 4 x i64> poison, <vscale x 4 x i32> zeroinitializer)
  %52 = extractelement <vscale x 4 x i64> %51, i32 0
  %53 = getelementptr float, ptr addrspace(1) %13, i64 %52
  %54 = getelementptr float, ptr addrspace(1) %53, i32 0
  %wide.load20 = load <vscale x 4 x float>, ptr addrspace(1) %54, align 4, !tbaa !13, !alias.scope !15
  %55 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load20, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0xBFE99999A0000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %50)
  %56 = getelementptr float, ptr addrspace(1) %14, i64 %52
  %57 = getelementptr float, ptr addrspace(1) %56, i32 0
  %wide.load21 = load <vscale x 4 x float>, ptr addrspace(1) %57, align 4, !tbaa !13, !alias.scope !18
  %58 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load21, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0xBFECCCCCC0000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %55)
  %59 = getelementptr float, ptr addrspace(1) %15, i64 %52
  %60 = getelementptr float, ptr addrspace(1) %59, i32 0
  %wide.load22 = load <vscale x 4 x float>, ptr addrspace(1) %60, align 4, !tbaa !13, !alias.scope !20
  %61 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load22, <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 0x3FB99999A0000000, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x float> %58)
  %62 = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_B, i64 %44
  %63 = getelementptr inbounds float, ptr addrspace(1) %62, i32 0
  store <vscale x 4 x float> %61, ptr addrspace(1) %63, align 4, !tbaa !13, !alias.scope !22, !noalias !24
  %index.next = add nuw i64 %index, %23
  %vec.ind.next = add <vscale x 4 x i64> %vec.ind, %.splat
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %for.cond2.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %ind.end, %middle.block ], [ 1, %for.cond2.i.preheader ], [ 1, %vector.memcheck ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body7.i, %scalar.ph
  %j.0.i = phi i64 [ %add50.i, %for.body7.i ], [ %bc.resume.val, %scalar.ph ]
  %cmp5.i = icmp ult i64 %j.0.i, %sub.i
  br i1 %cmp5.i, label %for.body7.i, label %for.cond.cleanup6.i

for.cond.cleanup6.i:                              ; preds = %for.cond2.i
  %inc73.i = add i64 %i.0.i, 1
  %indvar.next = add i64 %indvar, 1
  br label %for.cond.i, !llvm.loop !29

for.body7.i:                                      ; preds = %for.cond2.i
  %sub10.i = add i64 %j.0.i, -1
  %arrayidx.i = getelementptr float, ptr addrspace(1) %13, i64 %sub10.i
  %65 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %arrayidx17.i = getelementptr float, ptr addrspace(1) %14, i64 %sub10.i
  %66 = load float, ptr addrspace(1) %arrayidx17.i, align 4, !tbaa !13
  %mul18.i = fmul float %66, 0xBFD3333340000000
  %67 = tail call float @llvm.fmuladd.f32(float %65, float 0x3FC99999A0000000, float %mul18.i)
  %arrayidx24.i = getelementptr float, ptr addrspace(1) %15, i64 %sub10.i
  %68 = load float, ptr addrspace(1) %arrayidx24.i, align 4, !tbaa !13
  %69 = tail call float @llvm.fmuladd.f32(float %68, float 0x3FD99999A0000000, float %67)
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %13, i64 %j.0.i
  %70 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %71 = tail call float @llvm.fmuladd.f32(float %70, float 5.000000e-01, float %69)
  %add37.i = add i64 %mul14.i, %j.0.i
  %arrayidx38.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_A, i64 %add37.i
  %72 = load float, ptr addrspace(1) %arrayidx38.i, align 4, !tbaa !13
  %73 = tail call float @llvm.fmuladd.f32(float %72, float 0x3FE3333340000000, float %71)
  %arrayidx45.i = getelementptr float, ptr addrspace(1) %15, i64 %j.0.i
  %74 = load float, ptr addrspace(1) %arrayidx45.i, align 4, !tbaa !13
  %75 = tail call float @llvm.fmuladd.f32(float %74, float 0x3FE6666660000000, float %73)
  %add50.i = add nuw i64 %j.0.i, 1
  %arrayidx52.i = getelementptr float, ptr addrspace(1) %13, i64 %add50.i
  %76 = load float, ptr addrspace(1) %arrayidx52.i, align 4, !tbaa !13
  %77 = tail call float @llvm.fmuladd.f32(float %76, float 0xBFE99999A0000000, float %75)
  %arrayidx59.i = getelementptr float, ptr addrspace(1) %14, i64 %add50.i
  %78 = load float, ptr addrspace(1) %arrayidx59.i, align 4, !tbaa !13
  %79 = tail call float @llvm.fmuladd.f32(float %78, float 0xBFECCCCCC0000000, float %77)
  %arrayidx66.i = getelementptr float, ptr addrspace(1) %15, i64 %add50.i
  %80 = load float, ptr addrspace(1) %arrayidx66.i, align 4, !tbaa !13
  %81 = tail call float @llvm.fmuladd.f32(float %80, float 0x3FB99999A0000000, float %79)
  %arrayidx71.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_B, i64 %add37.i
  store float %81, ptr addrspace(1) %arrayidx71.i, align 4, !tbaa !13
  br label %for.cond2.i, !llvm.loop !30

_ZZZN23Polybench_2DConvolution3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>) #4

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="2dconvolution.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
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
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21}
!21 = distinct !{!21, !17}
!22 = !{!23}
!23 = distinct !{!23, !17}
!24 = !{!21, !19, !16}
!25 = distinct !{!25, !26, !27, !28}
!26 = !{!"llvm.loop.mustprogress"}
!27 = !{!"llvm.loop.isvectorized", i32 1}
!28 = !{!"llvm.loop.unroll.runtime.disable"}
!29 = distinct !{!29, !26}
!30 = distinct !{!30, !26, !27}
