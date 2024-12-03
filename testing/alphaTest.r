data<-read.csv("alphaTesting.csv")
data <- data[,-1]
dataNew <- data

alphas = array(dim=c(15,100))

for (i in 1:6) {
  start = (i - 1)*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
}

for (i in 7:9) {
  start = (i + 1)*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
}

alphas[10,] <- rowSums(data[,19:21])
alphas[10,] <- alphas[10,]/3

for (i in 11:14) {
  start = i*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
}

alphas[15,] <- rowSums(data[,22:24])
alphas[15,] <- alphas[15,]/3

numSolved <- array(dim=c(15))
totalMean <- array(dim=c(15))
meanSolved <- array(dim=c(15))
for (i in 1:15) {
  no0 <- alphas[i,][!alphas[i,] %in%  c(0.0)]
  numSolved[i] <- length(no0)
  totalMean[i] <- mean(alphas[i,])
  meanSolved[i] <- mean(no0)
}
 

alphaVals <- c(0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.6,0.7,0.8,0.9,1.0)
plot(alphaVals, totalMean, type = "b", pch = 15, main="Quality of solution with various alphas", xlab = "alpha", ylab = "quality",xaxt="n")
axis(1, at = seq(0, 1.0, by = 0.1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))
plot(lables, numSolved, type = "b")
plot(lables, meanSolved, type = "b")

hist(totalMean)
totalMean
max(totalMean)

###############
grasp1Obj<-read.csv("graspObj1.csv")$a
grasp2Obj <-read.csv("graspObj2.csv")$a
grasp3Obj <-read.csv("graspObj3.csv")$a
graspObj <- grasp1Obj + grasp2Obj + grasp3Obj
graspObj <- graspObj/3
graspObjMax <- max(grasp1Obj, grasp2Obj, grasp3Obj)

graspTime <- read.csv("graspTime.csv")$a

greedyObj <- read.csv("greedyObj.csv")$a
greedyTime <- read.csv("greedyTime.csv")$a

localSearchObj <- read.csv("localSearchObj.csv")$a
localSearchTime <- read.csv("localSearchTime.csv")$a

X <- 1:100
plot(X, greedyTime, type = "l", main="Time", xlab = "Time", ylab = "sample")
lines(X,localSearchTime, type="l", col="blue")
lines(X, graspTime, type="l", col="red")

plot(X, greedyObj, type = "l", main="Time", xlab = "Time", ylab = "sample")
lines(X,localSearchObj, type="l", col="blue")
lines(X, graspObj, type="l", col="red")
