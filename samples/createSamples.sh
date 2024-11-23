#!/bin/bash
N=22
T=$(($N+8))
INF=21
echo "Compiling..."
g++ -O2 -o generator.exe generator.cc

for i in $(seq $INF $T)
do
    ./generator.exe $i > project.$i.dat
    echo "Solving problem $i"
    oplrun ../ilp/project.template.mod project.$i.dat | grep -E "OBJECTIVE|Commission" > project.$i.sol
    echo "Solution to $i"
    cat project.$i.sol
done

echo "Done!"

rm generator.exe
