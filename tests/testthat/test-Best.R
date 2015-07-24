library(functools)
context("Best()")

test_that("Produces the correct output.", {
  expect_equal(Best(function(x, y) return(x > y), 1:10), 10)
  expect_equal(Best(function(x, y) return(x < y), 1:10), 1)
  expect_equal(Best(function(x, y) return(x[1] == "l"), letters), "l")
})

test_that("Produces the correct output type.", {
  expect_is(Best(function(x, y) return(x > y), 1:10), "integer")
  expect_is(Best(function(x, y) return(x < y), 1:10), "integer")
  expect_is(Best(function(x, y) return(x[1] == "l"), letters), "character")
})

test_that("Produces the correct errors.", {
  expect_error(Best(function(x, y, z) return(y < z), 1:10))
})

