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

plot(xCplex, cplexObjFes, type = "h", col= "blue",main= "Comparison of objective functions", xlab = "Sample", ylab = "Quality")
points(xLocalSearch,localSearchSol, col="yellow",type="h")
legend(70, 1, legend=c("Local Search", "Cplex"),
       col=c("yellow", "blue"), lty=1:1, cex=1.5)

plot(xCplex, cplexObjFes, type = "h", col= "blue",main= "Comparison of objective functions", xlab = "Sample", ylab = "Quality")
points(xGreedy,greedyObjSol, col="#C0FF00",type="h")
legend(70, 1, legend=c("Greedy", "Cplex"),
       col=c("#C0FF00", "blue"), lty=1:1, cex=1.5)

plot(xCplex, cplexObjFes, type = "h", col= "blue",main= "Comparison of objective functions", xlab = "Sample", ylab = "Quality")
points(xGrasp,graspObjSol, col="#FFC100",type="h")
legend(70, 1, legend=c("Grasp", "Cplex"),
       col=c("#FFC100", "blue"), lty=1:1, cex=1.5)

plot(xCplex, cplexObjFes, type = "h", col= "black",main= "Comparison of all objective functions", xlab = "Sample", ylab = "Quality")
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
plot(x,greedyTime, type="l",log="y", ylim=c(0.005,5.0), col="black", main="Time comparison (logarithmic scale)", xlab = "sample", ylab="time")
lines(x,localSearchTime, type = "l", col="green")
lines(x,graspTime, col="red")
lines(x,cplexTime, col="blue")
legend(1, 5, legend=c("CPLEX", "Greedy","LocalSearch","GRASP"),
       col=c("blue", "black","green","red"), lty=1:1, cex=1)

plot(x, cplexTime, type="l", log="y", col="blue", main = "Time: GRASP vs CPLEX (log-scale)",xlab = "sample", ylab="time")
lines(x,graspTime, col="red")
legend(1, 500, legend=c("CPLEX","GRASP"),
       col=c("blue", "red"), lty=1:1, cex=1.5)

plot(x, greedyTime, type="l", log="y", col="black", main = "Time: Local Search vs Greedy (log-scale)",xlab = "sample", ylab="time")
lines(x,localSearchTime, col="green")
legend(10,0.025,legend=c("Greedy","Local Search"),
       col=c("black", "green"), lty=1:1, cex=1.5)

##############33

greedyPercentage = greedyObj/cplexObj
greedyPercentage = greedyPercentage[!greedyPercentage %in% c(NaN)]
greedyPercentage = greedyPercentage[!greedyPercentage %in% c(0.0)]
GreedyClass1 = length(greedyPercentage[greedyPercentage > 0.9999999])
GreedyClass2 = length(greedyPercentage[greedyPercentage >= 0.95]) - length(greedyPercentage[greedyPercentage > 0.9999999])
GreedyClass3 = length(greedyPercentage[greedyPercentage >= 0.90]) - GreedyClass2 - GreedyClass1
GreedyClass4 = length(greedyPercentage[greedyPercentage >= 0.85]) - GreedyClass2 - GreedyClass1 - GreedyClass3
GreedyClass5 =length(greedyPercentage) - GreedyClass2 - GreedyClass1 - GreedyClass3 - GreedyClass4

localPercentage = localSearchObj/cplexObj
localPercentage = localPercentage[!localPercentage %in% c(NaN)]
localPercentage = localPercentage[!localPercentage %in% c(0.0)]
LocalClass1 = length(localPercentage[localPercentage > 0.9999999])
LocalClass2 = length(localPercentage[localPercentage >= 0.95]) - LocalClass1
LocalClass3 = length(localPercentage[localPercentage >= 0.90]) - LocalClass2 - LocalClass1
LocalClass4 = length(localPercentage[localPercentage >= 0.85]) - LocalClass2 - LocalClass1 - LocalClass3
LocalClass5 =length(localPercentage) - LocalClass2 - LocalClass1 - LocalClass3 - LocalClass4


graspPercentage = graspObj/cplexObj
graspPercentage = graspPercentage[!graspPercentage %in% c(NaN)]
graspPercentage = graspPercentage[!graspPercentage %in% c(0.0)]
GraspClass1 = length(graspPercentage[graspPercentage >= 1.00])
GraspClass2 = length(graspPercentage[graspPercentage >= 0.95]) - GraspClass1
GraspClass3 = length(graspPercentage[graspPercentage >= 0.90]) - GraspClass2 - GraspClass1
GraspClass4 = length(graspPercentage[graspPercentage >= 0.85]) - GraspClass2 - GraspClass1 - GraspClass3
GraspClass5 =length(graspPercentage) - GraspClass2 - GraspClass1 - GraspClass3 - GraspClass4

diffGreedyLS = greedyTime - localSearchTime
diffGreedyLS
max(diffGreedyLS)
