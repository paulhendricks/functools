library(functools)
context("All()")

test_that("All() returns TRUE if a predicate function applied over an iterable returns all TRUE values", {
  expect_equal(All(is.numeric, mtcars), TRUE)
  expect_equal(All(is.character, mtcars), FALSE)
  #   expect_equal(All(All), TRUE)
  expect_equal(All(is.numeric, list(NA, "3", NULL)), FALSE)
  expect_equal(All(is.numeric, list(NA, "3", NULL, 5)), FALSE)
  expect_equal(All(is.numeric, list(NA, 3, NULL)), FALSE)
  expect_equal(All(Identity, list(NA, TRUE)), NA)
  expect_equal(All(Identity, list(NA, TRUE), na.rm = TRUE), TRUE)
})
