library(functools)
context("True()")

test_that("True() returns TRUE", {
  expect_equal(True(), TRUE)
})
