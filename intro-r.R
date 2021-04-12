# Basic operators

2+2 #addition

2*2 #multiplication

20/2 #division

2^3 #exponents


# Objects ----

weight_kg <- 55
(weight_kg <- 55)
weight_lb <- 2.2 * weight_kg
weight_kg <- 50
weight_kg

# Challenge 1 ----

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

# Functions ----

a <- 64
b <- sqrt(a)
b
round(3.14)
args(round)

# Getting Help ----

?round
??kruskal
sessionInfo()

# Data Types/Classes ----

12.6 # numeric
3
100
"Pizza" # character
TRUE # logical
FALSE
T
F

# Data Structures: Vector ----

weight_g <- c(21, 34, 39, 54, 55)
weight_g

length(weight_g)
class(weight_g)
str(weight_g)

# Characters
animals <- c("mouse", "rat", "dog", "bear")
length(animals)
class(animals)
str(animals)

# Logical

has_tail <- c(TRUE, TRUE, TRUE, FALSE)
class(has_tail)

# Coercion ----

# What will happen in each of these examples? (hint: use `class()` to check the data type of your objects):

num_char <- c(1, 2, 3, 'a')
num_char[4]
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c('a', 'b', 'c', TRUE)
tricky <- c(1, 2, 3, '4')


# Subsetting Vectors ---- 

animals[2]
animals[c(3,2)]
animals[2:4]
animals[-2]
animals[6]

animals

animals == "dog"
animals == "otter"

has_tail
animals
animals[has_tail]
animals[animals == "bear" | animals == "rat"]
weight_g[weight_g > 50]
weight_g[weight_g < 30 & weight_g > 50]


# Missing Data ----

heights <- c(2, 3, 4, NA, 6)
max(heights, na.rm = TRUE)
sum(heights, na.rm = TRUE)
?max

heights_withoutNA <- heights[!is.na(heights)]
na.omit(heights)
heights[complete.cases(heights)]


# Matrix

y <- matrix(1:20, nrow = 5, ncol = 4)

class(y)
y
y[,4]
y[3, ]
y[2:4, 1:3]

# List 

myl <- list(id = "ID_1",
            a_vector = animals,
            a_matrix = y,
            age = 5.3)

class(myl)
str(myl)
myl

myl[[2]]
myl[["id"]]
myl$a_vector[2]

# Data Frames ----

my_df <- data.frame(
  ID = c(1:4),
  Color = c("red", "white", "red", NA),
  Passed = c(TRUE, TRUE, TRUE, FALSE),
  Weight = c(99, 54, 85, 70),
  Height = c(1.78, 1.67, 1.872, 1.59)
)

class(my_df)
str(my_df)


# Challenge 2 ----
#What is wrong with this data frame?


# animal_data <- data.frame(
#   animal=c("dog", "cat", "sea cucumber", "sea urchin),
#   feel=c("furry", "squishy", "spiny"),
#   weight=c(45, 8 1.1, 0.8)
# )




# Installing R Packages

install.packages("lubridate")
library(lubridate)


# Part 2: Working with Tabular Data ----

download.file("http://bit.ly/MS_trafficstops_bw", "data/MS_trafficstops_bw.csv")
stops <- read.csv("data/MS_trafficstops_bw.csv")

# size + dimension
dim(stops)
nrow(stops)
ncol(stops)
length(stops)
object.size(stops)

# content
head(stops)
tail(stops)

# names
names(stops)
rownames(stops)

# summary
str(stops)
summary(stops)

# Challenge 3 ----

# Based on the output of str(stops) can you answer the following questions?
#   
#   What is the class of the object stops?
#   How many rows and how many columns are in this object?
#   How many counties have been recorded in this dataset?



# Indexing and subsetting data frames ---- 

