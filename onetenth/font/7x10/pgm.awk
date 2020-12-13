#!/usr/bin/awk -f

# take a PPM and create modified PGM
# f looks like j-128kr.pgm
# use what's in front of the dash for color

BEGIN {
	C0["0"] = 1; C1["0"] = 2    # 2   blank space i
	C0["1"] = 2; C1["1"] = 0    #       0         b
	C0["2"] = 0; C1["2"] = 3    # 4     1 =  2^0  r
	C0["3"] = 1; C1["3"] = 3    # 3 *   2 =  2^1  i
	C0["4"] = 2; C1["4"] = 3    # 6 *   4 =  2^2  b
	C0["5"] = 0; C1["5"] = 2    # 5 .   8 =  2^3  r
	C0["6"] = 1; C1["6"] = 2    # 4    16 =  2^4  i
	C0["7"] = 2; C1["7"] = 1    # 1    32 =  2^5  b
	C0["8"] = 0; C1["8"] = 1    # 6    64 =  2^6  r
	C0["9"] = 1; C1["9"] = 0    # 5   128 =  2^7  i
	C0["a"] = 0; C1["a"] = 2    # 3 . 256 =  2^8  b
	C0["b"] = 1; C1["b"] = 2    # 1   512 =  2^9  r
	C0["c"] = 2; C1["c"] = 3    # 7 *  1K = 2^10  i
	C0["d"] = 0; C1["d"] = 3    # 4 !  2K = 2^11  b
	C0["e"] = 1; C1["e"] = 3    # 3 *  4K = 2^12  r
	C0["f"] = 2; C1["f"] = 1    # 6    8K = 2^13  i
	C0["g"] = 0; C1["g"] = 1    # 5   16K = 2^14  b
	C0["h"] = 1; C1["h"] = 0    # 7   32K = 2^15  r
	C0["i"] = 2; C1["i"] = 0    # 1   64K = 2^16  i
	C0["j"] = 3; C1["j"] = 0    #   | 128K = 2^17 r
}

NR == 1 { c1 = substr(f, 1, 1); c0 = C0[c1]; sub(/1/,"2"); print >f; next }

NR == 2 { c1 = C1[c1]; print "24 12" >f; print 3 >f; next }

{
	for (i = 1; i <= NF; i++) printf("%d ", ($i) ? c1 : c0) >f
	print 3 >f
}

END { print "3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3" >f }
