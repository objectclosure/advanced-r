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


# warnings----
fw <- function() {
  cat("1\n")
  warning("W1")
  cat("2\n")
  warning("W2")
  cat("3\n")
  warning("W3")
}

fw()
# by default warnings appear after control returns to top level

# to make warnings appear immediately:
options(warn = 1)
fw()

# to convert warnings to errors:
options(warn = 2)
fw()

# restore default behaviour:
options(warn = 0)
fw()

# messages----
fm <- function() {
  for (i in seq_len(3)) {
    cat(i, "\n")
    message("M", i)
  }
}

fm()
