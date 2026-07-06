; ModuleID = '<stdin>'
source_filename = "2mm.cpp"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n8:16:32:64-G1"
target triple = "aarch64"

$_ZTS15Polybench_2mm_1 = comdat any

$_ZTS15Polybench_2mm_2 = comdat any

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS15Polybench_2mm_1(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_A, ptr addrspace(1) noundef align 4 %_arg_raw_B, ptr addrspace(1) noundef align 4 %_arg_raw_C) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_size_, 2
  %1 = shl i64 %_arg_size_, 2
  %2 = add i64 %1, 4
  %3 = shl i64 %_arg_size_, 2
  %4 = add i64 %_arg_size_, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup5.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc26.i, %for.cond.cleanup5.i ]
  %5 = mul i64 %1, %i.0.i
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %5
  %6 = add i64 %2, %5
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %6
  %7 = add i64 %5, 4
  %8 = mul i64 %0, %i.0.i
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %8
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %9 = getelementptr float, ptr addrspace(1) %_arg_raw_A, i64 %mul.i
  %10 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul.i
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.cond.cleanup10.i, %for.cond2.i.preheader
  %k.0.i = phi i64 [ %inc23.i, %for.cond.cleanup10.i ], [ 0, %for.cond2.i.preheader ]
  %11 = shl i64 %k.0.i, 2
  %12 = add i64 %5, %11
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %12
  %13 = add i64 %7, %11
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_A, i64 %13
  %14 = mul i64 %3, %k.0.i
  %scevgep5 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %14
  %15 = add i64 %2, %14
  %scevgep6 = getelementptr i8, ptr addrspace(1) %_arg_raw_B, i64 %15
  %cmp4.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.cond7.i.preheader, label %for.cond.cleanup5.i

for.cond7.i.preheader:                            ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %9, i64 %k.0.i
  %mul14.i = mul i64 %k.0.i, %_arg_size_
  %16 = getelementptr float, ptr addrspace(1) %_arg_raw_B, i64 %mul14.i
  %17 = call i64 @llvm.vscale.i64()
  %18 = mul i64 %17, 4
  %min.iters.check = icmp ule i64 %4, %18
  br i1 %min.iters.check, label %scalar.ph, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.cond7.i.preheader
  %mul = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 4, i64 %_arg_size_)
  %mul.result = extractvalue { i64, i1 } %mul, 0
  %mul.overflow = extractvalue { i64, i1 } %mul, 1
  %19 = sub i64 0, %mul.result
  %20 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %mul.result
  %21 = icmp ult ptr addrspace(1) %20, %scevgep
  %22 = or i1 %21, %mul.overflow
  br i1 %22, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %bound0 = icmp ult ptr addrspace(1) %scevgep1, %scevgep4
  %bound1 = icmp ult ptr addrspace(1) %scevgep3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound07 = icmp ult ptr addrspace(1) %scevgep1, %scevgep6
  %bound18 = icmp ult ptr addrspace(1) %scevgep5, %scevgep2
  %found.conflict9 = and i1 %bound07, %bound18
  %conflict.rdx = or i1 %found.conflict, %found.conflict9
  br i1 %conflict.rdx, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %23 = call i64 @llvm.vscale.i64()
  %24 = mul i64 %23, 4
  %n.mod.vf = urem i64 %4, %24
  %25 = icmp eq i64 %n.mod.vf, 0
  %26 = select i1 %25, i64 %24, i64 %n.mod.vf
  %n.vec = sub i64 %4, %26
  %27 = call i64 @llvm.vscale.i64()
  %28 = mul i64 %27, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %29 = add i64 %index, 0
  %30 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13, !alias.scope !15
  %broadcast.splatinsert = insertelement <vscale x 4 x float> poison, float %30, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x float> %broadcast.splatinsert, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  %31 = getelementptr float, ptr addrspace(1) %16, i64 %29
  %32 = getelementptr float, ptr addrspace(1) %31, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %32, align 4, !tbaa !13, !alias.scope !18
  %33 = getelementptr float, ptr addrspace(1) %10, i64 %29
  %34 = getelementptr float, ptr addrspace(1) %33, i32 0
  %wide.load10 = load <vscale x 4 x float>, ptr addrspace(1) %34, align 4, !tbaa !13, !alias.scope !20, !noalias !22
  %35 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %broadcast.splat, <vscale x 4 x float> %wide.load, <vscale x 4 x float> %wide.load10)
  store <vscale x 4 x float> %35, ptr addrspace(1) %34, align 4, !tbaa !13, !alias.scope !20, !noalias !22
  %index.next = add nuw i64 %index, %28
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %vector.scevcheck, %for.cond7.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond7.i.preheader ], [ 0, %vector.scevcheck ], [ 0, %vector.memcheck ]
  br label %for.cond7.i

