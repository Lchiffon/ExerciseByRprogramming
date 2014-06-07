### R programming WEEK 3
###  4/18/2014 9:17

###   q1 This famous (Fisher's or Anderson's) iris data set

library(datasets)
data(iris)
head(iris)
?iris
iris[iris$Species=='virginica',]->iris_v
mean(iris_v$Sepal.Length)
#####another method 
split(iris,iris$Species)->iris1
lapply(iris1,function(a) mean(a[,c("Sepal.Length")]))

###question 2 caculate the avg of each cols
apply(iris[, 1:4], 2, mean)


### question3
data(mtcars)
?mtcars
head(cars)
tapply(mtcars$mpg, mtcars$cyl, mean)

### question 4
tapply(mtcars$hp, mtcars$cyl, mean)->a

