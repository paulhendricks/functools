library(functools)
context("Any()")

test_that("Produces the correct output.", {
  expect_equal(Any(is.numeric, mtcars), TRUE)
  expect_equal(Any(is.character, mtcars), FALSE)
  expect_equal(Any(is.numeric, list(NA, "3", NULL)), FALSE)
  expect_equal(Any(is.numeric, list(NA, "3", NULL, 5)), TRUE)
  expect_equal(Any(is.numeric, list(NA, 3, NULL)), TRUE)
  expect_equal(Any(Identity, list(NA, FALSE)), NA)
  expect_equal(Any(Identity, list(NA, FALSE), na.rm = TRUE), FALSE)
})

test_that("Produces the correct output type.", {
  expect_is(Any(is.numeric, mtcars), "logical")
  expect_is(Any(is.character, mtcars), "logical")
  expect_is(Any(is.numeric, list(NA, "3", NULL)), "logical")
  expect_is(Any(is.numeric, list(NA, "3", NULL, 5)), "logical")
  expect_is(Any(is.numeric, list(NA, 3, NULL)), "logical")
  expect_is(Any(Identity, list(NA, FALSE)), "logical")
  expect_is(Any(Identity, list(NA, FALSE), na.rm = TRUE), "logical")
})

test_that("Produces the correct errors.", {
  expect_error(Any(mean, mtcars), "logical")
})
