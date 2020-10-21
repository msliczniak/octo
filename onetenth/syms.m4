# syms.m4

pushdef(`IX', `0')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
`: sym'I
0 $1 $2 $3 $4 $5 0 0 dnl
divert(incr(divnum))dnl
`: isym'I
255 dnl
eval($1 ^ 255) dnl
eval($2 ^ 255) dnl
eval($3 ^ 255) dnl
eval($4 ^ 255) dnl
eval($5 ^ 255) dnl
255 0
divert(decr(divnum))dnl
popdef(`I')dnl
')dnl

# 5x5 symbols
NI( 0,  0,  0,  0,  0) # blank space
NI(28, 54, 54, 54, 28) #   1 =  2^0     bold rounded
NI( 0, 12,  4,  4, 14) #   2 =  2^1     miniscule
NI(62,  2, 62, 32, 62) #   4 =  2^2
NI(60, 14, 62, 14, 60) #   8 =  2^3     bold rounded
NI( 0,  4, 20, 30,  4) #  16 =  2^4     miniscule
NI(30, 32, 62,  2, 62) #  32 =  2^5
NI(30, 24, 62, 58, 30) #  64 =  2^6     bold rounded
NI( 0, 30,  2,  4,  8) # 128 =  2^7     miniscule
NI(30, 18, 62, 34, 62) # 256 =  2^8
NI(62, 46, 62, 14, 14) # 512 =  2^9     bold
NI( 0, 12, 18, 30, 18) #  1K = 2^10
NI(60, 34, 62, 34, 60) #  2K = 2^11
NI(30, 62, 56, 62, 30) #  4K = 2^12     bold rounded
NI( 0, 28, 18, 18, 28) #  8K = 2^13     miniscule
NI(62, 32, 56, 32, 62) # 16K = 2^14
NI(62, 56, 60, 56, 56) # 32K = 2^15     bold
NI( 0, 46, 42, 42, 46) # 64K = 2^16     miniscule

popdef(`NI')dnl
popdef(`IX')dnl
