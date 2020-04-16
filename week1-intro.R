# Intro to Arrrggh - week 1
# 16-Apr-2020 1000am
# KD and TV

################
# HOUSEKEEPING #
################

# roll call / powerpoint

# going to spend a long time going over RStudio today itself, it may seem tedious but we need to make sure we are all on the same page from the ground
# up. If we run into issues in the future and i ask "what error shows in your console?" or "how is the variable defined in your environment?" or 
# "what is your working directory set to?", we need to know what those things mean to start to troubleshoot. 

# and a script almost word-for-word of what I'm saying will be available with these notes so focus on keeping up with what I'm saying and doing, 
# take notes if it helps, but don't get bogged down in details because I will send it all out at the end. 

# everyone should have R and RStudio downloaded - the DIFFERENCE is that R is the workhorse, RStudio is just a nicer way of looking at/using it


##################### Qs

##################################################################################################################################################


##########
# E-TOUR #
##########

### Overview what you see when you open it:
# - you have this big console window with a few R notes that will pop up every time. Just to note a few key things, R is free, you should never pay 
# for any aspect of it, apart from some higher-level ones that include warranties and help. If you are asked to pay for packages it's a lie or you 
# don't need it. 
# also some tips here to ask for help, demos, etc. I've never used these, but you could give it a shot and see what happens. 

# top right has this multi-tabbed window, on environment right now, but also has history and connections. unlikely you will use history or connections
# environment is the most useful because as you define dataframes, variables, etc. they will appear here with details. 

# bottom right also has a multi-tabbed pane: files, plots, packages, help and viewer. the most common ones you will probably use are plots and help, 
# maybe files as well. 

# up top is a menu of icons to start a variety of new files, a new project, open files, save buttons, print, etc. 

# First thing to define: project and a script. As you might suspect, making a new project is a way to simply connect a bunch of scripts under one
# umbrella, like making a folder or similar. This is helpful to make if you wanted to eventually link to an online repository like github, or if you
# want to share, move or send all scripts of a group together. 

### MAKE A PROJECT
# Hit File > New project > New Directory > New Project > directory name whatever you want (no spaces), Browse to wherever you want the project held > 
# > click open in new session > Create Project 
# new window should open.
# A new script is automatically opened for our fourth window????. this is what a typical RStudio layout will be: script, console, environment, and plots/help
### 

##################### Qs      //end of 'e-tour' 

##################################################################################################################################################

# for today, we are approaching R considering 2 major components or pillars: 
# 1: the 'underlying' structure of code and data in r
# 2: compilations/operations on data by functions (and arguments) 



##############################
# 1. VARIABLE/CODE STRUCTURE #
##############################

# Now back at same window as before, but within a project. 

# Open a new script. A script is like a word document or text file in that it's a blank slate where all the magic will happen. 
# We haven't lost the previous console, it has just dropped down to half size. the KEY difference here is that the script is the saved document you
# are left with. What happens in the console DOES NOT GET SAVED so DO NOT work here unless you don't care about it being saved. the console shows you
# if your code runs properly, any warnings or errors, debug messages, etc. 

# good habit to get into is to always start your script with some REAL WORDS rather than code. give it a title, a date, description, etc. 
# the way we do this in R is to start everything with a hash like you're hashtagging your life - go ahead and give script some info (example). 
# this is called ANNOTATION - there is no such thing as too much annotation when it comes to a script. It will save your butt and is important
# for transparency and understanding if you have to hand code off to someone else. ALWAYS ALWAYS ANNOTATE! 

# Now some SIMPLE CALCULATIONS with R to explore how it works and displays information in the script and the console. 
# when we decide to run a piece of code, or 'execute' the code, we do CTRL+ENTER in the script, but in the console we can just hit enter. like i said,
# the script is just like a word document, you just type away however you want. it doesn't become code until you hit CTRL+ENTER. in the console, 
# think of that as 'live' coding - all you have to do is hit enter. 
2+2
568*88
968/(45-3)                   # brackets are cool because they auto-bracket! 

