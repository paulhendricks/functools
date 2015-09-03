library(functools)
context("Map()")

test_that("Produces the correct output.", {
  expect_equal(functools::Map(1:4, 4:1, .f = rep), base::Map(f = rep, 1:4, 4:1))
})
