#2026_02_05 Class Script
# NOAA SEA ICE COVERAGE :3
url = "https://noaadata.apps.nsidc.org/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v4.0.csv"

arctic_ice = read.csv(url, skip = 2, header = FALSE, 
        col.name = c("year", "month", "day", "extent", "missing", "source_data"))

head(arctic_ice)
tail(arctic_ice)
summary(arctic_ice)

#plotting, using lubridate package (because the dates are in three columns)
install.packages("lubridate") #only do this once ever!!!
#every time you want to use lubridate, you need to call in with library
library(lubridate) #do this every R session. and you should put this at the beginning of every real script you do 
      #if you arent super confident with the package, leave a comment that tells you what function you're using
      #basically say WHY you bothered ot load this library. #make_date()
arctic_ice$date = make_date(year = arctic_ice$year, month = arctic_ice$month, day = arctic_ice$day)
head(arctic_ice)
class(arctic_ice$date)

plot(extent ~ date, data = arctic_ice, type = "l", 
    main = "NOAA Arctic Sea Ice Extent", 
    ylab = "Sea ice extent (*10^6 km ^2)")

#lets make it look better so we see annual change, not seasonal change
    #TREND LINES! with... for loops...

#calculate the annual average arctic sea ice extent

arctic_ice_averages = data.frame(year = seq(from = min(arctic_ice$year) + 1, to = max(arctic_ice$year) - 1),
                                extent_annual_avg = NA,
                                extent_5yr_avg = NA) #setting up the place to store our info
arctic_ice_averages

#practice outside of the for loop (because they are scary)
                #FOR LOOPS ARE NOT SCARY YOU ARE AWESOME AND GREAT AT CODING
arctic_ice_averages$extent_annual_avg[1] = mean(arctic_ice$extent[arctic_ice$year == 1979])
head(arctic_ice_averages)

for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$extent[arctic_ice$year == arctic_ice_averages$year[i]]) #year, corresponding to the year from the i-th orw
print(paste("i =", i, "year = ", arctic_ice_averages$year[i]))
}
head(arctic_ice_averages)
#may be helpful to figure out how to do the loop info for the first row, then add it to a for loop
plot(extent_annual_avg ~ year, data = arctic_ice_averages, type = "l")

# five year average :) :D :3 :*
#you go girl!!! best coder ever!

tail(arctic_ice_averages)
# you want the for loop to go through 1981 to 2023.
          # you cant calculate a five year average with only 2 years.
# you need to figure this out BEFORE the for loop

for(i in seq(3, dim(arctic_ice_averages)[1] - 2)){ #i doesnt HAVE to be one. it will be whatever you want. here, we start at 3.
  years = seq(from = arctic_ice_averages$year[i]-2, to = arctic_ice_averages$year[i]+2) 
  arctic_ice_averages$extent_5yr_avg[i] = mean(arctic_ice$extent[arctic_ice$year %in% years])
  print(years)
}

plot(extent_5yr_avg ~ year, data = arctic_ice_averages, type = "l", col = "black")
lines(extent_annual_avg ~ year, data = arctic_ice_averages, type = "l", col = "tomato")
 #lets combine this graph with the one with dates...

arctic_ice_averages$date = make_date(year = arctic_ice_averages$year, month = 6, day = 30)
head(arctic_ice_averages)
class(arctic_ice_averages$date)

plot(extent ~ date, data = arctic_ice, type = "l")
+ lines(extent_annual_avg ~ date, data = arctic_ice_averages, type = "l", col = "slateblue")
+ lines(extent_5yr_avg ~ date, data = arctic_ice_averages, type = "l", col = "hotpink3")

