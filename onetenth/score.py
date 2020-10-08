def score(x):
	if x == 2:
		return 4

	return (score(x >> 1) + x) * 2

