# board.m4

include(`sprites.m')

: board
: board0
BL BL
: board2-6
BL BL
: board1
BL BL BL BL
: board2
BL BL BL BL
: board3
BL BL BL BL

: boardf # free counts
: bfree0
0
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
 0 16       0b11
 0  0     0b1100
10 16   0b110000
10  0 0b11000000
: drawbs1
20 16       0b11
20  0     0b1100
30 16   0b110000
30  0 0b11000000
