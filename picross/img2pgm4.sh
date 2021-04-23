#!/bin/sh

# convert to 2-bit PGM

convert "$1" -colorspace RGB -flatten -normalize \
  -compress None -strip gif:- | \
gifsicle --method=blend-diversity --gamma=1.0 -wUk4 | \
convert gif:- \( +clone -unique-colors \) \( +clone -colorspace Gray \) \
  -swap -3,-1 -strip -compress None ppm:- | `dirname "$0"`/pgm.awk
