library(functools)
context("Testing Existy() function")

test_that("Existy removes NULLs from lists", {
  expect_equal(Existy(NULL), FALSE)
  expect_equal(Existy(NA), FALSE)
#   expect_equal(Existy(Existy), TRUE)
  expect_equal(Existy(1), TRUE)
  expect_equal(Existy(2.4), TRUE)
  expect_equal(Existy("hello"), TRUE)
  expect_equal(Existy(FALSE), TRUE)
  expect_equal(Existy(TRUE), TRUE)
})
