library(functools)
context("Best()")

test_that("Best() evaluates correctly.", {
  expect_equal(Best(function(x, y) return(x > y), 1:10), 10)
  expect_equal(Best(function(x, y) return(x < y), 1:10), 1)
  expect_equal(Best(function(x, y) return(x[1] == "l"), letters), "l")
})
