target datalayout = "E-m:e-p:32:16:32-i8:8:8-i16:16:16-i32:16:32-n8:16:32-a:0:16-S16"
target triple = "m68k"

define i1 @ham(i128 %arg, i128 %arg1, i1 %arg2) {
bb:
  %lshr = lshr i128 %arg, 64
  %icmp = icmp eq i128 %lshr, 0
  %and = and i1 false, true
  br i1 %and, label %bb5, label %bb3

bb3:                                              ; preds = %bb
  %icmp4 = icmp ult i128 1, %arg1
  ret i1 %icmp4

bb5:                                              ; preds = %bb
  br i1 %icmp, label %bb7, label %bb6

bb6:                                              ; preds = %bb5
  br i1 %arg2, label %bb10, label %bb8

bb7:                                              ; preds = %bb5
  ret i1 false

bb8:                                              ; preds = %bb6
  %icmp9 = icmp eq i64 0, 0
  br i1 %icmp9, label %bb11, label %bb12

bb10:                                             ; preds = %bb6
  br label %bb19

bb11:                                             ; preds = %bb8
  ret i1 false

bb12:                                             ; preds = %bb8
  %shl = shl i128 %arg1, 1
  br label %bb15

bb15:                                             ; preds = %bb17, %bb12
  %phi = phi i128 [ 0, %bb12 ], [ %or, %bb17 ]
  %or = or i128 %phi, %shl
  br i1 false, label %bb16, label %bb17

bb16:                                             ; preds = %bb15
  br label %bb17

bb17:                                             ; preds = %bb16, %bb15
  %phi18 = phi i128 [ %phi, %bb16 ], [ 0, %bb15 ]
  br label %bb15

bb19:                                             ; preds = %bb23, %bb10
  %phi20 = phi i128 [ 0, %bb10 ], [ %lshr25, %bb23 ]
  %phi21 = phi i128 [ %arg, %bb10 ], [ %sub, %bb23 ]
  %sub = sub i128 %phi21, %phi20
  br i1 false, label %bb22, label %bb23

bb22:                                             ; preds = %bb19
  br label %bb23

bb23:                                             ; preds = %bb22, %bb19
  %phi24 = phi i128 [ %phi21, %bb22 ], [ 0, %bb19 ]
  %lshr25 = lshr i128 %phi20, 1
  br label %bb19
}
