# cut code from r-intro-course
# KD 

##################################################################################################################################################
##################################################################################################################################################

# immediately we see it is for XY plotting, so scatterplots - no categorical or descriptive stuff, just good old fashioned x-y data. the rest of the
# description for now is above and beyond what we want to do, but essentially, there are a lot of different plot types, depending on what data 
# structure you are using. 
# scroll down, usage shows the format for the SYNTAX. Syntax, which is fancy for 'sentence structure' means just that - how our code is structured,
# is it separated by commas, is it "x,y" or "y~x" which you will see... elipses means "and more", but what is shown before "..." are some key
# arguments.

# ARGUMENTS is one of the most helpful places, it tells us all the arguments and parameters that can be fed to plot() to give
# us a desired result. we need the x and y arguments, but then there's a ton of other stuff we could use, like graphical parameters, the type of
# plot, etc. so lets try some 

# start with the example of the plot() function - self-explanatory, it would make a plot
plot(v1, v3)         # plot is an x,y or y~x plot.

# TO ASK R FOR HELP... ?plot
# lets look at ?plot to help us understand what this FUNCTION is and what ARGUMENTS it wants 


# lets specify a LINE plot, rename the xlab and ylab, change the line width (lwd), line type (lty), and colour
plot(v1, v3, type="l", xlab="Julian Date", ylab="Awesomeness")


# i am using this plot() simply as an example of a function, to outline arguments, and to access R help files. This is all in 'base R' so far, but
# there is a nice package called "ggplot" i'm going to introduce in a week or 2, it's way easier to plot in once you get the hang of it, so
# don't stress to memorize these exact details. 

##################################################################################################################################################
##################################################################################################################################################
