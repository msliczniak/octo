#include <stdint.h>
#include <stdio.h>

#define SEED0 2
#define SEED1 2

static uint8_t lfsr[2];

int
main(int argc, char *argv[])
{
	(void)argc; (void)argv;

	lfsr[0] = SEED0; lfsr[1] = SEED1;
	for (;;) {
		lfsr[0] <<= 1;
		if (lfsr[1] & 0x80) lfsr[0] |= 1;
		lfsr[1] <<= 1;
		if ((lfsr[0] & 0x80) ^ (lfsr[1] & 0x80)) lfsr[1] |= 1;
		(void)printf("%02x%02x\n", lfsr[0], lfsr[1]);
		if (lfsr[0] != SEED0) continue;
		if (lfsr[1] != SEED1) continue;
		return (0);
	}
}
