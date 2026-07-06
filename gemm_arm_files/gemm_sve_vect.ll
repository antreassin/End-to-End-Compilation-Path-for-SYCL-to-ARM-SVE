; ModuleID = '<stdin>'
source_filename = "gemm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS4Gemm = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS4Gemm(i64 noundef %_arg_NI_, i64 noundef %_arg_NJ_, i64 noundef %_arg_NK_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_NJ_, 2
  %1 = shl i64 %_arg_NJ_, 2
  %2 = add i64 %1, 4
  %3 = shl i64 %_arg_NJ_, 2
  %4 = add i64 %_arg_NJ_, 1
  %5 = shl i64 %_arg_NJ_, 2
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup10.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc39.i, %for.cond.cleanup10.i ]
  %6 = mul i64 %5, %i.0.i
  %scevgep7 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %6
  %7 = mul i64 %1, %i.0.i
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %7
  %8 = add i64 %2, %7
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %8
  %9 = mul i64 %0, %i.0.i
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %9
  %cmp.i = icmp ult i64 %i.0.i, %_arg_NI_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_NJ_
  %10 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  %11 = call i64 @llvm.vscale.i64()
  %12 = mul i64 %11, 8
  %min.iters.check13 = icmp ule i64 %4, %12
  br i1 %min.iters.check13, label %scalar.ph12, label %vector.scevcheck6

vector.scevcheck6:                                ; preds = %for.cond2.i.preheader
  %mul8 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 4, i64 %_arg_NJ_)
  %mul.result9 = extractvalue { i64, i1 } %mul8, 0
  %mul.overflow10 = extractvalue { i64, i1 } %mul8, 1
  %13 = sub i64 0, %mul.result9
  %14 = getelementptr i8, ptr addrspace(1) %scevgep7, i64 %mul.result9
  %15 = icmp ult ptr addrspace(1) %14, %scevgep7
  %16 = or i1 %15, %mul.overflow10
  br i1 %16, label %scalar.ph12, label %vector.ph14

vector.ph14:                                      ; preds = %vector.scevcheck6
  %17 = call i64 @llvm.vscale.i64()
  %18 = mul i64 %17, 8
  %n.mod.vf15 = urem i64 %4, %18
  %19 = icmp eq i64 %n.mod.vf15, 0
  %20 = select i1 %19, i64 %18, i64 %n.mod.vf15
  %n.vec16 = sub i64 %4, %20
  %21 = call i64 @llvm.vscale.i64()
  %22 = mul i64 %21, 8
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18, %vector.ph14
  %index19 = phi i64 [ 0, %vector.ph14 ], [ %index.next22, %vector.body18 ]
  %23 = add i64 %index19, 0
  %24 = call i64 @llvm.vscale.i64()
  %25 = mul i64 %24, 4
  %26 = add i64 %25, 0
  %27 = mul i64 %26, 1
  %28 = add i64 %index19, %27
  %29 = getelementptr float, ptr addrspace(1) %10, i64 %23
  %30 = getelementptr float, ptr addrspace(1) %10, i64 %28
  %31 = getelementptr float, ptr addrspace(1) %29, i32 0
  %32 = call i64 @llvm.vscale.i64()
  %33 = mul i64 %32, 4
  %34 = getelementptr float, ptr addrspace(1) %29, i64 %33
  %wide.load20 = load <vscale x 4 x float>, ptr addrspace(1) %31, align 4, !tbaa !13
  %wide.load21 = load <vscale x 4 x float>, ptr addrspace(1) %34, align 4, !tbaa !13
  %35 = fmul <vscale x 4 x float> %wide.load20, shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 2.123000e+03, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
  %36 = fmul <vscale x 4 x float> %wide.load21, shufflevector (<vscale x 4 x float> insertelement (<vscale x 4 x float> poison, float 2.123000e+03, i64 0), <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer)
  %37 = call i64 @llvm.vscale.i64()
  %38 = mul i64 %37, 4
  %39 = getelementptr float, ptr addrspace(1) %29, i64 %38
  store <vscale x 4 x float> %35, ptr addrspace(1) %31, align 4, !tbaa !13
  store <vscale x 4 x float> %36, ptr addrspace(1) %39, align 4, !tbaa !13
  %index.next22 = add nuw i64 %index19, %22
  %40 = icmp eq i64 %index.next22, %n.vec16
  br i1 %40, label %middle.block11, label %vector.body18, !llvm.loop !15

middle.block11:                                   ; preds = %vector.body18
  br label %scalar.ph12

