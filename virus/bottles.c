#include <stdint.h>
#include <stdio.h>

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

static uint8_t bottles[256];
static uint8_t lfsr[2];

static inline void
gen(uint8_t seed[])
{
}

int
main(int argc, char *argv[])
{
	uint8_t seed[2];

	viri = (level + 1) + 1;
	level = ltbl[level];

	seed[0] = 0x80; seed[1] = 1;
	for (;;) {
		lfsr[0] = seed[0]; lfsr[1] = seed[1];
		(void)printf("%02x%02x", seed[0], seed[1]);
		for (;;) {
			lfsr[0] <<= 1;
			if (lfsr[1] & 0x80) lfsr[0] |= 1;
			lfsr[1] <<= 1;
			if ((uint8_t)((lfsr[0] & 0x80) + (lfsr[1] & 0x80)))
				lfsr[1] |= 1;
			(void)printf(" %02x%02x", lfsr[0], lfsr[1]);

			if (lfsr[0] != seed[0]) continue;
			if (lfsr[1] != seed[1]) continue;
			break;
		}

		(void)printf("\n");
		if ((seed[0] == 0x7f) && (seed[1] == 0xff)) return (0);

		seed[1] += 1;
		if (seed[1] == 0) seed[0] += 1;
		if ((uint8_t)(seed[1] << 1)) seed[0] += 0x80;
	}
}
