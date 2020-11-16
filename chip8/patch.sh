#!/bin/sh

awk 'NF { print $1, $2, "X" }' c8x-2p.txt | \
  sort -m -k1,1 -k3,3 - c8-2p"$1".txt | \
  awk 'NF == 2 { print $1, $2, "Y"; next } { print }' | \
  sort -k1,1 -k3,3 | \
  awk '{ if ($1 == p) next; print; p = $1 }' | \
  xxd -r -c1 >c8x-2p"$1".ram
