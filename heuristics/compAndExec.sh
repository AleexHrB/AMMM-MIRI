#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing heurstics..."
sleep 1

for f in $(ls ../samples/*.dat | sort -V)
do
    echo "Our solution to $f:"
    echo "Greedy"
    ./heuristic.exe $f 1
    echo "Local Search"
    ./heuristic.exe $f 2
    echo "GRASP"
    ./heuristic.exe $f 3
    echo "========================"
    echo "Real solution to problem $f:"
    out="${f%.dat}.sol"
    cat $out
    echo "========================"
done
rm heuristic.exe
