using System;
using System.Collections;

namespace DrMarioVirusGeneratorTest
{
	struct Position
	{
		public int x;
		public int y;
	}

	class MainClass
	{
		private static int seed;
		private static Random randomizer;

		public static void Main (string[] args)
		{
			randomizer = new Random ();
			char[,] bottle = new char[16, 8];
			for (int y = 0; y < 16; y++) {
				for (int x = 0; x < 8; x++) {
					bottle[y, x] = '.';
				}
			}

			int virusLevel = 10;
			int remainingViruses = (virusLevel + 1) * 4;
			seed = randomizer.Next ();
			while (remainingViruses > 0) {
				remainingViruses = GenerateVirus (bottle, remainingViruses, virusLevel);
				Console.WriteLine (remainingViruses.ToString ());
			}

			Console.WriteLine ("    --------");
			for (int y = 15; y >= 0; y--) {
				String line = String.Format ("{0,2} |", y);
				for (int x = 0; x < 8; x++) {
					line = String.Concat (line, bottle[y, x]);
				}
				line = String.Concat (line, '|');
				Console.WriteLine (line);
			}
			Console.WriteLine ("    --------");
			Console.WriteLine ("    12345678");
		}

		private static Position NextBottlePosition(Position position)
		{
			position.x++;
			if (position.x > 7) {
				position.x = 0;
				position.y--;
			}

			return position;
		}

		private static int GenerateVirus(char[,] bottle, int remainingViruses, int virusLevel)
		{
			if (remainingViruses < 1) {
				return 0;
			}

			int maxVirusRow;
			if (virusLevel >= 19) {
				maxVirusRow = 12;
			}
			else {
				int[] maxVirusRows = {
					9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
					10, 10,
					11, 11
				};
				maxVirusRow = maxVirusRows[virusLevel];
			}

			Position virusPosition;
			virusPosition.x = seed % 8;
			do {
				seed = randomizer.Next();
				virusPosition.y = seed % 16;
			} while (virusPosition.y > maxVirusRow);

			char[] virusTypes = { 'Y', 'R', 'B' };
			int virusIndex = remainingViruses % 4;
			if (virusIndex == 3) {
				seed = randomizer.Next();
				if (((seed / 3) % 2) == 0) {
					virusIndex = seed % 3;
				}
				else {
					virusIndex = 2 - (seed % 3);
				}
			}

			while (bottle[virusPosition.y, virusPosition.x] != '.') {
				Console.WriteLine (bottle [virusPosition.y, virusPosition.x].ToString ());
				virusPosition = NextBottlePosition(virusPosition);
				if (virusPosition.y < 0) {
					return remainingViruses;
				}
			}

			Hashtable surroundingViruses = new Hashtable();
			surroundingViruses.Add('Y', false);
			surroundingViruses.Add('R', false);
			surroundingViruses.Add('B', false);
			surroundingViruses.Add('.', false);
			while (true) {
				surroundingViruses['Y'] = false;
				surroundingViruses['R'] = false;
				surroundingViruses['B'] = false;
				surroundingViruses['.'] = false;

				if (virusPosition.x > 1) {
					surroundingViruses[bottle[virusPosition.y, virusPosition.x - 2]] = true;
				}
				if (virusPosition.x < 6) {
					surroundingViruses[bottle[virusPosition.y, virusPosition.x + 2]] = true;
				}
				if (virusPosition.y < 14) {
					surroundingViruses[bottle[virusPosition.y + 2, virusPosition.x]] = true;
				}
				if (virusPosition.y > 1) {
					surroundingViruses[bottle[virusPosition.y - 2, virusPosition.x]] = true;
				}

				if (!(bool)surroundingViruses['Y'] || !(bool)surroundingViruses['R'] || !(bool)surroundingViruses['B']) {
					while ((bool)surroundingViruses[virusTypes[virusIndex]]) {
						if (virusIndex == 0) {
							virusIndex = 2;
						}
						else {
							virusIndex--;
						}
					}
					break;
				}

				do {
					virusPosition = NextBottlePosition(virusPosition);
					if (virusPosition.y < 0) {
						return remainingViruses;
					}
				} while (bottle[virusPosition.y, virusPosition.x] != '.');
			}

			bottle[virusPosition.y, virusPosition.x] = virusTypes[virusIndex];
			return remainingViruses - 1;
		}
	}
}
