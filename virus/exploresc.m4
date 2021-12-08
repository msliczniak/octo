:alias x v8
:alias y v9
:alias s va

: main
hires
vf := 255
buzzer := vf
delay := vf

: forever
x := 0
y := 0
s := 32

i := 0
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0

y += 16
i += s
x := 0
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0

y += 16
i += s
x := 0
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0

y += 16
i += s
x := 0
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0
i += s
x += 16
sprite x y 0

vf := key
:call forever
