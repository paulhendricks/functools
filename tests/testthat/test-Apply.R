library(functools)
context("Apply()")

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]

test_that("Produces the correct output.", {
  expect_equal(Apply(mean, x, 2, trim = 0.2), apply(x, 2, mean, trim = 0.2))
})

test_that("Produces the correct output type.", {
  expect_is(Apply(mean, x, 2, trim = 0.2), "numeric")
})

test_that("Produces the correct errors.", {
  expect_error(Apply(x, 2, mean, trim = 0.2))
})
