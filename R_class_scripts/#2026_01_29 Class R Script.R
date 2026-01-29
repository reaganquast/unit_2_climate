#2026_01_29 Class R Script
#saving a plot
    #after you run all of your code that makes figures, use the command dev.off()
    #this will save it to a pdf

#ok actual boolean logic now 
  #boolean logic is TRUE (T) and FALSE (F) - must be caps

vec = c(1,0,2,1)
vec[ c(T,F,T,F)]
# this seems stupid, but you can use it to subset based on data based on certain qualifications
3 ==3
x = 3
y = 3
x == y
#this is asking a question !
x < 3
#if you are asking if something is equal to each other, MUST use two equal signs
#to ask if something is in a group, use the following
x %in% vec
  #this specifically says "is the number of x in the vector vec"

c(1,2,3,4) %in% c(3,2,1)

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                           area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                           avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
#give us all oceans w/ average depth greater than 4000 meters
world_oceans[world_oceans$avg_depth_m > 4000, ] #you must use a comma and space after you call it
world_oceans$ocean[world_oceans$avg_depth_m > 4000] #this one only asks for you to give the ocean, rather than all the info (specify column)
#do exercise 2.1 at home

1 + 2 == 3
0.1 + 0.2 == 0.3 #it's true, so why does the computer say it isnt? -- stupid computer, that's why
    #when you use equals equals sign, just remember that you're using a computer that thinks like a computer, not like a human

#boolean operators
#when you use boolean operators, you need to repeat your question, kind of. example below
    x > 2 & x < 9
    x > 2 & < 9 #this doesn't work! computer gets confused
