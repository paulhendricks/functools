library(functools)
context("Memoise()")

x <- round(runif(100, 0, 100))
runif_memoised <- Memoise(runif)

test_that("Produces the correct output.", {
  expect_equal(runif_memoised(100), runif_memoised(100))
})

test_that("Produces the correct output type.", {
  expect_is(Memoise(Identity), "function")
})

test_that("Produces the correct errors.", {
  expect_error(Memoise()())
})