for.cond.cleanup5.i:                              ; preds = %for.cond2.i
  %inc26.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !27

for.cond7.i:                                      ; preds = %for.body11.i, %scalar.ph
  %j.0.i = phi i64 [ %inc.i, %for.body11.i ], [ %bc.resume.val, %scalar.ph ]
  %cmp9.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp9.i, label %for.body11.i, label %for.cond.cleanup10.i

for.cond.cleanup10.i:                             ; preds = %for.cond7.i
  %inc23.i = add i64 %k.0.i, 1
  br label %for.cond2.i, !llvm.loop !28

for.body11.i:                                     ; preds = %for.cond7.i
  %37 = load float, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %arrayidx16.i = getelementptr float, ptr addrspace(1) %16, i64 %j.0.i
  %38 = load float, ptr addrspace(1) %arrayidx16.i, align 4, !tbaa !13
  %arrayidx21.i = getelementptr float, ptr addrspace(1) %10, i64 %j.0.i
  %39 = load float, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !13
  %40 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %39)
  store float %40, ptr addrspace(1) %arrayidx21.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond7.i, !llvm.loop !29

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress norecurse nounwind
define weak_odr dso_local void @_ZTS15Polybench_2mm_2(i64 noundef %_arg_size_, ptr addrspace(1) noundef align 4 %_arg_raw_C, ptr addrspace(1) noundef align 4 %_arg_raw_D, ptr addrspace(1) noundef align 4 %_arg_raw_E) local_unnamed_addr #0 comdat !kernel_arg_buffer_location !10 !sycl_fixed_targets !11 !sycl_kernel_omit_args !12 {
entry:
  %0 = shl i64 %_arg_size_, 2
  %1 = shl i64 %_arg_size_, 2
  %2 = add i64 %1, 4
  %3 = shl i64 %_arg_size_, 2
  %4 = add i64 %_arg_size_, 1
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.cleanup11.i, %entry
  %i.0.i = phi i64 [ 0, %entry ], [ %inc39.i, %for.cond.cleanup11.i ]
  %5 = mul i64 %1, %i.0.i
  %scevgep1 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %5
  %6 = add i64 %2, %5
  %scevgep2 = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %6
  %7 = add i64 %5, 4
  %8 = mul i64 %0, %i.0.i
  %scevgep = getelementptr i8, ptr addrspace(1) %_arg_raw_E, i64 %8
  %cmp.i = icmp ult i64 %i.0.i, %_arg_size_
  br i1 %cmp.i, label %for.cond2.i.preheader, label %_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit

for.cond2.i.preheader:                            ; preds = %for.cond.i
  %mul.i = mul i64 %i.0.i, %_arg_size_
  %9 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul.i
  %10 = call i64 @llvm.vscale.i64()
  %11 = mul i64 %10, 8
  %min.iters.check13 = icmp ule i64 %4, %11
  br i1 %min.iters.check13, label %scalar.ph12, label %vector.ph14

vector.ph14:                                      ; preds = %for.cond2.i.preheader
  %12 = call i64 @llvm.vscale.i64()
  %13 = mul i64 %12, 8
  %n.mod.vf15 = urem i64 %4, %13
  %14 = icmp eq i64 %n.mod.vf15, 0
  %15 = select i1 %14, i64 %13, i64 %n.mod.vf15
  %n.vec16 = sub i64 %4, %15
  %16 = call i64 @llvm.vscale.i64()
  %17 = mul i64 %16, 8
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18, %vector.ph14
  %index19 = phi i64 [ 0, %vector.ph14 ], [ %index.next20, %vector.body18 ]
  %18 = add i64 %index19, 0
  %19 = call i64 @llvm.vscale.i64()
  %20 = mul i64 %19, 4
  %21 = add i64 %20, 0
  %22 = mul i64 %21, 1
  %23 = add i64 %index19, %22
  %24 = getelementptr float, ptr addrspace(1) %9, i64 %18
  %25 = getelementptr float, ptr addrspace(1) %9, i64 %23
  %26 = getelementptr float, ptr addrspace(1) %24, i32 0
  %27 = call i64 @llvm.vscale.i64()
  %28 = mul i64 %27, 4
  %29 = getelementptr float, ptr addrspace(1) %24, i64 %28
  store <vscale x 4 x float> zeroinitializer, ptr addrspace(1) %26, align 4, !tbaa !13
  store <vscale x 4 x float> zeroinitializer, ptr addrspace(1) %29, align 4, !tbaa !13
  %index.next20 = add nuw i64 %index19, %17
  %30 = icmp eq i64 %index.next20, %n.vec16
  br i1 %30, label %middle.block11, label %vector.body18, !llvm.loop !30

