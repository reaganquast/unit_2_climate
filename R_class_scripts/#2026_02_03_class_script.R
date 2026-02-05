#2026_02_03
#Class R Script - Mauna Loa CO2
url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
# this takes the data directly from the internet!

co2 = read.table(file = url, col.names = c("year", 
                                          "month",
                                          "decimal_date", 
                                          "monthly_average", 
                                          "deseasonalized", 
                                          "n_days", 
                                          "st_dev_days", 
                                          "monthly_mean_uncertainty"))
class(co2)
head(co2)
summary(co2)
range(co2$decimal_date)

plot(monthly_average ~ decimal_date, data=co2, type = "l") #the ~ means "function of"
lines(deseasonalized ~ decimal_date, data=co2, col="red") #adds a line to a plot window that's already open

co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized#because it doesnt exist, r will create this column for us
head(co2)

plot(seasonal_cycle ~ decimal_date, data = co2, type = "l") #l means line

#subsetting data to see more of a clear picture
#grab most recent five years
co2_2020to2025 = co2[co2$decimal_date>2020, ]
summary(co2_2020to2025)

plot(seasonal_cycle ~ decimal_date, data = co2_2020to2025, type="l")

jan_anomalizes = co2$seasonal_cycle[co2$month == 1]
summary(jan_anomalizes)
head(jan_anomalizes)
jan_anomalizes
mean(jan_anomalizes) #average detrended amount of co2 in january

#lets do that for every month... except we don't want everything floating around
#lets make a data frame with 12 rows
#create a data frame w monthly detrended co2 anomalies
co2_monthly_cycle = data.frame(month = seq(12), detrended_monthly_cycle = NA)#initializing a data frame
co2_monthly_cycle

#filling in the data
co2_monthly_cycle$detrended_monthly_cycle[1] = mean(co2$seasonal_cycle[co2$month == 1])
co2_monthly_cycle$detrended_monthly_cycle[2] = mean(co2$seasonal_cycle[co2$month == 2])
co2_monthly_cycle$detrended_monthly_cycle[3] = mean(co2$seasonal_cycle[co2$month == 3])
co2_monthly_cycle$detrended_monthly_cycle[4] = mean(co2$seasonal_cycle[co2$month == 4])
co2_monthly_cycle$detrended_monthly_cycle[5] = mean(co2$seasonal_cycle[co2$month == 5])
co2_monthly_cycle$detrended_monthly_cycle[6] = mean(co2$seasonal_cycle[co2$month == 6])
co2_monthly_cycle$detrended_monthly_cycle[7] = mean(co2$seasonal_cycle[co2$month == 7])
co2_monthly_cycle$detrended_monthly_cycle[8] = mean(co2$seasonal_cycle[co2$month == 8])
co2_monthly_cycle$detrended_monthly_cycle[9] = mean(co2$seasonal_cycle[co2$month == 9])
co2_monthly_cycle$detrended_monthly_cycle[10] = mean(co2$seasonal_cycle[co2$month == 10])
co2_monthly_cycle$detrended_monthly_cycle[11] = mean(co2$seasonal_cycle[co2$month == 11])
co2_monthly_cycle$detrended_monthly_cycle[12] = mean(co2$seasonal_cycle[co2$month == 12])
#that was painful... 
plot(detrended_monthly_cycle ~ month, data = co2_monthly_cycle, type="l", col="turquoise")
 #what if you have a shit ton of data...
    #if you need to change it more than 3 times, as a rule of thumb, repeat it!

#loops tutorial
#do this FOR every value of that in a for loop

#using print statements allows you to talk to yourself within chunks of code
#i is the classic name of the variable you use to step through the loop
for (i in c(1:4)){
    print(i)

} #i is an itterand, the thing you are itterating over and over

#i is whatever it ended up with when you exit out of the loop
sentence = c("loops", "are", "fun", "maybe")
for(word in sentence){
    print(word)
}
#use print if there are multiples and you want to see each
my_vector = c(1, 3, 5, 4, 2)
#if i want to square everything, you can make a loop and save it
#initializing a storage location...
    my_vector_squared = rep(NA, 5)
        #now you have a place to store each value
n_my_vector = length(my_vector)
my_vector_squared = rep(NA, length(my_vector)) #more efficient

for (i in seq(n_my_vector)){
  print( paste ("im on iteration; ", i))
  my_vector_squared[i] = my_vector[i]^2
  print(paste("my answer is; ", my_vector_squared[i]))
} #this holds your hand and tells you which vector you're on

#calculate total of a vector
my_vector = c(1, 3, 5, 2, 4)
n_my_vector = length(my_vector)
my_vector_total = 0
for(i in seq(n_my_vector)){
    print(my_vector_total)
    my_vector_total = my_vector_total + my_vector[i]
}
#make sure you rerun the initialization that sets the number as 0
#put the initialization right above the loop, and it should be an INSTINCT, to highlight it with the for loop code

#exercise 5.1
my_integer = 7
my_integer_factorial = 1
for(i in seq(my_integer)){
    print(my_integer_factorial)
    my_integer_factorial = my_integer_factorial* my_integer[i]
}
7*6*5*4*3*2*1

#that attempt sucks... heres a class coding
num = 7
factorial_result = 1
for(i in seq(num)){
    factorial_result = i * factorial_result
    print(factorial_result)
}

#nesting for loops

mat = matrix(c(2,0,8,3,5,-4), nrow=2, ncol=3)
mat

mat_squared = matrix(rep(NA, 6), nrow=2, ncol=3)

dim(mat) #use this in sequence - even if your data changes size, the loop still works

for(i in seq(dim(mat)[1])){
  for(j in seq(dim(mat)[2])){
    print(paste("im on row: ", i, " and column: ", j))
    mat_squared [i,j] = mat[i,j]^2
  }
}
#name the itterand in the second loop something else! otherwise it gets confused
#the first for loop, using [1] is discussing rows (first dimension)
#second nested loop uses [2] because it is the second dimension (columns)

mat_squared
#look at the print(paste). the computer goes through the first value of i, 
#and then go through all the columns under that first row
#Then, once there are no more "j"'s, it goes back to i to see if there are
#any more options for that 

#WHILE LOOPS (used a lot for programmers, but not really for data scientists)
  #use when you don't know how many time's youll repeat the task

#while (some condition is true){
#do this code
#}
#if the condition turns false, it will exit the code

x = 1
while (x>0){
  x = x+1
}
#this is an infinite loop. use ctrl + c to escape!!! or press the red button

x = 5
while(x > 0){
  x = x - 1
}

#fish catching game
total_catch_lb = 0
n_fish = 0
while(total_catch_lb < 50){ 
  new_fish_weight = rnorm(n = 1, mean = 2, sd = 1)#r stands for random, norm stands for normal distribution
  total_catch_lb = total_catch_lb + new_fish_weight
  n_fish = n_fish + 1
  print(paste("n fish = ", n_fish, "and new fish weight = ", new_fish_weight))
}
