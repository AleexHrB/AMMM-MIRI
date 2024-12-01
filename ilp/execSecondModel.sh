#!/bin/bash

for f in $(ls ../samples/data/*.dat | sort -V)
do
    echo "Solving problem $f"
    out="${f%.dat}.sol"
    out="${out##*/}"
    { time timeout 1800 oplrun project.template.second.mod $f | grep -E "OBJECTIVE|Commission" > $out ; } 2>>$out 
    echo "Solution to $i"
    cat $out 
    mv $out ../samples/secondModel/
done

echo "Done!"
