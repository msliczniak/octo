# monitors.m4

divert(incr(divnum))dnl
:assert "program too large" { HERE < 3728 } # hires

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

:monitor sprite:0 "%x %x%x%x%x%x %x%x"
:monitor sprite:1 "%x %x%x%x%x%x"
:monitor sprite:2 "%x %x%x%x%x%x %x%x"
:monitor sprite:3 "%x %x%x%x%x%x"
:monitor sprite:4 "%x %x%x%x%x%x %x%x"
:monitor sprite:5 "%x %x%x%x%x%x"
:monitor sprite:6 "%x %x%x%x%x%x %x%x"
:monitor sprite:7 "%x %x%x%x%x%x"

:monitor sprite:8  "%x %x%x%x%x%x %x%x"
:monitor sprite:9  "%x %x%x%x%x%x"
:monitor sprite:10 "%x %x%x%x%x%x %x%x"
:monitor sprite:11 "%x %x%x%x%x%x"
:monitor sprite:12 "%x %x%x%x%x%x %x%x"
:monitor sprite:13 "%x %x%x%x%x%x"
:monitor sprite:14 "%x %x%x%x%x%x %x%x"
:monitor sprite:15 "%x %x%x%x%x%x"
divert(decr(divnum))dnl
