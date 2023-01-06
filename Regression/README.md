# Regression
## Simple Linear Regression
**Description**\
The data(cars) give the speed of cars and the distances taken to stop recorded in the 1920s.
```
l <- lm(dist~speed, data = cars)
summary(l) 
```
<img align="centre" alt="SLR" width="700" height ="400" src="https://user-images.githubusercontent.com/111043457/210221578-3281be81-1ff4-4b5a-9e85-9e72b3646949.png">

## Multiple Linear Regression
**Description**\
Data on motor fuel consumption and related variables, for the year 2001 in the United States. 
```
l2 <- lm(FuelC~Drivers+Income+Miles+Pop+Tax, data = fc)
summary(l2)

```
<img align="centre" alt="MLR" width="800" height ="500" src="https://user-images.githubusercontent.com/111043457/210221941-7d5c680a-ec56-4a16-b2d8-c7d201320c22.png">
