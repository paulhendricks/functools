library(functools)
context("Testing Any() function")

test_that("Any() returns TRUE if a predicate function applied over an iterable returns any TRUE values", {
  expect_equal(Any(is.numeric, mtcars), TRUE)
  expect_equal(Any(is.character, mtcars), FALSE)
  #   expect_equal(Any(Any), TRUE)
  expect_equal(Any(is.numeric, list(NA, "3", NULL)), FALSE)
  expect_equal(Any(is.numeric, list(NA, "3", NULL, 5)), TRUE)
  expect_equal(Any(Identity, list(NA, FALSE)), NA)
  expect_equal(Any(Identity, list(NA, FALSE), na.rm = TRUE), FALSE)
})
