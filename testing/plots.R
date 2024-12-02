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

lim = 1
x = 1:lim
data <- data.frame(cplexObj[lim],greedyObj[lim],localSearchObj[lim],graspObj[lim])

barplot(as.matrix(data))

plot(xCplex, cplexObjFes, type = "h", col= "blue")
points(xLocalSearch,localSearchSol, col="yellow",type="h")
legend(70, 1, legend=c("Local Search", "Cplex"),
       col=c("yellow", "blue"), lty=1:1, cex=0.8)

plot(xCplex, cplexObjFes, type = "h", col= "blue")
points(xGreedy,greedyObjSol, col="#C0FF00",type="h")
legend(70, 1, legend=c("Greedy", "Cplex"),
       col=c("#C0FF00", "blue"), lty=1:1, cex=0.8)

plot(xCplex, cplexObjFes, type = "h", col= "blue")
points(xGrasp,graspObjSol, col="#FFC100",type="h")
legend(70, 1, legend=c("Grasp", "Cplex"),
       col=c("#FFC100", "blue"), lty=1:1, cex=0.8)

plot(xCplex, cplexObjFes, type = "h", col= "black")
points(xGrasp,graspObjSol, col="blue")
points(xGreedy,greedyObjSol, col="red")
points(xLocalSearch,localSearchSol, col="green")
legend(70, 1, legend=c("CPLEX", "Greedy","LocalSearch","GRASP"),
       col=c("black", "red","green","blue"), lty=1:1, cex=0.8)





#############################################
greedyTime1<-read.csv("greedyTimeFirst.csv",stringsAsFactors = TRUE)$b
greedyTime2<-read.csv("greedyTimeSecond.csv",stringsAsFactors = TRUE)$b
greedyTime3<-read.csv("greedyTimeThird.csv",stringsAsFactors = TRUE)$b
greedyTime <- (greedyTime1 + greedyTime2 + greedyTime3)/3

cplexTime<-read.csv("cplexTime.csv",stringsAsFactors = TRUE)$b

localSearchTime1<-read.csv("localSearchTimeFirst.csv",stringsAsFactors = TRUE)$b
localSearchTime2<-read.csv("localSearchTimeSecond.csv",stringsAsFactors = TRUE)$b
localSearchTime3<-read.csv("localSearchTimeThird.csv",stringsAsFactors = TRUE)$b
localSearchTime <- (localSearchTime1 + localSearchTime2 + localSearchTime3)/3

graspTime1<-read.csv("graspTimeFirst.csv",stringsAsFactors = TRUE)$b
graspTime2<-read.csv("graspTimeSecond.csv",stringsAsFactors = TRUE)$b
graspTime3<-read.csv("graspTimeThird.csv",stringsAsFactors = TRUE)$b
graspTime <- (graspTime1 + graspTime2 + graspTime3)/3

lim = 100
x = 1:lim
plot(x,greedyTime, type="l",log="y", ylim=c(0.005,5.0))
lines(x,localSearchTime, type = "l", col="blue")
lines(x,graspTime, col="red")
lines(x,cplexTime, col="green")

plot(x, cplexTime, type="l", log="y")
lines(x,graspTime, col="red")