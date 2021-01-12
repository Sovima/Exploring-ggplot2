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

# Also, note that to check a collection of pre-installed data sets, run data()


# Now, we can split the data even further by making a separate graph for each of the
# value for some discrete feature. Note that after ~, we write a function, and we use 
# nrow to have a better split data
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# Also, I would like to check if that allows for custom data selection
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ (year > 1999), nrow = 1)
# From the produced graph we can see that I was right and this way we can split
# the data into more custom parts

# Now we can also facet on 2 features
# Note that to use this feature, we have to use facet_grid and
# not facet_wrap like in the case with 1 variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# Also, you can use . to display the graphs in cols/rows
# In this case, the first feature represents the columns and second is rows 
# thus, by putting cyl in the second part, we say that we would like the graphs 
# to be displayed in a row.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ .)


# Now, we can create graphs with different geoms, aka, different
# types of graphs

# for example, a scatterplot is created with geom_point
# a fitted line can be drawn using geom_smooth
# Example:

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Observe that there are aestetics in _smooth that _point does not have.
# For example, linetype. Thus, you have to carefully "study" each geom before using it
# the list of all geoms with their aes features can be found in https://exts.ggplot2.tidyverse.org/gallery/

# Also, we can layer different geoms on top of each other:
ggplot(mapping = aes(x = displ, y = hwy), data = mpg) + 
  geom_point() +
  geom_smooth(color = "red")

# There is a WARNING coming up that I don't know how to fix yet but the graph looks correct


# If you don't feel like coloring each category, you can use the feature group:

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))


# However, this might introduce conflicts and duplicates as to change 1 value
# for example, x we woul have to change it everywhere it appears in the code.
# to avoid this, we can collect all common information in the ggplot part:

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# this doesn't mean you can include any custom aestetics
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class), show.legend = FALSE) + 
  geom_smooth()

# Note that the local argument overrides the global argument.

# Now, we can combine different data sets(data features) in the same graph
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# So, I was a bit confused at first but I figured it out. In geom_smooth we still keep the aes part
# as indicated in ggplot because it is not overwritten. However, we overwrite the data variable,
# creating a smooth line only for data where class == "subcompact". Also se = FALSE tells us to
# not display the confidence interval. 

# You can use other geoms as well
ggplot(data = mpg) +
  geom_line(mapping = aes(x = displ, y = hwy))

# Bar doesn't have y value as it's based on count
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = displ))

ggplot(data = mpg) +
  geom_rug(mapping = aes(x = displ, y = hwy))

# After examining the graph, it looks like this geom displayes the density of each
# feature on the side of the graph. Hence, it would make sense to combine it with 
# the point geom. Example:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  geom_rug()

# I think this would be most useful when height-wise density is important. For example,
# like in DNA gel electrophoresis analysis. 