# simple numerical operations. more complex things: 
sqrt(77.5)
log(202)
log10(66933451)
668^7

# we can also define variables and they show up in our ENVIRONMENT
a <- 665                 # The <- defines a thing and applies it to the value.                       these are bi-directional, '665 -> a' also works (never see it written this way though). you can use '=' but it is a bad idea when you get into different types of functions because it means something different to R
b <- 3
x <- 9+9
y <- 646505.66

# and then create a formula
((a^b)-x)+y           
formula <- ((a^b)-x)+y                 


# we can also definte what is called a VECTOR. a vector is a list of values that can be numerical, character, logical, etc. its the most basic
# element of a table or dataframe, it's essentially just one string of data. see ENVRIONMENT again.
v1 <- c(88, 89, 90, 91, 92)                                                         # c() ('concatenate or combine') means you are about to list multiple items separated by ,
v2 <- c("joe exotic", "carole baskin", "doc antle", "tiger #1", "scarface")         # quotes are cool because they auto-quote!
v3 <- c(585, 22.3, 963, 42, 7.9665)
v4 <- c(45, "sockeye", TRUE)

# lets reference a specific value in one of these vectors. this is a simple vector, it has 5 values we specified in a certain order, it is 1D so 
# therefore we should only have to tell R one piece of information to return a value
v1[1]                     # [] indicates we are looking inside of something with multiple values and a basic structure. what we write within [] indicates WHERE we want R to look
v2[3]                     # works with character values too!  
v3[c(1,3)]                # here we get values in spots 1 and 3
v1[c(2:4)]                # here we get values in spots 2 to 4 INCLUSIVE (:)


##################### Qs

# Next definition is a MATRIX. a matrix is a 2D series of values - it's like a basic table, with fixed columns and rows, but all of
# the SAME data type - this is how it differs from a dataframe. a dataframe, which we will discuss LATER, could have numbers, characters, dates, etc.
m1 <- matrix(nrow=3, ncol=3, 11:19)                                                 # making a matrix of 9 values, in a 3x3 format
# show matrix - location indicator numbers

# to view and pull values from within the matrix, we use the same premise as above with [], only this time with an added ","
m1[1,3]                   # within [ , ] is always [row, column] order 
m1[c(1,2), 2]
m1[c(1:3), c(1,2)]        # can nest vector or list requests within the matrix location request to pull out specific values 
m1[c(1:3), -c(3)]         # same as above! 

####### review R error messages if a ( or , is removed!


# the basic premise of using [], (), commas, "", etc. will apply to essentially all dataframes and types across R regardless of whatever data 
# you are using. These are some core 'base R' operations. 


##################### Qs          //end of 'new script' 

##################################################################################################################################################


####################################
# FUNCTIONS, ARGUMENTS, and R HELP #
####################################

# anything in R that is a word followed by () is a function. this is something that, when fed ARGUMENTS, will perform some kind of further analysis
# or restructuring, some extra code in the background, to make a product. 

# start with the example of the plot() function - self-explanatory, it would make a plot

plot(v1, v3)         # plot is an x,y or y~x plot.

# TO ASK R FOR HELP... ?plot
# lets look at ?plot to help us understand what this FUNCTION is and what ARGUMENTS it wants 
# in the help files at the top we can see the function we are asking about, followed by what {package} it came from 

# the DESCRIPTION and TITLE should tell you a fair bit about what is going on. 
# immediately we see it is for XY plotting, so scatterplots - no categorical or descriptive stuff, just good old fashioned x-y data. the rest of the
# description for now is above and beyond what we want to do, but essentially, there are a lot of different plot types, depending on what data 
# structure you are using. 
# scroll down, usage shows the format for the SYNTAX. Syntax, which is fancy for 'sentence structure' means just that - how our code is structured,
# is it separated by commas, is it "x,y" or "y~x" which you will see... elipses means "and more", but what is shown before "..." are some key
# arguments.

