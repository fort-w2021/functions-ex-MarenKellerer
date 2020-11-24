library(pryr)
library(testthat)
library(checkmate)

# a) ----------------------------------------------------------------------

# rewritten correlation function
set.seed(20141012)
x <- sample(x = c(1:10, NA), size = 20, replace = TRUE)
y <- runif(n = 20, min = 0, max = 1)
# min and max are the default values - not necessary
cor(x = x, y = y, use = "pairwise.complete.obs", method = "kendall")


# b) ----------------------------------------------------------------------


f1 <- function(x = {
  y <- 1
  2
}, y = 0) {
  x + y
}

# Funciton f1 has x and y as arguments, where x defines y. So if x is selected
# first, y is equal to 1. If y is selected first the second argument is used
# and y equals 0.

# This principle is called lazy evaluation.
# Inputs are evaluated only when they are actually used.
# Or in the order in which they are used.



# c) ----------------------------------------------------------------------


# Was gibt diese Funktion zurück? Warum? Welches Prinzip illustriert sie?

f2 <- function(x = z) {
  z <- 100
  x
}

# Function f2 returns the value x which is defined to be equal to z.
# If f2 has no manually set arguments it returns the value 100, otherwise
# it returns the value that was set manually in the funciton as argument.
# The reason is, that the default value is defined in terms of another
# argument.

# The principle is called lazy evaluation.




# d) ----------------------------------------------------------------------


# input: arguments of type logical
`%xor%` <- function(a, b) {

  # check for logical input
  assert(check_logical(a), check_logical(b), combine = "and")

  (a | b) & !(a & b)
}


testthat::test_file("test-functions-xor.R")




# e) ----------------------------------------------------------------------

# The state of options() and par() can be saved and restored by assigning the
# wanted value in the function to an object and add the function on.exit().
# The function on.exit() can save and restore the state of options() ad par()

opar <- par(no.readonly = TRUE)
on.exit(par(opar))

# This works analogous to options()



# f) ----------------------------------------------------------------------


# function that opens a PDF-Plot device, calls the arguments and closes the
# device no matter if the arguents worked for the function or not
plot_pdf <- function(...) {
  on.exit(dev.off())

  # do plotting
  plot(...)
}



# g) ----------------------------------------------------------------------


c <- 10
c(c = c)

# The code returns a vector with the name c and the value 10, because it's the
# vector function that uses the predefined value of c which is 10.
# Socend line: The first c is the vector function, the second c is the
# name of the element and the third c is the value predefined in the first line.
