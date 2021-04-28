#!/usr/bin/awk -f
FNR == 1 { h = 0; w = 0 }

NF == 0 { next }

h == 0 {
	for (i = 1; i <= NF; i++) {
		v = $i + 0; if (v != 0) break
	}
	
	if (v == 0) next
	h = v; hc = i
}

w == 0 {
	if (NF == 1) {
		w = $1 + 0

		#f = FILENAME ".txt"
		#print w, h, hc, vc >f
		#close(f)

		for (i = 0; i < h; i++) {
			v = split(a[i], c)

			l = 0; f = -1
			for (j = 1; j <= v; j++) {
				l += c[j] + f + 1
				printf(" %d", c[j])
				f = 0
			}

			if (l < h) printf(" 0")
			print ""
		}

		split("", a)
		split("", c)
		print ""; next
	}

	j = 0; for (i = hc; i++ < NF; j++) {
		v = $i + 0; if (v == 0) continue
		a[j] = v " " a[j]
	}; vc++

	next
}

{
	l = 0; f = -1
	for (i = hc; i > 0; i--) {
		v = $i + 0; if (v == 0) break

		l += $i + f + 1
		printf(" %d", $i)
		f = 0
	}

	if (l < w) printf(" 0")
	print ""
}
