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
