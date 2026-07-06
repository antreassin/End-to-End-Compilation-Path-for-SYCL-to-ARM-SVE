; ModuleID = '<stdin>'
source_filename = "bicg.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS5Bicg1 = comdat any

$_ZTS5Bicg2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS5Bicg1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_r, ptr addrspace(1) noundef align 4 %_arg_raw_s) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_size_, 2
  %1 = add i64 %0, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_s, i64 %1
  %2 = shl i64 %_arg_size_, 2
  %3 = add i64 %_arg_size_, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc12.i, %for.cond.cleanup5.i ]
  %4 = mul i64 %2, %i.0.i
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %4
  %5 = add i64 %1, %4
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %5
  %6 = shl i64 %i.0.i, 2
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_r, i64 %6
  %7 = add i64 %6, 4
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_r, i64 %7
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %8 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_r, i64 %i.0.i
  %9 = call i64 @llvm.vscale.i64()
  %10 = mul i64 %9, 4
  %min.iters.check = icmp ule i64 %3, %10
  br i1 %min.iters.check, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond2.i.preheader
  %bound0 = icmp ult ptr addrspace(1) %_arg_raw_s, %scevgep2
  %bound1 = icmp ult ptr addrspace(1) %scevgep1, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound05 = icmp ult ptr addrspace(1) %_arg_raw_s, %scevgep4
  %bound16 = icmp ult ptr addrspace(1) %scevgep3, %scevgep
  %found.conflict7 = and i1 %bound05, %bound16
  %conflict.rdx = or i1 %found.conflict, %found.conflict7
  br i1 %conflict.rdx, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %11 = call i64 @llvm.vscale.i64()
  %12 = mul i64 %11, 4
  %n.mod.vf = urem i64 %3, %12
  %13 = icmp eq i64 %n.mod.vf, 0
  %14 = select i1 %13, i64 %12, i64 %n.mod.vf
  %n.vec = sub i64 %3, %14
  %15 = call i64 @llvm.vscale.i64()
  %16 = mul i64 %15, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %17 = add i64 %index, 0
  %18 = getelementptr float, ptr addrspace(1) %8, i64 %17
  %19 = getelementptr float, ptr addrspace(1) %18, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %19, align 4, !tbaa !13, !alias.scope !15
  %20 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !13, !alias.scope !18
  %broadcast.splatinsert = insertelement <vscale x 4 x float> poison, float %20, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x float> %broadcast.splatinsert, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  %21 = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_s, i64 %17
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i32 0
  %wide.load8 = load <vscale x 4 x float>, ptr addrspace(1) %22, align 4, !tbaa !13, !alias.scope !20, !noalias !22
  %23 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load, <vscale x 4 x float> %broadcast.splat, <vscale x 4 x float> %wide.load8)
  store <vscale x 4 x float> %23, ptr addrspace(1) %22, align 4, !tbaa !13, !alias.scope !20, !noalias !22
  %index.next = add nuw i64 %index, %16
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %for.cond2.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond2.i.preheader ], [ 0, %vector.memcheck ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %scalar.ph
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ %bc.resume.val, %scalar.ph ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !27

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %8, i64 %j.0.i
  %25 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %26 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !13
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_s, i64 %j.0.i
  %27 = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !13
  %28 = tail call float @llvm.fmuladd.f32(float %25, float %26, float %27)
  store float %28, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !28

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS5Bicg2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_p, ptr addrspace(1) noundef align 4 %_arg_raw_q) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_size_, 2
  %1 = add i64 %0, 4
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_p, i64 %1
  %2 = add i64 %_arg_size_, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc12.i, %for.cond.cleanup5.i ]
  %3 = shl i64 %i.0.i, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_q, i64 %3
  %4 = add i64 %3, 4
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_q, i64 %4
  %5 = mul i64 %0, %i.0.i
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %5
  %6 = add i64 %1, %5
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %6
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %7 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %arrayidx10.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_q, i64 %i.0.i
  %arrayidx10.i.promoted = load float, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !13
  %8 = call i64 @llvm.vscale.i64()
  %9 = mul i64 %8, 4
  %min.iters.check = icmp ule i64 %2, %9
  br i1 %min.iters.check, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond2.i.preheader
  %bound0 = icmp ult ptr addrspace(1) %scevgep, %scevgep3
  %bound1 = icmp ult ptr addrspace(1) %scevgep2, %scevgep1
  %found.conflict = and i1 %bound0, %bound1
  %bound05 = icmp ult ptr addrspace(1) %scevgep, %scevgep4
  %bound16 = icmp ult ptr addrspace(1) %_arg_raw_p, %scevgep1
  %found.conflict7 = and i1 %bound05, %bound16
  %conflict.rdx = or i1 %found.conflict, %found.conflict7
  br i1 %conflict.rdx, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %10 = call i64 @llvm.vscale.i64()
  %11 = mul i64 %10, 4
  %n.mod.vf = urem i64 %2, %11
  %12 = icmp eq i64 %n.mod.vf, 0
  %13 = select i1 %12, i64 %11, i64 %n.mod.vf
  %n.vec = sub i64 %2, %13
  %14 = call i64 @llvm.vscale.i64()
  %15 = mul i64 %14, 4
  %16 = insertelement <vscale x 4 x float> shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float -0.000000e+00, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer), float %arrayidx10.i.promoted, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <vscale x 4 x float> [ %16, %vector.ph ], [ %22, %vector.body ]
  %17 = add i64 %index, 0
  %18 = getelementptr float, ptr addrspace(1) %7, i64 %17
  %19 = getelementptr float, ptr addrspace(1) %18, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %19, align 4, !tbaa !13, !alias.scope !29
  %20 = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_p, i64 %17
  %21 = getelementptr inbounds float, ptr addrspace(1) %20, i32 0
  %wide.load8 = load <vscale x 4 x float>, ptr addrspace(1) %21, align 4, !tbaa !13, !alias.scope !32
  %22 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %wide.load, <vscale x 4 x float> %wide.load8, <vscale x 4 x float> %vec.phi)
  %index.next = add nuw i64 %index, %15
  %23 = icmp eq i64 %index.next, %n.vec
  br i1 %23, label %middle.block, label %vector.body, !llvm.loop !34

