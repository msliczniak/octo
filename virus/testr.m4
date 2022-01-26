: main
hires
v2 := 4
v1 := 1

v0 := 0
i := piece
sprite v0 v1 9
v0 += 4
sprite v0 v1 9
v0 := 64
sprite v0 v1 9
v0 += 4
sprite v0 v1 9

v1 := 255
v0 := 1
delay := v0

v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1
v1 := 1

v0 := 0
i := down
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 15

v0 += 4
i := down
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 15

v0 := 64
i := down
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 15

v0 += 4
i := down
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 15

v1 := delay
v0 := 255
v0 -= v1
i := hex v0
v0 := 0
sprite v0 v0 5

v0 := key
clear
jump main

: piece
0x02 0x05 0x05 0x05 0x07 0x05 0x05 0x05 0x02

: down
0x02 0x05 0x05 0x05 0x07 0x05 0x07 0x00 0x07 0x05 0x07 0x05 0x05 0x05 0x02
