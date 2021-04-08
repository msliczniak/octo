#!/bin/sh

rm -rf strips || exit
mkdir strips || exit

convert mockup.pbm -crop 64x32 +repage strips/s.png || exit
cd strips || exit

mv s-0.png t.png || exit
mv s-1.png b.png || exit

# vertical strips
for n in t b; do
	convert "$n".png -crop 8x32 -compress None -strip pbm:- | \
	awk '/P1/ { close(f); f = n i++ ".pbm" } { print >f }
	END { if (i != 8) exit(1) }' n=$n || exit
done

# horiz
for n in t b; do
for i in 0 1 2 3 4 5 6 7; do
	convert $n"$i".pbm -crop 8x4 -compress None -strip pbm:- | \
	awk '/P1/ {
		close(f); f = i++ n
		print "P2" >f; getline; print >f; print "3" >f; next
	} { print >f }
	END { if (i != 8) exit(1) }' n=$n$i || exit
done
done

i=0 # L side
for n in t b; do
for j in 0 1 6 7; do
	<$j$n$i >$j$n$i.pgm tr 1 3 || exit
done; done

for n in t b; do
for j in 2 3 4 5; do
	<$j$n$i >$j$n$i.pgm tr 1 2 || exit
done; done

i=7 # R side
for n in t b; do
for j in 0 1 7 5 6; do
	<$j$n$i >$j$n$i.pgm tr 1 3 || exit
done; done

for n in t b; do
for j in 2 3 4; do
	<$j$n$i >$j$n$i.pgm tr 1 2 || exit
done; done

#for n in t b; do
#for i in 0 7; do
#for j in 0 1 2 3 4 5 6 7; do
#	mv $j$n$i $j$n$i.pgm || exit
#done; done; done

# L&R
for n in t b; do
for i in 1 2 5 6; do
for j in 0 1 6 7; do
	<$j$n$i >$j$n$i.pgm tr 1 2 || exit
done; done; done

for n in t b; do
for i in 1 2 5 6; do
for j in 2 3 4 5; do
	<$j$n$i >$j$n$i.pgm tr 1 3 || exit
done; done; done

# C board
for n in t b; do
for i in 3 4; do
for j in 0 1 6 7; do
	<$j$n$i >$j$n$i.pgm tr 1 3 || exit
done; done; done

for n in t b; do
for i in 3 4; do
for j in 2 3 4 5; do
	<$j$n$i >$j$n$i.pgm tr 1 2 || exit
done; done; done

exec montage ?t?.pgm ?b?.pgm -tile 8x -geometry +0+0 ../mockup.pgm
