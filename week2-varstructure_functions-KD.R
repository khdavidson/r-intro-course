# Intro to Arrrggh - week 2
# 23-Apr-2020 13:00
# KD and TV



############## REVIEW 


##### Last week, we learned: 
# Open RStudio and know how it is different from R
# Be familiar with the RStudio layout and components: script, console, environment, plots/help panes
# Initialize a new project and new script 
# Understand what annotating is, and why it is important 
# Define variables to store values
# Use variables in equations
# Use math operations (e.g., mean, sum) 
# Install and load a package into RStudio
# Run through swirl() Lession 1  (at home)
#### 

# Recall how to define a variable: 
a <- 4532                 #  case sensitive. only 1 value.  


##### Recall main pillars of foundation: 
# 1: The 'underlying' structure of code and data in r                      THIS WAS LAST WEEK (APR 16) AND TODAY (APR 23)
# 2: Compilations/operations on data by FUNCTIONS (and ARGUMENTS)          THIS MAY BE TODAY (APR 23)
#####


                                                     #####################################
###################################################### 1. VARIABLE/CODE STRUCTURE cont'd ##########################################################
                                                     #####################################


# Last week we worked on assigning variables that were only 1 value. Some of them were formulae that used multiple values, but the end result was
# always a variable (e.g., 'a', 'formula1') that had a single value. 

# This week, we are going to learn about storing MULTIPLE values in one variable. These take two main forms: VECTORS and MATRICES.



#=========#
# VECTORS #
#=========#

#### First very confusing thing: VECTORS!
# A vector is a 1D string of values that can be all the same type of values (numerical, character, logical, etc.), 
# It's the most basic element of a table (or dataframe), essentially just one string of data. 
# Think of it like a single column of data that might eventually reside in a larger spreadsheet. 
# Recall: as we go, keep and eye on your ENVRIONMENT 
####

# To define a VECTOR, we use the same process that we did before ('<-')
# The difference here is that we begin with the command 'c()' 
# c() ('concatenate' or 'combine') means you are about to list multiple items separated by ','
v1 <- c(88, 89, 90, 91, 92)                                                         # These are all 'numerical' or 'integer' values
v2 <- c("joe exotic", "carole baskin", "doc antle", "tiger #1", "scarface")         # These are all 'character' values 
v3 <- c(585, 22.3, 963, 42, 7.9665)                                                 # These are all 'numerical' values
# Look up to Environment and see the variable type, number of values, and the values


# ??????????????????????????? 


# Now we have a list of multiple values. While our vectors here are short (only 3-5 values long), in real life, we could have vectors that have
# 10000000s of values. We might want to find a specific value based on its LOCATION within the vector. 
# START with 'v1'. It has 5 values we specified in a certain order, it is 1D, therefore we should only have to tell R one piece of information 
# to return a value. To ask R for a specific locatin inside of a string of data, we use '[]'. 
# [] indicates we are looking inside of something with multiple values and a basic structure. what we write within [] indicates WHERE we want R to look
v1[1]                                    # looking inside a numerical/integer vector
v2[3]                                    # still works with character vector too!  
v3[c(1,3)]                               # here we get values in spots 1 & 3
v1[c(2:4)]                               # here we get values in spots 2 to 4 INCLUSIVE (:)

# subseting or filtering 1D data still uses []
v2[v2 == "joe exotic"]                   # '==' is interpreted as 'includes exactly'. Will return exact matches
v2[v2 != "carole baskin"]                # '!=' is interpreted as 'does not include exactly'. Will remove exact matches 


# ??????????????????????????? 


#=======#
# LISTS #
#=======#

#### What is a LIST?!
# A list is very similar to a vector, it is a 1-D string of values. BUT, it can be multiple variable types. 
# Can look inside using same as with vector: []
####

l1 <- list(system = "Stellako River", year = 2019, count = 120000)                  # this list is a mix of character and numerical values
# Side note: DO NOT put commas in your numbers! (120000 vs. 120,000)


# ??????????????????????????? 


#### Reconciling VECTOR and LIST in your mind 
# Think of a VECTOR as looking DOWN a column in a spreadsheet: these will all be the same type of information (e.g., all dates, 
# all stream names), etc. 
# Think of a LIST as looking ACROSS a row in a spreadsheet: this could be a mix of values that are specific to a survey (e.g., the date, the stream
# name, count, comments, etc.)
####


