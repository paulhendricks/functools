library(functools)
context("All()")

test_that("Produces the correct output.", {
  expect_equal(All(is.numeric, mtcars), TRUE)
  expect_equal(All(is.character, mtcars), FALSE)
  expect_equal(All(is.numeric, list(NA, "3", NULL)), FALSE)
  expect_equal(All(is.numeric, list(NA, "3", NULL, 5)), FALSE)
  expect_equal(All(is.numeric, list(NA, 3, NULL)), FALSE)
  expect_equal(All(Identity, list(NA, TRUE)), NA)
  expect_equal(All(Identity, list(NA, TRUE), na.rm = TRUE), TRUE)
})

test_that("Produces the correct output type.", {
  expect_is(All(is.numeric, mtcars), "logical")
  expect_is(All(is.character, mtcars), "logical")
  expect_is(All(is.numeric, list(NA, "3", NULL)), "logical")
  expect_is(All(is.numeric, list(NA, "3", NULL, 5)), "logical")
  expect_is(All(is.numeric, list(NA, 3, NULL)), "logical")
  expect_is(All(Identity, list(NA, TRUE)), "logical")
  expect_is(All(Identity, list(NA, TRUE), na.rm = TRUE), "logical")
})

test_that("Produces the correct errors.", {
  expect_error(All(mean, mtcars), "logical")
})

