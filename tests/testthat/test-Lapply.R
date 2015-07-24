library(functools)
context("Lapply()")

x <- data.frame(matrix(runif(10000), ncol = 5))
test_that("Produces the correct output.", {
  expect_equal(Lapply(Identity, x), lapply(x, Identity))
  expect_equal(Lapply(sum, x), lapply(x, sum))
  expect_equal(Lapply(mean, x, trim = 0.2), lapply(x, mean, trim = 0.2))
})

test_that("Produces the correct output type.", {
  expect_is(Lapply(Identity, x), "list")
  expect_is(Lapply(sum, x), "list")
  expect_is(Lapply(mean, x, trim = 0.2), "list")
})

test_that("Produces the correct errors.", {
  expect_error(Lapply(x, Identity))
  expect_error(Lapply(x, sum))
  expect_error(Lapply(x, mean, trim = 0.2))
})
