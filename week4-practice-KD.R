# Intro to R
# week 4 PRACTICE/EXAMPLES  
# May 7, 2020 


# Example start of every script: 
######################################################################################################################################################

# set working directory
setwd("~/ANALYSIS/Data")               # replace with your working directory

# load packages
library(xlsx)                                           
library(openxlsx)

# read in data
data <- read.xlsx("r-intro-week1_calibration.xlsx", sheet = 2)                                 # could use the csv file too if you wanted

######################################################################################################################################################



##### Recall: 
# data[row#, column#]
# data[row#, "column_name"]
# data$column_name
# data$column[row #]
##### and that c() can fit into these  



############################################
# 1. Referencing individual, whole columns #
############################################

# 1.1. Reference the 'CU' column using:
# $ notation:

# [,] notation: 

# [,] and "" notation: 




# 1.2. Reference the 'cuml_dead' column using:
# $ notation:

# [,] notation:

# [,] and "" notation: 




# 1.3. Reference column 29 using [,] notation:


###################################################################################################################################################


#######################################################
# 2. Referencing a single, specific value in a column #    i.e., one cell 
####################################################### 

# Use [,] notation to find: 
# 2.1. The value in the 73rd row of column 8:

# 2.2. The value in the 11th row of column 22:

# 2.3. The value in the 102nd row of column 30:

#---------------------------------------------------------------------

# Combine the $ and [] operations to find: 
# 2.4. The 150th value of the 'size' column:

# 2.5 The 69th value of the 'large_woody_debris' column:

# 2.6. The 99th value of the 'index' column:

#---------------------------------------------------------------------

# Combine the [,] and "" operations to find: 
# 2.7. The 54th value in 'index':

# 2.8. The 2nd value in 'peak_live':

#---------------------------------------------------------------------

# Show THREE different ways to find: 
# 2.9. The 14th value of column 22 'hpe_enddate':

# 2.10. The 50th value of column 15 'low_precision_method'


###################################################################################################################################################


#############################################################
# 3. Referencing a string of specific values in a column(s) #
#############################################################

# Combine the [,] (and sometimes 'c()') notation to find: 
# 3.1. The 1,3,5,7 and 9th values of column 18:

# 3.2. The 100 to 150th values (inclusive) of column 4:

# 3.3. All entries in columns 19 and 22:

# 3.4. The 2, 45-62nd (inclusive) and 153rd values of column 8:

# 3.5. The values in row 10 of columns 2, 6 and 28:

# 3.6. The values in rows 1-6 inclusive of all columns:

#---------------------------------------------------------------------

# Combine the $ and [] (and sometimes 'c()') operators to find: 
# 3.7. The 70, 80 and 90th values of 'year':

# 3.8. The 1-50th values of 'water_level':

# 3.9. The 3, 99 and 149th values in 'water_discharge'

#---------------------------------------------------------------------

# Combine the [,] and "" (and sometimes 'c()') operators to find: 
# 3.10. The 1, 80 and 9th values of 'ec_data_type':

# 3.5. The 1-120th values of 'index':

# 3.6. The 20-23rd, 26-60th, 45th values in 'gazetted_stream_name':


###################################################################################################################################################


####################################################
# 4. Referencing using 'except'/removal operations #
####################################################

# Using [,] (and sometimes 'c()') notation: 
# 4.1. Find all columns except columns 20-28 (inclusive): 

  # 4.1a. store that as a new data frame called 'data1'

# 4.2. Find all columns except columns 2, 9, 19 and 23:

# 4.3. Find all columns but omit the first 10 rows:

  # 4.3a. store that as a new data frame called 'data2'

# 4.4. Remove data1 and data2 from your environment

#---------------------------------------------------------------------

# Using $ and [] (and sometimes 'c()') notation:
# 4.5. Find all values of 'gazetted_stream_name' except the first 10:

# 4.6. Find all values of 'high_precision_method' except values 99 to 153 (inclusive):

# 4.7. The values in the last 10 rows of columns 1, 4, and 8-10 (inclusive)


###################################################################################################################################################


#####################
# EASY CALCULATIONS #
#####################

