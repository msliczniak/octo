# syms.m4

pushdef(`IX', `0')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
`: sym'I
0 $1 $2 $3 $4 $5 0 dnl
divert(incr(divnum))dnl
`: isym'I
254 dnl
eval($1 ^ 254) dnl
eval($2 ^ 254) dnl
eval($3 ^ 254) dnl
eval($4 ^ 254) dnl
eval($5 ^ 254) dnl
254
divert(decr(divnum))dnl
popdef(`I')dnl
')dnl

# 5x5 symbols
NI(  0,   0,   0,   0,   0) # blank space
NI( 56, 108, 108, 108,  56) #   1 =  2^0     bold rounded
NI(  0,  24,   8,   8,  28) #   2 =  2^1     miniscule
NI(124,   4, 124,  64, 124) #   4 =  2^2
NI(120,  28, 124,  28, 120) #   8 =  2^3     bold rounded
NI(  0,   8,  40,  60,   8) #  16 =  2^4     miniscule
NI( 60,  64, 124,   4, 124) #  32 =  2^5
NI( 60,  48, 124, 116,  60) #  64 =  2^6     bold rounded
NI(  0,  60,   4,   8,  16) # 128 =  2^7     miniscule
NI( 60,  36, 124,  68, 124) # 256 =  2^8
NI(124,  92, 124,  28,  28) # 512 =  2^9     bold
NI(  0,  24,  36,  60,  36) #  1K = 2^10
NI(120,  68, 120,  68, 120) #  2K = 2^11
NI( 60, 124, 112, 124,  60) #  4K = 2^12     bold rounded
NI(  0,  56,  36,  36,  56) #  8K = 2^13     miniscule
NI(124,  64, 112,  64, 124) # 16K = 2^14
NI(124, 112, 120, 112, 112) # 32K = 2^15     bold
NI(  0,  92,  84,  84,  92) # 64K = 2^16     miniscule

popdef(`NI')dnl
popdef(`IX')dnl
