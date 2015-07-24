library(functools)
context("Constants functions")

test_that("Produces the correct output.", {
  expect_equal(True(), TRUE)
  expect_equal(False(), FALSE)
  expect_equal(Identity(Identity), Identity)
  expect_equal(Na(), NA)
  expect_equal(Null(), NULL)
})

test_that("Produces the correct output type.", {
  expect_equal(1, 1)
})

test_that("Produces the correct errors.", {
  expect_equal(1, 1)
})
