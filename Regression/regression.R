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