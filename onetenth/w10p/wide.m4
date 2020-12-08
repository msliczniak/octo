pushdef(`N')dnl
pushdef(`IX', `0')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl

`: isym'I
:byte dnl
eval(L0 ^ 255) dnl
eval(L1 ^ 255) dnl
eval(L2 ^ 255) dnl
eval(L3 ^ 255) dnl
eval(L4 ^ 255) dnl
eval(L5 ^ 255) dnl
eval(L6 ^ 255)
:byte dnl
eval(R0 ^ 255) dnl
eval(R1 ^ 255) dnl
eval(R2 ^ 255) dnl
eval(R3 ^ 255) dnl
eval(R4 ^ 255) dnl
eval(R5 ^ 255) dnl
eval(R6 ^ 255)
N($*)
popdef(`I')dnl
popdef(`L0')popdef(`R0')dnl
popdef(`L1')popdef(`R1')dnl
popdef(`L2')popdef(`R2')dnl
popdef(`L3')popdef(`R3')dnl
popdef(`L4')popdef(`R4')dnl
popdef(`L5')popdef(`R5')dnl
popdef(`L6')popdef(`R6')dnl
')dnl NI
undivert
: symc
dnl italic blank space=
pushdef(`L0', 63)pushdef(`R0', 254)dnl
pushdef(`L1', 63)pushdef(`R1', 254)dnl
pushdef(`L2', 127)pushdef(`R2', 254)dnl
pushdef(`L3', 127)pushdef(`R3', 252)dnl
pushdef(`L4', 255)pushdef(`R4', 252)dnl
pushdef(`L5', 255)pushdef(`R5', 248)dnl
pushdef(`L6', 255)pushdef(`R6', 248)dnl
:byte 2 NI

pushdef(`N', `dnl
divert(incr(divnum))dnl
`: hisym'I
:byte dnl
eval(L0) dnl
eval(L1) dnl
eval(L2) dnl
eval(L3) dnl
eval(L4) dnl
eval(L5) dnl
eval(L6)
:byte dnl
eval(R0) dnl
eval(R1) dnl
eval(R2) dnl
eval(R3) dnl
eval(R4) dnl
eval(R5) dnl
eval(R6)
ifelse(I, 1, `dnl
: hisymf    # filler
:byte 0
')dnl I == 1
divert(decr(divnum))dnl
')dnl N
dnl ==> 0b.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 28)dnl
pushdef(`L1', 0)pushdef(`R1', 62)dnl
pushdef(`L2', 0)pushdef(`R2', 54)dnl
pushdef(`L3', 0)pushdef(`R3', 54)dnl
pushdef(`L4', 0)pushdef(`R4', 54)dnl
pushdef(`L5', 0)pushdef(`R5', 62)dnl
pushdef(`L6', 0)pushdef(`R6', 28)dnl
:byte 2 NI

dnl ==> 0-1r.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 8)dnl
pushdef(`L1', 0)pushdef(`R1', 56)dnl
pushdef(`L2', 0)pushdef(`R2', 8)dnl
pushdef(`L3', 0)pushdef(`R3', 8)dnl
pushdef(`L4', 0)pushdef(`R4', 8)dnl
pushdef(`L5', 0)pushdef(`R5', 8)dnl
pushdef(`L6', 0)pushdef(`R6', 62)dnl
:byte 2 NI

popdef(`N')dnl
dnl ==> 1-2i.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 12)dnl
pushdef(`L1', 0)pushdef(`R1', 18)dnl
pushdef(`L2', 0)pushdef(`R2', 4)dnl
pushdef(`L3', 0)pushdef(`R3', 8)dnl
pushdef(`L4', 0)pushdef(`R4', 16)dnl
pushdef(`L5', 0)pushdef(`R5', 32)dnl
pushdef(`L6', 0)pushdef(`R6', 124)dnl
:byte 2 NI

dnl ==> 2-4b.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 56)dnl
pushdef(`L1', 0)pushdef(`R1', 112)dnl
pushdef(`L2', 0)pushdef(`R2', 224)dnl
pushdef(`L3', 1)pushdef(`R3', 204)dnl
pushdef(`L4', 1)pushdef(`R4', 254)dnl
pushdef(`L5', 1)pushdef(`R5', 254)dnl
pushdef(`L6', 0)pushdef(`R6', 12)dnl
:byte 2 NI

dnl ==> 3-8r.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 28)dnl
pushdef(`L1', 0)pushdef(`R1', 34)dnl
pushdef(`L2', 0)pushdef(`R2', 34)dnl
pushdef(`L3', 0)pushdef(`R3', 28)dnl
pushdef(`L4', 0)pushdef(`R4', 34)dnl
pushdef(`L5', 0)pushdef(`R5', 34)dnl
pushdef(`L6', 0)pushdef(`R6', 28)dnl
:byte 2 NI

dnl ==> 4-16i.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 70)dnl
pushdef(`L1', 1)pushdef(`R1', 200)dnl
pushdef(`L2', 0)pushdef(`R2', 80)dnl
pushdef(`L3', 0)pushdef(`R3', 152)dnl
pushdef(`L4', 0)pushdef(`R4', 164)dnl
pushdef(`L5', 1)pushdef(`R5', 36)dnl
pushdef(`L6', 7)pushdef(`R6', 152)dnl
:byte 2 NI

dnl ==> 5-32b.pbm.txt <==
pushdef(`L0', 30)pushdef(`R0', 60)dnl
pushdef(`L1', 63)pushdef(`R1', 126)dnl
pushdef(`L2', 3)pushdef(`R2', 14)dnl
pushdef(`L3', 14)pushdef(`R3', 28)dnl
pushdef(`L4', 3)pushdef(`R4', 56)dnl
pushdef(`L5', 63)pushdef(`R5', 112)dnl
pushdef(`L6', 30)pushdef(`R6', 126)dnl
:byte 2 NI

dnl ==> 6-64r.pbm.txt <==
pushdef(`L0', 3)pushdef(`R0', 4)dnl
pushdef(`L1', 4)pushdef(`R1', 8)dnl
pushdef(`L2', 4)pushdef(`R2', 16)dnl
pushdef(`L3', 7)pushdef(`R3', 36)dnl
pushdef(`L4', 4)pushdef(`R4', 190)dnl
pushdef(`L5', 4)pushdef(`R5', 132)dnl
pushdef(`L6', 3)pushdef(`R6', 4)dnl
:byte 2 NI

dnl ==> 7-128i.pbm.txt <==
pushdef(`L0', 9)pushdef(`R0', 140)dnl
pushdef(`L1', 58)pushdef(`R1', 82)dnl
pushdef(`L2', 8)pushdef(`R2', 82)dnl
pushdef(`L3', 16)pushdef(`R3', 156)dnl
pushdef(`L4', 17)pushdef(`R4', 36)dnl
pushdef(`L5', 34)pushdef(`R5', 36)dnl
pushdef(`L6', 247)pushdef(`R6', 152)dnl
:byte 2 NI

dnl ==> 8-256b.pbm.txt <==
pushdef(`L0', 227)pushdef(`R0', 142)dnl
pushdef(`L1', 247)pushdef(`R1', 158)dnl
pushdef(`L2', 54)pushdef(`R2', 56)dnl
pushdef(`L3', 119)pushdef(`R3', 190)dnl
pushdef(`L4', 231)pushdef(`R4', 182)dnl
pushdef(`L5', 193)pushdef(`R5', 182)dnl
pushdef(`L6', 247)pushdef(`R6', 158)dnl
:byte 2 NI

dnl ==> 9-512r.pbm.txt <==
pushdef(`L0', 56)pushdef(`R0', 140)dnl
pushdef(`L1', 67)pushdef(`R1', 146)dnl
pushdef(`L2', 112)pushdef(`R2', 130)dnl
pushdef(`L3', 8)pushdef(`R3', 132)dnl
pushdef(`L4', 8)pushdef(`R4', 136)dnl
pushdef(`L5', 72)pushdef(`R5', 144)dnl
pushdef(`L6', 51)pushdef(`R6', 222)dnl
:byte 2 NI

dnl ==> a-1ki.pbm.txt <==
pushdef(`L0', 0)pushdef(`R0', 82)dnl
pushdef(`L1', 1)pushdef(`R1', 212)dnl
pushdef(`L2', 0)pushdef(`R2', 88)dnl
pushdef(`L3', 0)pushdef(`R3', 144)dnl
pushdef(`L4', 0)pushdef(`R4', 168)dnl
pushdef(`L5', 1)pushdef(`R5', 36)dnl
pushdef(`L6', 7)pushdef(`R6', 164)dnl
:byte 2 NI

dnl ==> b-2kb.pbm.txt <==
pushdef(`L0', 15)pushdef(`R0', 50)dnl
pushdef(`L1', 31)pushdef(`R1', 182)dnl
pushdef(`L2', 3)pushdef(`R2', 188)dnl
pushdef(`L3', 7)pushdef(`R3', 56)dnl
pushdef(`L4', 14)pushdef(`R4', 60)dnl
pushdef(`L5', 28)pushdef(`R5', 54)dnl
pushdef(`L6', 31)pushdef(`R6', 182)dnl
:byte 2 NI

dnl ==> c-4kr.pbm.txt <==
pushdef(`L0', 1)pushdef(`R0', 34)dnl
pushdef(`L1', 2)pushdef(`R1', 36)dnl
pushdef(`L2', 4)pushdef(`R2', 40)dnl
pushdef(`L3', 9)pushdef(`R3', 48)dnl
pushdef(`L4', 15)pushdef(`R4', 168)dnl
pushdef(`L5', 1)pushdef(`R5', 36)dnl
pushdef(`L6', 1)pushdef(`R6', 34)dnl
:byte 2 NI

dnl ==> d-8ki.pbm.txt <==
pushdef(`L0', 1)pushdef(`R0', 146)dnl
pushdef(`L1', 2)pushdef(`R1', 84)dnl
pushdef(`L2', 2)pushdef(`R2', 88)dnl
pushdef(`L3', 3)pushdef(`R3', 144)dnl
pushdef(`L4', 4)pushdef(`R4', 168)dnl
pushdef(`L5', 4)pushdef(`R5', 164)dnl
pushdef(`L6', 3)pushdef(`R6', 36)dnl
:byte 2 NI

dnl ==> e-16kb.pbm.txt <==
pushdef(`L0', 99)pushdef(`R0', 178)dnl
pushdef(`L1', 231)pushdef(`R1', 182)dnl
pushdef(`L2', 238)pushdef(`R2', 60)dnl
pushdef(`L3', 111)pushdef(`R3', 184)dnl
pushdef(`L4', 109)pushdef(`R4', 188)dnl
pushdef(`L5', 109)pushdef(`R5', 182)dnl
pushdef(`L6', 247)pushdef(`R6', 182)dnl
:byte 2 NI

pushdef(`N', `: hisym0 #
')dnl N
dnl ==> f-32kr.pbm.txt <==
pushdef(`L0', 99)pushdef(`R0', 34)dnl
pushdef(`L1', 148)pushdef(`R1', 164)dnl
pushdef(`L2', 16)pushdef(`R2', 168)dnl
pushdef(`L3', 33)pushdef(`R3', 48)dnl
pushdef(`L4', 18)pushdef(`R4', 40)dnl
pushdef(`L5', 148)pushdef(`R5', 36)dnl
pushdef(`L6', 103)pushdef(`R6', 162)dnl
:byte 2 NI

dnl ==> g-64ki.pbm.txt <==
popdef(`N')
pushdef(`L0', 24)pushdef(`R0', 210)dnl
pushdef(`L1', 33)pushdef(`R1', 20)dnl
pushdef(`L2', 66)pushdef(`R2', 24)dnl
pushdef(`L3', 100)pushdef(`R3', 144)dnl
pushdef(`L4', 151)pushdef(`R4', 168)dnl
pushdef(`L5', 145)pushdef(`R5', 36)dnl
pushdef(`L6', 97)pushdef(`R6', 36)dnl
:byte 2 NI

undivert
popdef(`N')dnl
popdef(`NI')dnl
popdef(`IX')dnl
