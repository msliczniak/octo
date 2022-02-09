define(`CR', `v8')dnl
define(`CX', `v9')dnl
define(`CY', `va')dnl

: main
CX := 0
CY := 1

v1 := 255
v0 := 2
delay := v0
: start_sync
v0 := delay
if v0 != 0
then jump start_sync
delay := v1

CX += 4
i := boards
i += CX
i += CX
load v7

if v0 != 0xff then
v0 := 0
CY += 6

if v1 != 0xff then
v0 := 0
CY += 6

if v2 != 0xff then
v0 := 0
CY += 6

if v3 != 0xff then
v0 := 0
CY += 6

if v4 != 0xff then
v0 := 0
CY += 6

if v5 != 0xff then
v0 := 0
CY += 6

if v6 != 0xff then
v0 := 0
CY += 6

if v7 != 0xff then
v0 := 0
CY -= 42

v1 := delay
v0 := 255
v0 -= v1
i := hex v0
v0 := 1
sprite v0 v0 5
v0 := key
clear
jump main

: boards
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff

0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff

0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff

0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff
