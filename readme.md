# AMMM Project

## Project

This project was made in the context of the class Algorithmic Methods for Mathematical Models of the MIRI (Master in Innovation and Research in Informatics).

The goal of this project was to solve an optimization problem with different methods (using an ILP formulation and using heruistic methods). 


## Files

- The directory pdf contains the statement of the project (project.pdf) our report (report.pdf) and the slides for the presentation (slides.pdf)
- The directory heuristics contains all source code of our heuristic methods as well as some scripts to execute those programs multiple times and the log files of the executions we used for testing
- The directory ilp contains all information about our ILP models and a script to execute them
- The directory samples contains our sample generator as wall as the samples that samples that we used in our project. It also contains a script to execute the sample generator and information about the solution of those samples using ILP (which will be the optimal solution)
- Finally, the testing folder contains all information about our experiments (multiple .csv files) and some R-script files that we used to generate plots and retrive some information

## Excution

There are many options to execute:

- To generate samples you can use the script ./samples/data/createSamples.sh and then the command ./samples/data/clean.sh if you want to remove them.
- Scripts ./samples/getCSVObj.sh and ./samples/getCSVTime.sh can be used to obtain the Obj function and execution time of the CPLEX (Those scripts obtain the solution from the .sol files on the ./samples/secondModel directory.)
- To execute the CPLEX model you can just use the ./ilp/execModel.sh script, and it will use all the samples on the ./samples/data director.
- To execute our heuristics you can just use the scripts ./heuristics/execAlphaGrasp.sh, ./heuristics/execLocalSearch.sh, ./heruistics/execGrasp.sh and ./heuristics/execGreedy.sh, the outputs will be stored in their respective directories.
- Finally you can use the scripts ./testing/execCSVs.sh and then ./testing/getSeconds.sh to generate the CSVs with the outputs of the all executions. The R scripts on the testing directory can be used to retrieve information of those CSV files. 
- Have fun!

## Important considerations

- We found out that if the locale of your computer is in spanish, the outputs given with the "time" command will use the comma "," as a separator for decimals. Our project is not designed to detect that so if you try to generate the data (using the scripts we provided) with a spanish locale, the data will be erroneus. 
