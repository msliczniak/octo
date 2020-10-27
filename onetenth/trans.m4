# trans.m4

: flip
i := board2-7
load ve
v0 := ve
v1 := vd
v2 := vc
v3 := vb
v4 := va
v5 := v9
v6 := v8
i := prevboard0
save v7

i := board0-7
load ve
v0 := ve
v1 := vd
v2 := vc
v3 := vb
v4 := va
v5 := v9
v6 := v8
i := prevboard2
save v7
i := board2
save v7

i := prevboard0
load v7
i := board0
save v7
return

: right
i := board-1
load ve
vf := ve
ve := va
va := v9
v9 := v5
v5 := v4
v4 := v0

v0 := vd
vd := v6
v6 := v8
v8 := v1
v1 := v3
v3 := vb
vb := v0

v0 := vc
vc := v2
v2 := v7
v7 := v0
i := board
load v0

i := board
save ve
i := prevboard
save vf
return
