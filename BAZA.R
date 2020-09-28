#vector(10.09.2020 Lection)
myfirstvector <- c(1,2,1,2,1)
mygender <- c("F", "M", "F", "M", "F")

#factor
mygender <- c("F", "M", "F", "M", "F")
mygender1 <- factor(mygender, levels = c("F", "M"))
str(mygender1) #(10.09.2020 Lection)

#num(15.09.2020 lection)
numeric1 <- c(1,2,3,4,5)
numeric2 <- c(1.2, 1.3, 1.4, 1.5)

#int
int1 <- c(1L, 15L, 20L)
int2 <- c(1:5)
class(int2)

#vector to factor
color <- c("z", "h", "h", "h", "z", "b", "a")
factor <- factor(color, levels = c ("z","h", "b", "a"))
factor
#or
factornew <- as.factor(color)
factornew

#data frames 
data11 <- data.frame(Number = myfirstvector, Gender = mygender1)
str(data11)
class(data11)

#Matrix
Matrix1 <- seq(1,10)
mydata <- matrix(Matrix1, nrow = 5, ncol = 2)
rownames(mydata) <- c("Max","Gleb","Eghor","Vlad","Dima")
colnames(mydata) <- c("Gender","City")
mydata1 <- cbind(myfirstvector, mygender)
mydata2 <- rbind(myfirstvector, mygender)
data2 <- data.frame(mydata) #(15.09.2020 lection)

#logical operators (17.09.2020)

# [!] - the "not" operator  
# [&] - the "and" operator
# [|] - the "or" operator
# [==] - the "equals" operator 
# [!=] - the "not equal" operator
# [>]  - the "greater than" operator
# [>=] - the "greater that or equal to" operator 
# [<]  - the "less than" operator
# [<=] - the "less than or equal to" operator 
# [%in%] - the "contained in (щось знайти в чомусь) " operator

ages <- c(3, 6, 9, 12, 15, 18)
cutoff <- 12
ages == cutoff

ages2 <- c(3, 6, 3, 5, 5, 24)
ages == ages2

ages > cutoff
ages2 >= cutoff

ages >= ages2 
ages %in% ages2

ages %in% cutoff
ages2 != cutoff
ages != ages2

ages > cutoff & ages > ages2
ages < cutoff & ages > ages2
ages > cutoff | ages2 > cutoff
ages > cutoff & !(ages > ages2)
ages > cutoff & ages <= ages2
common <- ages >= cutoff
indiv <- !(ages > cutoff)
common
indiv
common & indiv

#colors(logical operations)
colors <- c("red", "blue", "white", "black", "green")
colors == "white" 
colors != "red"
c("green", "yellow") %in% colors
colors %in% c("red", "white", "yellow")

#factor(logical operation)
LogFact <- factor(c(3,1,2,1,1), levels = 1:3, labels = c("small", "medium", "hight"))
LogFact # (з факторами працює лише 2 логічні оператори (==), (!=) )
as.integer(LogFact)
as.integer(LogFact) == 3
LogFact == "medium"

#logical functions 
all(ages == cutoff)
all(ages >= 30)

any(ages == cutoff)
any(ages >100)

colors %in% c("red", "black")
which(colors %in% c("red", "black"))
sum(common)
mean(indiv)#(17.09.2020)

#List-DataFrames(23.09.2020)

List1 <-list(c(15, 25, 54), c("cat", "dog", "squarell", "racoon"), c("red", "blue", "green", "white") )
List1
names(List1) <- c("numbers", "animals", "colors")
List1

List2 <-list(numbers = 1:5, animals = c("whale", "bear", "wolf", "fox"), colors =c("yellow", "gray", "pink", "violet"))
List2

ListAll <- list(List1, List2)
ListAll

list(st1 = List1, st2 = List2)

mtcars
head(mtcars)
as.list(mtcars)
as.list(head(mtcars))
data("mtcars")

#Subseting lists

List1 <-list(c(15, 25, 54), c("cat", "dog", "squarell", "racoon"), c("red", "blue", "green", "white") ) 
Subset1 <- List1 [1]
Subset1
Subset2 <- List2 ["animals"]
Subset2
class(List1)
class(Subset1)
class(Subset2)
class(numeric)
class(mygender)

#Mtcars
Subset3 <-head(mtcars, 3)
Subset3
Subset3 [[3]]
Subset3 ["wt"]

mtcars$carb[3:8]
class(mtcars$carb)

#Small detail
Detail <-c(5,10,15,NA,25)
class(Detail)
mean(Detail)
sum(Detail)
mean(Detail, na.rm = TRUE)
sum(Detail, na.rm = TRUE)#(23.09.2020)

#Functions(24.09.2020)
#Кожна функція складається з 3-ох частин: name, argument(s), body

name <- function(arguments){
  body
}
class(name)

#Назва функції повинна бути: short, clear, descriptive, verbs (action words), "snake case"

#example 2
cel_to_fahr <- function(c){
  c * (9/5) + 32
}
cel_to_fahr(35)
cel_to_fahr(c(0, 14, 23, 29))

#function's output 
#1 argument
```{r}
cel_to_fahr <- function(c){
  F <- c * (9/5) + 32
  return(paste("The entered Cel temperature is", F, "degrees Fahr"))
}
```
cel_to_fahr((21))

#No argument
cel_to_fahr <- function(){
  c <- readline(prompt ="Enter a value in Cel: ")
  F <- as.integer(c) * (9/5) + 32
  return(paste("The entered Cel temperature is", F, "degrees Fahr"))
}
cel_to_fahr()

#Some arguments
convert_temp <- function(temp, unit){
  if(unit=="C"){
    D <- temp * (9/5) + 32
  } else if (unit == "F"){
    D <- (temp -32) * (5/9)
  } else {
    D <- message("Please enter a correct unit -- either F or C")
    }
    return(D)
}
convert_temp(32, "C")
convert_temp(15, "F")
convert_temp(54, "temp")

convert_temp <- function(temp, unit = "C"){
  if(unit=="C"){
    D <- temp * (9/5) + 32
  } else if (unit == "F"){
    D <- (temp -32) * (5/9)
  } else {
    D <- message("Please enter a correct unit -- either F or C")
  }
  return(D)
}
convert_temp(33)
convert_temp(21, unit="C")
convert_temp(21, unit= "F")
convert_temp(132, "temperature")

#RMarkdown (28.09.2020) 
install.packages("rmarkdown")
library(rmarkdown)

#Перша візуалізація з mtcars
```{r echo= FALSE}
plot(mtcars$cyl)
```
Мабуть непогано для початку
setwd()
#chunk options
#include = FALSE - запобігає появів коду та результатів у готовому форматі.
#echo = FALSE - запобігає коду, але не появі результатам у готовому форматі.
#message = FALSE - запобігає появі повідомлень, що генеруються кодом у готовому файлі.
#warning = FALSE - запобігає появі попереджень, що генеруютсья кодом.
#fig.cap = "..." - додає підпис до графічних результатів.


