library(functools)
context("Testing Compact() function")

foo <- list(NULL, 1, 5, NULL)
test_that("Compact removes NULLs from lists", {
  expect_equal(Compact(foo), list(1, 5))
})
