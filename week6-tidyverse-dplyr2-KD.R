# R intro week 6
# tidyverse --> dplyr! part 2
# 21-may-2020
# kd and tv


# Same script start every time: 
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


#                                                    #######################################
###################################################### 5. INTRO TO TIDYVERSE: DPLYR cont'd #######################################################
#                                                    #######################################


####### Continuing on with the 6 verbs/functions of dplyr: 
# DONE LAST WEEK: select() - choses which columns to remove or keep
# DONE LAST WEEK: filter() - filters cases in specific columns to provide exact matches or numerical operations (e.g., > or <)
# group_by() - creates hierarchical groupings for performing summary statistics 
# summarize() - the place where mathematical operations are given for summary statistics (e.g., sum, mean, sd, etc.)
# mutate() - creates new variables (columns, which could include mathematical operations to join existing columns), or change the contents/format of an existing column
# arrange() - sorts rows within specific columns (e.g., alphabetical, smallest-to-largest, etc.)
#####


#============================#
# group_by() and summarize() #
#============================#

# For grouping by multiple levels of a factor. Can be grouped by levels of different variables 
# Eg, can group by stock ID, and then age, or date, etc. 

# Is used in conjunction with summarize(), as just making groups on it's own does do much, you need to 'populate' those groups with something
# Common summarize() functions: 
# mean()
# sd()
# n()
# unique()
# sum()

# 1. Calculate the mean and SD length_mm for each age group 
smolt_data %>% 
  group_by(age) %>% 
  summarize(mean_length = mean(length_mm), sd_length = sd(length_mm)) 

# 2. Calculate the mean and SD weight_g for each stock group ('NEWregion1') each day
View(smolt_data %>% 
  group_by(date, NEWregion1) %>% 
  summarize(mean_weight = mean(weight_g), sd_weight = sd(weight_g)))

# NAs in our numerical data (weight_g) can be a pain, so let's quickly remove them: 
View(smolt_data %>% 
  group_by(date, NEWregion1) %>% 
  summarize(mean_weight = mean(weight_g, na.rm=T), sd_weight = sd(weight_g, na.rm=T)))

# The NAs in our stock ID (NEWregion1) require the use of filter... 


# ????????????????????????????




#------------------ PIPE IT ------------------------------------------------------------------------
# Using SELECT(), remove the comment and data source and region2-5 columns we don't want
# Using FILTER(), chose age-1 smolts who have a >= 80% chance of being from region 4
# Using GROUP_BY() and SUMMARIZE(), calculate the mean and SD length of each stock ID group each day
# Also, use FILTER() to remove the NAs in NEWregion1

stack_test <- smolt_data %>% 
  select(ufid:prob1, age:lab_identifier) %>%                                                      # note now that we have done group_by() and summarize(), select isn't really needed anymore
  filter(age==1 & prob1>=0.8 & !is.na(NEWregion1)) %>% 
  group_by(date, NEWregion1) %>%                                                                  # note order specified impacts column order
  summarize(mean_length = mean(length_mm, na.rm=T), sd_length = sd(length_mm, na.rm=T)) %>%       # remember to add na.rm=T to ignore days where no lengths taken
  print()
#---------------------------------------------------------------------------------------------------



# ????????????????????????????



#==========#
# mutate() #
#==========#

# To change the value of an existing column: 

# convert length_mm from mm to cm 
smolt_data %>%
  mutate(length_mm = length_mm/10)

# Or convert the probability (prob1) from proportion to a full percent (i.e., multiply by 100)
smolt_data %>% 
  mutate(prob1 = prob1*100)

# BUT maybe now the new values don't match our old column headers, so instead we might want to add a new column: 
smolt_data %>% 
  mutate(length_cm = length_mm/10)

# we could calculate a new column called condition_factor
smolt_data %>%
  mutate(condition_factor = weight_g/length_mm^3) 



# ????????????????????????????



## one of the BEST uses of mutate is to rename confusing factor levels...
# But when you have multiple factor levels, it's hard to simultaneously rename multiple levels...
# Enter the ifelse() statement! "If x, do this, if not do that" 
# ifelse() statements can be nested too! 
# syntax: ifelse(value of interest, perform this operation to it, otherwise make it this)
# ifelse() also uses syntax similar to the conditional filtering we learned before!

smolt_data %>% 
  mutate(NEWregion1 = ifelse(NEWregion1==4, "Nadina", "Stellako"))


# ????????????????????????????


