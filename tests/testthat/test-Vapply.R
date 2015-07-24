library(functools)
context("Vapply()")

x <- runif(10000)
test_that("Produces the correct output.", {
  expect_equal(Vapply(function(x) x * x, x, numeric(1)),
               vapply(x, function(x) x * x, numeric(1)))
})

test_that("Produces the correct output type.", {
  expect_is(Vapply(Identity, 1:10, integer(1)), "integer")
  expect_is(Vapply(Identity, seq(0, 1, by = 0.2), numeric(1)), "numeric")
  expect_is(Vapply(Identity, letters, character(1)), "character")
  expect_is(Vapply(Identity, c(NA, TRUE, FALSE), logical(1)), "logical")
})

test_that("Produces the correct errors.", {
  expect_error(Vapply(x, Identity))
})
