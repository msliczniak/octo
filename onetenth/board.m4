# board.m4

include(`sprites.m')

: board
: board0
BL
: board2-7
: board-1
BL
: board2-6
BL BL
: board1
BL BL BL BL
: board2
BL BL BL BL
: board3
BL BL BL
: board-f
BL

: boardf # free counts
: bfree0
0
: prevboard0-7
: bfree1
0
: prevboard0-6
: bfree2
0
: bfree3
0

: boarde # extras
: bghost0
0
: bghost1
0
: bmaxsym
0
: bscore
0

: prevboard
: prevboard0
BL BL
: prevboard2-6
BL BL
: prevboard1
BL BL BL BL
: prevboard2
BL BL BL BL
: prevboard3
BL BL BL BL

dnl : zboard
dnl : zboard0
dnl BL BL BL BL
dnl BL BL BL BL
dnl : zboard2
dnl BL BL BL BL
dnl BL BL BL BL

: draw,s,a
: draw,n,b
 0b11000000  0  0
   0b110000  0 16
     0b1100  8  0
       0b11  8 16

: draw,s,b
: draw,n,a
 0b11000000 16  0
   0b110000 16 16
     0b1100 24  0
       0b11 24 16

: draw,e,a
: draw,w,b
 0b10001000  0  0
  0b1000100  8  0
   0b100010 16  0
    0b10001 24  0

: draw,e,b
: draw,w,a
 0b10001000  0 16
  0b1000100  8 16
   0b100010 16 16
    0b10001 24 16

: draw,s,a,p
: draw,n,b,p
 0b11000000 33 32
   0b110000 33 48
     0b1100 41 32
       0b11 41 48

: draw,s,b,p
: draw,n,a,p
 0b11000000 49 32
   0b110000 49 48
     0b1100 57 32
       0b11 57 48

: draw,e,a,p
: draw,w,b,p
 0b10001000 33 32
  0b1000100 41 32
   0b100010 49 32
    0b10001 57 32

: draw,e,b,p
: draw,w,a,p
 0b10001000 33 48
  0b1000100 41 48
   0b100010 49 48
    0b10001 57 48