# ARGUMENTS is one of the most helpful places, it tells us all the arguments and parameters that can be fed to plot() to give
# us a desired result. we need the x and y arguments, but then there's a ton of other stuff we could use, like graphical parameters, the type of
# plot, etc. so lets try some 


# lets specify a LINE plot, rename the xlab and ylab, change the line width (lwd), line type (lty), and colour
plot(v1, v3, type="l", xlab="Julian Date", ylab="Awesomeness")


# i am using this plot() simply as an example of a function, to outline arguments, and to access R help files. This is all in 'base R' so far, but
# there is a nice package called "ggplot" i'm going to introduce in a week or 2, it's way easier to plot in once you get the hang of it, so
# don't stress to memorize these exact details. 


##################### Qs            //end of 'r functions and help' 



###################
# HOMEWORK: SWIRL #
###################

# SWIRL is an intro package that will guide you through different features of R 
# a package is what it sounds like - a group or chunk of code to perform some special analysis or purpose in R. there are tons of packages out there
# Lesson 1 in swirl is good review of what we did today! 

# INSTALL SWIRL TOGETHER! 
install.packages("swirl")
library(swirl)


# // end day 1 






##################################################################################################################################################

# nice but lets look at our own data now!
# from here on is the code process you will use to set up a new script each time 

#######################
# INITIALIZE A SCRIPT #
#######################

#########
# 1. WORKING DIRECTORY 
#########

# the WORKING DIRECTORY is where you store your data. by setting a working directory, you are telling R where to find the file(s) you want to 
# use. I have a separate folder in My Docs called ANALYSIS - within this folder I have sub-folders for Data, Scripts and Figures. It is
# much easier to have one central folder for all working analysis data files, in the event you want to use multiple excel files in one script. If
# the scripts are stored in different places on your computer, you have to change your working directory each time which is a huge pain. 

# the easiest way to set your working directory is at the top, click Session > Set Working Directory > Choose Directory... > navigate to the folder 
# with all of your data and select it. You should now see it below in the Console. 

setwd("~/ANALYSIS/Data")

# everytime you close and re-start R, you will have to set your working directory. To save time, I copy the working directory script below from the
# console, and make it the first line of my script. That way it is quick to re-set and run every time I start up analysis.

##################### Qs


#########
# 2. LOADING PACKAGES 
#########

# in addition to re-setting your working directory each time, you will also have to re-load any packages you are using in the script.
# a package is an extra tool or suite of tools someone else has written to work in R, often to do a specialized type of analysis. Base R can do some
# things, but not a whole lot. There are tons of packages out there, some better than others, but many are vouched for either through the CRAN
# network or in statistical or programming journals. 

# one of the most common suite of tools is a whole group of packages that reside in the package "tidyverse". This contains 10+ (?) packages all
# around data cleaning, manipulation, plotting, summarizing, etc. we won't use these packages today, but we will install and load them so that we
# are ready for next week. 

install.packages("tidyverse")            # this can be written in your console, doesn't need to be saved. once you install a package, it's on your computer until you erase the computer memory or uninstall R and RStudio
library(tidyverse)                       # this is what you want written at the top of your script! 
# it may take a while to install and unpack the packages - there are a lot! 

# we will also install and load some packages for reading Excel files: 
install.packages("XLConnect")      
install.packages("xlsx")
install.packages("openxlsx")
library(XLConnect)                       # these can be finicky, read-in IN THIS ORDER
library(xlsx)
library(openxlsx)

##################### Qs


#########
# 3.1. READ IN DATA - CSV 
#########

# now we have wd and packages loaded, we can read in our data. this is the Excel or csv file of data that we want to perform some analysis on. The
# most common data format, because it works across all platforms, is a .csv (or 'comma separated values') file. It's like a text file, it has no
# fancy cell formatting or anything so it is usually the simplest type. It is also only 1 tab when opened in Excel - cannot have multiple tabs.

# to start by reading in a csv file
data <- read.csv("r-intro-week1_calibration.csv")

# we see it shows up in our Environment. Click the blue arrow to see the variables and summaries. Here, each row is actually a colum. so you have
# the column 'watershed_group' which is a Factor type variable with 10 levels, and then it gives you the head of those. Next is 'run_timing_group'
# also a Factor but with 4 levels. 

