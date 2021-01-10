# To explore ggplot2, we will be working with the pre-loaded dataset mpg

# We will start by importing the library
library(stats)
library (tidyverse)




ggplot(data = mpg)
# This code creates an empty plot. 
# The ggplot() function creates the background of the plot, 
# but since no layers were specified with geom function, nothing is drawn.

# to count rows/columns, call nrow(data), ncol(data)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))
# Here, we see that cyl is a categorical variable

ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))
# I would say that this graph is not too useful because class is categorical and 
# not directly numbered so it doesn't mean to put any order to it
# it would make more sense to have it as a histogram


# the following function allows to see the exact values for each combination
# of 2 categorical data within a dataset:
count(mpg, drv, class)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))
# Here, we can see a more clear pattern between displ and hwy. For example, 
# the highest values of hwy have the combination of drv = f and displ < 2.
# using this feature we can understand more complex relationships between 
# the features.


# Note that if you want to change the general color, the feature color
# goes outside the aes part. For example:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# Using these features, we can display all data from the pre loaded
# data set Orange in one figure. 
ggplot(data = Orange) +
  geom_point(mapping = aes(x = age, y = circumference, color = Tree))

# Also, note that to check a collection of preinstalled data sets, run data()







