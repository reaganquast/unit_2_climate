# for exercises that we did NOT get to in class

#Exercise 1.1:
  #Create the same time series figure with 95% confidence intervals for the Greenland ice sheet mass loss.


#Exercise 1.2:
  #Calculate the average annual ice loss (a.k.a. the annual rate of ice loss) for each ice sheet by dividing 
  #the change in ice lost from the beginning to the end of the time series by the total time that passed.
  #Then display the ice loss rates in a bar graph. Save the bar graph into the `figures/` directory in this repo.


#Exercise 2.1:
  #Create a vector with the names of the oceans you have personally visited. 
  #Use the `%in%` operator to subset the oceans you have visited from the world_oceans data frame. 
  #Now use subsetting to find out whether you have ever personally visited any oceans that have a 
  #smaller area than the Atlantic ocean.


#Exercise 2.2:
  #Here are a few random variables. Try converting these sentences into tests written with R code. 

w = 15
x = c(-1, 0, 1)
y = "February"
z = c("Monday", "Tuesday", "January")

# Is w greater than 10 and less than 20?
# Are any of the values in x positive?
# Are all of the values in x positive?
# Is object y the word "February"?
# How many values in z are days of the week?


#Exercise 3.1:
  #Let's say you took someone's temperature and you want to first evaluate whether or not they have a fever. 
  #If they DO have a fever, claculate how different their temperature is from the median human temperature 
  #of 98.6 and print out the answer. Also, if they DO have a fever, evaluate whether the fever is high > 101 
  #and if it is, print out a warning message. This will be most efficiently coded with a set of nested `if()` 
  #statements. Test your code with a temperature that is not a fever (`temp = 98.4`), that is a low fever (`temp = 99.5`) 
  #and that is a high fever (`temp = 102.1`).


#Exercise 3.2:
  #Let's say you have the number of donuts your Dad bought on Sunday stored in variable `n_donuts`. 
  #Write an if/else chain to print out a statement that states whether Dad bought less than a dozen,
  #a dozen (12), a baker's dozen (13) or more than a baker's dozen. 


#Exercise 3.3:
  #Perhaps in a dataset that you are using, the number `-999` is used to indicate a missing value 
  #(this is super common). To take advantage of R's intuitive handling of missing values 
  #(in math equations, plotting, etc.) you should replace those elements with `NA`. Use the ifelse() 
  #statement to replace all of the `-999` values in the `data` vector with `NA`. Then use an if/else 
  #chain to print out a statement about whether there are any `NA`s in the `data` variable. 
  #It may help to use functions we covered earlier like `any()` and `is.na()`.


#Exercise 4.1:
  #As a result of climate change, there have been many phenological changes in the physical and 
  #biological environment. That means that there is a shift in the timing of seasonal phenomena 
  #and activities. One of the most obvious examples of this is that as many parts of the world warm, 
  #the spring growing season for plants is starting a bit earlier each spring. Plot the seasonal cycle 
  #of co2 for 1959 (the first full year of data) and 2019 (the last full year of data) on the same figure. 
  #What do you notice? Is this a robust analysis to determine if there has been a phenological shift in 
  #global carbon uptake / respiration?


#Exercise 5.1:
  #Use a for() loop to calculate the factorial (symbol !) of any integer number greater than 0. 
  #(For example: 3! = 3x2x1 = 6) Test it with `num = 3` and `num = 6`.


#Exercise 5.2:
  #Use a while loop to build a simple number matching game. Pick a number between 1 and 10 outside 
  #of the loop. Then, inside the loop, step through 1 to 10 and test if that iteration of the loop 
  #has guessed the correct number. At the end, print out the number of guesses it took for your loop 
  #to guess the right number. You could make this game fancier by stepping through random numbers 
 #inside the loop to guess the right number using `guess=round(runif(n=1, min=1, max=10))`


#Exercise 6.1: 
  #Use a for loop to calculate the 10-year rolling average, where the rolling average for a given year
  #(say 1988) is calculated from the mean of that year the 9 years prior (so mean extent from 1979 to 1988). 
  #Plot your 10-year average in red in the same figure that you plotted the annual average to see how much 
  #smoother it makes your time series. 


#Exercise 6.2:
  #Use a for loop to calculate the total ice loss in each full decade of the data, starting 
  #with 1980-1989. Plot the ice loss per decade in a bar plot.


#Exercise 7.1:
  #Create a function that reads in someone's grade percentage points and returns their letter grade 
  #(A: 90-100, B: 80-90, etc.). You can imagine how you could make this function fancier by including 
  #grading scheme info in the parameters to ask if the function user wanted to also know if the student 
  #earned a B+, B or B-.


#Exercise 8.1:
  #Calculate the 10-year and 20-year rolling averages of the temperature anomaly data using our new 
  #user defined function `calc_rolling_average`. Plot the 5, 10 and 20 year rolling averages onto the 
  #same figure. How would you change the design of the function if you wanted it to calculate the moving 
  #average where the reference year was at the midpoint of the moving window, rather than the endpoint
  #of the moving window?
