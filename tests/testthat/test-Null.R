library(functools)
context("Testing Null() function")

test_that("Null() returns TRUE", {
  expect_equal(Null(), NULL)
})
