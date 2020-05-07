# R intro
# Week 4: STARTING A SCRIPT and DATA EXPLORATION 1
# May 7, 2020
# KD and TV




#                                                     ########################
####################################################### 3. STARTING A SCRIPT #####################################################################
#                                                     ########################


# There are a few things you will have to do at the start of almost every script for each analysis. They are: 
# 1. Setting your working directory
# 2. Loading packages
# 3. Reading in your data file (Excel or .csv)
# The order you do these things in doesn't matter 


#======================#
# 1. WORKING DIRECTORY #
#======================#

# The WORKING DIRECTORY is where you store your data. 
# By setting a working directory, you are telling R where to find the file(s) you want to use. 
# It is a lot easier to have one central folder for all working analysis data files, in the event you want to use multiple excel files in one script. 
# If the scripts are stored in different places on your computer, you have to change your working directory each time which is a huge pain. 

# The easiest way to set your working directory is:
# Click Session > Set Working Directory > Choose Directory... > navigate to the folder with all of your data and select it. 
# You should now see it below in the console. 

setwd("~/ANALYSIS/Data")

# everytime you close and re-start R, you will have to set your working directory. 
# To save time, I copy the working directory script below from the console, and make it the first line of my script. Quick to re-run every time. 




#=====================#
# 2. LOADING PACKAGES #
#=====================#

# You will also have to re-load any packages you are using in the script each new session.
# Recall: a package is an extra tool or suite of tools someone else has written to work in R, often to do a specialized type of analysis. 

# Packages for reading Excel files: 
# install.packages("xlsx")                                 # This can be written in your console, doesn't need to be saved. Once you install a package, it's on your computer forever
# install.packages("openxlsx")       
library(xlsx)                                            # This is what you want written at the top of your script! 
library(openxlsx)




#============================#
# 3. LOAD/READ-IN DATA FILES #
#============================#
# Now we can read in our data. This is the Excel or csv file of data that we want to perform some analysis on. 

#########
# 3.1. CSV DATA
#########
# csv (or 'comma separated values') is the most common data format because it works across all platforms file. 
# It is also only 1 tab when opened in Excel - cannot have multiple tabs.
# To start by reading in a csv file
data.csv <- read.csv("r-intro-week1_calibration.csv")


#########
# 3.2. EXCEL DATA
#########

# Often we have multi-tabbed Excel files and creating many .csv files is tedious and hard to keep track of. 
# Instead, we can use the packages we installed above. 

# To read an excel file
data.xl <- read.xlsx("r-intro-week1_calibration.xlsx", sheet = 2)                                 # sheet = sheet number 
data.xl <- read.xlsx("r-intro-week1_calibration.xlsx", sheet = "Calibration_v3")                  # OR sheet = sheet name 

# Note your file type. You might have a macro Excel file which is .xlsm, or an old excel file .xls




#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 3 SUMMARY #
#==========================#

##### Section 3 summary: 
# Setting a working directory
# Installing/loading packages
# Reading in csv data files
# Reading in Excel data files
#####
#------------------------------------------------------------------------------------------------------------------------------------------------




##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################



#                                                       ###########################
######################################################### 4. DATA EXPLORATION (1) ##################################################################
#                                                       ###########################


# This next section is all about looking at the data, cleaning it, and becoming familiar with how R has imported it PRIOR to doing any analysis
# or extra manipulation/calculations. 

# It's really important to look at the data first and clean it up as this will save a lot of time and headaches. Often messy data is the main 
# issue behind a lot of issues in R. 


#=================#
# LOOKING AT DATA #
#=================#
# Now we have our data read in, recall this is a data frame. 
# Recall: dataframe is a two-dimensional data structure with a mix of variable types (numeric, factor, character, etc.)

##### MULTIPLE VARIABLES/WHOLE DATAFRAME AT ONCE
# 1. Look at data using head()
head(data)                                                # gives first 6 rows of data just for quick look
# 2. Look at column (or variable) names using names()
names(data)                                               # gives names of all columns (in order) 
# 3. Look at data using drop-down blue arrow
## This shows each column, its format, and an example of some of the first values
# 4. Look at data using Viewer. Can do this two ways: click the dataframe name in Environment OR use View()
View(data)                                                # shows the whole dataframe in an excel-type 'big screen' view. Note it is CAPITAL V! 
#####