scalar.ph12:                                      ; preds = %vector.scevcheck6, %for.cond2.i.preheader, %middle.block11
  %bc.resume.val17 = phi i64 [ %n.vec16, %middle.block11 ], [ 0, %for.cond2.i.preheader ], [ 0, %vector.scevcheck6 ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body5.i, %scalar.ph12
  %j.0.i = phi i64 [ %inc.i, %for.body5.i ], [ %bc.resume.val17, %scalar.ph12 ]
  %cmp3.i = icmp ult i64 %j.0.i, %_arg_NJ_
  br i1 %cmp3.i, label %for.body5.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %mul13.i = mul i64 %i.0.i, %_arg_NK_
  %41 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul13.i
  %mul29.i = mul i64 %i.0.i, %_arg_NJ_
  %42 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul29.i
  br label %for.cond8.i

for.body5.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %10, i64 %j.0.i
  %43 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %mul7.i = fmul float %43, 2.123000e+03
  store float %mul7.i, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !19

for.cond8.i:                                      ; preds = %for.cond.cleanup21.i, %for.cond8.i.preheader
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup21.i ], [ 0, %for.cond8.i.preheader ]
  %44 = mul i64 %3, %k.0.i
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %44
  %45 = add i64 %2, %44
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %45
  %cmp9.i = icmp ult i64 %k.0.i, %_arg_NK_
  br i1 %cmp9.i, label %for.body11.i, label %for.cond.cleanup10.i

for.cond.cleanup10.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !20

for.body11.i:                                     ; preds = %for.cond8.i
  %arrayidx15.i = getelementptr float, ptr addrspace(1) %41, i64 %k.0.i
  %46 = load float, ptr addrspace(1) %arrayidx15.i, align 4, !tbaa !13
  %mul16.i = fmul float %46, 3.241200e+04
  %mul24.i = mul i64 %k.0.i, %_arg_NJ_
  %47 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul24.i
  %48 = call i64 @llvm.vscale.i64()
  %49 = mul i64 %48, 4
  %min.iters.check = icmp ule i64 %4, %49
  br i1 %min.iters.check, label %scalar.ph, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.body11.i
  %mul = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 4, i64 %_arg_NJ_)
  %mul.result = extractvalue { i64, i1 } %mul, 0
  %mul.overflow = extractvalue { i64, i1 } %mul, 1
  %50 = sub i64 0, %mul.result
  %51 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %mul.result
  %52 = icmp ult ptr addrspace(1) %51, %scevgep
  %53 = or i1 %52, %mul.overflow
  br i1 %53, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %bound0 = icmp ult ptr addrspace(1) %scevgep1, %scevgep4
  %bound1 = icmp ult ptr addrspace(1) %scevgep3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %54 = call i64 @llvm.vscale.i64()
  %55 = mul i64 %54, 4
  %n.mod.vf = urem i64 %4, %55
  %56 = icmp eq i64 %n.mod.vf, 0
  %57 = select i1 %56, i64 %55, i64 %n.mod.vf
  %n.vec = sub i64 %4, %57
  %58 = call i64 @llvm.vscale.i64()
  %59 = mul i64 %58, 4
  %broadcast.splatinsert = insertelement <vscale x 4 x float> poison, float %mul16.i, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x float> %broadcast.splatinsert, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %60 = add i64 %index, 0
  %61 = getelementptr float, ptr addrspace(1) %47, i64 %60
  %62 = getelementptr float, ptr addrspace(1) %61, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %62, align 4, !tbaa !13, !alias.scope !21
  %63 = getelementptr float, ptr addrspace(1) %42, i64 %60
  %64 = getelementptr float, ptr addrspace(1) %63, i32 0
  %wide.load5 = load <vscale x 4 x float>, ptr addrspace(1) %64, align 4, !tbaa !13, !alias.scope !24, !noalias !21
  %65 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %broadcast.splat, <vscale x 4 x float> %wide.load, <vscale x 4 x float> %wide.load5)
  store <vscale x 4 x float> %65, ptr addrspace(1) %64, align 4, !tbaa !13, !alias.scope !24, !noalias !21
  %index.next = add nuw i64 %index, %59
  %66 = icmp eq i64 %index.next, %n.vec
  br i1 %66, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %vector.scevcheck, %for.body11.i, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.body11.i ], [ 0, %vector.scevcheck ], [ 0, %vector.memcheck ]
  br label %for.cond18.i

for.cond18.i:                                     ; preds = %for.body22.i, %scalar.ph
  %j17.0.i = phi i64 [ %bc.resume.val, %scalar.ph ], [ %inc33.i, %for.body22.i ]
  %cmp20.i = icmp ult i64 %j17.0.i, %_arg_NJ_
  br i1 %cmp20.i, label %for.body22.i, label %for.cond.cleanup21.i

for.cond.cleanup21.i:                             ; preds = %for.cond18.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !27

for.body22.i:                                     ; preds = %for.cond18.i
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %47, i64 %j17.0.i
  %67 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !13
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %42, i64 %j17.0.i
  %68 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %69 = tail call float @llvm.fmuladd.f32(float %mul16.i, float %67, float %68)
  store float %69, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %inc33.i = add nuw i64 %j17.0.i, 1
  br label %for.cond18.i, !llvm.loop !28

_ZZZN14Polybench_Gemm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>) #3

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="gemm.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #2 = { "target-cpu"="neoverse-v2" "target-features"="+sve" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(none) }

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
!15 = distinct !{!15, !16, !17, !18}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !16, !17}
!20 = distinct !{!20, !16}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !16, !17, !18}
!27 = distinct !{!27, !16}
!28 = distinct !{!28, !16, !17}
