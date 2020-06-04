# R intro week 7
# tidyverse --> ggplot2! 
# 4-jun-2020
# kd and tv


# Same script start every time: 
##################################################################################################################################################

# set wd
setwd("~/Documents/ANALYSIS/Data")

# load packages
library(tidyverse)
library(xlsx)
library(openxlsx)

# read in data 
smolt_data <- read.xlsx("nautley_ANALYTICAL_database_2019.xlsx", sheet=3, detectDates=T)     # detect dates is important!!!!! 

# quickly view data!

##################################################################################################################################################



#                                                    ##################################
###################################################### 6. INTRO TO TIDYVERSE: ggplot2 #######################################################
#                                                    ##################################


##### What is ggplot2?
# A series of graphing functions that use language similar to dplyr and the rest of the tidyverse
# ggplot2 is specific to the tidyverse series of languages
# in base R, the function to make a graph is plot() or barplot()
# sometimes, base R can be a bit more flexible and streamlined for complicated plots, but you can always ultimately do all you can in base R in
# ggplot. 
# In ggplot, it's a lot clearer what is happening, and easier to work through to get a result. Plus, in my opinion, the graphs are much more 
# aesthetically pleasing! They also work with things like pipes and other dplyr verbs such as filter if you need to use those.
#####

##### What are the main components to a ggplot script?
# ggplot scrips have 3 main components or requirements: data, coordinates or a 'framework' (e.g., x and y), and a way to draw the data onto the 
# coordinates.
# ggplot works like photoshop, or for anyone with GIS background, like GIS layers when mapping.
# You use various functions part of the ggplot world stacked on top of each other to build a graph. 
# This also means that ggplot reads functions and lines of code IN THE ORDER THEY ARE WRITTEN - this is useful to remember, particularly for aesthetics 
#####

#=================#
# BUILD UP A PLOT #
#=================#
# start by using smolt_data to plot length ~ date


##### ESSENTIAL REQUIREMENTS 1-3: data, aes and a geom
# DATA: the foundation
ggplot(smolt_data)

# AESTHETICS: the framework/coordinates
ggplot(smolt_data, aes(x=date, y=length_mm))

# GEOM: how to visually draw the data
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point()

# GEOM: let's make the points prettier
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5)



##### ADDITIONAL REQUIREMENTS 4+: make it pretty

# SCALES: Those axes are a mess! Lets make better intervals for the x and y axis labels
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +
  ### ***SCROLL THROUGH ALL SCALE OPTIONS TO DEMONSTRATE THE NUMBER OF OPTIONS
  ### USE HELP FILES/PROMPTS TO PICK THE RIGHT ARGUMENTS****
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                # seq(from, to, by=interval)
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d")        # %b is the 3-letter month (e.g., 'Apr'), if you wanted numerical month it would be %m

# Next, lets use labs() to change the axis labels. This could probably go inside a theme() element, but labs() is soooo much easier!
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +       
  labs(x="Date", y="Length (mm)") 


# THEME: make text larger and all black
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +       
  labs(x="Date", y="Length (mm)") +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold"))

# THEME: Get rid of that ugly gray background
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) +
  theme_bw()    # prime example of how ggplot operates sequentially: theme_bw() has internal defaults, and has overwritten our previous theme() requests

# THEME: switch the order
ggplot(smolt_data, aes(x=date, y=length_mm)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 




#=======================================#
# PLOTTING BASED ON A GROUPING VARIABLE #
#=======================================#
# So we have our base plot of length~date, but within those individual fish there are different stocks. We should know how to represent
# these visually, because they aren't all the same. Maybe more patterns will become clear...

# STEP 1: add to the 'aes' instructions! 
ggplot(smolt_data, aes(x=date, y=length_mm, fill=NEWregion1)) +
  geom_point(size=3, shape=21, fill="blue", colour="black", stroke=1.5) +     # WHY DOESN'T THIS WORK? 
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 

ggplot(smolt_data, aes(x=date, y=length_mm, fill=NEWregion1)) +              
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +             # ggplot is sequential - must delete 'fill' from geom_point
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 
# This is OK, but stock ID isn't really a continuous variable, it's discrete, it's either A, B or neither.
# R has read in our data that the 'NEWregion1' ID is a numerical (continuous) value, because the IDs are initially given as numbers with NAs for
# blanks. We can quickly convert this in our plot by changing NEWregion1 to be a factor in our plot. 


# STEP 2: Convert grouping variable to a factor
ggplot(smolt_data, aes(x=date, y=length_mm, fill=as.factor(NEWregion1))) +         # as.factor()    
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +             
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 
# That's starting to look better, but those NAs are really harshing this plot's vibe...
# we can apply a quick filter() function to 'smolt_data'  WITHIN the ggplot function


# STEP 3: Apply filter() to data within ggplot()
# Note that if R read in your smolt_data so that NEWregion1 is a factor, you will have to use filter(NEWregion1 != "NA) instead
ggplot(smolt_data %>% filter(!is.na(NEWregion1)), aes(x=date, y=length_mm, fill=as.factor(NEWregion1))) +         # filter()   
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +             
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 


# STEP 4: THEME: Not a fan of where that legend is... lets put it on top for now, more out of the way
ggplot(smolt_data %>% filter(!is.na(NEWregion1)), aes(x=date, y=length_mm, fill=as.factor(NEWregion1))) +          
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +             
  scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold"),
    legend.position = "top") 


