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


# 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(mapping = aes(linetype = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(size = 16), show.legend = FALSE) +
  geom_smooth(mapping = aes(group = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = drv), size = 1, show.legend = FALSE) +
  geom_smooth(mapping = aes(color = drv, group = drv), se = FALSE)



ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(color = "white", size = 3) +
  geom_point(mapping = aes(color = drv), size = 1)

# Note: we can use geom_bar to draw a bar graph
# Now, to display the functionality of bar plots, we will be using the pre-loaded 
# Diamonds dataset

# Also, interestingly, to add a title, we need another geom
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut)) +
  ggtitle("Diamond Cuts")+
  theme(plot.title = element_text(hjust = 0.5))
# The last line allows for centered alignment as the title is located on the left
# side by default

# Here, as for every bar plot, we see the groups on the bottom, and 
# the count on the left. 

# we can also achieve the same result by using stat_count
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

# However, there are cases in which we would use stat over a geom:
# For example
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
# Stat identity part corresponds to how will the data be transformed which 
# in this case is just a direct x - y relationship as our data already contains 
# the count values

# Then, to create even more customization, it is possible to override the 
# default stat and use something else. For example, to create a bar chart 
# of proportions, we would use the following:

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))


# Now, we can also create a graphical summary of the data:

# For example, the following graph is 
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min, # The following 3 features are constructed from the 
    fun.max = max, # y-values. That is, min, max, and med of depth
    fun = median
  )

# More stats can be found in official R cheat sheets

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))
# We must include group = 1 because otherwise, the geom assumes all 
# groups have the same y-value aka, height. 

# Now, we will add some color. 
# There are 2 ways that we can color our bar plot
# First, is coloring each bar with a different color to emphasize
# each group.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

# The second, is to color by a third argument. This will show what proportion 
# of each bar corresponds to each category of that third feature

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..count../sum(..count..), fill = color))

# As you can observe, the graph produced by the function above is stacked
# However, there are more options for how the rectangles are positioned
# we can change them by changing the positional argument:
# Note that it is not part of the aestetic

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..count../sum(..count..), fill = color),
                         position = "identity")
# However, this is not very useful for this type of barplots as the boxes are 
# put on top of each other

# We can see more of this by changing the alpha argument 
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..count../sum(..count..), fill = color),
           position = "identity", alpha = 0.5)
# Now, the overlap is more apparent

# There are a few ways to avoid this:
# Firstly, we can stack the columns not on top but beside each other. 
# that way we can compare individual columns within the stack as well

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# The position agrument is responsible for this way of stacking

# Also, we can have each feature stacked on top of others using fill
# agrument but that will make the bars of equal heights. Thus, is allows
# to compare what proportion of each bar goes to which feature.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# on scatter plots that we have built previously, the values are actually 
# rounded which decreases the amount of dots we see and it also changes
# the proportions we see as many dots now overlap. To change that, we need
# once again, chnage the positional argument:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# Note that this does not not-round the data but raher adds randomness to each point. 
# Hence, each individual dot is now visible and while it might create some innacuracies
# on a small scale, it allows us to find large collections of points on a large scale

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

ggplot(data = mpg, mapping = aes(x = cty, group = drv))+
  geom_boxplot()

# While by default there is a cartesian system assigned to the plots,
# there are other ones that can be applied when necessary. Example:

# coord_flip() flips the x and y coordinates, changing the orientation
# of the graph
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

# coord_polar() creates a round coordinate system. Visually, it allows 
# to exaggerate the proportions

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_polar()

# we can also use this to create a pie chart. We would only have to create pieces
# of equal radii. We can do that by setting theta="y"

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")


