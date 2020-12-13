pushdef(`P00', 0)dnl
pushdef(`P01', 15)dnl
pushdef(`P11', 30)dnl
pushdef(`P10', 45)dnl

: main
hires
plane 3

: _main_loop
v1 := 112
v2 := 32
v3 := 0
v4 := 104

: _draw
i := symc
i += v3
load v0

i := p00
i += v0
sprite v1 v2 15

i := isym0
i += v3
i += v3
sprite v4 v2 15

if v2 == 48
then jump _h

v2 += 16
v3 += 15
jump _draw

: _h
if v4 == 64
then jump _w

v1 -= 10
v2 := 0
v3 += 15
v4 -= 10
v2 := 0
jump _draw

: _w
v0 := key
jump _main_loop

pushdef(`IX', `0')dnl

pushdef(`C', `:byte $1 0 0 0 0 0 0 0 0 0 0 0 0 0 0')dnl

pushdef(`N', `eval($1 ^ 255)popdef($1)')dnl

pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
divert(incr(divnum))dnl
`: isym'I
:byte N(`L0') N(`L1') N(`L2') N(`L3') N(`L4') N(`L5') N(`L6') N(`L7') dnl
N(`L8') N(`L9') N(`L10') N(`L11') N(`L12') N(`L13') N(`L14')
:byte N(`R0') N(`R1') N(`R2') N(`R3') N(`R4') N(`R5') N(`R6') N(`R7') dnl
N(`R8') N(`R9') N(`R10') N(`R11') N(`R12') N(`R13') N(`R14')
popdef(`I')dnl
divert(decr(divnum))dnl
')dnl

: p00
:byte 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128
:byte 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128
:byte   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
:byte   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
:byte 128 128 128 128 128 128 128 128 128 128 128 128 128 128 128
: symc
dnl 0-spi-r.txt
C(P00)dnl
pushdef(`L0', 0)pushdef(`R0', 0)dnl
pushdef(`L1', 0)pushdef(`R1', 0)dnl
pushdef(`L2', 0)pushdef(`R2', 0)dnl
pushdef(`L3', 0)pushdef(`R3', 0)dnl
pushdef(`L4', 0)pushdef(`R4', 0)dnl
pushdef(`L5', 0)pushdef(`R5', 0)dnl
pushdef(`L6', 0)pushdef(`R6', 0)dnl
pushdef(`L7', 0)pushdef(`R7', 0)dnl
pushdef(`L8', 0)pushdef(`R8', 0)dnl
pushdef(`L9', 0)pushdef(`R9', 0)dnl
pushdef(`L10', 0)pushdef(`R10', 0)dnl
pushdef(`L11', 0)pushdef(`R11', 0)dnl
pushdef(`L12', 0)pushdef(`R12', 0)dnl
pushdef(`L13', 0)pushdef(`R13', 0)dnl
pushdef(`L14', 0)pushdef(`R14', 0)dnl
NI
dnl 3-2i-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 255)dnl
pushdef(`L1', 0)pushdef(`R1', 255)dnl
pushdef(`L2', 0)pushdef(`R2', 255)dnl
pushdef(`L3', 0)pushdef(`R3', 255)dnl
pushdef(`L4', 0)pushdef(`R4', 255)dnl
pushdef(`L5', 64)pushdef(`R5', 255)dnl
pushdef(`L6', 96)pushdef(`R6', 255)dnl
pushdef(`L7', 82)pushdef(`R7', 255)dnl
pushdef(`L8', 73)pushdef(`R8', 255)dnl
pushdef(`L9', 69)pushdef(`R9', 255)dnl
pushdef(`L10', 2)pushdef(`R10', 255)dnl
pushdef(`L11', 0)pushdef(`R11', 255)dnl
pushdef(`L12', 0)pushdef(`R12', 255)dnl
pushdef(`L13', 0)pushdef(`R13', 255)dnl
pushdef(`L14', 0)pushdef(`R14', 255)dnl
NI
dnl 4-4b-r.txt
C(P10)dnl
pushdef(`L0', 255)pushdef(`R0', 0)dnl
pushdef(`L1', 255)pushdef(`R1', 0)dnl
pushdef(`L2', 255)pushdef(`R2', 0)dnl
pushdef(`L3', 255)pushdef(`R3', 0)dnl
pushdef(`L4', 255)pushdef(`R4', 56)dnl
pushdef(`L5', 255)pushdef(`R5', 60)dnl
pushdef(`L6', 255)pushdef(`R6', 62)dnl
pushdef(`L7', 255)pushdef(`R7', 55)dnl
pushdef(`L8', 255)pushdef(`R8', 51)dnl
pushdef(`L9', 255)pushdef(`R9', 121)dnl
pushdef(`L10', 255)pushdef(`R10', 120)dnl
pushdef(`L11', 255)pushdef(`R11', 48)dnl
pushdef(`L12', 255)pushdef(`R12', 0)dnl
pushdef(`L13', 255)pushdef(`R13', 0)dnl
pushdef(`L14', 255)pushdef(`R14', 0)dnl
NI
dnl 5-8r-r.txt
C(P00)dnl
pushdef(`L0', 0)pushdef(`R0', 0)dnl
pushdef(`L1', 0)pushdef(`R1', 0)dnl
pushdef(`L2', 0)pushdef(`R2', 0)dnl
pushdef(`L3', 0)pushdef(`R3', 0)dnl
pushdef(`L4', 0)pushdef(`R4', 0)dnl
pushdef(`L5', 54)pushdef(`R5', 0)dnl
pushdef(`L6', 73)pushdef(`R6', 0)dnl
pushdef(`L7', 73)pushdef(`R7', 0)dnl
pushdef(`L8', 73)pushdef(`R8', 0)dnl
pushdef(`L9', 54)pushdef(`R9', 0)dnl
pushdef(`L10', 0)pushdef(`R10', 0)dnl
pushdef(`L11', 0)pushdef(`R11', 0)dnl
pushdef(`L12', 0)pushdef(`R12', 0)dnl
pushdef(`L13', 0)pushdef(`R13', 0)dnl
pushdef(`L14', 0)pushdef(`R14', 0)dnl
NI
dnl 6-16i-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 255)dnl
pushdef(`L1', 0)pushdef(`R1', 255)dnl
pushdef(`L2', 0)pushdef(`R2', 255)dnl
pushdef(`L3', 64)pushdef(`R3', 191)dnl
pushdef(`L4', 64)pushdef(`R4', 191)dnl
pushdef(`L5', 98)pushdef(`R5', 157)dnl
pushdef(`L6', 90)pushdef(`R6', 165)dnl
pushdef(`L7', 7)pushdef(`R7', 248)dnl
pushdef(`L8', 48)pushdef(`R8', 207)dnl
pushdef(`L9', 76)pushdef(`R9', 179)dnl
pushdef(`L10', 74)pushdef(`R10', 181)dnl
pushdef(`L11', 49)pushdef(`R11', 206)dnl
pushdef(`L12', 1)pushdef(`R12', 254)dnl
pushdef(`L13', 0)pushdef(`R13', 255)dnl
pushdef(`L14', 0)pushdef(`R14', 255)dnl
NI
dnl 7-32b-r.txt
C(P10)dnl
pushdef(`L0', 255)pushdef(`R0', 0)dnl
pushdef(`L1', 221)pushdef(`R1', 34)dnl
pushdef(`L2', 156)pushdef(`R2', 99)dnl
pushdef(`L3', 148)pushdef(`R3', 107)dnl
pushdef(`L4', 148)pushdef(`R4', 107)dnl
pushdef(`L5', 128)pushdef(`R5', 127)dnl
pushdef(`L6', 201)pushdef(`R6', 54)dnl
pushdef(`L7', 255)pushdef(`R7', 0)dnl
pushdef(`L8', 157)pushdef(`R8', 98)dnl
pushdef(`L9', 140)pushdef(`R9', 115)dnl
pushdef(`L10', 132)pushdef(`R10', 123)dnl
pushdef(`L11', 160)pushdef(`R11', 95)dnl
pushdef(`L12', 176)pushdef(`R12', 79)dnl
pushdef(`L13', 185)pushdef(`R13', 70)dnl
pushdef(`L14', 255)pushdef(`R14', 0)dnl
NI
dnl 8-64r-r.txt
C(P00)dnl
pushdef(`L0', 0)pushdef(`R0', 0)dnl
pushdef(`L1', 0)pushdef(`R1', 0)dnl
pushdef(`L2', 0)pushdef(`R2', 0)dnl
pushdef(`L3', 0)pushdef(`R3', 62)dnl
pushdef(`L4', 0)pushdef(`R4', 73)dnl
pushdef(`L5', 0)pushdef(`R5', 73)dnl
pushdef(`L6', 0)pushdef(`R6', 48)dnl
pushdef(`L7', 0)pushdef(`R7', 0)dnl
pushdef(`L8', 0)pushdef(`R8', 24)dnl
pushdef(`L9', 0)pushdef(`R9', 20)dnl
pushdef(`L10', 0)pushdef(`R10', 18)dnl
pushdef(`L11', 0)pushdef(`R11', 121)dnl
pushdef(`L12', 0)pushdef(`R12', 16)dnl
pushdef(`L13', 0)pushdef(`R13', 0)dnl
pushdef(`L14', 0)pushdef(`R14', 0)dnl
NI
dnl 9-128i-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 191)dnl
pushdef(`L1', 0)pushdef(`R1', 191)dnl
pushdef(`L2', 0)pushdef(`R2', 157)dnl
pushdef(`L3', 0)pushdef(`R3', 165)dnl
pushdef(`L4', 0)pushdef(`R4', 248)dnl
pushdef(`L5', 0)pushdef(`R5', 191)dnl
pushdef(`L6', 0)pushdef(`R6', 157)dnl
pushdef(`L7', 0)pushdef(`R7', 174)dnl
pushdef(`L8', 0)pushdef(`R8', 182)dnl
pushdef(`L9', 0)pushdef(`R9', 249)dnl
pushdef(`L10', 0)pushdef(`R10', 207)dnl
pushdef(`L11', 0)pushdef(`R11', 177)dnl
pushdef(`L12', 0)pushdef(`R12', 182)dnl
pushdef(`L13', 0)pushdef(`R13', 198)dnl
pushdef(`L14', 0)pushdef(`R14', 249)dnl
NI
dnl a-256b-r.txt
C(P00)dnl
pushdef(`L0', 115)pushdef(`R0', 0)dnl
pushdef(`L1', 123)pushdef(`R1', 0)dnl
pushdef(`L2', 95)pushdef(`R2', 0)dnl
pushdef(`L3', 78)pushdef(`R3', 0)dnl
pushdef(`L4', 0)pushdef(`R4', 0)dnl
pushdef(`L5', 94)pushdef(`R5', 0)dnl
pushdef(`L6', 95)pushdef(`R6', 0)dnl
pushdef(`L7', 123)pushdef(`R7', 0)dnl
pushdef(`L8', 123)pushdef(`R8', 0)dnl
pushdef(`L9', 0)pushdef(`R9', 0)dnl
pushdef(`L10', 60)pushdef(`R10', 0)dnl
pushdef(`L11', 126)pushdef(`R11', 0)dnl
pushdef(`L12', 79)pushdef(`R12', 0)dnl
pushdef(`L13', 123)pushdef(`R13', 0)dnl
pushdef(`L14', 123)pushdef(`R14', 0)dnl
NI
dnl b-512r-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 255)dnl
pushdef(`L1', 38)pushdef(`R1', 217)dnl
pushdef(`L2', 69)pushdef(`R2', 186)dnl
pushdef(`L3', 69)pushdef(`R3', 186)dnl
pushdef(`L4', 57)pushdef(`R4', 198)dnl
pushdef(`L5', 0)pushdef(`R5', 255)dnl
pushdef(`L6', 66)pushdef(`R6', 189)dnl
pushdef(`L7', 66)pushdef(`R7', 189)dnl
pushdef(`L8', 127)pushdef(`R8', 128)dnl
pushdef(`L9', 64)pushdef(`R9', 191)dnl
pushdef(`L10', 0)pushdef(`R10', 255)dnl
pushdef(`L11', 98)pushdef(`R11', 157)dnl
pushdef(`L12', 81)pushdef(`R12', 174)dnl
pushdef(`L13', 73)pushdef(`R13', 182)dnl
pushdef(`L14', 70)pushdef(`R14', 185)dnl
NI
dnl c-1ki-r.txt
C(P10)dnl
pushdef(`L0', 255)pushdef(`R0', 0)dnl
pushdef(`L1', 255)pushdef(`R1', 0)dnl
pushdef(`L2', 255)pushdef(`R2', 0)dnl
pushdef(`L3', 255)pushdef(`R3', 64)dnl
pushdef(`L4', 255)pushdef(`R4', 64)dnl
pushdef(`L5', 255)pushdef(`R5', 98)dnl
pushdef(`L6', 255)pushdef(`R6', 90)dnl
pushdef(`L7', 255)pushdef(`R7', 7)dnl
pushdef(`L8', 255)pushdef(`R8', 112)dnl
pushdef(`L9', 255)pushdef(`R9', 15)dnl
pushdef(`L10', 255)pushdef(`R10', 20)dnl
pushdef(`L11', 255)pushdef(`R11', 98)dnl
pushdef(`L12', 255)pushdef(`R12', 1)dnl
pushdef(`L13', 255)pushdef(`R13', 0)dnl
pushdef(`L14', 255)pushdef(`R14', 0)dnl
NI
dnl d-2kb-r.txt
C(P00)dnl
pushdef(`L0', 0)pushdef(`R0', 0)dnl
pushdef(`L1', 98)pushdef(`R1', 98)dnl
pushdef(`L2', 115)pushdef(`R2', 115)dnl
pushdef(`L3', 123)pushdef(`R3', 123)dnl
pushdef(`L4', 95)pushdef(`R4', 95)dnl
pushdef(`L5', 79)pushdef(`R5', 79)dnl
pushdef(`L6', 70)pushdef(`R6', 70)dnl
pushdef(`L7', 0)pushdef(`R7', 0)dnl
pushdef(`L8', 127)pushdef(`R8', 127)dnl
pushdef(`L9', 127)pushdef(`R9', 127)dnl
pushdef(`L10', 28)pushdef(`R10', 28)dnl
pushdef(`L11', 54)pushdef(`R11', 54)dnl
pushdef(`L12', 99)pushdef(`R12', 99)dnl
pushdef(`L13', 65)pushdef(`R13', 65)dnl
pushdef(`L14', 0)pushdef(`R14', 0)dnl
NI
dnl e-4kr-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 255)dnl
pushdef(`L1', 0)pushdef(`R1', 255)dnl
pushdef(`L2', 24)pushdef(`R2', 255)dnl
pushdef(`L3', 20)pushdef(`R3', 255)dnl
pushdef(`L4', 18)pushdef(`R4', 255)dnl
pushdef(`L5', 121)pushdef(`R5', 255)dnl
pushdef(`L6', 16)pushdef(`R6', 255)dnl
pushdef(`L7', 0)pushdef(`R7', 255)dnl
pushdef(`L8', 127)pushdef(`R8', 255)dnl
pushdef(`L9', 8)pushdef(`R9', 255)dnl
pushdef(`L10', 20)pushdef(`R10', 255)dnl
pushdef(`L11', 34)pushdef(`R11', 255)dnl
pushdef(`L12', 65)pushdef(`R12', 255)dnl
pushdef(`L13', 0)pushdef(`R13', 255)dnl
pushdef(`L14', 0)pushdef(`R14', 255)dnl
NI
dnl f-8ki-r.txt
C(P10)dnl
pushdef(`L0', 255)pushdef(`R0', 0)dnl
pushdef(`L1', 255)pushdef(`R1', 0)dnl
pushdef(`L2', 255)pushdef(`R2', 0)dnl
pushdef(`L3', 207)pushdef(`R3', 48)dnl
pushdef(`L4', 177)pushdef(`R4', 78)dnl
pushdef(`L5', 182)pushdef(`R5', 73)dnl
pushdef(`L6', 198)pushdef(`R6', 57)dnl
pushdef(`L7', 249)pushdef(`R7', 6)dnl
pushdef(`L8', 143)pushdef(`R8', 112)dnl
pushdef(`L9', 240)pushdef(`R9', 15)dnl
pushdef(`L10', 235)pushdef(`R10', 20)dnl
pushdef(`L11', 157)pushdef(`R11', 98)dnl
pushdef(`L12', 254)pushdef(`R12', 1)dnl
pushdef(`L13', 255)pushdef(`R13', 0)dnl
pushdef(`L14', 255)pushdef(`R14', 0)dnl
NI
dnl g-16kb-r.txt
C(P00)dnl
pushdef(`L0', 0)pushdef(`R0', 70)dnl
pushdef(`L1', 0)pushdef(`R1', 127)dnl
pushdef(`L2', 0)pushdef(`R2', 127)dnl
pushdef(`L3', 0)pushdef(`R3', 64)dnl
pushdef(`L4', 0)pushdef(`R4', 60)dnl
pushdef(`L5', 0)pushdef(`R5', 126)dnl
pushdef(`L6', 0)pushdef(`R6', 79)dnl
pushdef(`L7', 0)pushdef(`R7', 123)dnl
pushdef(`L8', 0)pushdef(`R8', 123)dnl
pushdef(`L9', 0)pushdef(`R9', 0)dnl
pushdef(`L10', 0)pushdef(`R10', 127)dnl
pushdef(`L11', 0)pushdef(`R11', 127)dnl
pushdef(`L12', 0)pushdef(`R12', 28)dnl
pushdef(`L13', 0)pushdef(`R13', 118)dnl
pushdef(`L14', 0)pushdef(`R14', 99)dnl
NI
dnl h-32kr-r.txt
C(P01)dnl
pushdef(`L0', 0)pushdef(`R0', 221)dnl
pushdef(`L1', 0)pushdef(`R1', 190)dnl
pushdef(`L2', 0)pushdef(`R2', 182)dnl
pushdef(`L3', 0)pushdef(`R3', 201)dnl
pushdef(`L4', 0)pushdef(`R4', 255)dnl
pushdef(`L5', 0)pushdef(`R5', 157)dnl
pushdef(`L6', 0)pushdef(`R6', 174)dnl
pushdef(`L7', 0)pushdef(`R7', 182)dnl
pushdef(`L8', 0)pushdef(`R8', 185)dnl
pushdef(`L9', 0)pushdef(`R9', 255)dnl
pushdef(`L10', 0)pushdef(`R10', 128)dnl
pushdef(`L11', 0)pushdef(`R11', 247)dnl
pushdef(`L12', 0)pushdef(`R12', 235)dnl
pushdef(`L13', 0)pushdef(`R13', 221)dnl
pushdef(`L14', 0)pushdef(`R14', 190)dnl
NI
dnl i-64ki-r.txt
C(P10)dnl
pushdef(`L0', 207)pushdef(`R0', 0)dnl
pushdef(`L1', 179)pushdef(`R1', 0)dnl
pushdef(`L2', 181)pushdef(`R2', 0)dnl
pushdef(`L3', 206)pushdef(`R3', 0)dnl
pushdef(`L4', 254)pushdef(`R4', 0)dnl
pushdef(`L5', 231)pushdef(`R5', 0)dnl
pushdef(`L6', 235)pushdef(`R6', 0)dnl
pushdef(`L7', 141)pushdef(`R7', 0)dnl
pushdef(`L8', 230)pushdef(`R8', 0)dnl
pushdef(`L9', 254)pushdef(`R9', 0)dnl
pushdef(`L10', 143)pushdef(`R10', 0)dnl
pushdef(`L11', 240)pushdef(`R11', 0)dnl
pushdef(`L12', 235)pushdef(`R12', 0)dnl
pushdef(`L13', 157)pushdef(`R13', 0)dnl
pushdef(`L14', 254)pushdef(`R14', 0)dnl
NI
dnl j-128kr-r.txt
C(P11)dnl
pushdef(`L0', 128)pushdef(`R0', 128)dnl
pushdef(`L1', 255)pushdef(`R1', 255)dnl
pushdef(`L2', 142)pushdef(`R2', 142)dnl
pushdef(`L3', 182)pushdef(`R3', 182)dnl
pushdef(`L4', 185)pushdef(`R4', 185)dnl
pushdef(`L5', 255)pushdef(`R5', 255)dnl
pushdef(`L6', 201)pushdef(`R6', 201)dnl
pushdef(`L7', 182)pushdef(`R7', 182)dnl
pushdef(`L8', 182)pushdef(`R8', 182)dnl
pushdef(`L9', 201)pushdef(`R9', 201)dnl
pushdef(`L10', 255)pushdef(`R10', 255)dnl
pushdef(`L11', 128)pushdef(`R11', 128)dnl
pushdef(`L12', 247)pushdef(`R12', 247)dnl
pushdef(`L13', 235)pushdef(`R13', 235)dnl
pushdef(`L14', 156)pushdef(`R14', 156)dnl
NI