# Calculate the mean and standard deviation ('sd()') of: 
# The 100 to 150th values (inclusive) of column 6: 

# All entries in column 18: 

#---------------------------------------------------------------------

# Calculate the median value of 'peak_live' except the first 10 values: 

#---------------------------------------------------------------------

# Calculate the sum of 'peak_live' and add it to the sum of 'cuml_dead':        --> this is a tricky one so see answer below once you try it! 












###################################################################################################################################################

###################################################################################################################################################

###################################################################################################################################################

#                                                                  BEWARE ANSWERS BELOW

###################################################################################################################################################

###################################################################################################################################################

###################################################################################################################################################























############################################
# 1. Referencing individual, whole columns #
############################################

# 1.1. Reference the 'CU' column using:
# $ notation 
data$CU
# [,] notation 
data[,3]
# [,] and "" notation 
data[,"CU"]

# 1.2. Reference the 'cuml_dead' column using:
# $ notation
data$cuml_dead
# [,] notation
data[,17]
# [,] and "" notation 
data[,"cuml_dead"]

# 1.3. Reference column 29 using [,] notation:
data[,29]                                  # a trick! there is no column 29. 




#######################################################
# 2. Referencing a single, specific value in a column #
#######################################################
# i.e., one cell 


# Use [,] notation to find: 
# 2.1. The value in the 73rd row of column 8
data[73,8]
# 2.2. The value in the 11th row of column 22
data[11,22]
# 2.3. The value in the 102nd row of column 30
data[102,30]                                               # notice the difference between 'NA' in 2.2 and 'NULL' in 2.3 - there is no column 30



# Combine the $ and [] operations to find: 
# 2.4. The 150th value of the 'size' column
data$size[150]
# 2.5 The 69th value of the 'large_woody_debris' column
data$large_woody_debris[69]
# 2.6. The 99th value of the 'index' column
data$index[99]                                              # notice here because we have already specified the column outside of the [], we only need to give R the row number



# Combine the [,] and "" operations to find: 
# 2.5. The 54th value in 'index'
data[54,"index"]
# 2.6. The 2nd value in 'peak_live'
data[2,"peak_live"]



# Show three different ways to find: 
# 2.7 The 14th value of column 22 'hpe_enddate'
data$hpe_enddate[14]
data[14,22]
data[14,"hpe_enddate"]
# 2.8. The 50th value of column 15 'low_precision_method'
data$low_precision_method[50]
data[50,15]
data[50,"low_precision_method"]



##########################################################
# 3. Referencing a string of specific values in a column(s) #
##########################################################

# Combine the [,] (and sometimes 'c()') notation to find: 
# 3.1. The 1,3,5,7 and 9th values of column 18
data[c(1,3,5,7,9),18]
# 3.2. The 100 to 150th values (inclusive) of column 4
data[100:150, 4]
data[c(100:150), 4] 
# 3.3. All entries in columns 19 and 22 
data[,c(19,22)]
# 3.4. The 2, 45-62nd (inclusive) and 153rd values of column 8
data[c(2, 45:62, 153), 8]
# 3.5. The values in row 10 of columns 2, 6 and 28
data[10, c(2, 6, 28)]
# 2.8. The values in rows 1-6 inclusive of all columns
data[c(1:6), ]                                           # this is the same has typing head(data)! 



# Combine the $ and [] (and sometimes 'c()') operators to find: 
# 3.4. The 70, 80 and 90th values of 'year'
data$year[c(70,80,90)]
# 3.5. The 1-50th values of 'water_level'
data$water_level[1:50]
data$water_level[c(1:50)]
# 3.6. The 3, 99 and 149th values in 'water_discharge'
data$water_discharge[c(3,99,149)]




# Combine the [,] and "" (and sometimes 'c()') operators to find: 
# 3.4. The 1, 80 and 9th values of 'ec_data_type'
data[c(1,80,9), "ec_data_type"]
# 3.5. The 1-120th values of 'index'
data[1:120, "index"]
data[c(1:120), "index"]
# 3.6. The 20-23rd, 26-60th, 45th values in 'gazetted_stream_name'
data[c(20:23, 26:60, 45), "gazetted_stream_name"]
data[c(26:60, 45, 20:23), "gazetted_stream_name"]              # order you request values in is what is returned (numerical order is NOT assumed)




