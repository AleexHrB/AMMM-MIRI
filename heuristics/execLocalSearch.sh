#!/bin/bash
echo "Compiling..."
g++ -O2 -o heuristic.exe main.cc
echo "Compilation done! Executing Greedy..."

N=3

# Clean and recreate output directory
rm localSearchOutput/*.log

# Run heuristic.exe N times for each data file
for i in $(seq $N); do
    for f in $(find ../samples/data -maxdepth 1 -name '*.dat' | sort -V); do
        num=$(basename "$f" | grep -oE '[0-9]+')
        output="localSearchOutput/localSearchIter${i}_Size${num}.log"
        echo "Running: Iteration $i Size $num"

        # Redirect both time and program output to the same file
        { 
            { time ./heuristic.exe "$f" 2; } 2>&1 
        } >> "$output"
    done
done

rm heuristic.exe
