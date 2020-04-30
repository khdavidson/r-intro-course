# Intro to Arrrggh - week 2
# 23-Apr-2020 13:00
# KD and TV



############## REVIEW of last week

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


##### Recall main sections or pillars of R foundations:  
# 1: The 'underlying' structure of code and data in r                                 THIS WAS LAST WEEK (APR 16) AND TODAY (APR 23)
# 2: Compilations/operations on data by FUNCTIONS (and ARGUMENTS) and R help          THIS IS NEXT WEEK (APR 30)
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


# Now we have a list of multiple values. While our vectors here are short (only 3-5 values long), in real life, we could have vectors that have
# 10000000s of values. We might want to find a specific value based on its LOCATION within the vector. 
# START with 'v1'. It has 5 values we specified in a certain order, it is 1D, therefore we should only have to tell R one piece of information 
# to return a value. To ask R for a specific locatin inside of a string of data, we use '[]'. 
# [] indicates we are looking inside of something with multiple values and a basic structure. what we write within [] indicates WHERE we want R to look
v1[1]                                    # looking inside a numerical/integer vector
v2[3]                                    # still works with character vector too
v3[c(1,3)]                               # here we get values in spots 1 & 3
v1[c(2:4)]                               # here we get values in spots 2 to 4 INCLUSIVE (:)

# subseting or filtering 1D data still uses []
v2[v2 == "joe exotic"]                   # '==' is interpreted as 'includes exactly'. Will return exact matches
v2[v2 != "carole baskin"]                # '!=' is interpreted as 'does not include exactly'. Will remove exact matches 



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


# Again, we could have a massive matrix, and we might want to find a specific value witin in.
# Look at m1. Only 9 values, but unlike vectors, it is 2D. Therefore, R will need TWO pieces of information to return a value. 
# We still use the same premise as above, [], but this time with a ',' between the brackets.
# Within [,] the order of operations is always [row number, column number]
m1[1,3]                                                # looking for the value in the first row and third column within 'm1' 
m1[c(1,2), 2]                                          # looking for values in m1 in the first and second rows, but only 2nd column
m1[c(1:3), c(1,2)]                                     # looking for values in m1 in rows 1 to 3 (inclusive), but only the first 2 columns 
m1[c(1:3), -3]                                         # we can do the same as above by asking R to remove '-' the 3rd column. In this case, we don't need 'c()' unless we wanted to remove multiple columns (e.g., '-c(2,3)')


# subsetting or filtering 2D data also uses []
m2[m2 == "pink"]                                       # '==' is interpreted as 'includes exactly'. Will return exact matches
m2[m2 != "chum"]                                       # '!=' is interpreted as 'does not include exactly'. Will remove exact matches 



#============================#
# ADDITIONAL DATA STRUCTURES #
#============================#

##### Additional DATA STRUCTURES you may come across:
# ARRAY: This is just a matrix that is 3D (so it is still all the same type of data). You will rarely see this.
# DATAFRAME: This is a 2D data structure that is a mix of data types. *This is what we will use for the majority of the time*
# LIST: R can make lists out of any data structure. It's a way of combining or stringing together a bunch of different data. 
# a list can be any data types together (recall powerpoint figures).
# when considering a list of single values, it could be thought of as looking across a row in an Excel sheet.
#####





########################## End of week 2 - YOU DESERVE A BEER! (or 5 chocolate bars...)



#=================================#
# REVIEW OF WHAT WE LEARNED TODAY #
#=================================#
##### Day 2 Summary...You should now be able to: 
# Define vectors 
# Define matrices 
# Know the difference variable types: numerical, integer, character, etc. 
# Recognize that our focus will mostly be on dataframes
# Know that arrays and lists also exist
# Extract specific values inside vectors and matrices
#### 



#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 1 SUMMARY #    (remember those two PILLARS i was talking about...)
#==========================#

##### This was a long section. Section 1 summary: 
# RStudio layout and components, and how it is different from R
# How to make a new project and script 
# How to annotate
# How to define a single variable: a <- 65
# How to define a vector: v1 <- c(1,2,3)
# How to define a matrix: m1 <- matrix(nrow=10, ncol=10, 1:100)
# How to look inside (or 'index') all of these data structures using [] or [,]
# Know the different variable types: numerical, character, integer, etc. 
# Understand our focus will be on dataframes from now on, and know that lists and arrays also exist

# The basic premise of using [], (), 'c()', commas, "", etc. will apply to essentially all dataframes and types across R regardless of whatever 
# data you use. These are some core 'base R' operations! 

# This is a nice, simple reference that summarizes the differences: https://www.programcreek.com/2014/01/vector-array-list-and-data-frame-in-r/
# This has more detail and shows a LOT of different ways to deal with the different data types: https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/
# Another good source for data structure details: https://qcbsrworkshops.github.io/Workshops/workshop01/workshop01-en/workshop01-en.html#45
# Google is full of great resources. Some reliable pages are stackoverflow, crossvalidated, stackexchange, DataCamp, Datanovia, anything by 
# SoftwareCarpentry... 
#####
#------------------------------------------------------------------------------------------------------------------------------------------------