middle.block11:                                   ; preds = %vector.body18
  br label %scalar.ph12

scalar.ph12:                                      ; preds = %for.cond2.i.preheader, %middle.block11
  %bc.resume.val17 = phi i64 [ %n.vec16, %middle.block11 ], [ 0, %for.cond2.i.preheader ]
  br label %for.cond2.i

for.cond2.i:                                      ; preds = %for.body6.i, %scalar.ph12
  %j.0.i = phi i64 [ %inc.i, %for.body6.i ], [ %bc.resume.val17, %scalar.ph12 ]
  %cmp4.i = icmp ult i64 %j.0.i, %_arg_size_
  br i1 %cmp4.i, label %for.body6.i, label %for.cond8.i.preheader

for.cond8.i.preheader:                            ; preds = %for.cond2.i
  %mul20.i = mul i64 %i.0.i, %_arg_size_
  %31 = getelementptr float, ptr addrspace(1) %_arg_raw_C, i64 %mul20.i
  %32 = getelementptr float, ptr addrspace(1) %_arg_raw_E, i64 %mul20.i
  br label %for.cond8.i

for.body6.i:                                      ; preds = %for.cond2.i
  %arrayidx.i = getelementptr float, ptr addrspace(1) %9, i64 %j.0.i
  store float 0.000000e+00, ptr addrspace(1) %arrayidx.i, align 4, !tbaa !13
  %inc.i = add nuw i64 %j.0.i, 1
  br label %for.cond2.i, !llvm.loop !31

for.cond8.i:                                      ; preds = %for.cond.cleanup17.i, %for.cond8.i.preheader
  %k.0.i = phi i64 [ %inc36.i, %for.cond.cleanup17.i ], [ 0, %for.cond8.i.preheader ]
  %33 = shl i64 %k.0.i, 2
  %34 = add i64 %5, %33
  %scevgep3 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %34
  %35 = add i64 %7, %33
  %scevgep4 = getelementptr i8, ptr addrspace(1) %_arg_raw_C, i64 %35
  %36 = mul i64 %3, %k.0.i
  %scevgep5 = getelementptr i8, ptr addrspace(1) %_arg_raw_D, i64 %36
  %37 = add i64 %2, %36
  %scevgep6 = getelementptr i8, ptr addrspace(1) %_arg_raw_D, i64 %37
  %cmp10.i = icmp ult i64 %k.0.i, %_arg_size_
  br i1 %cmp10.i, label %for.cond14.i.preheader, label %for.cond.cleanup11.i

for.cond14.i.preheader:                           ; preds = %for.cond8.i
  %arrayidx22.i = getelementptr float, ptr addrspace(1) %31, i64 %k.0.i
  %mul24.i = mul i64 %k.0.i, %_arg_size_
  %38 = getelementptr float, ptr addrspace(1) %_arg_raw_D, i64 %mul24.i
  %39 = call i64 @llvm.vscale.i64()
  %40 = mul i64 %39, 4
  %min.iters.check = icmp ule i64 %4, %40
  br i1 %min.iters.check, label %scalar.ph, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for.cond14.i.preheader
  %mul = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 4, i64 %_arg_size_)
  %mul.result = extractvalue { i64, i1 } %mul, 0
  %mul.overflow = extractvalue { i64, i1 } %mul, 1
  %41 = sub i64 0, %mul.result
  %42 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %mul.result
  %43 = icmp ult ptr addrspace(1) %42, %scevgep
  %44 = or i1 %43, %mul.overflow
  br i1 %44, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.scevcheck
  %bound0 = icmp ult ptr addrspace(1) %scevgep1, %scevgep4
  %bound1 = icmp ult ptr addrspace(1) %scevgep3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound07 = icmp ult ptr addrspace(1) %scevgep1, %scevgep6
  %bound18 = icmp ult ptr addrspace(1) %scevgep5, %scevgep2
  %found.conflict9 = and i1 %bound07, %bound18
  %conflict.rdx = or i1 %found.conflict, %found.conflict9
  br i1 %conflict.rdx, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %45 = call i64 @llvm.vscale.i64()
  %46 = mul i64 %45, 4
  %n.mod.vf = urem i64 %4, %46
  %47 = icmp eq i64 %n.mod.vf, 0
  %48 = select i1 %47, i64 %46, i64 %n.mod.vf
  %n.vec = sub i64 %4, %48
  %49 = call i64 @llvm.vscale.i64()
  %50 = mul i64 %49, 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %51 = add i64 %index, 0
  %52 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !13, !alias.scope !32
  %broadcast.splatinsert = insertelement <vscale x 4 x float> poison, float %52, i64 0
  %broadcast.splat = shufflevector <vscale x 4 x float> %broadcast.splatinsert, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  %53 = getelementptr float, ptr addrspace(1) %38, i64 %51
  %54 = getelementptr float, ptr addrspace(1) %53, i32 0
  %wide.load = load <vscale x 4 x float>, ptr addrspace(1) %54, align 4, !tbaa !13, !alias.scope !35
  %55 = getelementptr float, ptr addrspace(1) %32, i64 %51
  %56 = getelementptr float, ptr addrspace(1) %55, i32 0
  %wide.load10 = load <vscale x 4 x float>, ptr addrspace(1) %56, align 4, !tbaa !13, !alias.scope !37, !noalias !39
  %57 = call <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float> %broadcast.splat, <vscale x 4 x float> %wide.load, <vscale x 4 x float> %wide.load10)
  store <vscale x 4 x float> %57, ptr addrspace(1) %56, align 4, !tbaa !13, !alias.scope !37, !noalias !39
  %index.next = add nuw i64 %index, %50
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !40

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph

