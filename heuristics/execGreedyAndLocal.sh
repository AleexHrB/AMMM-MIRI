#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing heuristics..."
N=3

for i in $(seq $N)
do
    # Create separate output files for Greedy and Local Search for each iteration
    echo "Executing iteration $i"
    greedy_output="greedy_output_iteration_$i.txt"
    local_search_output="local_search_output_iteration_$i.txt"
    
    echo "Iteration $i - Greedy" > $greedy_output
    echo "Iteration $i - Local Search" > $local_search_output
    
    for f in $(ls ../samples/*.dat | sort -V)
    do
        # Greedy Output
        echo "Our solution to $f:" >> $greedy_output
        { time ./heuristic.exe $f 1; } >> $greedy_output 2>&1
        echo "========================" >> $greedy_output
        
        # Local Search Output
        echo "Our solution to $f:" >> $local_search_output
        { time ./heuristic.exe $f 2; } >> $local_search_output 2>&1
        echo "========================" >> $local_search_output
        
        # Real solution (can be included in both outputs if desired)
        out="${f%.dat}.sol"
        echo "Real solution to problem $f:" >> $greedy_output
        cat $out >> $greedy_output
        echo "========================" >> $greedy_output

        echo "Real solution to problem $f:" >> $local_search_output
        cat $out >> $local_search_output
        echo "========================" >> $local_search_output
    done
done

rm heuristic.exe

