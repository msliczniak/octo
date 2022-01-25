: main
hires
v2 := 5
v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1

v0 := 16
v1 := 0
i := 0
v3 := 0
if v3 key then
i += v2
sprite v0 v1 3
i += v2
v0 += 8
v3 := 1
if v3 key then
i += v2
sprite v0 v1 3
i += v2
v0 += 8
v3 := 2
if v3 key then
i += v2
sprite v0 v1 3

v0 := 40
v1 := 0
i := 0
v3 := 3
if v3 key then
i += v2
sprite v0 v1 3
i += v2
v0 += 8
v3 := 4
if v3 key then
i += v2
sprite v0 v1 3
i += v2
v0 += 8
v3 := 5
if v3 key then
i += v2
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