# ??????????????????????????? 


#==========#
# MATRICES #
#==========#

####
# Next definition is a MATRIX. 
# A matrix is a 2D series of values - it's like a basic table, with fixed columns and rows, but is all the SAME data type (e.g., all numbers) 
# This is how it differs from a dataframe (which we will get to later). 
####

# To define a MATRIX, we use the matrix() function
m1 <- matrix(nrow=3, ncol=3, 11:19)                    # making a matrix of 9 values, in a 3x3 format
m2 <- matrix(nrow=2, ncol=2, c("pink", "chinook", "chum", "pink"))
# Look at matrix in console and note the location indicator numbers: [,1] / [1,]


# ??????????????????????????? 


# Again, we could have a massive matrix, and we might want to find a specific value witin in.
# Look at m1. Only 9 values, but unlike vectors, it is 2D. Therefore, R will need TWO pieces of information to return a value. 
# We still use the same premise as above, [], but this time with a ',' between the brackets.
# Within [,] the order of operations is always [row number, column number]
m1[1,3]                                                # looking for the value in the first row and third column within 'm1' 
m1[c(1,2), 2]                                          # looking for values in m1 in the first and second rows, but only 2nd column
m1[c(1:3), c(1,2)]                                     # looking for values in m1 in rows 1 to 3 (inclusive), but only the first 2 columns 
m1[c(1:3), -c(3)]                                      # we can do the same as above by asking R to remove '-c()' the 3rd column


# subsetting or filtering 2D data also uses [,]
m2[m2 == "pink"]                                       # '==' is interpreted as 'includes exactly'. Will return exact matches
m2[m2 != "chum"]                                       # '!=' is interpreted as 'does not include exactly'. Will remove exact matches 


# ??????????????????????????? 

#####
# (NOT MENTIONED IN CLASS) Extra note: ARRAY
# You might hear the term array. This is just a matrix that has >2 dimensions. 
# I didn't mention this in the class because it's advanced and you will almost never come across this in your use with R. 
#####




########################## PROPOSED end of day 1 - YOU DESERVE A BEER! (or 5 chocolate bars...)
#### maybe keep going but unlikely?



#=================================#
# REVIEW OF WHAT WE LEARNED TODAY #
#=================================#
##### Day 2 Summary...YOU CAN NOW: 
# Define vectors 
# Define lists  
# Define matrices (and vaguely know what an array is)
# Define dataframes
# Extract specific values inside vectors and matrices
####? Use a function and know to pass it arguments
####? Know how to use R to ask for help with passing arguments to functions
####? Know how to interpret R help documents
#### 



#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 1 SUMMARY #
#==========================#

##### This was a long section. Section 1 summary: 
# RStudio layout and components, and how it is different from R
# How to make a new project and script 
# How to annotate
# How to define a single variable: a <- 65
# How to define a vector: v1 <- c(1,2,3)
# How to define a list: l1 <- list(name="Stellako", year="2019", count=120000)
# How to define a matrix: m1 <- matrix(nrow=10, ncol=10, 1:100)
# How to look inside all of these data structures using [] or [,]

# The basic premise of using [], (), 'c()', commas, "", etc. will apply to essentially all dataframes and types across R regardless of whatever 
# data you use. These are some core 'base R' operations! 

# This is a nice, simple reference that summarizes the differences: https://www.programcreek.com/2014/01/vector-array-list-and-data-frame-in-r/
# This has more detail and shows a LOT of different ways to deal with the different data types: https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/
# Another good source for data structure details: https://qcbsrworkshops.github.io/Workshops/workshop01/workshop01-en/workshop01-en.html#45
# Google is full of great resources. Some great pages are stackoverflow, crossvalidated, stackexchange, DataCamp, Datanovia, anything by 
# SoftwareCarpentry. 
#####
#------------------------------------------------------------------------------------------------------------------------------------------------









##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################


# Recall the 2 major components or pillars of R we are centered around for the intro with these basics: 
# 1: The 'underlying' structure of code, data and variables in r                      THIS WAS WEEK 1 (APR 16) AND WEEK 2 (APR 23)
# 2: Compilations/operations on data by FUNCTIONS (and ARGUMENTS)                     THIS MAY BE NEXT WEEK (APR 30)







                                                     ######################################
###################################################### 2. FUNCTIONS, ARGUMENTS and R HELP #########################################################
                                                     ######################################