# We can see if we look through we have a few types of variables (key variables):
# FACTOR: variables which take on a limited number of different values (aka categorical variables)
# INTEGER: whole numbers 
# NUMERICAL: numbers often with decimens (aka continuous variables)
# (not here) CHARACTER: a string or series of characters - similar to factor but infinite (this would be like a 'comments/notes' column)
# (not here) DATE: a date, important for any work analyzing or plotting time-series data
# r senses variable types and assigns them based on its best guess, but sometimes isn't always correct. E.g., scroll down to "hpe_startdate" etc,
# it has assigned dates to be Factors - BECAUSE they don't have a year attached! 
# Best practice, always check your variables before you start anything

# this sidebar is really helpful, but it's hard to actually see what we are working with. click on 'data' to view fullscreen! 

# here, we can see better now some differences between data types. Note for the NUMERICAL values that where an empty cell lies, R fills this with
# and NA value - that is because as a I mentioned before it's a continuous variable so there needs to be SOMETHING there. For factors, blanks are
# OK. 


#########
# 3.1. READ IN DATA - EXCEL 
#########

# that is great, but often we have multi-tabbed Excel files and creating many .csv files is tedious and hard to keep track of. Instead, we can 
# use the packages we installed above. 

# to read an excel file
data.xl <- read.xlsx("r-intro-week1_calibration.xlsx", sheet = 2)      # sheet index = sheet number. WATCH THE FILETYPE! you might have a macro Excel file which is .xlsm, or an old excel file .xls. DONT ASSUME .xlsx!

# using the dropdown menu, we can see it has applied TOTALLY different variable types to many of our variables that were Factors - almost all are now
# Characters. This is fine, but may pose problems if we want to use factors to group or summarize data in different ways. This is important now
# just to show that different packages may treat data differently - be aware of this. 


##################### Qs?   //end of 'initalize script' 

##################################################################################################################################################


####################
# DATA EXPLORATION #
####################

# now we have our data read in, these are DATA FRAMES. Definition: 
### "table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values 
### from each column. can be mix of variable types (numeric, factor, character, etc.)"

# lets also look at our data using head()
head(data)                             # gives first 6 rows of data just for quick look

# what are all of our column (or variable) names? 
names(data)

# the general format for calling to data stored within this data frame is to use the following structure: 
data$watershed_group                   # note the drop-down menu to help u (& tab). and the format of rows/row #s in the console (is a column in the dataframe)
data$stream_alias
data$low_precision_estimate

# now lets try using the syntax we learned before to reference a specific value in the data frame.
# look for the 73rd value in 'watershed_group'
data$watershed_group[73]
# look for the 100th value for 'high precision estimate'
data$high_precision_estimate[100]

# in this case, we have already told R which column to look in, so now we are just specifying the row number. we can also use the matrix-style
# reference method we learned above as well, where we reference [row #, column #]
# what is the 15th value in column 8? 
data[15,8]                             # quick way to find column # is using the data View option & hovering over the column

# what is column 19's 99th value? 
data[99,19]

# we can also use the embedded vector, or list, method of looking up values we learned earlier 
# what are values 1 to 10 (inclusive) in column 5?
data[c(1:10), 5]

# what are the 55, 57, and 59th values of column 13?
data[c(55, 57, 59), 13]

# what is the 23rd value of column 29? 
data[23, 29]                           # we don't have a column 29! BE CAREFUL! R will not always give you blatant warning signs/errors if you mess up! 


#######
# 1. SUBSETTING DATA 
#######

