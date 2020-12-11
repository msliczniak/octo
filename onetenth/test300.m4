pushdef(`P00', 256)dnl
pushdef(`P01', eval(P00 + 14))dnl
pushdef(`P11', eval(P01 + 14))dnl
pushdef(`P10', eval(P11 + 14))dnl

: main
v1 := 0
v2 := 0

: _cl
i := isym0
i += v1
load v0
i := 0
i += v2
save v0

if v2 == 255
then jump _ce

v2 += 15
v1 += 1

: _ce

dnl 0-spi-r.txt
C(P00)dnl

dnl 3-2i-r.txt
C(P01)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(64)R(255)dnl
L(96)R(255)dnl
L(82)R(255)dnl
L(73)R(255)dnl
L(69)R(255)dnl
L(2)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl

dnl 4-4b-r.txt
C(P10)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(56)dnl
L(255)R(60)dnl
L(255)R(62)dnl
L(255)R(55)dnl
L(255)R(51)dnl
L(255)R(121)dnl
L(255)R(120)dnl
L(255)R(48)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(0)dnl

dnl 5-8r-r.txt
C(P00)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(54)R(0)dnl
L(73)R(0)dnl
L(73)R(0)dnl
L(73)R(0)dnl
L(54)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl

dnl 6-16i-r.txt
C(P01)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(64)R(191)dnl
L(64)R(191)dnl
L(98)R(157)dnl
L(90)R(165)dnl
L(7)R(248)dnl
L(48)R(207)dnl
L(76)R(179)dnl
L(74)R(181)dnl
L(49)R(206)dnl
L(1)R(254)dnl
L(0)R(255)dnl
L(0)R(255)dnl

dnl 7-32b-r.txt
C(P10)dnl
L(255)R(0)dnl
L(221)R(34)dnl
L(156)R(99)dnl
L(148)R(107)dnl
L(148)R(107)dnl
L(128)R(127)dnl
L(201)R(54)dnl
L(255)R(0)dnl
L(157)R(98)dnl
L(140)R(115)dnl
L(132)R(123)dnl
L(160)R(95)dnl
L(176)R(79)dnl
L(185)R(70)dnl
L(255)R(0)dnl

dnl 8-64r-r.txt
C(P00)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(0)R(62)dnl
L(0)R(73)dnl
L(0)R(73)dnl
L(0)R(48)dnl
L(0)R(0)dnl
L(0)R(24)dnl
L(0)R(20)dnl
L(0)R(18)dnl
L(0)R(121)dnl
L(0)R(16)dnl
L(0)R(0)dnl
L(0)R(0)dnl

dnl 9-128i-r.txt
C(P01)dnl
L(0)R(191)dnl
L(0)R(191)dnl
L(0)R(157)dnl
L(0)R(165)dnl
L(0)R(248)dnl
L(0)R(191)dnl
L(0)R(157)dnl
L(0)R(174)dnl
L(0)R(182)dnl
L(0)R(249)dnl
L(0)R(207)dnl
L(0)R(177)dnl
L(0)R(182)dnl
L(0)R(198)dnl
L(0)R(249)dnl

dnl a-256b-r.txt
C(P00)dnl
L(115)R(0)dnl
L(123)R(0)dnl
L(95)R(0)dnl
L(78)R(0)dnl
L(0)R(0)dnl
L(94)R(0)dnl
L(95)R(0)dnl
L(123)R(0)dnl
L(123)R(0)dnl
L(0)R(0)dnl
L(60)R(0)dnl
L(126)R(0)dnl
L(79)R(0)dnl
L(123)R(0)dnl
L(123)R(0)dnl

dnl b-512r-r.txt
C(P01)dnl
L(0)R(255)dnl
L(38)R(217)dnl
L(69)R(186)dnl
L(69)R(186)dnl
L(57)R(198)dnl
L(0)R(255)dnl
L(66)R(189)dnl
L(66)R(189)dnl
L(127)R(128)dnl
L(64)R(191)dnl
L(0)R(255)dnl
L(98)R(157)dnl
L(81)R(174)dnl
L(73)R(182)dnl
L(70)R(185)dnl

dnl c-1ki-r.txt
C(P10)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(64)dnl
L(255)R(64)dnl
L(255)R(98)dnl
L(255)R(90)dnl
L(255)R(7)dnl
L(255)R(112)dnl
L(255)R(15)dnl
L(255)R(20)dnl
L(255)R(98)dnl
L(255)R(1)dnl
L(255)R(0)dnl
L(255)R(0)dnl

dnl d-2kb-r.txt
C(P00)dnl
L(0)R(0)dnl
L(0)R(0)dnl
L(98)R(98)dnl
L(115)R(115)dnl
L(123)R(123)dnl
L(95)R(95)dnl
L(79)R(79)dnl
L(70)R(70)dnl
L(0)R(0)dnl
L(127)R(127)dnl
L(127)R(127)dnl
L(28)R(28)dnl
L(118)R(118)dnl
L(99)R(99)dnl
L(0)R(0)dnl

dnl e-4kr-r.txt
C(P01)dnl
L(0)R(255)dnl
L(0)R(255)dnl
L(24)R(255)dnl
L(20)R(255)dnl
L(18)R(255)dnl
L(121)R(255)dnl
L(16)R(255)dnl
L(0)R(255)dnl
L(127)R(255)dnl
L(8)R(255)dnl
L(20)R(255)dnl
L(34)R(255)dnl
L(65)R(255)dnl
L(0)R(255)dnl
L(0)R(255)dnl

dnl f-8ki-r.txt
C(P10)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(255)R(0)dnl
L(207)R(48)dnl
L(177)R(78)dnl
L(182)R(73)dnl
L(198)R(57)dnl
L(249)R(6)dnl
L(143)R(112)dnl
L(240)R(15)dnl
L(235)R(20)dnl
L(157)R(98)dnl
L(254)R(1)dnl
L(255)R(0)dnl
L(255)R(0)dnl

dnl g-16kb-r.txt
C(P00)dnl
L(0)R(70)dnl
L(0)R(127)dnl
L(0)R(127)dnl
L(0)R(64)dnl
L(0)R(60)dnl
L(0)R(126)dnl
L(0)R(79)dnl
L(0)R(123)dnl
L(0)R(123)dnl
L(0)R(0)dnl
L(0)R(127)dnl
L(0)R(127)dnl
L(0)R(28)dnl
L(0)R(118)dnl
L(0)R(99)dnl

dnl h-32kr-r.txt
C(P01)dnl
L(0)R(221)dnl
L(0)R(190)dnl
L(0)R(182)dnl
L(0)R(201)dnl
L(0)R(255)dnl
L(0)R(157)dnl
L(0)R(174)dnl
L(0)R(182)dnl
L(0)R(185)dnl
L(0)R(255)dnl
L(0)R(128)dnl
L(0)R(247)dnl
L(0)R(235)dnl
L(0)R(221)dnl
L(0)R(190)dnl

dnl i-64ki-r.txt
C(P10)dnl
L(207)R(0)dnl
L(179)R(0)dnl
L(181)R(0)dnl
L(206)R(0)dnl
L(254)R(0)dnl
L(231)R(0)dnl
L(235)R(0)dnl
L(141)R(0)dnl
L(230)R(0)dnl
L(254)R(0)dnl
L(143)R(0)dnl
L(240)R(0)dnl
L(235)R(0)dnl
L(157)R(0)dnl
L(254)R(0)dnl

dnl j-128kr-r.txt
C(P11)dnl
L(128)R(128)dnl
L(255)R(255)dnl
L(142)R(142)dnl
L(182)R(182)dnl
L(185)R(185)dnl
L(255)R(255)dnl
L(201)R(201)dnl
L(182)R(182)dnl
L(182)R(182)dnl
L(201)R(201)dnl
L(255)R(255)dnl
L(128)R(128)dnl
L(247)R(247)dnl
L(235)R(235)dnl
L(156)R(156)dnl

: isym0
:byte  C0  C1  C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 C13 C14
:byte C15 C16 C17  0  0  0  0  0  0  0   0   0   0   0   0
