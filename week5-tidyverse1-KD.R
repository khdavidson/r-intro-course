# R Intro week 5
# tidyverse --> dyplyr! 
# 14-May-2020
# kd and tv


# Same script starting code every time: 
##################################################################################################################################################

# set wd
setwd("~/ANALYSIS/Data")

# load packages
library(tidyverse)
library(xlsx)
library(openxlsx)

# read in data 
smolt_data <- read.xlsx("nautley_ANALYTICAL_database_2019.xlsx", sheet=3, detectDates=T)     # detect dates is important!!!!! 

# quickly view data!

##################################################################################################################################################



#                                                       ################################
######################################################### 5. INTRO TO TIDYVERSE: DPLYR ############################################################
#                                                       ################################


#####
# What is tidyverse? 
# A suite of packages (see powerpoint) that allow us to perform simple summary and visualization functions to explore and present data
# What is dplyr? 
# dplyr is a package within the tidyverse that specifically performs summary operations (e.g., filtering, grouping, calculations) on our data
#####

# dplyr has 6 main 'verbs': 
## select() - choses which columns to remove or keep
## filter() - filters cases in specific columns to provide exact matches or numerical operations (e.g., > or <)
## group_by() - creates hierarchical groupings for performing summary statistics 
## summarize() - the place where mathematical operations are given for summary statistics (e.g., sum, mean, sd, etc.)
## mutate() - creates new variables (columns, which could include mathematical operations to join existing columns), or change the contents/format of an existing column
## arrange() - sorts rows within specific columns (e.g., alphabetical, smallest-to-largest, etc.)

# these verbs are joined together by PIPES, '%>%', which allow you to 'stack' multiple directions to R and run as one continuous block of code


## Try some examples using nautley juvenile dataset 



#==========#
# select() #
#==========#

# The file is huge, maybe we only want certain columns. There are several ways to use select()
# Can use both column NUMBERS and NAMES in select()
# Note for names you do not need $ or "" around the column name

# 1. Using column names you want to retain, Select only ufid, date, and length_mm:
smolt_data %>%
  select(ufid, date, length_mm)           # you can also use ':' operator between column names, e.g., ufid:length_mm keeps all those columns

# 2. Using column names you don't want to retain, remove columns date_group, jdate, and data_source:
smolt_data %>% 
  select(-c(date_group, jdate, data_source))

# 3. Using column numbers you want to retain, keep columns 1-12, 26 and 35: 
smolt_data %>% 
  select(c(1:12, 26, 35))

# 4. Using column numbers you don't want to retain, remove columns 13-25, 27-34, and 36-39: 
smolt_data %>% 
  select(-c(13:25, 27:34, 36:39))




#==========#
# filter() #
#==========#

# We want to obtain a subset of certain rows from the dataset using conditional filtering 
# Important filtering operations: 
# ==        exactly equals (for factors and characters)
# !=        does not exactly equals (for factors and characters)
# > <       greater than/less than (for numbers or integers only)
# >= <=     greater/less than or equal to (for numbers or integers only)   ** the order of > and = matters!!! Typed as you would say it "greater than or equal to" 
 

# 1. Select only cases were age is 1
smolt_data %>%
  filter(age == 1)

# 2. select only cases were age is 1 and the probability ('prob1') of being assigned to a stock ID is >= 80%
smolt_data %>%
  filter(age == 1, prob1 >= 0.8)          # ',' means all must be true

smolt_data %>%
  filter(age == 1 & prob1 >= 0.8)         # '&' means all must be true

smolt_data %>%
  filter(age == 1 | prob1 >= 0.8)         # any or either can be true (like saying 'or') 

# when in doubt, compare the number of rows returned to see quickly the differences, either using nrow() or the viewer (aka, View() )
nrow(smolt_data %>%
  filter(age == 1, prob1 >= 0.8))                 # 157 rows
nrow(smolt_data %>%
  filter(age == 1 & prob1 >= 0.8))                # 157 rows
nrow(smolt_data %>%
  filter(age == 1 | prob1 >= 0.8))                # 1665 rows





#------------------ ON-GOING PIPE EXAMPLE ------------------------------------------------------------------------
#### We will build on this example each time we learn a new verb
# Using SELECT(), remove the comment colums, data source and extra region2-6 info columns we don't want (18 columns in total to be removed)
# Using FILTER(), chose age-1 smolts who have a >= 80% chance of being from region 4
stack_test <- smolt_data %>% 
  select(ufid:prob1, age:lab_identifier) %>% 
  filter(age==1 & prob1>=0.8) %>% 
  print()
# Look in the environment: now we have a dataframe with 21 columns and 157 rows
#-----------------------------------------------------------------------------------------------------------------





############################### END DAY 5, will pick up on rest of dplyr next week. Good job! ############################### 








##### TIDYVERSE RESOURCES:
# Master the tidyverse course: https://github.com/rstudio/master-the-tidyverse
# Cheat sheets: https://rstudio.com/resources/cheatsheets/
# R for Data Science textbook: https://r4ds.had.co.nz/
# UBC Stat 545A/547 course: https://stat545.stat.ubc.ca/
# Beginner’s guide to tidyverse: https://www.analyticsvidhya.com/blog/2019/05/beginner-guide-tidyverse-most-powerful-collection-r-packages-data-science/
# A gRadual intRoduction to the tidyverse (part 3 is dplyr specific): https://tidyverse-intro.github.io/
#####