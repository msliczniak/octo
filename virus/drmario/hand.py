#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""ドクターマリオ (FC) ツモ&初期配置シミュレータ

使い方:

    $ hand.py <level> <rand_idx>

level には 0..20 の値を指定します。
rand_idx は乱数インデックス(0始まり)です。最速スタートの場合1になりま
す。
"""


import sys


def BIT(x, i):
    return (x>>i) & 1

def rand_update(r):
    bit = BIT(r,1) ^ BIT(r,9)
    r >>= 1
    r  |= bit << 15
    return r

def rand_at(n):
    r = 0x8988
    for _ in range(n):
        r = rand_update(r)
    return r

def gen_tumos(r):
    tumos = []
    x = 0
    for i in range(0x80):
        r = rand_update(r)
        x += (r>>8) & 0xF
        while x >= 9: x -= 9
        tumos.append(x)
    tumos.reverse()

    return tumos, r

def virus_put(level, r, c, field):
    H_MAX = (
         9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
         9,  9,  9,  9,  9, 10, 10, 11, 11, 12,
        12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
        12, 12, 12, 12, 12,
    )
    COLORS = (
        0, 1, 2, 2, 1, 0, 0, 1,
        2, 2, 1, 0, 0, 1, 2, 1,
    )
    MASKS = ( 1, 2, 4, 0 )

    while True:
        r = rand_update(r)
        h = (r>>8) & 0xF
        if h <= H_MAX[level]: break

    x = (r&0xFF) & 7
    y = 15 - h
    off = 8*y + x

    color = c & 3
    if color == 3:
        r = rand_update(r)
        color = COLORS[(r&0xFF) & 0xF]

    #print(f"0x{r:04X}", x, y, off, color)

    while True:
        while field[off] != 0xFF:
            off += 1
            if off >= 128: return r, False

        mask = 0

        # 2段上のマス
        # 高さ制限があるので境界チェック不要
        mask |= MASKS[field[off-16] & 3]

        # 2段下のマス
        if off < 112:
            mask |= MASKS[field[off+16] & 3]

        # 2つ左のマス
        if off % 8 >= 2:
            mask |= MASKS[field[off-2] & 3]

        # 2つ右のマス
        if off % 8 < 6:
            mask |= MASKS[field[off+2] & 3]

        if mask == 7:
            off += 1
            if off >= 128: return r, False
            continue

        while MASKS[color] & mask != 0:
            color -= 1
            if color < 0: color = 2

        field[off] = 0xD0 | color
        return r, True

def virus_place(level, r):
    field = [0xFF] * 128

    count = 4 * (level+1)
    while count > 0:
        r, success = virus_put(level, r, count, field)
        if success: count -= 1

    return field

def print_tumos(tumos):
    CAPSULE_L = ( 0, 0, 0, 1, 1, 1, 2, 2, 2 )
    CAPSULE_R = ( 0, 1, 2, 0, 1, 2, 0, 1, 2 )

    COLOR_CHR = {
        0 : "Y",
        1 : "R",
        2 : "B",
    }

    for t in tumos:
        c1 = COLOR_CHR[CAPSULE_L[t]]
        c2 = COLOR_CHR[CAPSULE_R[t]]
        print(c1, c2)

def print_field(field):
    CELL_CHR = {
        0xD0 : "Y",
        0xD1 : "R",
        0xD2 : "B",
        0xFF : ".",
    }

    for y in range(16):
        for x in range(8):
            off = 8*y + x
            print(CELL_CHR[field[off]], end="")
        print()

def print_hand(tumos, field):
    print_tumos(tumos)
    print_field(field)

def usage():
    sys.exit("Usage: virus_place <level> <rand_idx>")

def main():
    if len(sys.argv) != 3: usage()
    level    = int(sys.argv[1])
    rand_idx = int(sys.argv[2])
    assert 0 <= level <= 20
    assert 0 <= rand_idx <= 32766

    r = rand_at(rand_idx)
    #print(f"rand: 0x{r:04X}")

    tumos, r = gen_tumos(r)
    field    = virus_place(level, r)

    print_hand(tumos, field)

if __name__ == "__main__": main()
