#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing heurstics..."
sleep 1
N=28
for i in $(seq $N)
do
    echo "Our solution to problem $i:"
    echo "Greedy"
    ./heuristic.exe ../samples/project.$i.dat 1
    echo "Local Search"
    ./heuristic.exe ../samples/project.$i.dat 2
    echo "========================"
    echo "Real solution to problem $i:"
    cat ../samples/project.$i.sol
    echo "========================"
done
rm heuristic.exe
