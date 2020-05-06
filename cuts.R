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










