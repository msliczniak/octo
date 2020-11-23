# board.m4

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
: board0:-4
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
: board2:-4
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
: prevboard0:-4
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
: prevboard2:-4
BL BL BL BL
: prevboard2
BL BL BL BL
: prevboard3
BL BL BL BL
