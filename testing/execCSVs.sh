echo "Getting CPLEX Objective Function"
../samples/getCSVObjSecond.sh > cplexObj.csv

echo "Getting CPLEX Time"
../samples/getCSVTimeSecond.sh > cplexTime.csv


mode="greedy"
echo "Getting Greedy Objective Function"
../heuristics/${mode}Output/getCSVObj.sh > ${mode}Obj.csv

echo "Getting Greedy Time First Iteration"
../heuristics/${mode}Output/getCSVfirstTime.sh > ${mode}TimeFirst.csv

echo "Getting Greedy Time Second Iteration"
../heuristics/${mode}Output/getCSVsecondTime.sh > ${mode}TimeSecond.csv

echo "Getting Greedy Time Third Iteration"
../heuristics/${mode}Output/getCSVthirdTime.sh > ${mode}TimeThird.csv


mode="localSearch"
echo "Getting Local Search Objective Function"
../heuristics/${mode}Output/getCSVObj.sh > ${mode}Obj.csv

echo "Getting Local Search Time First Iteration"
../heuristics/${mode}Output/getCSVfirstTime.sh > ${mode}TimeFirst.csv

echo "Getting Local Search Time Second Iteration"
../heuristics/${mode}Output/getCSVsecondTime.sh > ${mode}TimeSecond.csv

echo "Getting Local Search Time Third Iteration"
../heuristics/${mode}Output/getCSVthirdTime.sh > ${mode}TimeThird.csv


mode="grasp"
echo "Getting GRASP First Objective Function"
../heuristics/${mode}Output/getCSVObjFirst.sh > ${mode}ObjFirst.csv

echo "Getting GRASP Second Objective Function"
../heuristics/${mode}Output/getCSVObjSecond.sh > ${mode}ObjSecond.csv

echo "Getting GRASP Third Objective Function"
../heuristics/${mode}Output/getCSVObjThird.sh > ${mode}ObjThird.csv

echo "Getting GRASP Time First Iteration"
../heuristics/${mode}Output/getCSVfirstTime.sh > ${mode}TimeFirst.csv

echo "Getting GRASP Time Second Iteration"
../heuristics/${mode}Output/getCSVsecondTime.sh > ${mode}TimeSecond.csv

echo "Getting GRASP Time Third Iteration"
../heuristics/${mode}Output/getCSVthirdTime.sh > ${mode}TimeThird.csv
