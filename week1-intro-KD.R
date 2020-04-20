# Intro to Arrrggh (R)
# week 1 - The Basics
# 16-Apr-2020 1000am
# KD and TV
# Jeff Denison, Stacey Hobson, Thomas Powell, Andrew Grant, Kristy Grant, Andrew Reith, 
# Brad Butler, Dylan Couture, Brian Leaf, Adam Bruno, Doug Thorpe 


                                           #####################################
############################################ 0. HOUSEKEEPING, INTRO TO RStudio ####################################################################
                                           #####################################


#==============#
# HOUSEKEEPING #
#==============#

# intro powerpoint. why R is great, blah, blah, blah. 
                                           
#### THE PLAN (UPDATED AFTER APR 16 as we didn't get to vectors/matrices/functions)
# Week 1: Basics, jargon, defining variables, math operations
# Week 2: Defining vectors, matrices, using functions and asking R for help
# Week 3: Initializing a script, packages, importing data
# Week 4: Data exploration with tidyverse (tidyr, dplyr, and ggplot)        # Weeks 3 and 4 might be combined and we will work through tidyverse over multiple sessions
# (Week 5: Good data practices, spreadsheets for R) - if interest, also kinda ties in to tidyverse (long vs. wide data)
## Schedule is flexible and will be determined more based on interest, stamina, speed and comfort
####
                                           
# These are the building blocks, and they will be THE HARDEST PART. Don't stress if it doesn't come naturally. Took me 7 years to get 'here'.

### The difference between R and RSTUDIO
# R is a coding language and the software 'workhorse'. Once downloaded, you should never need to open it. It will lurk in the background.
# RStudio is the nice user interface. It will talk to R to run your code.
###


#=========================#
# RStudio VISUAL OVERVIEW #
#=========================#

#### When you first open RStudio:
# Big CONSOLE window with a few lines of information. 
# Some tips here to ask for help, demos, etc. I've never used these, but you could give it a shot and see what happens.
# BB noted that help.start() is general help within R. 
# R is free, you should never pay for it or packages associated with it. If you are asked to pay for packages it's a scam. 

# TOP RIGHT: a multi-tabbed pane, likely on ENVIRONMENT (also has History and Connections). Unlikely you will use History or Connections
# Environment is the most useful because as you define dataframes, values, etc. they will appear here with details. 

# BOTTOM RIGHT: a multi-tabbed pane with Files, Plots, Packages, Help and Viewer. 
# The most common ones you will probably use are Plots and Help

# ALONG THE TOP: icons to open or create new files, new project, save buttons, print, etc. 
####


#### PROJECTS vs. SCRIPTS 
# A PROJECT is a way to simply connect a bunch of associated scripts under one umbrella, like making a folder on your computer. 
# Projects are helpful if eventually link to an online repository (e.g., github), or if you want to share, move or send scripts as a group 
# a SCRIPT is like a blank document. It is where all of your code will be written and is save-able (more on this below).
###
                                           
#### TASK: MAKE A PROJECT
# File > New project > New Directory > New Project > directory name whatever you want (no spaces), Browse to wherever you want the project held > 
# click 'Open in new session' > Create Project 
# A new RStudio window should open. At the very top it should say "~/your file path/... - RStudio" 
# Keep this window open, and close the old RStudio window (likely just says "RStudio" at the top)
### 

#### TASK: OPEN A SCRIPT (defined below)
# You should now be in the new project window. 
# Up top, just under 'File', is an icon of a white square with a green '+' sign. Click the small down arrow next to it.
# Select 'R Script'
# The console should drop down to ~1/2 size and you are now faced with a large blank box.
####
        
                                           
                                                                              


##################################################################################################################################################

                                           
                                           
# KEEP IN MIND 2 major components or pillars of R: 
# 1: The 'underlying' structure of code and data in r                      THIS WILL BE TODAY (APR 16) AND NEXT WEEK (APR 23)
# 2: Compilations/operations on data by FUNCTIONS (and ARGUMENTS)          THIS WILL LIKELY BE NEXT WEEK (APR 23)



                                                     ##############################
###################################################### 1. VARIABLE/CODE STRUCTURE #################################################################
                                                     ##############################

                                           
                                           
# Now back at same window as before, but in a script, within a project. 

#### New SCRIPTs. 
# A SCRIPT is like a word document or text file. It's a blank slate where all the code magic will happen. The console is still down below. 
# The KEY difference is that the script can be saved. The console DOES NOT GET SAVED, so DO NOT work here unless you don't 
# care about it. The console will show if your code runs properly, any warnings or errors, debug messages, etc. It is like 'live' code. 
####

