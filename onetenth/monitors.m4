# monitors.m4

divert(incr(divnum))dnl
# :assert "program too large" { HERE < 3728 }

:monitor board0 "%x %x %x %x"
:monitor board1 "%x %x %x %x"
:monitor board2 "%x %x %x %x"
:monitor board3 "%x %x %x %x"

:monitor boardf "%x %x %x %x"
:monitor boarde "%x %x %x %x"

:monitor prevboard0 "%x %x %x %x"
:monitor prevboard1 "%x %x %x %x"
:monitor prevboard2 "%x %x %x %x"
:monitor prevboard3 "%x %x %x %x"
divert(decr(divnum))dnl
