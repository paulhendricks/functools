library(functools)
context("Null()")

test_that("Null() returns NULL", {
  expect_equal(Null(), NULL)
})
