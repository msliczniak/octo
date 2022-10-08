#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static int level = 9;

static int viri;

static uint8_t ltbl[] = {
	0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,
	0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,
	0x30, 0x28, 0x28, 0x20, 0x20, 0x18, 0x18
};

static uint8_t vtbl[] = {
	0, 1, 2, 2, 1, 0, 0, 1, 2, 2, 1, 0, 0, 1, 2, 1
};

static uint8_t bottles[256 + 32];
static uint8_t lfsr[2];

#define BOTTLE (&bottles[16])

static inline void
gen(uint8_t s0, uint8_t s1)
{
	int pos, surrounding;
	uint8_t type;

	lfsr[0] = s0; lfsr[1] = s1;
	(void)printf("%02x%02x", seed[0], seed[1]);
gen_loop:
	for (;;) {
		lfsr[0] <<= 1;
		if (lfsr[1] & 0x80) lfsr[0] |= 1;
		lfsr[1] <<= 1;
		if ((uint8_t)((lfsr[0] & 0x80) + (lfsr[1] & 0x80)))
			lfsr[1] |= 1;

		pos = lfsr[0] & 0x7f;
		if (pos >= level) break;

		if (lfsr[0] != s0) continue;
		if (lfsr[1] != s1) continue;

		exit(1);
	}

	type = viri & 3;
	if (type == 3) type = vtbl[lfsr[1] & 15];
	for (;;) {
		if (BOTTLE[pos] == 0) break;
		if (pos == 0x79) goto gen_loop;
		pos++;
	}

	surrounding = 0;
}

int
main(int argc, char *argv[])
{
	uint8_t seed[2];

	viri = (level + 1) + 1;
	level = ltbl[level];

	seed[0] = 0x80; seed[1] = 1;
	for (;;) {

		(void)printf("\n");
		if ((seed[0] == 0x7f) && (seed[1] == 0xff)) return (0);

		seed[1] += 1;
		if (seed[1] == 0) seed[0] += 1;
		if ((uint8_t)(seed[1] << 1)) seed[0] += 0x80;
	}
}
