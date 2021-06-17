include(`rel.m4')dnl
RELFILE(`isrboard.txt')dnl

:org 0x300
: main
jump init

: INTC
:byte 0x22      # DEC  R2       ;5
:byte 0x78      # SAV           ;7
:byte 0x22      # DEC  R2       ;9
:byte 0x73      # STXD          ;11
:byte 0x9B      # GHI  RB       ;13
:byte 0x73      # STXD          ;15
:byte 0xF8 0    # LDI  00H      ;17
:byte 0xA0      # PLO  R0       ;19
:byte 0x7E      # SHLC          ;21
:byte 0x52      # STR  R2       ;23
:byte 0x92      # GHI  R2       ;25
:byte 0xB0      # PHI  R0       ;27
:byte 0x80      # GLO  R0       ;29

#00 A0
#08 A1
#10 B0
#18 B1
#20 C0
#28 C1
#30 D0
#38 D1
#40 E0
#48 E1
#50 -
#58 .

# A0 B0 C0 D0 E0
: INT2
:byte 0xBB      # PHI  RB      ;2
:byte 0xFC 16   # ADI  10H     ;4
:byte 0xAB      # PLO  RB      ;6
                    
# A1 B1 C1 D1 E1    
: SYNC
:byte 0x9B      # GHI  RB      ;2
:byte 0xA0      # PLO  R0      ;4
:byte 0xE2      # SEX  R2      ;6

# A0 B0 C0 D0 E0    
:byte 0xC4      # NOP          ;3
:byte 0xC4      # NOP          ;6
                    
# A1 B1 C1 D1 E1    
:byte 0xA0      # PLO  R0      ;2
:byte 0xFB 0x40 # XRI  40H     ;4
:byte 0xE2      # SEX  R2      ;6

# A0 B0 C0 D0 E0    
:byte 0xC4      # NOP          ;3
:byte 0xC4      # NOP          ;6

# A1 B1 C1 D1 E1
:byte 0x32
: INTB
EPA(INT3)    # BZ   INT3    ;2
:byte 0xF8 0x58 # LDI  58H     ;4
:byte 0xA0      # PLO  R0      ;6

# .
:byte 0x8B      # GLO  RB      ;2
:byte 0xA0      # PLO  R0      ;4
:byte 0x30 EPA(INT2) # BR   INT2    ;6

# A1 B1 C1 D1 E1
: INT3
:byte 0xF8 0x50 # LDI  50H ;
:byte 0xA0      # PLO  R0  ;

# -
:byte 0xF8 0x60 # LDI  60H ;
:byte 0xA0      # PLO  R0    ;
:byte 0x91      # GHI  R1    ; high byte of patch point address

# F0
:byte 0xBB      # PHI  RB    ;
:byte 0xF8 EPA(INTB) # LDI  00H   ; low byte of patch point address
:byte 0xAB      # PLO  RB  ;

# F1
:byte 0xF8 0x60 # LDI  60H ;
:byte 0xA0      # PLO  R0    ;
:byte 0xF8 EPA(INT4)     # LDI  00H ;

# F0
:byte 0xC4      # NOP      ;
:byte 0xC4      # NOP      ;

# F1
:byte 0x5B      # STR  RB    ;
:byte 0xF8 0x60 # LDI  60H ;
:byte 0xA0      # PLO  R0    ;

# F0
:byte 0xC4      # NOP      ;
:byte 0xC4      # NOP      ;

# F1
:byte 0xF8 0x58 # LDI  58H ;
:byte 0xA0      # PLO  R0  ;
:byte 0xF8 0x70 # LDI  70H ;

# .
:byte 0xA0      # PLO  R0  ;
:byte 0xBB      # PHI  RB      ;
:byte 0xF8 0x60 # LDI  60H ;

# G0
:byte 0xAB      # PLO  RB    ;
:byte 0xE2      # SEX  R2  ;
:byte 0x9B      # GHI  RB      ;

# G1
:byte 0xA0      # PLO  R0      ;
:byte 0xE2      # SEX  R2  ;
:byte 0xE2      # SEX  R2  ;

# G0
:byte 0xC4      # NOP      ;
:byte 0xC4      # NOP      ;

# G1
:byte 0xA0      # PLO  R0      ;
:byte 0xE2      # SEX  R2  ;
:byte 0xE2      # SEX  R2  ;

# 0
:byte 0xE2      # SEX  R2  ;
:byte 0xE2      # SEX  R2  ;
: INTA
:byte 0xF8 0x58 # LDI  58H ;

# 1
:byte 0xA0      # PLO  R0  ;
:byte 0x92      # GHI  R2    ;
:byte 0xF9 1    # ORI  01H    ;

# .
:byte 0xB0      # PHI  R0      ;
:byte 0x8B      # GLO  RB      ;
:byte 0xA0      # PLO  R0  ;

# 0
:byte 0xBB      # PHI  RB      ;
:byte 0xFC 16   # ADI  10H     ;4
:byte 0xAB      # PLO  RB      ;6
                    
# 1    
:byte 0x9B      # GHI  RB      ;2
:byte 0xA0      # PLO  R0      ;4
:byte 0xE2      # SEX  R2      ;6

# 0    
:byte 0xC4      # NOP          ;3
:byte 0xC4      # NOP          ;6
                    
# 1    
:byte 0xA0      # PLO  R0      ;2
:byte 0xFB 0x80 # XRI  80H     ;4
:byte 0xE2      # SEX  R2      ;6

# 0    
:byte 0xE2      # SEX  R2      ;2
:byte 0x3A EPA(INTA)    # BNZ   INTA    ;4
:byte 0xF8 0x50 # LDI  50H ;

# 1
:byte 0xA0      # PLO  R0  ;
:byte 0xE2      # SEX  R2      ;4
:byte 0xF8 0    # LDI  00H ;6

# -
:byte 0xA0      # PLO  R0  ;
:byte 0xBB      # PHI  RB      ;
:byte 0xF8 16   # LDI  10H ;6

# K0
:byte 0xAB      # PLO  RB      ;
:byte 0xE2      # SEX  R2      ;4
:byte 0x30 EPA(SYNC) # BR   SYNC    ;

: INT4
:byte 0xF8 0x90 # LDI  90H     ;4
:byte 0xA0      # PLO  R0      ;6

# 90H
:byte 0xA0      # PLO  R0      ;
:byte 0xE2      # SEX  R2              ;
:byte 0xE2      # SEX  R2              ;

# 90H
:byte 0x80      # GLO  R0
:byte 0xE2      # SEX  R2              ;
:byte 0xE2      # SEX  R2              ;

# 98H
:byte 0xA0      # PLO  R0      ;
:byte 0xE2      # SEX  R2              ;
:byte 0xE2      # SEX  R2              ;

:byte 0xE2      # SEX  R2              ;
: DISP
:byte 0x80      # GLO  R0
:byte 0xE2      # SEX  R2              ;

:byte 0x20      # DEC  R0              ;
:byte 0xA0      # PLO  R0              ;
:byte 0xE2      # SEX  R2              ;

:byte 0x3C EPA(DISP) # BN1  DISP            ;
: LAST
:byte 0x80      # GLO  R0
:byte 0xE2      # SEX  R2              ;2

:byte 0x20      # DEC  R0              ;4
:byte 0xA0      # PLO  R0              ;6
:byte 0xE2      # SEX  R2              ;2

:byte 0x34 EPA(LAST) # B1   LAST            ;

:byte 0x19      # INC  R9 
:byte 0x72      # LDXA    
:byte 0x76      # SHRC                 ;
:byte 0x98      # GHI  R8   
:byte 0x32 EPA(INT6) # BZ   INT6
:byte 0xAB      # PLO  RB   
:byte 0x2B      # DEC  RB   
:byte 0x8B      # GLO  RB   
:byte 0xB8      # PHI  R8   
: INT6
:byte 0x88      #GLO  R8 
:byte 0x32 EPA(INT0) #BZ   INT0
:byte 0x7B      #SEQ     
:byte 0x28      #DEC  R8 
:byte 0x30 EPA(INT1) #BR   INT1

: INT0
:byte 0x7A      #2 REQ          ;

: INT1
:byte 0x91      # GHI  R1    ; high byte of patch point address
:byte 0xBB      # PHI  RB    ;
:byte 0xF8 EPA(INTB) # LDI  00H   ; low byte of patch point address
:byte 0xAB      # PLO  RB  ;
:byte 0xF8 EPA(INT3)     # LDI  00H ;
:byte 0x5B      # STR  RB    ;
:byte 0x72      #3 LDXA         ;
:byte 0xBB      #4 PHI  RB      ;
:byte 0x72      #5 LDXA         ;
:byte 0x70      #6 RET          ;

: INT
:byte 0xC0 3 EPA(INTC)       # LBR 0302H    ;15



# :byte 0xF8 0x90 # LDI  90H     ;4
# :byte 0xA0      # PLO  R0      ;6
# 
# # 90H
# :byte 0xA0      # PLO  R0      ;
# :byte 0x19      # INC  R9 
# :byte 0x72      # LDXA    
# 
# # 90H
# :byte 0x76      # SHRC                 ;
# :byte 0x80      # GLO  R0
# : DISP
# :byte 0xE2      # SEX  R2              ;
# 
# # 98H
# :byte 0x20      # DEC  R0              ;4
# :byte 0xA0      # PLO  R0              ;6
# :byte 0xE2      # SEX  R2              ;2
# 
# # 98H
# :byte 0x80      # GLO  R0
# :byte 0xE2      # SEX  R2              ;
# # HSYNC         EF1: 0        R0: 0FE0
# :byte 0xE2      # SEX  R2              ;
# 
# # A0H
# :byte 0x20      # DEC  R0              ;4
# :byte 0xA0      # PLO  R0              ;6
# :byte 0xE2      # SEX  R2              ;
# 
# # A0H
# :byte 0x80      # GLO  R0
# :byte 0x3C EPA(DISP) # BN1  DISP            ;
# : LAST
# :byte 0x80      # GLO  R0
# 
# # E8H
# :byte 0x20      # DEC  R0              ;4
# :byte 0xA0      # PLO  R0              ;6
# :byte 0x34 EPA(LAST) # B1   LAST            ;
# 
# :byte 0xE2      # SEX  R2              ;2
# # HSYNC         EF1: 1        R0: 0FF0


# install custom ISR
:calc SYS00_LSB { HERE & 255 }
:macro SYS00 { :byte SYS00_LSB }
:byte 0xf8 3	# LDI 03H
#:byte 0xf8 8	# LDI 08H
:byte 0x00	# IDL
:byte 0xb1	# PHI R1
:byte 0xf8 EPA(INT)    # LDI H
:byte 0xa1	# PLO R1
:byte 0xd4	# SEP R4

# upper disply page
:calc SYS01_LSB { HERE & 255 }
:macro SYS01 { :byte SYS01_LSB }
:byte 0x92	# GHI  R2
:byte 0xbb	# PHI  RB
:byte 0xba	# PHI  RA
:byte 0xf8 0	# LDI  00H
:byte 0xaa	# PLO  RA
:byte 0xd4	# SEP  R4

# default display page
:calc SYS02_LSB { HERE & 255 }
:macro SYS02 { :byte SYS02_LSB }
:byte 0x92	# GHI  R2
:byte 0xfc 1	# ADI  01H
:byte 0xbb	# PHI  RB
:byte 0xba	# PHI  RA
:byte 0xf8 0	# LDI  00H
:byte 0xaa	# PLO  RA
:byte 0xd4	# SEP  R4

: color :next _color
:byte 0xb1 14
v1 += 8

if v3 == 0 then
return

v3 -= 1
jump color

: board :next _board
sprite v1 v0 6
v1 -= v2
if vf == 0
then return
jump board

: band
v1 := 0
v3 := 7
jump color

: stripe
v3 := 1
:call color
if v5 == 0
then return
v5 -= 1
v0 ^= v4
jump stripe

: nums
v0 := 1

: _nums
sprite v0 v1 5

if v0 == 61
then return

v0 += 4
jump _nums

: zone
i := bits0
v0 := 12
v1 := 60
v2 := 16
:call board
v1 := 57
:call board
v1 := 54
:call board
v1 := 51
:call board
v1 := 48
:call board

i := _board
v0 := 1
save v0
i := bits2
v0 := 10
v1 := 46
:call board

i := bits1
v0 := 11
v1 := 58
:call board
v1 := 52
:call board

i := _board
v0 := 10
save v0
i := bits0
v0 := 0
v1 := 60
v2 := 16
:call board
v1 := 57
:call board
v1 := 54
:call board
v1 := 51
:call board
v1 := 48
jump board

: bits0
:byte 32
:byte 16
:byte 32
:byte 16
:byte 32
:byte 16
:byte 32
:byte 16
:byte 32
:byte 16

: bits1
:byte 0x90

: bits2
:byte 48

: init
# should be GLO RC not GHI RC
i := 0x228
v0 := 0x8c
save v0

v0 := 7
v2 := 18
:call band

i := _color
v0 := 10
save v0
v0 := 2
v1 := 0
v2 := 0
v4 := 4
v5 := 3
:call stripe

i := _color
v0 := 6
save v0
v1 := 0
v2 := 12
v5 := 3
:call stripe

# red
i := _color
v0 := 1
save v0
v2 := 10
:call band

# violet
v0 := 3
v2 := 11
:call band

# jump over init on reset
i := 0x301
:calc ADDR { ( HERE + 4 ) & 255 }
v0 := ADDR
save v0

: start
:byte 3 SYS02
load vf
:byte 3 SYS01
save vf
save vf
save vf
save vf
save vf
save vf
save vf
save vf
:byte 3 SYS02

# black background
:byte 2 0xa0

# HIRES 32x8 color mode
v0 := 2
v1 := 0
v2 := 0
:byte 0xb1 1

# install custom ISR
:byte 3 SYS00

i := eight
v1 := 19
:call nums
v1 := 25
:call nums

i := _board
v0 := 6
save v0
:call zone

i := _board
v0 := 4
save v0
:byte 3 SYS01
:call zone
#:byte 3 SYS02

:alias x v2
:alias xo v3
:alias y v4
:alias yo v5
:alias kc v6	# key
:alias to v7    # time-out
:alias dir v8   # direction
:alias mask v9
:alias kp va    # prev key

# direction bits
:calc NM { 0x1 }
:calc SM { 0x2 }
:calc EM { 0x4 }
:calc WM { 0x8 }

# direction masks
:calc VM { NM | SM }
:calc HM { EM | WM }

x := 0
xo := 0
y := 0
yo := 0
kp := 0

v0 := 0
i := v
sprite v0 y 2
v1 := 10
i := h
sprite x v1 1
i := cursor
sprite x y 2

: input
mask := 0
kc := 6
if kc key then
mask := 1
kc := 2
if kc key then
mask |= kc
kc := 4
if kc key then
mask |= kc
kc := 8
if kc key then
mask |= kc

to := 6
if mask == kp then
to := 2
kp := mask

kc := 1
kc &= mask
if kc != 0 then
:call keye

kc := 2
kc &= mask
if kc != 0 then
:call keyn

kc := 4
kc &= mask
if kc != 0 then
:call keyw

kc := 8
kc &= mask
if kc != 0 then
:call keys

jump input

: cursor
#:byte 0x60
#:byte 0x40
:byte 0x20
:byte 0

: h
0x48

: v
0x80
0x80

: keyw
sprite x y 2
delay := to
i := h
sprite x v1 1
if xo != 0 then
jump _keyw
xo := 5
if x == 0 then
x := 64
x -= 1
: _keyw
x -= 3
xo -= 1
sprite x v1 1
jump _key

: keye
sprite x y 2
delay := to
i := h
sprite x v1 1
if xo != 4 then
jump _keye
xo := 255
if x == 60 then
x := 252
x += 1
: _keye
x += 3
xo += 1
sprite x v1 1
jump _key

: keyn
sprite x y 2
delay := to
i := v
sprite v0 y 2
y -= 2
yo -= 1
if yo == 9 then
jump _keyn9
if yo == 6 then
jump _keyn6
if yo == 4 then
jump _keyn4
if yo != 255 then
jump _keyv
y := 8
yo := 14
:byte 3 SYS02
i := v
jump _keyv
: _keyn9
y += 0x12
jump _keyv
: _keyn6
y += 4
:byte 3 SYS01
i := v
jump _keyv
: _keyn4
y -= 2
jump _keyv

: keys
sprite x y 2
delay := to
i := v
sprite v0 y 2
y += 2
yo += 1
if yo == 5 then
jump _keys5
if yo == 7 then
jump _keys7
if yo == 10 then
jump _keys10
if yo != 15 then
jump _keyv
y := 0
yo := 0
:byte 3 SYS01
i := v
jump _keyv
: _keys5
y += 2
jump _keyv
: _keys7
y -= 4
:byte 3 SYS02
i := v
jump _keyv
: _keys10
y -= 18
# FALLTHRU
: _keyv
sprite v0 y 2 
# FALLTHRU
: _key
i := cursor
sprite x y 2
: _to
vf := delay
if vf != 0 then
jump _to
return

: eight
:byte 0xe0
:byte 0xa0
:byte 0xe0
:byte 0xa0
:byte 0xe0

RELDUMP(`')dnl
