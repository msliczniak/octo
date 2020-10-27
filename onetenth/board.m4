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

: drawbs0
 0b11000000  0  0
   0b110000  0 16
     0b1100  8  0
       0b11  8 16

: drawbs1
 0b11000000 16  0
   0b110000 16 16
     0b1100 24  0
       0b11 24 16
