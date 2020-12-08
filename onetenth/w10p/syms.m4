# syms.m4

pushdef(`N')dnl
pushdef(`IX', `0')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl

`: isym'I
:byte dnl
eval($1 ^ 254) dnl
eval($2 ^ 254) dnl
eval($3 ^ 254) dnl
eval($4 ^ 254) dnl
eval($5 ^ 254)
`: sym'I
:byte dnl
eval($1) dnl
eval($2) dnl
ifelse(I, 0, 16, `eval($3)') dnl mark empty cells with a dot
eval($4) dnl
eval($5)
N($*)
popdef(`I')dnl
')dnl
dnl make sure that isym0 and sym0 start in the same page
undivert
:assert "program too large" { HERE <= 3238 }
:org 3238
# 5x5 symbols
: symc  # sym color
:byte 2 NI(  0,   0,   0,   0,   0) # blank space
pushdef(`N', `dnl

divert(incr(divnum))dnl
`: hisym'I
:byte 254
:byte dnl
eval($1 ^ 254) dnl
eval($2 ^ 254) dnl
eval($3 ^ 254) dnl
eval($4 ^ 254) dnl
eval($5 ^ 254)
ifelse(I, 1, `:byte 254 : hsym0 :byte 0 0 0 0')
divert(incr(divnum))dnl

`: hsym'I
:byte 0 dnl
eval($1) dnl
eval($2) dnl
eval($3) dnl
eval($4) dnl
eval($5)
ifelse(I, 1, `:byte 0 : hsymf :byte 0 0 0 0')
divert(decr(divnum))dnl
divert(decr(divnum))dnl
')dnl
:byte 4 NI( 56, 108, 108, 108,  56) #   1 =  2^0 bold rounded
:byte 3 NI(  0,  24,   8,   8,  28) #   2 =  2^1 miniscule
divert(incr(divnum))dnl
:byte 254
divert(incr(divnum))dnl
:byte 0
divert(decr(divnum))dnl
divert(decr(divnum))dnl
popdef(`N')dnl
:byte 6 NI(124,   4, 124,  64, 124) #   4 =  2^2
:byte 5 NI(120,  28, 124,  28, 120) #   8 =  2^3 bold rounded
:byte 4 NI(  0,   8,  40,  60,   8) #  16 =  2^4 miniscule
:byte 1 NI( 60,  64, 124,   4, 124) #  32 =  2^5
:byte 6 NI( 60,  48, 124, 116,  60) #  64 =  2^6 bold rounded
:byte 5 NI(  0,  60,   4,   8,  16) # 128 =  2^7 miniscule
:byte 3 NI( 60,  36, 124,  68, 124) # 256 =  2^8
:byte 1 NI(124,  92, 124,  28,  28) # 512 =  2^9 bold
:byte 7 NI(  0,  24,  36,  60,  36) #  1K = 2^10
:byte 4 NI(120,  68, 120,  68, 120) #  2K = 2^11
:byte 3 NI( 60, 124, 112, 124,  60) #  4K = 2^12 bold rounded
:byte 6 NI(  0,  56,  36,  36,  56) #  8K = 2^13 miniscule
:byte 5 NI(124,  64, 112,  64, 124) # 16K = 2^14
:byte 7 NI(124, 112, 120, 112, 112) # 32K = 2^15 bold
: hisym0
:byte 1 NI(  0,  92,  84,  84,  92) # 64K = 2^16 miniscule
undivert
popdef(`N')dnl
popdef(`NI')dnl
popdef(`IX')dnl