#### ANNOTATING
# A good habit to get into is to always start your script with some REAL WORDS rather than code. Give it a title, a date, description, etc. 
# To annotate, start everything with a hash like you're hashtagging your life. 
# This is called ANNOTATION - there is no such thing as too much annotation when it comes to a script. It will save your butt and is important
# for transparency and understanding if you have to hand code off to someone else. ALWAYS, ALWAYS ANNOTATE! 
####

                                           # lets dive in! :)

#=====================#
# SIMPLE CALUCLATIONS #
#=====================#
# when we decide to run, or 'execute' code, do CTRL+ENTER in the script, but in the console can just hit ENTER. 
2+2                       
66*2
985/45
46*(5-3)
721^3
721=700                       # returns an error
382<926                       # TRUE (382 is smaller than 926)  
382>926                       # FALSE (382 is not larger than 926)  

# math operations (will come back to these more later) 
sqrt(75)                      # square-root
log(202)                      # natural log
log10(202)                    # base-10 log
mean(56 + 6 + 33)             # mean or average of the values 
mean(56, 6, 33)               # DOESN'T WORK: mean wants numbers separated by '+' not ','
sd()                          # standard deviation
sum(56 + 6 + 33)              # sum of these numbers    
sum(56, 6, 33)                # sum allows both '+' and ',' separaters  


#====================#
# DEFINING VARIABLES #
#====================#
# Defining (or 'assigning') a variable. you are storing a value (could be a number or a word) in a variable for quick access. 
# you might want to do this for values you use repeatedly throughout a script to keep it clean and easy to follow
# while doing this, keep an eye on your ENVIRONMENT (top right pane)
a <- 65                                     # the '<-' is the assigning code. It's like saying "a gets 65" 
b <- 3
x <- 9+9
y <- 645829.33
m <- "sox rocks"                            # i didn't do this during the lesson, but I wanted to show you that it doesn't have to be numbers
# To view the values of a, b, x, y, either look at your environment, or simply type them, for example:
a
b
x
y
m

# Try these variables in a formula
formula1 <- a+b                             # the sum of a+b is stored in 'formula1'
formula1          
formula2 <- ((a^b)-x)+y                     # the result of the more complex formula is stored in 'formula2'

# What if you want to remove formula2?
remove(formula2)                            # it is now missing from your environment


# If you make an error, simplty re-run the formula with the correction. It will be over-written
formula2 <- ((a^b)-x)+y                     # just copying this down from above to demonstrate the change. This is the 'wrong' formula
formula2 <- ((a*b)-x)+y                     # this is the 'right' formula - we have replaced '^' with '*'
# notice now in your environment that the value of 'formula2' has changed

# THINGS TO BE AWARE OF: 
## 1. R is case sensitive
Formula1 <- a+b                             # R stores this as a new, unqiue value. Even though 'formula1' and 'Formula1' have the same value, R senses the uppercase F and stores a new value.
formula1 <- A+B                             # Returns error. There is no such thing as 'A' or 'B', only 'a' and 'b'
## 2. There are some special words in R that you can't use for variable names - be aware of this incase you receive an error



##################################################################################################################################################



#=================#
# HOMEWORK: SWIRL #
#=================#

### What are PACKAGES? (we will review this again next week)
# a PACKAGE is what it sounds like - an amalgamation of code to perform some special analysis or purpose in R. Many packages exist
# packages have to be installed from the internet
# once a package is downloaded, it is on your computer until you delete it or uninstall R. To use the pacakage again in future, you do not need 
# an internet connection.
###

# SWIRL is an intro to R package that will guide you through different features and operations
# HIGHLY recommend Lesson 1 in swirl(). It is good review of what we did today and will introduce some concepts for next week

# To install the swirl package**        
####install.packages("swirl")                  
# once you run this piece of code, let R do its thing and download it. you should be left with a final line that says: "The downloaded binary packages are in C:\Users\..."
# ** MOST PEOPLE ALREADY DID THIS IN CLASS. If you did it already, DO NOT RUN THIS CODE AGAIN. 
# ** once you have run it once, you can put a # infront of it. This will keep the code so you don't forget how to do it again in future, but R
# ** won't run it as code. That is why mine is already annotated. 

# Now the package is downloaded on your computer, but you need to tell RStudio to open it. Use the library() request to do so. 
library(swirl)
# you should see console message that stars with "Hi! ..." 

# If you want to CLEAN YOUR ENVIRONMENT, simply click the broom icon at the top of the Environment pane 
# (it is to the right of 'Import Dataset', below "Connections")




########################## end of day 1 - YOU DESERVE A BEER! (or 5 hours of fishing...)






##################################################################################################################################################

#=================================#
# REVIEW OF WHAT WE LEARNED TODAY #
#=================================#

##### YOU CAN NOW: 
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
