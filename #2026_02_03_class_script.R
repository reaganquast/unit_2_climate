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
  my_vector_squared[i] = my_vector[i]^2

}
my_vector_squared
