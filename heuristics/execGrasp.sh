#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing heuristics..."

alpha=(0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.60 0.70 0.80 0.90 1.00)
N=3


for a in ${alpha[@]}
do
    for i in $(seq $N)
    do
        echo "Starting iteration $i alpha=$a"
        output_file="./alphaGrasp/output_iteration_alpha=${a}_$i.log"
        > "$output_file"                     

        echo "=======================================================" >> "$output_file"
        echo "Iteration $i" >> "$output_file"
        for f in $(ls ../samples/*.dat | sort -V)
        do
            echo "GRASP" >> "$output_file"
            ./heuristic.exe $f 3 $a >> "$output_file" 2>&1
            echo "========================" >> "$output_file"
            echo "Real solution to problem $f:" >> "$output_file"
            out="${f%.dat}.sol"
            cat "$out" >> "$output_file"
            echo "========================" >> "$output_file"
        done
    done
done

rm heuristic.exe