middle.block:                                     ; preds = %vector.body
  %24 = call float @llvm.vector.reduce.fadd.nxv4f32(float -0.000000e+00, <vscale x 4 x float> %22)
  store float %24, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !13
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %for.cond2.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond2.i.preheader ], [ 0, %vector.memcheck ]
  %bc.merge.rdx = phi float [ %arrayidx10.i.promoted, %vector.memcheck ], [ %arrayidx10.i.promoted, %for.cond2.i.preheader ], [ %24, %middle.block ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %scalar.ph
  %25 = phi float [ %28, %for.body6.i ], [ %bc.merge.rdx, %scalar.ph ]
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ %bc.resume.val, %scalar.ph ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond.cleanup5.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc12.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !35

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %7, i64 %j.0.i
  %26 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %arrayidx8.i = getelementptr inbounds float, ptr addrspace(1) %_arg_raw_p, i64 %j.0.i
  %27 = load float, ptr addrspace(1) %arrayidx8.i, align 4, !tbaa !13
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %25)
  store float %28, ptr addrspace(1) %arrayidx10.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !36

_ZZZN14Polybench_Bicg3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.nxv4f32(float, <vscale x 4 x float>) #4

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="bicg.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
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
!10 = !{i32 -1, i32 -1, i32 -1, i32 -1}
!11 = !{}
!12 = !{i1 false, i1 false, i1 false, i1 false}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21}
!21 = distinct !{!21, !17}
!22 = !{!16, !19}
!23 = distinct !{!23, !24, !25, !26}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{!"llvm.loop.isvectorized", i32 1}
!26 = !{!"llvm.loop.unroll.runtime.disable"}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24, !25}
!29 = !{!30}
!30 = distinct !{!30, !31}
!31 = distinct !{!31, !"LVerDomain"}
!32 = !{!33}
!33 = distinct !{!33, !31}
!34 = distinct !{!34, !24, !25, !26}
!35 = distinct !{!35, !24}
!36 = distinct !{!36, !24, !25}
