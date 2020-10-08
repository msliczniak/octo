// https://stackoverflow.com/a/24010028

#include <iostream>
#include <vector>
#include <utility>
using namespace std;

/**
 * @param a - a vector containing the values currently in the field. 
 *   A value of zero means "empty cell".
 * @param score - the score the player currently has.
 * @return a pair where the first number is the number of twos that appeared
 *    and the second number is the number of fours that appeared.
 */
pair<int,int> solve(const vector<vector<int> >& a, int score) {
  vector<int> counts(20, 0);
  for (int i = 0; i < (int)a.size(); ++i) {
    for (int j = 0; j < (int)a[0].size(); ++j) {
      if (a[i][j] == 0) {
        continue;
      }
      int num;
      for (int l = 1; l < 20; ++l) {
        if (a[i][j] == 1 << l) {
          num = l;
          break;
        }
      }
      counts[num]++;
    }
  }
  // What the score would be if only twos appeared every time
  int twos_score = 0;
  for (int i = 1; i < 20; ++i) {
    twos_score += counts[i] * (1 << i) * (i - 1);
  }

  // For each 4 that appears instead of a two the overall score decreases by 4
  int fours = (twos_score - score) / 4;

  // How many twos are needed for all the numbers on the field(ignoring score)
  int twos = 0;
  for (int i = 1; i < 20; ++i) {
    twos += counts[i] * (1 << (i - 1));
  }
  // Each four replaces two 2-s
  twos -= fours * 2;

  return make_pair(twos, fours);
}

int main() {
	pair<int,int> p;
	vector<vector<int> > v;
	vector<int> a, b, c, d;
	int s;

#if 0
	a.push_back(4);
	a.push_back(2);
	a.push_back(0);
	a.push_back(0);

	b.push_back(0);
	b.push_back(0);
	b.push_back(0);
	b.push_back(0);

	c.push_back(0);
	c.push_back(0);
	c.push_back(0);
	c.push_back(0);

	d.push_back(0);
	d.push_back(0);
	d.push_back(0);
	d.push_back(0);
	
	s = 4;
#endif

#if 0
	a.push_back(0x0010);
	a.push_back(0x0008);
	a.push_back(0x0004);
	a.push_back(0x0002);
         
	b.push_back(0x0020);
	b.push_back(0x0040);
	b.push_back(0x0080);
	b.push_back(0x0100);
         
	c.push_back(0x1000);
	c.push_back(0x0800);
	c.push_back(0x0400);
	c.push_back(0x0200);
         
	d.push_back(0x2000);
	d.push_back(0x4000);
	d.push_back(0x8000);
	d.push_back(0x10000);

	s = 0x1c0004;
#endif

	a.push_back(0x0020);
	a.push_back(0x0010);
	a.push_back(0x0008);
	a.push_back(0x0004);
         
	b.push_back(0x0040);
	b.push_back(0x0080);
	b.push_back(0x0100);
	b.push_back(0x1000);
         
	c.push_back(0x0800);
	c.push_back(0x0400);
	c.push_back(0x0200);
	c.push_back(0x2000);
         
	d.push_back(0x4000);
	d.push_back(0x8000);
	d.push_back(0x10000);
	d.push_back(0x20000);

	s = 0x3c0000;

	v.push_back(a);
	v.push_back(b);
	v.push_back(c);
	v.push_back(d);

	p = solve(v, s);
	cout << p.first << endl;
	cout << p.second << endl;
	cout << p.first + p.second - 2 << endl;
}