# what if you wanted to look at data from only one location? we might only be interested in Stellako counts   
# we know to start it has to do with "gazetted stream name", and selecting only the specific rows that say "Stellako", so we know it should be a
# similar format to what we were doing before with []
stellako <- data[data$gazetted_stream_name=="Stellako River", ]                # GOOD. here, because we have specificed we want all rows in data where gazetted_stream_name == "stellako", we do not then FURTHER specify a column number. or else we ask to look within those rows and look for stellako, etc. keep comma and space to specify we want to keep dataframe structure/all columns 
stellako2 <- data$gazetted_stream_name["Stellako River"]                       # WRONG. cant reference characters in place of the numerical value 
stellako3 <- data$gazetted_stream_name=="Stellako River"                       # WRONG. no [] means we are simply asking R if at any point g_s_n is Stellako? so we are returned a logical vector
# '==' means 'exactly equal to' 

# what if we want stellako AND nadina? 
stell_nad <- data[data$gazetted_stream_name=="Stellako River" | data$gazetted_stream_name=="Nadina River", ]         # in this base R syntax, you can't use & or &&, although in some specific cases you can. here, "==" is an absolute "must equal". | is usually "given" or "allowing" and add on. if you ever have issues with using &, try replacing with |
stell_nad2 <- data[data$gazetted_stream_name=c("Stellako River", "Nadina River"), ]                                  # WRONG. can't use c() with subsetting

# what if we want all systems with a discharge higher than 20 m3/s?
discharge <- data[data$water_discharge > 20, ]                                 # this works, but it sucks with all the NAs

# to get rid of NAs 
bye_na <- discharge[!is.na(discharge$water_discharge), ]                       # "!" indicates we dont want something. with NAs, it's a bit tricker.
# to get rid of any normal level of a variable, e.g., we don't want Birken head
no_birks <- data[data$gazetted_stream_name != "Birkenhead River", ]            # can be interpreted as "does not equal"


##################### Qs


#######
# 2. SUMMARY CALCULATIONS
#######

# we may want to know how to do summary stats math. we will get into this using dplyr later, but for now, know that there are some useful functions
# to calculate simple stats. calculations ONLY work if the data are numerical or integer - can't be done on factor or character.
# these are mostly for reference, but will be used with dplyr later! 
# total or sum: 
sum(data$low_precision_estimate)
# average:
mean(data$high_precision_estimate)
# standard deviation: 
sd(data$high_precision_estimate)
# identify unique values
unique(data$gazetted_stream_name)
# count unique values 
length(unique(data$low_precision_estimate))
length(unique(data$low_precision_method))
# count number of rows/columns in a dataframe
nrow(data)
ncol(data)
length(data)                # same as ncol in this case


#######
# 3. PLOTTING!
#######

# Last but not least, we will make a plot today using base plot(). Soon though we will be using ggplot() so don't worry too much about the specifics
# of plot() as much of it will change

# lets plot a scatterplot of the low precision estimate~high precision estimate (recall y~x)
plot(data$high_precision_estimate ~ data$low_precision_estimate)
plot(data=data, high_precision_estimate ~ low_precision_estimate)            # can be a little cleaner to specify data=data first

# lets make the points solid, gray filled, size 2
plot(data=data, high_precision_estimate ~ low_precision_estimate,            # specify your data, recall y~x
  pch=21, col="black", bg="gray", cex=2,                                     # pch is point shape, col is colour, bg is fill colour, cex is point size
  xlab="Low precision estimate", ylab="High precision estimate")             # rename axes labels pretty
abline(a=0, b=1, col="red")                                                  # add a 1:1 regression line for fun 


# or we could make a bar graph of total number of fish per year 
barplot(data=data, high_precision_estimate ~ year, subset = gazetted_stream_name=="Tachie River", 
  col="red",
  xlab = "Year", ylab = "High precision estimate")
barplot(data[data$gazetted_stream_name=="Tachie River",]$high_precision_estimate ~ data[data$gazetted_stream_name=="Tachie River",]$year,
  col="blue",
  xlab = "Year", ylab = "High precision estimate")

# examine the subsetting requests - get just a vector of values because we have specified down so much. this is key for plotting, but often not
# of interest when purely just looking to subset a dataset for initial investigation


##################### Qs?   //end of 'data exploration'



##################################################################################################################################################
####################################################################### END WEEK 1 ###############################################################
##################################################################################################################################################

