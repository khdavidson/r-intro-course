# R intro course
# week 3 - functions, arguments, help, starting a script 
# KD and TV 
# 30 Apr 2020



# Recall the 2 major components or pillars of R we are centered around for the intro with these basics: 
# 1: The 'underlying' structure of code, data and variables in r                      THIS WAS WEEK 1 (APR 16) AND WEEK 2 (APR 23)
# 2: Compilations/operations on data by FUNCTIONS (and ARGUMENTS)                     THIS WAS TODAY (APR 30)




                                                     ######################################
###################################################### 2. FUNCTIONS, ARGUMENTS and R HELP #########################################################
                                                     ######################################


# We now start on PILLAR 2! Functions, Arguments and R Help files.

#### Next definition: FUNCTION
# Anything in R that is a word followed by () is a function. 
# set of statements (or arguments) organized together to perform a specific task - you pass control to the function by giving it the arguments that 
# are necessary for the function to accomplish the action 
# The function performs its task and returns control to the interpreter, as well as a result which can be stored as a new variable/object 
# R has tons of in-built functions or you can create your own 
#
# The different parts of a function are: 
# Function Name − This is the actual name of the function 
# Arguments − An argument is a placeholder. When a function is invoked, you pass a value to the argument. 
#             Arguments are optional; that is, a function may contain no arguments. Also arguments can have default values.
# Function Body − The function body contains a collection of statements that defines what the function does.
# Return Value − The return value of a function is the last expression in the function body to be evaluated.
# 
#### What are ARGUMENTS? 
# Arguments are the pieces of information you give a function to make it work. They are the pieces of information written within the ().  
# Luckily for us, EVERY function in R comes with HELP documentation. These help files will tell us what arguments we need to pass to the function
# so that we don't have to memorize it! 
#### 


#===========#
# FUNCTIONS #
#===========#
# We have already used functions! Recall, anything in R that is a word followed by () is a function! 
c()                              # This is the VECTOR function, but there are currently no arguments in the ()
matrix()                         # This is the MATRIX function, but there are currently no arguments in the ()
mean()                           # This is the MEAN function, but there are currently no arguments in the ()
sum()                            # This is the SUM function, but there are currently no arguments in the ()
# It is hard to know how to fill in a function... what arguments do we need? This is different for every function and is a lot to remember...
## enter R help! 


#========#
# R HELP #
#========#
# To ask R for help with filling these functions with ARGUMENTS, type '?functionname'
?c()                             # This is how to access the help file for the vector function  
?matrix()                        # This is how to access the help file for the matrix function


#======================#
# R HELP and ARGUMENTS #
#======================#

# Let's get acquainted with the layout of the R help documentation
# start with 
?matrix()

# AT THE TOP we see the function we are asking about, followed by what {package} it came from 

# The DESCRIPTION and TITLE should tell you a fair bit about what is going on. 
# TITLE: Matrices. Simple, thank you R
# DESCRIPTION: There are a few descriptions here depending on what specific function we are using. We are using matrix(), which creates a matrix 
# from the given set of values. That's us! How do we give it those values though? 

# Usage shows the format for the syntax. 

#### WHAT IS SYNTAX
# SYNTAX is a fancy word for 'sentence structure' or 'code structure' 
# It means just that - how our code is structured. Is it separated by commas, like 'x,y', or like a formula, 'y~x' (which you might see later)?
####


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



#==========#
# PRACTICE # 
#==========#

#1. Make a 10x10 matrix filled with consecutive numerical values starting with 1
matrix(nrow=10, ncol=10, 1:100)

#2. Make a 2x3 (hint: [2,3]) matrix filled with the names of star wars characters: 
# yoda, luke, darth vader, han, leia, chewy
matrix(nrow=2, ncol=3, c('yoda', 'luke', 'darth vader', 'han', 'leia', 'chewy'))


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



################################# end of WEEK 3! You deserve a beer (or 5 naps...)



##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################

