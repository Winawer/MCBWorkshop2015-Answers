#!/bin/bash

for i in `seq 1 1000`; do
	TFILE=data.$RANDOM
	let "number=$RANDOM % 500"
	dd if=/dev/urandom of=$TFILE bs=100 count=$number
done
