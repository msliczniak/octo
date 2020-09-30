#include <stdint.h>
#include <stdio.h>

#define VIRUS_LEVEL 20
uint8_t REM_VIRUSES = VIRUS_LEVEL * 4 + 4;

uint8_t color, location;

size_t bottle_start = 16;
uint8_t bottle[20 * 8];

void sub_B771(uint8_t * data, uint8_t len) {
	uint8_t carry_0 = 0, carry_1 = 0;
	uint8_t x = 0;
	if (((data[0] & 2) ^ (data[1] & 2)) != 0) {
		carry_0 = 1;
		carry_1 = 1;
	}

	for (x = 0; x < len; x++) {
		carry_0 = data[x] & 1;
		data[x] = (carry_1 << 7) | data[x] >> 1;
		carry_1 = carry_0;
	}
}

void sub_9CFF(uint8_t * seed) {
	uint8_t byte_47;
	uint8_t byte_48;
	uint8_t byte_49;
	uint8_t byte_4C;
	uint8_t byte_51;
	uint8_t byte_57;
	uint8_t virus_level_tbl[] = {0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0xA,0xA,0xB,0xB,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC,0xC};
	uint8_t rng_tbl[] = {0x78,0x70,0x68,0x60,0x58,0x50,0x48,0x40,0x38,0x30,0x28,0x20,0x18,0x10,0x8,0x0};
	uint8_t equal3_tbl[] = {0,1,2,2,1,0,0,1,2,2,1,0,0,1,2,1};
	uint8_t bit_tbl[] = {1, 2, 4, 0};

	do {
		sub_B771(seed, 2);
		byte_47 = seed[0] & 0xF;
	} while (virus_level_tbl[VIRUS_LEVEL] < byte_47);
	byte_47 = rng_tbl[byte_47] + (seed[1] & 7);
	byte_57 = byte_47;
	byte_49 = byte_47;

	byte_48 = REM_VIRUSES & 3;
	if (byte_48 == 3) {
		sub_B771(seed, 2);

		byte_48 = equal3_tbl[seed[1] & 0xF];
	}

	do {
		if (bottle[bottle_start + byte_57] == 0xFF)
			goto loop_start;
try_again:
		byte_57 = ++byte_49;
	} while (byte_57 < 0x80);
	return;
loop_start:
	byte_47 = byte_48;
	byte_4C = 0;
	byte_57 = 0;

	byte_4C |= bit_tbl[bottle[bottle_start + byte_49 - 16] & 3];
	byte_4C |= bit_tbl[bottle[bottle_start + byte_49 + 16] & 3];
	if ((byte_49 & 7) >= 2)
		byte_4C |= bit_tbl[bottle[bottle_start + byte_49 - 2] & 3];
	if ((byte_49 & 7) < 6)
		byte_4C |= bit_tbl[bottle[bottle_start + byte_49 + 2] & 3];
loop_inner:
	if (byte_4C != 7)
		goto loop_outer;
	goto try_again;
loop_outer:
	byte_51 = 0;
	if ((byte_4C & bit_tbl[byte_48]) == 0)
		goto done;
	byte_48--;
	if (byte_48 & 0x80)
		byte_48 = 2;
	goto loop_inner;
done:
	bottle[bottle_start + byte_49] = 0xD0 | byte_48;
	REM_VIRUSES--;
}

int main() {
	size_t x, y;
	uint8_t seed[] = {0x02, 0x00};

	for (y = 0; y < 20; y++) {
		for (x = 0; x < 8; x++) {
			bottle[y*8 + x] = 0xFF;
		}
	}

	while (REM_VIRUSES > 0) {
		sub_9CFF(seed);
	}

	for (y = 2; y < 16 + 2; y++) {
		for (x = 0; x < 8; x++) {
			switch (bottle[y*8 + x]) {
			case 0xD0: putchar('Y'); break;
			case 0xD1: putchar('R'); break;
			case 0xD2: putchar('B'); break;
			case 0xFF: putchar('-'); break;
			}
		}
		putchar('\n');
	}

	return 0;

}
