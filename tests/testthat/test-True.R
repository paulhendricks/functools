library(functools)
context("Testing True() function")

test_that("True() returns TRUE", {
  expect_equal(True(), TRUE)
})