# We now start on PILLAR 2! Functions, Arguments and R Help files.

#### Next definition: FUNCTION
# Anything in R that is a word followed by () is a function. 
# This is something that, when fed ARGUMENTS, will perform some kind of further analysis, restructuring, some extra code in the background, 
# to return a specific product. 
#### What are ARGUMENTS? 
# Arguments are the pieces of information you give a function to make it work. They are the pieces of information written within the ().  
# Luckily for us, EVERY function in R comes with HELP documentation. These help files will tell us what arguments we need to pass to the function
# so that we don't have to memorize it! 
#### 


#===========#
# FUNCTIONS #
#===========#
# We have already used functions! Recall, anything in R that is a word followed by () is a function! 
c()                              # This is the vector function, but there are currently no arguments in the ()
matrix()                         # This is the matrix function, but there are currently no arguments in the ()
# It is hard to know how to fill in a function... what arguments do we need? This is different for every function and is a lot to remember...
## enter R help! 


# ??????????????????????????? 


#========#
# R HELP #
#========#
# To ask R for help with filling these functions with ARGUMENTS, type '?functionname'
?c                               # This is how to access the help file for the vector function  
?matrix                          # This is how to access the help file for the matrix function


# ??????????????????????????? 


#======================#
# R HELP and ARGUMENTS #
#======================#

# Let's get acquainted with the layout of the R help documentation, focusing to start on the matrix() function

# AT THE TOP we see the function we are asking about, followed by what {package} it came from 

# The DESCRIPTION and TITLE should tell you a fair bit about what is going on. 
# TITLE: Matrices. Ok that is very simple thank you R
# DESCRIPTION: There are a few descriptions here depending on what specific function we are using. We are using matrix(), which creates a matrix 
# from the given set of values. That's us! How do we give it those values though? 

# Usage shows the format for the syntax. 

#### WHAT IS SYNTAX
# SYNTAX is a fancy word for 'sentence structure' or 'code structure' 
# It means just that - how our code is structured. Is it separated by commas, like 'x,y', or like a formula, 'y~x' (which you might see later)?
####


# ??????????????????????????? 


# Sometimes at the end of a function's syntax example you will see '...'
# Ellipses ('...') means "and more". What is shown before "..." are some KEY ARGUMENTS

# ARGUMENTS is one of the most helpful places. It tells us all the arguments and their parameters that can be fed to matrix() to give a desired
# result. So we have 6+ arguments that can be fed to 'matrix()': data, nrow, ncol, etc. 
# You will see that some (e.g., 'data') are OPTIONAL, and some (e.g., 'byrow') have DEFAULT settings. For these, if you don't include them in your
# function, R will either ignore it (for optional arguments), or just use the default setting. It's good to know about these, especially default
# settings when you get further into some analyses. 

# Further down, DETAILS bascially explains in words what is happening in the different functions, and often will include any caveats or literature
# references that informed how the code was compiled. 

# NOTES explains some more details

# At the veeerrryyy bottom the EXAMPLES section can often be helpful (but not always lol)


# ??????????????????????????? 


#==========#
# PRACTICE # 
#==========#

#1. Make a 10x10 matrix filled with consecutive numerical values starting with 1
matrix(nrow=10, ncol=10, 1:100)

#2. Make a 2x3 (hint: [2,3]) matrix filled with the names of star wars characters: yoda, luke, darth vader, han, leia, chewy  
matrix(nrow=2, ncol=3, c('yoda', 'luke', 'darth vader', 'han', 'leia', 'chewy'))

#3. Make a 5x5 matrix filled with numerical values starting at 10 with the column names: site1, site2, site3, site4, site5
### hint: you can CTRL+F search the help files for useful terms... like "column name" or "dimnames" to see how that code is used :)
matrix(nrow=5, ncol=5, 1:25, dimnames = dimnames)                       # notice there is no difference whether you use '' or "" quotations


# ??????????????????????????? 



########################## end of Section 2!! 



#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 2 SUMMARY #
#==========================#

##### Section 2 summary: 
# What 'functions' are - their form and requirements 
# What 'arguments' are and their syntax (structure)
# How to as R for help filling-in arguments for functions
# How to interpret R help documentation to get what you need out of it! 

# You will likely use ?functionname a lot! 
#####
#------------------------------------------------------------------------------------------------------------------------------------------------





##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################


