data<-read.csv("alphaTesting.csv")
data <- data[,-1]
dataNew <- data

alphas = array(dim=c(15,100))
graspObjMax = array(dim=c(15,100))

for (i in 1:6) {
  start = (i - 1)*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
  for (j in 1:100) {
    graspObjMax[i,j] = max(data[j,start], data[j,start + 1], data[j,start + 2])  
  }
  
}

for (i in 7:9) {
  start = (i + 1)*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
  for (j in 1:100) {
    graspObjMax[i,j] = max(data[j,start], data[j,start + 1], data[j,start + 2])  
  }
}

alphas[10,] <- rowSums(data[,19:21])
alphas[10,] <- alphas[10,]/3
for (j in 1:100) {
  graspObjMax[10,j] = max(data[j,19], data[j,20], data[j,21])  
}

for (i in 11:14) {
  start = i*3 + 1
  end = start + 2
  alphas[i,] <- rowSums(data[,start:end])
  alphas[i,] <- alphas[i,]/3
  for (j in 1:100) {
    graspObjMax[i,j] = max(data[j,start], data[j,start + 1], data[j,start + 2])  
  }
}

alphas[15,] <- rowSums(data[,22:24])
alphas[15,] <- alphas[15,]/3
for (j in 1:100) {
  graspObjMax[15,j] = max(data[j,22], data[j,23], data[j,24])  
}

numSolved <- array(dim=c(15))
totalMean <- array(dim=c(15))
meanSolved <- array(dim=c(15))
meanMax <- array(dim=c(15))
for (i in 1:15) {
  no0 <- alphas[i,][!alphas[i,] %in%  c(0.0)]
  numSolved[i] <- length(no0)
  totalMean[i] <- mean(alphas[i,])
  meanSolved[i] <- mean(no0)
  meanMax[i] <- mean(graspObjMax[i,])
}
 


alphaVals <- c(0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.6,0.7,0.8,0.9,1.0)
plot(alphaVals, totalMean, type = "b", pch = 15, main="Quality of solution with various alphas (Mean)", xlab = "alpha", ylab = "quality",xaxt="n")
axis(1, at = seq(0, 1.0, by = 0.1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))

plot(alphaVals, numSolved, type = "b",pch = 15, main="Number of solved problems (Max)", xlab = "alpha", ylab = "quality",xaxt="n")
axis(1, at = seq(0, 1.0, by = 0.1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))

plot(alphaVals, meanSolved, type = "b",pch = 15, main="Quality of solution with various alphas (Mean of solved instances)", xlab = "alpha", ylab = "quality",xaxt="n")
axis(1, at = seq(0, 1.0, by = 0.1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))

plot(alphaVals, meanMax, type="b", pch = 15, main="Quality of solution with various alphas (Max)", xlab = "alpha", ylab = "quality",xaxt="n")
axis(1, at = seq(0, 1.0, by = 0.1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))

meanMax
totalMean
meanSolved
numSolved
hist(totalMean)
totalMean
max(totalMean)
