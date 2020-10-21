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
0 0
: prevboard0-6
0 0

: boarde # extras
0 0 0 0

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
