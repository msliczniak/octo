: main
hires
v2 := 4
v1 := 0

v0 := 0
i := piece
sprite v0 v1 3
i += v2
v0 += 8
sprite v0 v1 3

v0 := 64
i := piece
sprite v0 v1 3
i += v2
v0 += 8
sprite v0 v1 3

v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1
v1 := 0

v0 := 0
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 64
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 6
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 70
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 12
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 76
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 18
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

v0 := 82
i := right
v3 := 0
if v3 key then
v2 := 4
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
v2 := 4
sprite v0 v1 3

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
0x3F 0x44 0x3F 0x00
0x80 0x40 0x80 0x00

: right
0x3F 0x45 0x3F 0x00
0x7E 0x51 0x7E