scalar.ph:                                        ; preds = %vector.memcheck, %vector.scevcheck, %for.cond14.i.preheader, %middle.block
  %bc.resume.val = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond14.i.preheader ], [ 0, %vector.scevcheck ], [ 0, %vector.memcheck ]
  br label %for.cond14.i

for.cond.cleanup11.i:                             ; preds = %for.cond8.i
  %inc39.i = add i64 %i.0.i, 1
  br label %for.cond.i, !llvm.loop !41

for.cond14.i:                                     ; preds = %for.body18.i, %scalar.ph
  %j13.0.i = phi i64 [ %inc33.i, %for.body18.i ], [ %bc.resume.val, %scalar.ph ]
  %cmp16.i = icmp ult i64 %j13.0.i, %_arg_size_
  br i1 %cmp16.i, label %for.body18.i, label %for.cond.cleanup17.i

for.cond.cleanup17.i:                             ; preds = %for.cond14.i
  %inc36.i = add i64 %k.0.i, 1
  br label %for.cond8.i, !llvm.loop !42

for.body18.i:                                     ; preds = %for.cond14.i
  %59 = load float, ptr addrspace(1) %arrayidx22.i, align 4, !tbaa !13
  %arrayidx26.i = getelementptr float, ptr addrspace(1) %38, i64 %j13.0.i
  %60 = load float, ptr addrspace(1) %arrayidx26.i, align 4, !tbaa !13
  %arrayidx31.i = getelementptr float, ptr addrspace(1) %32, i64 %j13.0.i
  %61 = load float, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %62 = tail call float @llvm.fmuladd.f32(float %59, float %60, float %61)
  store float %62, ptr addrspace(1) %arrayidx31.i, align 4, !tbaa !13
  %inc33.i = add nuw i64 %j13.0.i, 1
  br label %for.cond14.i, !llvm.loop !43

_ZZZN13Polybench_2mm3runERSt6vectorIN4sycl3_V15eventESaIS3_EEENKUlRNS2_7handlerEE0_clES8_ENKUlvE_clEv.exit: ; preds = %for.cond.i
  ret void
}

declare dso_local i32 @_Z18__spirv_ocl_printfPU3AS2Kcz(ptr addrspace(2), ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x float> @llvm.fmuladd.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>) #3

attributes #0 = { mustprogress norecurse nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "sycl-module-id"="2mm.cpp" "sycl-optlevel"="3" "sycl-single-task" "target-cpu"="neoverse-v2" "target-features"="+sve" "uniform-work-group-size"="true" }
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
!28 = distinct !{!28, !24}
!29 = distinct !{!29, !24, !25}
!30 = distinct !{!30, !24, !25, !26}
!31 = distinct !{!31, !24, !26, !25}
!32 = !{!33}
!33 = distinct !{!33, !34}
!34 = distinct !{!34, !"LVerDomain"}
!35 = !{!36}
!36 = distinct !{!36, !34}
!37 = !{!38}
!38 = distinct !{!38, !34}
!39 = !{!33, !36}
!40 = distinct !{!40, !24, !25, !26}
!41 = distinct !{!41, !24}
!42 = distinct !{!42, !24}
!43 = distinct !{!43, !24, !25}
