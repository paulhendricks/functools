library(functools)
context("Testing Reject() function")

test_that("Reject() does something", {
  expect_equal(Reject(function(x) x < 5, 1:10), 5:10)
})