# What are we looking for? Key thing is the VARIABLE TYPES and FORMATTING
  ## FACTOR: variables which take on a limited number of different values (aka categorical variables) - e.g., sex (M/F/J), group #, etc.
  ## INTEGER: whole numbers - e.g., years
  ## NUMERICAL: numbers often with decimens (aka continuous variables) - e.g., weights (5.2, 7.9, etc.)
  ## CHARACTER: a string or series of characters - similar to factor but infinite - e.g., a 'comments' or 'notes' column
  ## (not here) DATE: a date, important for any work analyzing or plotting time-series data - must include day, month and year to be recognized. Format usually doesn't matter (though this is the trickiest type of variable)
  
# R senses variable types and assigns them based on its best guess, but sometimes isn't always correct. 
  # In data.csv, most variables are Factors. In data.xlsx, most of those same variables were read in as Characters. Depending on the analysis you wanted to do, this could be an issue.
  # Look at "hpe_startdate" - it has assigned dates to be Factors - because they don't have a year attached


# Best practice, ALWAYS CHECK YOUR VARIABLES before you start anything, and make any changes you anticipate needing to make at the START! 
# (we will learn how to make these changes later)
  

##### SINGLE COLUMNS
# To reference a specific column within a dataframe, we use '$' operator 
# Same approximate idea as Excel notation of 'Sheet2!B13'  $ and ! are similar
data$watershed_group                                             
data$stream_alias
data$low_precision_estimate
# OR 
# Can use the [row number, column number] notation we learned before
data[,1]                                          # Same as data$watershed_group
data[,5]                                          # Same as data$stream_alias
data[,18]                                         # Same as data$low_precision_estimate
#####


##### SINGLE SPECIFIC VALUE
# Can use the above '$' symbol combined with syntax we learned before to reference a specific value in the data frame.
# Look for the 73rd value in 'watershed_group'
data$watershed_group[73]
# Look for the 100th value for 'high precision estimate'
data$high_precision_estimate[100]
# OR 
# Can just use the syntax we learned before [row number, column number] 
data[73,1]                                        # row 73, column 1. Same as data$watershed_group[73]
data[100,20]                                      # row 100, column 20. Same as data$high_precision_estimate[100]
#####


##### STRING OF SPECIFIC VALUES
# Can use the above '$' symbol combined with syntax we learned before w/ embedded vector method we learned befre 
# What are values 1 to 10 (inclusive) in the water_clarity column?
data$water_clarity[c(1:10)]
# What are the 56, 58 and 30th values in lpe_date? 
data$lpe_date[c(56, 58, 60)]
# OR 
# Use the [row number, column number] syntax we learned before
data[c(1:10),9]                                   # rows 1 to 10 of column 9. Same as data$water_clarity[c(1:10)]
data[c(56,58,60), 23]                             # rows 56,58,60 of column 23. Same as data$lpe_date[c(56, 58, 60)]
#####


##### **R ERRORS**
# As we now know, R doesn't return errors that make sense all the time. 
# What is the 23rd value of column 29? 
data[23, 29]                                      # We don't have a column 29! But the value 'NULL' isn't a super clear error flag
#####




#===============================#
# CALCULATION/SUMMARY FUNCTIONS #
#===============================#
# Some useful functions. These are mostly for reference, but will be used with dplyr later! 
sum(data$low_precision_estimate)
mean(data$high_precision_estimate)
sd(data$high_precision_estimate)
unique(data$gazetted_stream_name)
length(unique(data$low_precision_estimate))
length(unique(data$low_precision_method))
nrow(data)
ncol(data)
length(data)                                      # Same as ncol when referencing the entire dataframe
length(data$water_clarity)                        # same as nrow when referencing a specific row in the dataframe 




#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 4 SUMMARY #
#==========================#

##### Section 4 summary: 
# Know the 4 ways to look at data
# Identify issues/differences in variable types when dataframes are loaded using different methods
# Be very comfortable with indexing moving around the data file 
# Apply simple summary functions 
#####
#------------------------------------------------------------------------------------------------------------------------------------------------


##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################

