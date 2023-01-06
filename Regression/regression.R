## linear regression

data("cars")

l <- lm(dist~speed, data = cars)
summary(l)

plot(cars$speed, cars$dist,main="Relationship between Speed and Stopping Distances",
     xlab="Speed (mph)", ylab="Stopping distance (ft)",pch = 19)


## multiple linear regression


data("fuel2001")
fc <- fuel2001
str(fc)
l2 <- lm(FuelC~Drivers+Income+Miles+Pop+Tax, data = fc)
summary(l2)
plot(fc)

## logistic regression

url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"
data <- read.csv(url, header=FALSE)

#cleaning and manipulating data

data$sex <- as.factor(data$sex)
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)
data$ca <- as.factor(data$ca)
data$thal <- as.factor(data$thal)

str(data)

logistic <- glm(hd ~ ., data=data, family="binomial")
summary(logistic)

# plot of the predicted probabilities for each sample having heart disease

ggplot(data=predicted.data, aes(x=rank, y=probability.of.hd)) +
  geom_point(aes(color=hd), alpha=1, shape=4, stroke=2) +
  xlab("Index") +
  ylab("Predicted probability of getting heart disease")
