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

x > 5 | x %in% c(1, 2, 3)

vec1 = c(1,2,3)
vec2 = c(3,2,1)
vec1 == vec2

world_oceans[ world_oceans$avg_depth_m > 4000 & world_oceans$area_km2 > 100e6, ]
#stringing multiple conditionals together when subsetting data

#what about NAs?
vec2 = c(1, 2, NA, 4)
2 %in% vec2
NA %in% vec2
x = NA
y = NA
y == x
# sometimes NAs dont work well logically
    #instead of saying TRUE for y == x, it gives you NA
#is.na is specifically used to evaluate NAs
is.na(vec2)
sum( is.na(vec2))
#assumes false is a 0 and true is a 1
    #with this you can ask how many NAs are in your data
#do exercise 2.2 at home


#Lec 3 - conditional statements
#if this is true, do all of this
#test if else statements

num = -2
if(num<0){
    num=num * -1
    print("I made num positive")
}
num

#exercise3.1
temp = 105

 if(temp>99){
  print("you have a fever")
  diff = temp - 98.6
  print(diff)
  if(temp>101){
    print("WARNING - FEVER REAL")
  }}

#else statements
    #if this is true, do this. if it ISNT true, then just do this
a = 50
b = 75

if(a>b){
    print("a wins!")
} else{
    print("b wins!")
}

#more than two cases
a = 1
b = 1
if (a>b){
  print("a wins!")
} else if(a<b) {
  print("b wins!")
} else {
  print("tie.....")
}

#condensing if/else into a single line of code
    #use ifelse

