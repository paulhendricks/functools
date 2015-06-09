library(functools)
context("Testing Null() function")

test_that("Null() returns NULL", {
  expect_equal(Null(), NULL)
})
