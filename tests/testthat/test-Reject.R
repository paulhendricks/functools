library(functools)
context("Reject()")

less_than_5 <- function(x) x < 5
more_than_m <- function(x) x > "m"
foo <- 1:10
test_that("Produces the correct output.", {
  expect_equal(Reject(foo, less_than_5),
               base::Filter(base::Negate(less_than_5), foo))
  expect_equal(Reject(letters, more_than_m),
               base::Filter(base::Negate(more_than_m), letters))
})

test_that("Produces the correct output type.", {
  expect_is(Reject(foo, less_than_5), "integer")
  expect_is(Reject(letters, more_than_m), "character")
})

test_that("Produces the correct errors.", {
  expect_error(Reject(less_than_5, foo))
  expect_error(Reject(more_than_m, letters))
})
