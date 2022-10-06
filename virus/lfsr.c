#include <stdint.h>
#include <stdio.h>

static uint8_t lfsr[2];

int
main(int argc, char *argv[])
{
	unsigned int ui;
	uint8_t seed[2];

	if (argc != 3) return (2);
	if (sscanf(argv[1], "%x", &ui) != 1) return (3);
	seed[0] = lfsr[0] = ui;
	if (sscanf(argv[2], "%x", &ui) != 1) return (4);
	seed[1] = lfsr[1] = ui;
	for (;;) {
		lfsr[0] <<= 1;
		if (lfsr[1] & 0x80) lfsr[0] |= 1;
		lfsr[1] <<= 1;
		if ((uint8_t)((lfsr[0] & 0x80) + (lfsr[1] & 0x80)))
			lfsr[1] |= 1;
		(void)printf("%02x%02x\n", lfsr[0], lfsr[1]);
		if (lfsr[0] != seed[0]) continue;
		if (lfsr[1] != seed[1]) continue;
		return (0);
	}
}
