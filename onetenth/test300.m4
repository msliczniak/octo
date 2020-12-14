: main
hires
plane 3

: _main_loop
v1 := 64
v2 := 2
v3 := 0

: _draw
i := isyma0
i += v3
i += v3
sprite v1 v2 11

v1 += 8
i := isymb0
i += v3
i += v3
sprite v1 v2 11

v1 += 8
i := isymc0
i += v3
i += v3
sprite v1 v2 11

if v1 == 104
then jump _h

v1 += 8
v3 += 11
jump _draw

: _h
if v2 == 50
then jump _w

v1 := 16
v2 += 12
v3 += 11
jump _draw

: _w
v0 := key
jump _main_loop

pushdef(`IX', `0')dnl

pushdef(`N', `eval($1 ^ 255)popdef($1)')dnl

pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
`: isyma'I
:byte N(`LA0') N(`LA1') N(`LA2') N(`LA3') N(`LA4') N(`LA5') dnl
N(`LA6') N(`LA7') N(`LA8') N(`LA9') N(`LA10')
:byte N(`RA0') N(`RA1') N(`RA2') N(`RA3') N(`RA4') N(`RA5') dnl
N(`RA6') N(`RA7') N(`RA8') N(`RA9') N(`RA10')
divert(incr(divnum))dnl
`: isymb'I
:byte N(`LB0') N(`LB1') N(`LB2') N(`LB3') N(`LB4') N(`LB5') dnl
N(`LB6') N(`LB7') N(`LB8') N(`LB9') N(`LB10')
:byte N(`RB0') N(`RB1') N(`RB2') N(`RB3') N(`RB4') N(`RB5') dnl
N(`RB6') N(`RB7') N(`RB8') N(`RB9') N(`RB10')
divert(incr(divnum))dnl
`: isymc'I
:byte N(`LC0') N(`LC1') N(`LC2') N(`LC3') N(`LC4') N(`LC5') dnl
N(`LC6') N(`LC7') N(`LC8') N(`LC9') N(`LC10')
:byte N(`RC0') N(`RC1') N(`RC2') N(`RC3') N(`RC4') N(`RC5') dnl
N(`RC6') N(`RC7') N(`RC8') N(`RC9') N(`RC10')
divert(decr(divnum))dnl
divert(decr(divnum))dnl
popdef(`I')dnl
')dnl

dnl 0-spi.txt
pushdef(`LA0', 85)pushdef(`RA0', 170)pushdef(`LB0', 85)dnl
pushdef(`RB0', 170)pushdef(`LC0', 85)pushdef(`RC0', 171)dnl
pushdef(`LA1', 170)pushdef(`RA1', 85)pushdef(`LB1', 170)dnl
pushdef(`RB1', 85)pushdef(`LC1', 171)pushdef(`RC1', 85)dnl
pushdef(`LA2', 85)pushdef(`RA2', 170)pushdef(`LB2', 85)dnl
pushdef(`RB2', 170)pushdef(`LC2', 85)pushdef(`RC2', 171)dnl
pushdef(`LA3', 170)pushdef(`RA3', 85)pushdef(`LB3', 170)dnl
pushdef(`RB3', 85)pushdef(`LC3', 171)pushdef(`RC3', 85)dnl
pushdef(`LA4', 85)pushdef(`RA4', 170)pushdef(`LB4', 85)dnl
pushdef(`RB4', 170)pushdef(`LC4', 85)pushdef(`RC4', 171)dnl
pushdef(`LA5', 170)pushdef(`RA5', 85)pushdef(`LB5', 170)dnl
pushdef(`RB5', 85)pushdef(`LC5', 171)pushdef(`RC5', 85)dnl
pushdef(`LA6', 85)pushdef(`RA6', 170)pushdef(`LB6', 85)dnl
pushdef(`RB6', 170)pushdef(`LC6', 85)pushdef(`RC6', 171)dnl
pushdef(`LA7', 170)pushdef(`RA7', 85)pushdef(`LB7', 170)dnl
pushdef(`RB7', 85)pushdef(`LC7', 171)pushdef(`RC7', 85)dnl
pushdef(`LA8', 85)pushdef(`RA8', 170)pushdef(`LB8', 85)dnl
pushdef(`RB8', 170)pushdef(`LC8', 85)pushdef(`RC8', 171)dnl
pushdef(`LA9', 170)pushdef(`RA9', 85)pushdef(`LB9', 170)dnl
pushdef(`RB9', 85)pushdef(`LC9', 171)pushdef(`RC9', 85)dnl
pushdef(`LA10', 85)pushdef(`RA10', 170)pushdef(`LB10', 85)dnl
pushdef(`RB10', 170)pushdef(`LC10', 85)pushdef(`RC10', 171)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 3-2i.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 255)pushdef(`RA1', 0)pushdef(`LB1', 255)dnl
pushdef(`RB1', 28)pushdef(`LC1', 255)pushdef(`RC1', 1)dnl
pushdef(`LA2', 255)pushdef(`RA2', 0)pushdef(`LB2', 255)dnl
pushdef(`RB2', 34)pushdef(`LC2', 255)pushdef(`RC2', 1)dnl
pushdef(`LA3', 255)pushdef(`RA3', 0)pushdef(`LB3', 255)dnl
pushdef(`RB3', 2)pushdef(`LC3', 255)pushdef(`RC3', 1)dnl
pushdef(`LA4', 255)pushdef(`RA4', 0)pushdef(`LB4', 255)dnl
pushdef(`RB4', 4)pushdef(`LC4', 255)pushdef(`RC4', 1)dnl
pushdef(`LA5', 255)pushdef(`RA5', 0)pushdef(`LB5', 255)dnl
pushdef(`RB5', 8)pushdef(`LC5', 255)pushdef(`RC5', 1)dnl
pushdef(`LA6', 255)pushdef(`RA6', 0)pushdef(`LB6', 255)dnl
pushdef(`RB6', 16)pushdef(`LC6', 255)pushdef(`RC6', 1)dnl
pushdef(`LA7', 255)pushdef(`RA7', 0)pushdef(`LB7', 255)dnl
pushdef(`RB7', 32)pushdef(`LC7', 255)pushdef(`RC7', 1)dnl
pushdef(`LA8', 255)pushdef(`RA8', 0)pushdef(`LB8', 255)dnl
pushdef(`RB8', 64)pushdef(`LC8', 255)pushdef(`RC8', 1)dnl
pushdef(`LA9', 255)pushdef(`RA9', 0)pushdef(`LB9', 255)dnl
pushdef(`RB9', 248)pushdef(`LC9', 255)pushdef(`RC9', 1)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 4-4b.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 0)pushdef(`RA1', 255)pushdef(`LB1', 24)dnl
pushdef(`RB1', 255)pushdef(`LC1', 1)pushdef(`RC1', 255)dnl
pushdef(`LA2', 0)pushdef(`RA2', 255)pushdef(`LB2', 48)dnl
pushdef(`RB2', 255)pushdef(`LC2', 1)pushdef(`RC2', 255)dnl
pushdef(`LA3', 0)pushdef(`RA3', 255)pushdef(`LB3', 48)dnl
pushdef(`RB3', 255)pushdef(`LC3', 1)pushdef(`RC3', 255)dnl
pushdef(`LA4', 0)pushdef(`RA4', 255)pushdef(`LB4', 96)dnl
pushdef(`RB4', 255)pushdef(`LC4', 1)pushdef(`RC4', 255)dnl
pushdef(`LA5', 0)pushdef(`RA5', 255)pushdef(`LB5', 204)dnl
pushdef(`RB5', 255)pushdef(`LC5', 1)pushdef(`RC5', 255)dnl
pushdef(`LA6', 0)pushdef(`RA6', 255)pushdef(`LB6', 204)dnl
pushdef(`RB6', 255)pushdef(`LC6', 1)pushdef(`RC6', 255)dnl
pushdef(`LA7', 0)pushdef(`RA7', 255)pushdef(`LB7', 254)dnl
pushdef(`RB7', 255)pushdef(`LC7', 1)pushdef(`RC7', 255)dnl
pushdef(`LA8', 0)pushdef(`RA8', 255)pushdef(`LB8', 12)dnl
pushdef(`RB8', 255)pushdef(`LC8', 1)pushdef(`RC8', 255)dnl
pushdef(`LA9', 0)pushdef(`RA9', 255)pushdef(`LB9', 12)dnl
pushdef(`RB9', 255)pushdef(`LC9', 1)pushdef(`RC9', 255)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 5-8r.txt
pushdef(`LA0', 0)pushdef(`RA0', 0)pushdef(`LB0', 0)dnl
pushdef(`RB0', 0)pushdef(`LC0', 1)pushdef(`RC0', 1)dnl
pushdef(`LA1', 0)pushdef(`RA1', 0)pushdef(`LB1', 56)dnl
pushdef(`RB1', 0)pushdef(`LC1', 1)pushdef(`RC1', 1)dnl
pushdef(`LA2', 0)pushdef(`RA2', 0)pushdef(`LB2', 68)dnl
pushdef(`RB2', 0)pushdef(`LC2', 1)pushdef(`RC2', 1)dnl
pushdef(`LA3', 0)pushdef(`RA3', 0)pushdef(`LB3', 68)dnl
pushdef(`RB3', 0)pushdef(`LC3', 1)pushdef(`RC3', 1)dnl
pushdef(`LA4', 0)pushdef(`RA4', 0)pushdef(`LB4', 68)dnl
pushdef(`RB4', 0)pushdef(`LC4', 1)pushdef(`RC4', 1)dnl
pushdef(`LA5', 0)pushdef(`RA5', 0)pushdef(`LB5', 56)dnl
pushdef(`RB5', 0)pushdef(`LC5', 1)pushdef(`RC5', 1)dnl
pushdef(`LA6', 0)pushdef(`RA6', 0)pushdef(`LB6', 68)dnl
pushdef(`RB6', 0)pushdef(`LC6', 1)pushdef(`RC6', 1)dnl
pushdef(`LA7', 0)pushdef(`RA7', 0)pushdef(`LB7', 68)dnl
pushdef(`RB7', 0)pushdef(`LC7', 1)pushdef(`RC7', 1)dnl
pushdef(`LA8', 0)pushdef(`RA8', 0)pushdef(`LB8', 68)dnl
pushdef(`RB8', 0)pushdef(`LC8', 1)pushdef(`RC8', 1)dnl
pushdef(`LA9', 0)pushdef(`RA9', 0)pushdef(`LB9', 56)dnl
pushdef(`RB9', 0)pushdef(`LC9', 1)pushdef(`RC9', 1)dnl
pushdef(`LA10', 0)pushdef(`RA10', 0)pushdef(`LB10', 0)dnl
pushdef(`RB10', 0)pushdef(`LC10', 1)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 6-16i.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 255)pushdef(`RA1', 0)pushdef(`LB1', 223)dnl
pushdef(`RB1', 0)pushdef(`LC1', 63)pushdef(`RC1', 1)dnl
pushdef(`LA2', 255)pushdef(`RA2', 0)pushdef(`LB2', 30)dnl
pushdef(`RB2', 0)pushdef(`LC2', 255)pushdef(`RC2', 1)dnl
pushdef(`LA3', 255)pushdef(`RA3', 0)pushdef(`LB3', 221)dnl
pushdef(`RB3', 0)pushdef(`LC3', 255)pushdef(`RC3', 1)dnl
pushdef(`LA4', 255)pushdef(`RA4', 0)pushdef(`LB4', 188)dnl
pushdef(`RB4', 0)pushdef(`LC4', 127)pushdef(`RC4', 1)dnl
pushdef(`LA5', 255)pushdef(`RA5', 0)pushdef(`LB5', 187)dnl
pushdef(`RB5', 0)pushdef(`LC5', 191)pushdef(`RC5', 1)dnl
pushdef(`LA6', 255)pushdef(`RA6', 0)pushdef(`LB6', 187)dnl
pushdef(`RB6', 0)pushdef(`LC6', 191)pushdef(`RC6', 1)dnl
pushdef(`LA7', 255)pushdef(`RA7', 0)pushdef(`LB7', 119)dnl
pushdef(`RB7', 0)pushdef(`LC7', 127)pushdef(`RC7', 1)dnl
pushdef(`LA8', 255)pushdef(`RA8', 0)pushdef(`LB8', 119)dnl
pushdef(`RB8', 0)pushdef(`LC8', 127)pushdef(`RC8', 1)dnl
pushdef(`LA9', 252)pushdef(`RA9', 0)pushdef(`LB9', 24)dnl
pushdef(`RB9', 0)pushdef(`LC9', 255)pushdef(`RC9', 1)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 7-32b.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 3)pushdef(`RA1', 252)pushdef(`LB1', 199)dnl
pushdef(`RB1', 56)pushdef(`LC1', 129)pushdef(`RC1', 127)dnl
pushdef(`LA2', 6)pushdef(`RA2', 249)pushdef(`LB2', 108)dnl
pushdef(`RB2', 147)pushdef(`LC2', 193)pushdef(`RC2', 63)dnl
pushdef(`LA3', 0)pushdef(`RA3', 255)pushdef(`LB3', 96)dnl
pushdef(`RB3', 159)pushdef(`LC3', 193)pushdef(`RC3', 63)dnl
pushdef(`LA4', 0)pushdef(`RA4', 255)pushdef(`LB4', 96)dnl
pushdef(`RB4', 159)pushdef(`LC4', 193)pushdef(`RC4', 63)dnl
pushdef(`LA5', 3)pushdef(`RA5', 252)pushdef(`LB5', 193)dnl
pushdef(`RB5', 62)pushdef(`LC5', 129)pushdef(`RC5', 127)dnl
pushdef(`LA6', 0)pushdef(`RA6', 255)pushdef(`LB6', 99)dnl
pushdef(`RB6', 156)pushdef(`LC6', 1)pushdef(`RC6', 255)dnl
pushdef(`LA7', 0)pushdef(`RA7', 255)pushdef(`LB7', 102)dnl
pushdef(`RB7', 153)pushdef(`LC7', 1)pushdef(`RC7', 255)dnl
pushdef(`LA8', 6)pushdef(`RA8', 249)pushdef(`LB8', 108)dnl
pushdef(`RB8', 147)pushdef(`LC8', 1)pushdef(`RC8', 255)dnl
pushdef(`LA9', 3)pushdef(`RA9', 252)pushdef(`LB9', 207)dnl
pushdef(`RB9', 48)pushdef(`LC9', 193)pushdef(`RC9', 63)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 8-64r.txt
pushdef(`LA0', 0)pushdef(`RA0', 0)pushdef(`LB0', 0)dnl
pushdef(`RB0', 0)pushdef(`LC0', 1)pushdef(`RC0', 1)dnl
pushdef(`LA1', 0)pushdef(`RA1', 0)pushdef(`LB1', 0)dnl
pushdef(`RB1', 96)pushdef(`LC1', 1)pushdef(`RC1', 129)dnl
pushdef(`LA2', 0)pushdef(`RA2', 0)pushdef(`LB2', 0)dnl
pushdef(`RB2', 129)pushdef(`LC2', 1)pushdef(`RC2', 1)dnl
pushdef(`LA3', 0)pushdef(`RA3', 1)pushdef(`LB3', 0)dnl
pushdef(`RB3', 2)pushdef(`LC3', 1)pushdef(`RC3', 1)dnl
pushdef(`LA4', 0)pushdef(`RA4', 1)pushdef(`LB4', 0)dnl
pushdef(`RB4', 194)pushdef(`LC4', 1)pushdef(`RC4', 1)dnl
pushdef(`LA5', 0)pushdef(`RA5', 2)pushdef(`LB5', 0)dnl
pushdef(`RB5', 36)pushdef(`LC5', 1)pushdef(`RC5', 129)dnl
pushdef(`LA6', 0)pushdef(`RA6', 2)pushdef(`LB6', 0)dnl
pushdef(`RB6', 40)pushdef(`LC6', 1)pushdef(`RC6', 129)dnl
pushdef(`LA7', 0)pushdef(`RA7', 2)pushdef(`LB7', 0)dnl
pushdef(`RB7', 47)pushdef(`LC7', 1)pushdef(`RC7', 193)dnl
pushdef(`LA8', 0)pushdef(`RA8', 2)pushdef(`LB8', 0)dnl
pushdef(`RB8', 32)pushdef(`LC8', 1)pushdef(`RC8', 129)dnl
pushdef(`LA9', 0)pushdef(`RA9', 1)pushdef(`LB9', 0)dnl
pushdef(`RB9', 192)pushdef(`LC9', 1)pushdef(`RC9', 129)dnl
pushdef(`LA10', 0)pushdef(`RA10', 0)pushdef(`LB10', 0)dnl
pushdef(`RB10', 0)pushdef(`LC10', 1)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl 9-128i.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 253)pushdef(`RA1', 2)pushdef(`LB1', 227)dnl
pushdef(`RB1', 28)pushdef(`LC1', 143)pushdef(`RC1', 113)dnl
pushdef(`LA2', 241)pushdef(`RA2', 14)pushdef(`LB2', 221)dnl
pushdef(`RB2', 34)pushdef(`LC2', 119)pushdef(`RC2', 137)dnl
pushdef(`LA3', 253)pushdef(`RA3', 2)pushdef(`LB3', 253)dnl
pushdef(`RB3', 2)pushdef(`LC3', 119)pushdef(`RC3', 137)dnl
pushdef(`LA4', 251)pushdef(`RA4', 4)pushdef(`LB4', 251)dnl
pushdef(`RB4', 4)pushdef(`LC4', 111)pushdef(`RC4', 145)dnl
pushdef(`LA5', 251)pushdef(`RA5', 4)pushdef(`LB5', 247)dnl
pushdef(`RB5', 8)pushdef(`LC5', 31)pushdef(`RC5', 225)dnl
pushdef(`LA6', 251)pushdef(`RA6', 4)pushdef(`LB6', 238)dnl
pushdef(`RB6', 17)pushdef(`LC6', 223)pushdef(`RC6', 33)dnl
pushdef(`LA7', 247)pushdef(`RA7', 8)pushdef(`LB7', 221)dnl
pushdef(`RB7', 34)pushdef(`LC7', 223)pushdef(`RC7', 33)dnl
pushdef(`LA8', 247)pushdef(`RA8', 8)pushdef(`LB8', 189)dnl
pushdef(`RB8', 66)pushdef(`LC8', 223)pushdef(`RC8', 33)dnl
pushdef(`LA9', 193)pushdef(`RA9', 62)pushdef(`LB9', 6)dnl
pushdef(`RB9', 249)pushdef(`LC9', 63)pushdef(`RC9', 193)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl a-256b.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 0)pushdef(`RA1', 225)pushdef(`LB1', 0)dnl
pushdef(`RB1', 129)pushdef(`LC1', 1)pushdef(`RC1', 231)dnl
pushdef(`LA2', 0)pushdef(`RA2', 204)pushdef(`LB2', 0)dnl
pushdef(`RB2', 159)pushdef(`LC2', 1)pushdef(`RC2', 207)dnl
pushdef(`LA3', 0)pushdef(`RA3', 252)pushdef(`LB3', 0)dnl
pushdef(`RB3', 159)pushdef(`LC3', 1)pushdef(`RC3', 159)dnl
pushdef(`LA4', 0)pushdef(`RA4', 252)pushdef(`LB4', 0)dnl
pushdef(`RB4', 131)pushdef(`LC4', 1)pushdef(`RC4', 135)dnl
pushdef(`LA5', 0)pushdef(`RA5', 249)pushdef(`LB5', 0)dnl
pushdef(`RB5', 249)pushdef(`LC5', 1)pushdef(`RC5', 51)dnl
pushdef(`LA6', 0)pushdef(`RA6', 243)pushdef(`LB6', 0)dnl
pushdef(`RB6', 249)pushdef(`LC6', 1)pushdef(`RC6', 51)dnl
pushdef(`LA7', 0)pushdef(`RA7', 231)pushdef(`LB7', 0)dnl
pushdef(`RB7', 249)pushdef(`LC7', 1)pushdef(`RC7', 51)dnl
pushdef(`LA8', 0)pushdef(`RA8', 207)pushdef(`LB8', 0)dnl
pushdef(`RB8', 153)pushdef(`LC8', 1)pushdef(`RC8', 51)dnl
pushdef(`LA9', 0)pushdef(`RA9', 192)pushdef(`LB9', 0)dnl
pushdef(`RB9', 195)pushdef(`LC9', 1)pushdef(`RC9', 135)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl b-512r.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 240)pushdef(`RA1', 15)pushdef(`LB1', 239)dnl
pushdef(`RB1', 16)pushdef(`LC1', 31)pushdef(`RC1', 225)dnl
pushdef(`LA2', 247)pushdef(`RA2', 8)pushdef(`LB2', 142)dnl
pushdef(`RB2', 113)pushdef(`LC2', 239)pushdef(`RC2', 17)dnl
pushdef(`LA3', 239)pushdef(`RA3', 16)pushdef(`LB3', 239)dnl
pushdef(`RB3', 16)pushdef(`LC3', 239)pushdef(`RC3', 17)dnl
pushdef(`LA4', 225)pushdef(`RA4', 30)pushdef(`LB4', 239)dnl
pushdef(`RB4', 16)pushdef(`LC4', 239)pushdef(`RC4', 17)dnl
pushdef(`LA5', 254)pushdef(`RA5', 1)pushdef(`LB5', 239)dnl
pushdef(`RB5', 16)pushdef(`LC5', 223)pushdef(`RC5', 33)dnl
pushdef(`LA6', 254)pushdef(`RA6', 1)pushdef(`LB6', 239)dnl
pushdef(`RB6', 16)pushdef(`LC6', 191)pushdef(`RC6', 65)dnl
pushdef(`LA7', 254)pushdef(`RA7', 1)pushdef(`LB7', 239)dnl
pushdef(`RB7', 16)pushdef(`LC7', 127)pushdef(`RC7', 129)dnl
pushdef(`LA8', 238)pushdef(`RA8', 17)pushdef(`LB8', 238)dnl
pushdef(`RB8', 17)pushdef(`LC8', 255)pushdef(`RC8', 1)dnl
pushdef(`LA9', 241)pushdef(`RA9', 14)pushdef(`LB9', 130)dnl
pushdef(`RB9', 125)pushdef(`LC9', 15)pushdef(`RC9', 241)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl c-1ki.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 0)pushdef(`RA1', 255)pushdef(`LB1', 0)dnl
pushdef(`RB1', 187)pushdef(`LC1', 1)pushdef(`RC1', 191)dnl
pushdef(`LA2', 0)pushdef(`RA2', 254)pushdef(`LB2', 0)dnl
pushdef(`RB2', 59)pushdef(`LC2', 1)pushdef(`RC2', 191)dnl
pushdef(`LA3', 0)pushdef(`RA3', 255)pushdef(`LB3', 0)dnl
pushdef(`RB3', 187)pushdef(`LC3', 1)pushdef(`RC3', 127)dnl
pushdef(`LA4', 0)pushdef(`RA4', 255)pushdef(`LB4', 0)dnl
pushdef(`RB4', 118)pushdef(`LC4', 1)pushdef(`RC4', 255)dnl
pushdef(`LA5', 0)pushdef(`RA5', 255)pushdef(`LB5', 0)dnl
pushdef(`RB5', 113)pushdef(`LC5', 1)pushdef(`RC5', 255)dnl
pushdef(`LA6', 0)pushdef(`RA6', 255)pushdef(`LB6', 0)dnl
pushdef(`RB6', 117)pushdef(`LC6', 1)pushdef(`RC6', 255)dnl
pushdef(`LA7', 0)pushdef(`RA7', 254)pushdef(`LB7', 0)dnl
pushdef(`RB7', 238)pushdef(`LC7', 1)pushdef(`RC7', 255)dnl
pushdef(`LA8', 0)pushdef(`RA8', 254)pushdef(`LB8', 0)dnl
pushdef(`RB8', 238)pushdef(`LC8', 1)pushdef(`RC8', 255)dnl
pushdef(`LA9', 0)pushdef(`RA9', 248)pushdef(`LB9', 0)dnl
pushdef(`RB9', 46)pushdef(`LC9', 1)pushdef(`RC9', 255)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl d-2kb.txt
pushdef(`LA0', 0)pushdef(`RA0', 0)pushdef(`LB0', 0)dnl
pushdef(`RB0', 0)pushdef(`LC0', 1)pushdef(`RC0', 1)dnl
pushdef(`LA1', 3)pushdef(`RA1', 3)pushdef(`LB1', 204)dnl
pushdef(`RB1', 204)pushdef(`LC1', 193)pushdef(`RC1', 193)dnl
pushdef(`LA2', 6)pushdef(`RA2', 6)pushdef(`LB2', 108)dnl
pushdef(`RB2', 108)pushdef(`LC2', 193)pushdef(`RC2', 193)dnl
pushdef(`LA3', 0)pushdef(`RA3', 0)pushdef(`LB3', 108)dnl
pushdef(`RB3', 108)pushdef(`LC3', 193)pushdef(`RC3', 193)dnl
pushdef(`LA4', 0)pushdef(`RA4', 0)pushdef(`LB4', 109)dnl
pushdef(`RB4', 109)pushdef(`LC4', 129)pushdef(`RC4', 129)dnl
pushdef(`LA5', 0)pushdef(`RA5', 0)pushdef(`LB5', 207)dnl
pushdef(`RB5', 207)pushdef(`LC5', 1)pushdef(`RC5', 1)dnl
pushdef(`LA6', 1)pushdef(`RA6', 1)pushdef(`LB6', 141)dnl
pushdef(`RB6', 141)pushdef(`LC6', 129)pushdef(`RC6', 129)dnl
pushdef(`LA7', 3)pushdef(`RA7', 3)pushdef(`LB7', 12)dnl
pushdef(`RB7', 12)pushdef(`LC7', 193)pushdef(`RC7', 193)dnl
pushdef(`LA8', 6)pushdef(`RA8', 6)pushdef(`LB8', 12)dnl
pushdef(`RB8', 12)pushdef(`LC8', 193)pushdef(`RC8', 193)dnl
pushdef(`LA9', 7)pushdef(`RA9', 7)pushdef(`LB9', 236)dnl
pushdef(`RB9', 236)pushdef(`LC9', 193)pushdef(`RC9', 193)dnl
pushdef(`LA10', 0)pushdef(`RA10', 0)pushdef(`LB10', 0)dnl
pushdef(`RB10', 0)pushdef(`LC10', 1)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl e-4kr.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 255)pushdef(`RA1', 0)pushdef(`LB1', 219)dnl
pushdef(`RB1', 0)pushdef(`LC1', 191)pushdef(`RC1', 1)dnl
pushdef(`LA2', 255)pushdef(`RA2', 0)pushdef(`LB2', 187)dnl
pushdef(`RB2', 0)pushdef(`LC2', 191)pushdef(`RC2', 1)dnl
pushdef(`LA3', 255)pushdef(`RA3', 0)pushdef(`LB3', 123)dnl
pushdef(`RB3', 0)pushdef(`LC3', 127)pushdef(`RC3', 1)dnl
pushdef(`LA4', 255)pushdef(`RA4', 0)pushdef(`LB4', 123)dnl
pushdef(`RB4', 0)pushdef(`LC4', 127)pushdef(`RC4', 1)dnl
pushdef(`LA5', 254)pushdef(`RA5', 0)pushdef(`LB5', 216)dnl
pushdef(`RB5', 0)pushdef(`LC5', 255)pushdef(`RC5', 1)dnl
pushdef(`LA6', 253)pushdef(`RA6', 0)pushdef(`LB6', 219)dnl
pushdef(`RB6', 0)pushdef(`LC6', 127)pushdef(`RC6', 1)dnl
pushdef(`LA7', 252)pushdef(`RA7', 0)pushdef(`LB7', 11)dnl
pushdef(`RB7', 0)pushdef(`LC7', 127)pushdef(`RC7', 1)dnl
pushdef(`LA8', 255)pushdef(`RA8', 0)pushdef(`LB8', 219)dnl
pushdef(`RB8', 0)pushdef(`LC8', 191)pushdef(`RC8', 1)dnl
pushdef(`LA9', 255)pushdef(`RA9', 0)pushdef(`LB9', 219)dnl
pushdef(`RB9', 0)pushdef(`LC9', 191)pushdef(`RC9', 1)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl f-8ki.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 0)pushdef(`RA1', 255)pushdef(`LB1', 226)dnl
pushdef(`RB1', 255)pushdef(`LC1', 33)pushdef(`RC1', 255)dnl
pushdef(`LA2', 1)pushdef(`RA2', 255)pushdef(`LB2', 18)dnl
pushdef(`RB2', 255)pushdef(`LC2', 33)pushdef(`RC2', 255)dnl
pushdef(`LA3', 1)pushdef(`RA3', 255)pushdef(`LB3', 18)dnl
pushdef(`RB3', 255)pushdef(`LC3', 65)pushdef(`RC3', 255)dnl
pushdef(`LA4', 1)pushdef(`RA4', 255)pushdef(`LB4', 36)dnl
pushdef(`RB4', 255)pushdef(`LC4', 129)pushdef(`RC4', 255)dnl
pushdef(`LA5', 1)pushdef(`RA5', 255)pushdef(`LB5', 199)dnl
pushdef(`RB5', 255)pushdef(`LC5', 1)pushdef(`RC5', 255)dnl
pushdef(`LA6', 2)pushdef(`RA6', 255)pushdef(`LB6', 69)dnl
pushdef(`RB6', 255)pushdef(`LC6', 1)pushdef(`RC6', 255)dnl
pushdef(`LA7', 4)pushdef(`RA7', 255)pushdef(`LB7', 72)dnl
pushdef(`RB7', 255)pushdef(`LC7', 129)pushdef(`RC7', 255)dnl
pushdef(`LA8', 4)pushdef(`RA8', 255)pushdef(`LB8', 72)dnl
pushdef(`RB8', 255)pushdef(`LC8', 129)pushdef(`RC8', 255)dnl
pushdef(`LA9', 3)pushdef(`RA9', 255)pushdef(`LB9', 136)dnl
pushdef(`RB9', 255)pushdef(`LC9', 129)pushdef(`RC9', 255)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl g-16kb.txt
pushdef(`LA0', 0)pushdef(`RA0', 0)pushdef(`LB0', 0)dnl
pushdef(`RB0', 0)pushdef(`LC0', 1)pushdef(`RC0', 1)dnl
pushdef(`LA1', 0)pushdef(`RA1', 12)pushdef(`LB1', 0)dnl
pushdef(`RB1', 12)pushdef(`LC1', 1)pushdef(`RC1', 205)dnl
pushdef(`LA2', 0)pushdef(`RA2', 60)pushdef(`LB2', 0)dnl
pushdef(`RB2', 24)pushdef(`LC2', 1)pushdef(`RC2', 205)dnl
pushdef(`LA3', 0)pushdef(`RA3', 12)pushdef(`LB3', 0)dnl
pushdef(`RB3', 48)pushdef(`LC3', 1)pushdef(`RC3', 205)dnl
pushdef(`LA4', 0)pushdef(`RA4', 12)pushdef(`LB4', 0)dnl
pushdef(`RB4', 60)pushdef(`LC4', 1)pushdef(`RC4', 217)dnl
pushdef(`LA5', 0)pushdef(`RA5', 12)pushdef(`LB5', 0)dnl
pushdef(`RB5', 102)pushdef(`LC5', 1)pushdef(`RC5', 241)dnl
pushdef(`LA6', 0)pushdef(`RA6', 12)pushdef(`LB6', 0)dnl
pushdef(`RB6', 102)pushdef(`LC6', 1)pushdef(`RC6', 217)dnl
pushdef(`LA7', 0)pushdef(`RA7', 12)pushdef(`LB7', 0)dnl
pushdef(`RB7', 102)pushdef(`LC7', 1)pushdef(`RC7', 205)dnl
pushdef(`LA8', 0)pushdef(`RA8', 12)pushdef(`LB8', 0)dnl
pushdef(`RB8', 102)pushdef(`LC8', 1)pushdef(`RC8', 205)dnl
pushdef(`LA9', 0)pushdef(`RA9', 63)pushdef(`LB9', 0)dnl
pushdef(`RB9', 60)pushdef(`LC9', 1)pushdef(`RC9', 205)dnl
pushdef(`LA10', 0)pushdef(`RA10', 0)pushdef(`LB10', 0)dnl
pushdef(`RB10', 0)pushdef(`LC10', 1)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl h-32kr.txt
pushdef(`LA0', 255)pushdef(`RA0', 0)pushdef(`LB0', 255)dnl
pushdef(`RB0', 0)pushdef(`LC0', 255)pushdef(`RC0', 1)dnl
pushdef(`LA1', 255)pushdef(`RA1', 14)pushdef(`LB1', 255)dnl
pushdef(`RB1', 57)pushdef(`LC1', 255)pushdef(`RC1', 17)dnl
pushdef(`LA2', 255)pushdef(`RA2', 17)pushdef(`LB2', 255)dnl
pushdef(`RB2', 69)pushdef(`LC2', 255)pushdef(`RC2', 17)dnl
pushdef(`LA3', 255)pushdef(`RA3', 1)pushdef(`LB3', 255)dnl
pushdef(`RB3', 5)pushdef(`LC3', 255)pushdef(`RC3', 33)dnl
pushdef(`LA4', 255)pushdef(`RA4', 2)pushdef(`LB4', 255)dnl
pushdef(`RB4', 5)pushdef(`LC4', 255)pushdef(`RC4', 33)dnl
pushdef(`LA5', 255)pushdef(`RA5', 12)pushdef(`LB5', 255)dnl
pushdef(`RB5', 9)pushdef(`LC5', 255)pushdef(`RC5', 193)dnl
pushdef(`LA6', 255)pushdef(`RA6', 2)pushdef(`LB6', 255)dnl
pushdef(`RB6', 17)pushdef(`LC6', 255)pushdef(`RC6', 33)dnl
pushdef(`LA7', 255)pushdef(`RA7', 1)pushdef(`LB7', 255)dnl
pushdef(`RB7', 33)pushdef(`LC7', 255)pushdef(`RC7', 33)dnl
pushdef(`LA8', 255)pushdef(`RA8', 17)pushdef(`LB8', 255)dnl
pushdef(`RB8', 65)pushdef(`LC8', 255)pushdef(`RC8', 17)dnl
pushdef(`LA9', 255)pushdef(`RA9', 14)pushdef(`LB9', 255)dnl
pushdef(`RB9', 125)pushdef(`LC9', 255)pushdef(`RC9', 17)dnl
pushdef(`LA10', 255)pushdef(`RA10', 0)pushdef(`LB10', 255)dnl
pushdef(`RB10', 0)pushdef(`LC10', 255)pushdef(`RC10', 1)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl i-64ki.txt
pushdef(`LA0', 0)pushdef(`RA0', 255)pushdef(`LB0', 0)dnl
pushdef(`RB0', 255)pushdef(`LC0', 1)pushdef(`RC0', 255)dnl
pushdef(`LA1', 6)pushdef(`RA1', 249)pushdef(`LB1', 4)dnl
pushdef(`RB1', 251)pushdef(`LC1', 69)pushdef(`RC1', 187)dnl
pushdef(`LA2', 8)pushdef(`RA2', 247)pushdef(`LB2', 8)dnl
pushdef(`RB2', 247)pushdef(`LC2', 69)pushdef(`RC2', 187)dnl
pushdef(`LA3', 16)pushdef(`RA3', 239)pushdef(`LB3', 16)dnl
pushdef(`RB3', 239)pushdef(`LC3', 73)pushdef(`RC3', 183)dnl
pushdef(`LA4', 28)pushdef(`RA4', 227)pushdef(`LB4', 32)dnl
pushdef(`RB4', 223)pushdef(`LC4', 145)pushdef(`RC4', 111)dnl
pushdef(`LA5', 34)pushdef(`RA5', 221)pushdef(`LB5', 72)dnl
pushdef(`RB5', 183)pushdef(`LC5', 225)pushdef(`RC5', 31)dnl
pushdef(`LA6', 34)pushdef(`RA6', 221)pushdef(`LB6', 136)dnl
pushdef(`RB6', 119)pushdef(`LC6', 161)pushdef(`RC6', 95)dnl
pushdef(`LA7', 68)pushdef(`RA7', 187)pushdef(`LB7', 249)dnl
pushdef(`RB7', 6)pushdef(`LC7', 17)pushdef(`RC7', 239)dnl
pushdef(`LA8', 68)pushdef(`RA8', 187)pushdef(`LB8', 17)dnl
pushdef(`RB8', 238)pushdef(`LC8', 17)pushdef(`RC8', 239)dnl
pushdef(`LA9', 56)pushdef(`RA9', 199)pushdef(`LB9', 17)dnl
pushdef(`RB9', 238)pushdef(`LC9', 17)pushdef(`RC9', 239)dnl
pushdef(`LA10', 0)pushdef(`RA10', 255)pushdef(`LB10', 0)dnl
pushdef(`RB10', 255)pushdef(`LC10', 1)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
dnl j-128kr.txt
pushdef(`LA0', 255)pushdef(`RA0', 255)pushdef(`LB0', 255)dnl
pushdef(`RB0', 255)pushdef(`LC0', 255)pushdef(`RC0', 255)dnl
pushdef(`LA1', 220)pushdef(`RA1', 220)pushdef(`LB1', 113)dnl
pushdef(`RB1', 113)pushdef(`LC1', 187)pushdef(`RC1', 187)dnl
pushdef(`LA2', 155)pushdef(`RA2', 155)pushdef(`LB2', 174)dnl
pushdef(`RB2', 174)pushdef(`LC2', 187)pushdef(`RC2', 187)dnl
pushdef(`LA3', 223)pushdef(`RA3', 223)pushdef(`LB3', 174)dnl
pushdef(`RB3', 174)pushdef(`LC3', 183)pushdef(`RC3', 183)dnl
pushdef(`LA4', 223)pushdef(`RA4', 223)pushdef(`LB4', 174)dnl
pushdef(`RB4', 174)pushdef(`LC4', 183)pushdef(`RC4', 183)dnl
pushdef(`LA5', 223)pushdef(`RA5', 223)pushdef(`LB5', 113)dnl
pushdef(`RB5', 113)pushdef(`LC5', 143)pushdef(`RC5', 143)dnl
pushdef(`LA6', 222)pushdef(`RA6', 222)pushdef(`LB6', 238)dnl
pushdef(`RB6', 238)pushdef(`LC6', 183)pushdef(`RC6', 183)dnl
pushdef(`LA7', 221)pushdef(`RA7', 221)pushdef(`LB7', 238)dnl
pushdef(`RB7', 238)pushdef(`LC7', 183)pushdef(`RC7', 183)dnl
pushdef(`LA8', 219)pushdef(`RA8', 219)pushdef(`LB8', 238)dnl
pushdef(`RB8', 238)pushdef(`LC8', 187)pushdef(`RC8', 187)dnl
pushdef(`LA9', 136)pushdef(`RA9', 136)pushdef(`LB9', 49)dnl
pushdef(`RB9', 49)pushdef(`LC9', 187)pushdef(`RC9', 187)dnl
pushdef(`LA10', 255)pushdef(`RA10', 255)pushdef(`LB10', 255)dnl
pushdef(`RB10', 255)pushdef(`LC10', 255)pushdef(`RC10', 255)dnl
pushdef(`LA11', 255)pushdef(`RA11', 255)pushdef(`LB11', 255)dnl
pushdef(`RB11', 255)pushdef(`LC11', 255)pushdef(`RC11', 255)dnl
NI
