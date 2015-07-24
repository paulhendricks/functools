library(functools)
context("Mapply()")

test_that("Produces the correct output.", {
  expect_equal(Mapply(rep, 1:4, 4:1),
               mapply(rep, 1:4, 4:1))
  expect_equal(Mapply(rep, times = 1:4, x = 4:1),
               mapply(rep, times = 1:4, x = 4:1))
  expect_equal(Mapply(rep, times = 1:4, more_args = list(x = 42)),
               mapply(rep, times = 1:4, MoreArgs = list(x = 42)))
})

test_that("Produces the correct output type.", {
  expect_is(Mapply(rep, 1:4, 4:1), "list")
})

test_that("Produces the correct errors.", {
  expect_error(Mapply(1:4, 1:4, rep))
})
