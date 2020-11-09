# board.m4

include(`sprites.m')

# scrathpad
: zboard
: zboard0
BL BL BL BL
BL BL BL BL
: zboard2
BL
: board0-7
BL
: board0-6
BL BL
BL BL BL BL

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
: bmaxsym
0
: bscore
0
: bghost0
0
: bghost1
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

: draw,z,a
 0b11000000  0  0
   0b110000  0 16
     0b1100  8  0
       0b11  8 16

: draw,z,b
 0b11000000 16  0
   0b110000 16 16
     0b1100 24  0
       0b11 24 16

#: draw,z,a,p
# 0b11000000 33 32
#   0b110000 33 48
#     0b1100 41 32
#       0b11 41 48
#
#: draw,z,b,p
# 0b11000000 49 32
#   0b110000 49 48
#     0b1100 57 32
#       0b11 57 48
