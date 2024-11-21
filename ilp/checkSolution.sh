#!/bin/bash

N=8
for i in $(seq $N)
do
    echo "Our solution to problem $i:"
    oplrun project.template.mod ../samples/project.$i.dat | grep -E "OBJECTIVE|Commission"
    echo "========================"
    echo "Real solution to problem $i:"
    cat ../samples/project.$i.sol
    echo "========================"
done