#------------------ PIPE IT ------------------------------------------------------------------------
# Using SELECT(), remove the comment and data source and region2-5 columns we don't want
# Using FILTER(), chose age-1 smolts who have a >= 80% chance of being from region 4
### add in to FILTER() remove the NAs in NEWregion1
# Using GROUP_BY() and SUMMARIZE(), calculate the mean and SD length of each stock ID group each day
# Using MUTATE(), rename NEWregion1 value 4 to be Nadina, leaving the rest to be Stellako

stack_test <- smolt_data %>% 
  select(ufid:prob1, age:lab_identifier) %>%                                                      # note now that we have done group_by() and summarize(), select isn't really needed anymore
  filter(age==1 & prob1>=0.8 & !is.na(NEWregion1)) %>% 
  group_by(date, NEWregion1) %>%                                                                  # note order specified impacts column order
  summarize(mean_length = mean(length_mm, na.rm=T), sd_length = sd(length_mm, na.rm=T)) %>%       # remember to add na.rm=T to ignore days where no lengths taken
  mutate(NEWregion1 = ifelse(NEWregion1==4, "Nadina", "Stellako")) %>%
  print()
#---------------------------------------------------------------------------------------------------


# ????????????????????????????



#===========#
# arrange() #
#===========#

# Just the Sort By function in Excel 
# Usually not used, but good to know

# Sort by date
smolt_data %>% 
  arrange(date)

# Can be hierarchical: sort by date and length_mm
View(smolt_data %>% 
  arrange(date, length_mm))

# defalt is logical ascending order, e.g., a-z, 0-10, etc. 
# to switch that: 
smolt_data %>% 
  arrange(desc(date))

# If you just want it for easy looking at the data - click the column headers in the View() window



# ????????????????????????????



#------------------ PIPE IT ------------------------------------------------------------------------
# Using SELECT(), remove the comment and data source and region2-5 columns we don't want
# Using FILTER(), chose age-1 smolts who have a >= 80% chance of being from region 4
### add in to FILTER() remove the NAs in NEWregion1
# Using GROUP_BY() and SUMMARIZE(), calculate the mean and SD length of each stock ID group each day
# Using MUTATE(), rename NEWregion1 value 4 to be Nadina, leaving the rest to be Stellako
# Using ARRANGE(), sort by date and then descending region name (i.e., stellako before nadina)

stack_test <- smolt_data %>% 
  select(ufid:prob1, age:lab_identifier) %>%                                                      # note now that we have done group_by() and summarize(), select isn't really needed anymore
  filter(age==1 & prob1>=0.8 & !is.na(NEWregion1)) %>% 
  group_by(date, NEWregion1) %>%                                                                  # note order specified impacts column order
  summarize(mean_length = mean(length_mm, na.rm=T), sd_length = sd(length_mm, na.rm=T)) %>%       # remember to add na.rm=T to ignore days where no lengths taken
  mutate(NEWregion1 = ifelse(NEWregion1==4, "Nadina", "Stellako")) %>%
  arrange(date, desc(NEWregion1)) %>%
  print()
#---------------------------------------------------------------------------------------------------


# ????????????????????????????


# // end INTRO TO DPLYR! 


#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 5 SUMMARY #
#==========================#

##### Section 5 summary: 
# Know what tidyverse is
# Know what dplyr is and how it is useful
# Know the 6 main verbs of dplyr
# Use the name and numerical values in select() to chose/remove columns
# Apply conditional filtering using filter() to obtain (or remove) a subset of row values 
# Also know how to filter specifically for NAs using is.na() or !is.na()
# Perform grouping calcuations by combining group_by() and summarize() to calculate summary statistics 
# Re-format or create new variables (columns) using mutate()
# Apply ifelse() statements within mutate() to tailor specific variable levels to your needs - and know they can be nested!
# Sort data and tables in ascending or descending order and in groups using arrange()
# String multiple functions together using pipes (%>%) to run a solid block of code
#####
#------------------------------------------------------------------------------------------------------------------------------------------------


##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################



##### TIDYVERSE RESOURCES:
# Master the tidyverse course: https://github.com/rstudio/master-the-tidyverse
# Cheat sheets: https://rstudio.com/resources/cheatsheets/
# R for Data Science textbook: https://r4ds.had.co.nz/
# UBC Stat 545A/547 course: https://stat545.stat.ubc.ca/
# Beginner’s guide to tidyverse: https://www.analyticsvidhya.com/blog/2019/05/beginner-guide-tidyverse-most-powerful-collection-r-packages-data-science/
# A gRadual intRoduction to the tidyverse (part 3 is dplyr specific): https://tidyverse-intro.github.io/
#####

