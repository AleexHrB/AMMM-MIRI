#!/bin/bash
N=10
T=$(($N+8))
INF=9
echo "Compiling..."
g++ -O2 -o generator.exe generator.cc

for i in $(seq $INF $T)
do
    ./generator.exe $i > project.$i.dat
    oplrun ../ilp/project.template.mod project.$i.dat | grep -E "OBJECTIVE|Commission" > project.$i.sol
    echo "Solution to $i"
    cat project.$i.sol
done

echo "Done!"

rm generator.exe
