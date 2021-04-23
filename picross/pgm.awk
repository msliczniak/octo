#!/usr/bin/awk -f

# produce a text PGM
# consume three text PPMs
#  1. 4x1 greyscale
#  2. 4x1 RGB corresponding to previous brightnesses
#  3. image

# greyscale
NR == 4 {
	# insertion sort

	if (NF < 3) exit(1)

	i = 2
	first = i
	nxt[i] = -1
	val[i] = $1

	for (;;) {
		#print i, $i
		#print first
		#for (cur in val) print cur, val[cur], nxt[cur]
		#print ""

		i += 3
		if (i > NF) break

		val[i] = $i

		if ($i < val[first]) {
			nxt[i] = first
			first = i

			continue
		}

		prev = first
		cur = nxt[first]

		for (;;) {
			if (cur == -1) {
				nxt[prev] = i
				nxt[i] = -1

				break
			}

			if ($i < val[cur]) {
				nxt[prev] = i
				nxt[i] = cur

				break
			}

			prev = cur
			cur = nxt[cur]
		}
	}

	#print first
	#for (cur in val) print cur, val[cur], nxt[cur]

	split("", val)
	n = 0
	i = first

	for (;;) {
		val[i] = n

		i = nxt[i]
		if (i == -1) break
		n++
	}

	split("", nxt)

	#print n
	#for (cur in val) print cur, val[cur]

	next
}

# RGB
NR == 8 {
	# generate key map

	for (i = 2; i < NF; i += 3) {
		cur = $(i - 1) " " $i " " $(i + 1)
		nxt[cur] = val[i]
	}

	split("", val)
	next
}

# dimensions
NR == 10 {
	print "P2"
	print
	print n

	next
}

NR < 12 { next }

{
	i = 2
	for (;;) {
		cur = $(i - 1) " " $i " " $(i + 1)
		printf("%s", nxt[cur])

		i += 3
		if (i > NF) break

		printf(" ")
	}

	print ""
}
