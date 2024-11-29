#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing heuristics..."
N=3

rm ./times/*

for i in $(seq $N)
do
    # Create separate output files for Greedy and Local Search for each iteration
    echo "Executing iteration $i"
    greedy_output="./times/greedy_output_iteration_$i.txt"
    local_search_output="./times/local_search_output_iteration_$i.txt"
    grasp_output="./times/grasp_output_iteration_$i.txt"
    
    echo "Iteration $i - Greedy" > $greedy_output
    echo "Iteration $i - Local Search" > $local_search_output
    echo "Iteration $i - GRASP" > $grasp_output
    
    for f in $(ls ../samples/*.dat | sort -V)
    do
        echo "Program $f" >> $greedy_output
        # Greedy Output
        echo "Greedy:" >> $greedy_output
        echo "Executing Greedy $f"
        { time ./heuristic.exe $f 1; } >> $greedy_output 2>&1
        echo "========================" >> $greedy_output
        
        # Local Search Output
        echo "Executing Local Search $f"
        echo "Program $f" >> $local_search_output
        echo "Local Search" >> $local_search_output
        { time ./heuristic.exe $f 2; } >> $local_search_output 2>&1
        echo "========================" >> $local_search_output

        # GRASP
        echo "Executing GRASP $f"
        echo "Program $f" >> $grasp_output
        echo "GRASP:" >> $grasp_output
        { time ./heuristic.exe $f 3 0.30; } >> $grasp_output 2>&1
        echo "========================" >> $grasp_output
    done
done

rm heuristic.exe