stops[1, 1]   # first element in the first column of the data frame (as a vector)
stops[1, 6]   # first element in the 6th column (as a vector)
stops[, 1]    # first column in the data frame (as a vector)
stops[1]      # first column in the data frame (as a data.frame)
stops[1:3, 7] # first three elements in the 7th column (as a vector)
stops[3, ]    # the 3rd row (as a data.frame)
stops[1:6, ]  # the 1st to 6th rows, equivalent to head(stops)
stops[, -1]           # the whole data frame, excluding the first column
stops[-c(7:211211),]  # equivalent to head(stops)




stops["violation_raw"]       # Result is a data.frame
stops[, "violation_raw"]     # Result is a vector
stops[["violation_raw"]]     # Result is a vector
stops$violation_raw          # Result is a vector



# Challenge 4 ----

# Create a data.frame (stops_200) containing only the observations from row 200 of the stops dataset.
# 
# Notice how nrow() gave you the number of rows in a data.frame?
#   
# Use that number to pull out just that last row in the data frame.
# Compare that with what you see as the last row using tail() to make sure it’s meeting expectations.
# Pull out that last row using nrow() instead of the row number.
# Create a new data frame object (stops_last) from that last row.
# Use nrow() to extract the row that is in the middle of the data frame. Store the content of this row in an object named trafficstops_middle.





# Conditional Subsetting ----


# the condition:
# returns a logical vector of the length of the column
stops$county_name == "Webster County" 

# use this vector to extract rows and all columns
# note the comma: we want *all* columns
stops[stops$county_name == "Webster County", ] 

# assign extract to a new data frame
webster_stops <- stops[stops$county_name == "Webster County", ]

# and if we wanted to see the breakdown by race:
table(webster_stops$driver_race)



# Challenge 5 ----
# Use subsetting to extract trafficstops in Hancock, Harrison, and Jackson Counties into a separate data frame coastal_counties.
# Using coastal_counties, count the number of Black and White drivers in the three counties.
# 


# Adding and removing rows and columns

new_col <- row.names(stops)
stops_withnewcol <- cbind(stops, new_col)
head(trafficstops_withnewcol)


# using the $ sign

stops$row_numbers <- c(1:nrow(stops))
stops$all_false <- FALSE  # what do you think will happen here?


# adding row with rbind

new_row <- data.frame(id="MS-2017-12345", state="MS", stop_date="2017-08-24",
                      county_name="Tallahatchie County", county_fips=12345,                      police_department="MSHP", driver_gender="F", driver_birthdate="1999-06-14",
                      driver_race="Hispanic", violation_raw="Speeding", officer_id="ABCD")

stops_withnewrow <- rbind(stops, new_row)
tail(stops_withnewrow)



# Factors ----

party <- factor(c("republican", "democrat", "democrat", "republican"))

levels(party)
nlevels(party)


party # current order

party <- factor(party, levels = c("republican", "democrat"))
party # after re-ordering


as.character(party)
as.factor(party)

f <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(f)               # wrong! and there is no warning...
as.numeric(as.character(f)) # works...
as.numeric(levels(f))[f]    # The recommended way.

# Dates ----

str(stops)


library(lubridate)

stop_date <- ymd(stops$stop_date)
str(stop_date) # notice the 'date' class

plot(factor(year(stop_date)))




# Quick Introduction to the Tidyverse ----


library(dplyr)
#library(tidyverse)

webster_stops <- stops[stops$county_name == "Webster County", ]

# the dplyr way to do the same thing

stops %>% 
  filter(county_name == "Webster County")

webster_stops_dplyr <- stops %>% 
  filter(county_name == "Webster County")


webster_stops <- stops[stops$county_name == "Webster County", c("county_name", 
                                                                "driver_birthdate",
                                                                "driver_gender",
                                                                "driver_race")]


webster_stops_dplyr <- stops %>% 
  filter(county_name == "Webster County") %>% 
  select(county_name, starts_with("driver"))



# Challenge 6 ----

# load the dplyr library
# create a new data frame using dplyr containing only "Simpson County" 
# and the variables 'stop_date', 'county_fips', and 'violation_raw'
# how many observations did you get?
#
# what happens when you flip the order of filter() and select()?






