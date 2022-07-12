library(rlang)

stop("This is what an error looks like!")

warning("This is what a warning looks like")

message("This is what a message looks like")

f <- function() g()
g <- function() h()
h <- function() stop("This is an error")

f()

# set `call. = FALSE` since you can always use `traceback()`:
h <- function() stop("This is an error", call. = FALSE)

f()
traceback()

h <- function() abort("This is an error")

f()


