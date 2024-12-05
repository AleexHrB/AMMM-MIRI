# AMMM Project

## Project

This project was made in the context of the class Algorithmic Methods for Mathematical Models of the MIRI (Master in Innovation and Research in Informatics).

The goal of this project was to solve an optimization problem with different methods (using an ILP formulation and using heruistic methods). 


## Files

- The document project.pdf contains the problem statement
- The folder heuristics contains all source code of our heuristic methods as well as some scripts to execute those programs multiple times and the log files of the executions we used for testing
- The folder ilp contains all information about our ILP models and a script to execute them
- The folder samples contains our sample generator as wall as the samples that samples that we used in our project. It also contains a script to execute the sample generator and information about the solution of those samples using ILP (which will be the optimal solution)
- Finally, the testing folder contains all information about our experiments (multiple .csv files) and some R-script files that we used to generate plots and retrive some information

## Excution

## Important considerations

- We found out that if the locale of your computer is in spanish, the outputs given with the "time" command will use the comma "," as a separator for decimals. Our project is not designed to detect that so if you try to generate the data (using the scripts we provided) with a spanish locale, the data will be erroneus. 
