library(functools)
context("Lapply()")

test_that("Produces the correct output.", {
  expect_equal(Lapply(Identity, 1:10), lapply(1:10, Identity))
})

test_that("Produces the correct output type.", {
  expect_is(Lapply(Identity, 1:10), "list")
})

test_that("Produces the correct errors.", {
  expect_error(Lapply(1:10, Identity))
})
