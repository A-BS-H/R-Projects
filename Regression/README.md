# Regression
## Simple Linear Regression
```
l <- lm(dist~speed, data = cars)
summary(l) 
```
<img align="centre" alt="SLR" width="700" height ="400" src="https://user-images.githubusercontent.com/111043457/210221578-3281be81-1ff4-4b5a-9e85-9e72b3646949.png">

## Multiple Linear Regression
```
l2 <- lm(FuelC~Drivers+Income+Miles+Pop+Tax, data = fc)
summary(l2)

```
<img align="centre" alt="MLR" width="800" height ="500" src="https://user-images.githubusercontent.com/111043457/210221941-7d5c680a-ec56-4a16-b2d8-c7d201320c22.png">

## Logistic Regression
**Description**\
The data used is from the UCI machine learning repository.The Cleveland database on Heart Disease and related variables.
```
logistic <- glm(hd ~ ., data=data, family="binomial")
summary(logistic)

```
<img align="centre" alt="MLR" width="700" height ="400" src="https://user-images.githubusercontent.com/111043457/210966381-7e4212c2-519a-4f94-910f-14202fe7538d.png">

