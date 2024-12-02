greedyObj<-read.csv("greedyObj.csv",stringsAsFactors = TRUE)$a
cplexObj<-read.csv("cplexObj.csv",stringsAsFactors = TRUE)$a
localSearchObj<-read.csv("localSearchObj.csv",stringsAsFactors = TRUE)$a
diffObjGreedy <- cplexObj - greedyObj
diffObjLocal <- localSearchObj - cplexObj
graspObj1 <- read.csv("graspObjFirst.csv",stringsAsFactors = TRUE)$a
graspObj2 <- read.csv("graspObjSecond.csv",stringsAsFactors = TRUE)$a
graspObj3 <- read.csv("graspObjThird.csv",stringsAsFactors = TRUE)$a


graspObj = 1:100
for (i in 1:100)  {
  graspObj[i] = max(graspObj1[i],graspObj2[i], graspObj3[i])
  
}

graspObj1Sol <- graspObj1[!(graspObj1 %in% c(0.0))]
xGrasp1 <- (1:100)[!graspObj1 %in% 0.0]

graspObj2Sol <- graspObj2[!(graspObj2 %in% c(0.0))]
xGrasp2 <- (1:100)[!graspObj2 %in% 0.0]

graspObj3Sol <- graspObj3[!(graspObj3 %in% c(0.0))]
xGrasp3 <- (1:100)[!graspObj3 %in% 0.0]

graspObjSol <- graspObj[!(graspObj %in% c(0.0))]
xGrasp <- (1:100)[!graspObj %in% 0.0]

greedyObjSol <- greedyObj[!greedyObj %in% 0.0]
xGreedy <- (1:100)[!greedyObj %in% 0.0]

cplexObjFes <- cplexObj[!cplexObj %in% 0.0]
xCplex <- (1:100)[!cplexObj %in% 0.0]

localSearchSol <- localSearchObj[!localSearchObj %in% 0.0]
xLocalSearch <- (1:100)[!localSearchObj %in% 0.0]


lim = 100
x = 1:lim
barplot(cplexObj, type = "b", col= "cyan")
barplot(greedyObj, col="red")
lines(xGreedy, greedyObjSol, col="red")

lines(xLocalSearch,localSearchSol, col="green")
points(xLocalSearch,localSearchSol, col="green")

lines(xGrasp1,graspObj1Sol,col="purple")
points(xGrasp1,graspObj1Sol,col="purple")
length(graspObj1Sol)

graspObj1
graspObj2