# ggplot is a really powerful tool for manipulating, summarizing and visualizing data relatively quickly (once you get the hang of it...)
# It has inifinite options to customize graphics however you want. *soooo many different theme packages exist*

# But using pipes and as.factor() arguments in the plot code gets clustered
# you can also do all of your data manipulation/pipe operations using dplyr, and then save the final product in a dataframe to plot.



#=========================#
# EXAMPLE: PIPES TO PLOTS #
#=========================#

# PIPE: Pulling an example of a summarized dataset from last week! - this is what we will use to plot! 
gsi_length <- smolt_data %>% 
  select(ufid:prob1, age:lab_identifier) %>%                                                      # note now that we have done group_by() and summarize(), select isn't really needed anymore
  filter(age==1 & prob1>=0.8 & !is.na(NEWregion1)) %>% 
  group_by(date, NEWregion1) %>%                                                                  # note order specified impacts column order
  summarize(mean_length = mean(length_mm, na.rm=T), sd_length = sd(length_mm, na.rm=T)) %>%       # remember to add na.rm=T to ignore days where no lengths taken
  mutate(NEWregion1 = ifelse(NEWregion1==4, "Nadina", "Stellako")) %>%                            # here, only 1 ifelse() statement works because there are only 2 levels in NEWregion1 - we got rid of the NAs in NEWregion1 using filter
  arrange(date, desc(NEWregion1)) %>%
  print()



# PLOT: Mean length~date for the two stocks
ggplot(gsi_length, aes(x=date, y=mean_length, fill=NEWregion1)) +          
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +
  scale_y_continuous(breaks = seq(80, 140, by=20)) +              # NOTE NOW Y SCALE ISNT GOOD - HASH IT OUT     
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 

# Scales: ignore y scale
ggplot(gsi_length, aes(x=date, y=mean_length, fill=NEWregion1)) +          
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +
  #scale_y_continuous(breaks = seq(80, 140, by=20)) +                   
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold")) 

# GEOMs: we should add error bars to our plot
ggplot(gsi_length, aes(x=date, y=mean_length, fill=NEWregion1)) +          
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +
  geom_errorbar(aes(ymax=mean_length+sd_length, ymin=mean_length-sd_length)) +
  #scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold"))

# GEOMs: order is gross, lets put it behind the points 
ggplot(gsi_length, aes(x=date, y=mean_length, fill=NEWregion1)) + 
  geom_errorbar(aes(ymax=mean_length+sd_length, ymin=mean_length-sd_length)) +
  geom_point(size=3, shape=21, colour="black", stroke=1.5) +
  #scale_y_continuous(breaks = seq(75, 200, by=25)) +                
  scale_x_date(date_breaks = "5 day", date_labels = "%b %d") +      
  labs(x="Date", y="Length (mm)") +
  theme_bw() +
  theme(axis.text = element_text(size=12, colour="black"),
    axis.title = element_text(size=15, face="bold"))




#====================#
# EXPORTING GRAPHICS # 
#====================#

##### For low-res exported graphics: 
# Export > Copy to clipboard
# Export > Save as Image
# Screen shot of R window and crop 
# Snip tool of R window and crop
#####

##### For high-res exported graphics:   (HEAD ACHE)
# Export > Save as PDF
# Open PDF
# Snip tool 
# Copy into word document
#####



# // end INTRO TO GGPLOT2! GO DRINK BEERZzz AND EAT CHiPzZZzz



#------------------------------------------------------------------------------------------------------------------------------------------------
#==========================#
# END OF SECTION 6 SUMMARY #
#==========================#

##### Section 6 summary: 
# Know that ggplot2 and ggplot are the same thing
# Know the three key requirements for a plot 
# Know how to call a dataframe into ggplot
# Know how to use aesthetics or coordinates to assign the framework
# Know how to use geometries to draw data, and how to customize within geoms (size, shape, etc.)
# Know that there are many other geometries out there 
# Apply additional scales to manually adjust axes
# Use themes to customize the final visual touches
# Have a knowledge that stat_() functions exist
# String together multiple ggplot functions using +
#####
#------------------------------------------------------------------------------------------------------------------------------------------------



##################################################################################################################################################
##################################################################################################################################################












