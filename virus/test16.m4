: main
hires
v2 := 0

i := dots
v0 := 0
v1 := 0
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 64
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 0
v1 += 16
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 64
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 0
v1 += 16
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 64
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 0
v1 += 16
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 := 64
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0
v0 += 12
sprite v0 v1 0

v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1

v0 := 0
v1 := 0
i := piece
v3 := 0
if v3 key then
i += v2
sprite v0 v1 0
i += v2
v0 += 12
v3 := 1
if v3 key then
i += v2
sprite v0 v1 0
i += v2
v0 += 12
v3 := 2
if v3 key then
i += v2
sprite v0 v1 0

v0 := 64
v1 := 0
i := piece
v3 := 3
if v3 key then
i += v2
sprite v0 v1 0
i += v2
v0 += 12
v3 := 4
if v3 key then
i += v2
sprite v0 v1 0
i += v2
v0 += 12
v3 := 5
if v3 key then
i += v2
sprite v0 v1 0

v1 := delay
v0 := 255
v0 -= v1
i := hex v0
v0 := 56
sprite v0 v0 5

v0 := key
clear
jump main

: dots
0x00 0x00 0x08 0x20 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x20 0x00 0x00 0x00 0x00
0x00 0x00 0x08 0x20 0x00 0x00 0x00 0x00 0x00 0x00 0x08 0x20 0x00 0x00 0x00 0x00

: piece
0x71 0xC0 0x87 0x40 0x71 0xC0 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