####################################################
# 4. Referencing using 'except'/removal operations #
####################################################

# Using [,] (and sometimes 'c()') notation: 
# 4.1. Find all columns except columns 20-28 (inclusive) 
data[,-c(20:28)]
  # store that as a new data frame called 'data1'
  data1 <- data[,-c(20:28)]
# 4.2. Find all columns except columns 2, 9, 19 and 23
data[,-c(2,9,19,23)]
# 4.3. Find all columns but omit the first 10 rows 
data[-c(1:10),]
  # store that as a new data frame called 'data2'
  data2 <- data[-c(1:10),]

# Remove data1 and data2 from your environment
remove(data1)
remove(data2)



  
# Using $ and [] (and sometimes 'c()') notation
# 4.4. Find all values of 'gazetted_stream_name' except the first 10 
data$gazetted_stream_name[-c(1:10)]                                        # notice new #1 is Forfar, was beffore Barriere River (Upper)
# 4.5. Find all values of 'high_precision_method' except values 99 to 153 (inclusive)
data$high_precision_method[-c(99:153)]



# 3.7. The values in the last 10 rows of columns 1, 4, and 8-10 (inclusive)
data[-c(1:143), c(1, 4, 8:10)]
data[c(144:153), -c(2:3, 5:7, 11:28)]                      # you can switch around 'i want' and 'i don't want' operations whatever way works for your mind! 




#####################
# EASY CALCULATIONS #
#####################

# Calculate the mean and standard deviation ('sd()') of
# The 100 to 150th values (inclusive) of column 6
mean(data[100:150, 6])
sd(data[100:150, 6])

data1 <- data[100:150, 6]
mean(data1)
sd(data1)



# All entries in column 18 
mean(data[,18])
sd(data[,18])

data2 <- data[,18]
mean(data2)
sd(data2)






# Calculate the median value of 'peak_live' except the first 10 values 
median(data$peak_live[-c(1:10)])

data3 <- data$peak_live[-c(1:10)]
median(data3)



# Calculate the sum of 'peak_live' and add it to the sum of 'cuml_dead' 
sum(data$peak_live) + sum(data$cuml_dead)                         # R doesn't like NAs in numbers. We have a few spots where cuml_dead = NA
  # Advanced info: 
  sum(data$peak_live) + sum(data$cuml_dead, na.rm=T)              # We can use na.rm ('NA ReMove') set to TRUE or T and that tells R to just ignore the NAs and calculate it anyway!

data4 <- sum(data$peak_live)                                      # notice there are no NAs in peak_live so we can just do the sum() normally
data5 <- sum(data$cuml_dead, na.rm=T)
data4 + data5

# Does na.rm remove the whole row associated with the cuml_dead NA? Or does it keep the peak_live and just ignore the NA when it gets to cuml_dead? 
# In this case, na.rm only removes the individual NA case, not the entire row. 

# However, another function called 'na.omit' will remove all rows that contain NA. 
# Sometimes this is useful: e.g., you have a HUGE data base, and some years some crucial information (e.g., a live count) is missing,
# but you collected water temperature, sky cover, and precipitation. While Environmentals are great, perhaps we want to do an analysis on the live
# counts. Without live counts, those entries is useless, so you can use na.omit to remove them. 
# BUT na.omit is very greedy!

# Example of na.omit
data_nona <- na.omit(data)                     # This returns an empty dataframe because we had a LOT of NAs in our previous dataframe! That's less than ideal. 

# na.rm is an ARGUMENT
# na.omit is a FUNCTION

# What if you wanted to remove rows where just a specific column contains NA? 
data_subset <- data[!is.na(data$cuml_dead), ]                     # "!" operator means "i dont want a specific case" 

length(data$cuml_dead)                   # before, we had 153 values in cuml_dead
length(data_subset$cuml_dead)            # now, we have 144 values in the new cuml_dead stored in data_subset. R removed 10 rows where just cuml_dead was NA, but it preserved all of the other NAs we had in other columns








