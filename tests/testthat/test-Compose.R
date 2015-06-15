library(functools)
context("Compose()")

lu <- Compose(length, unique)
test_that("Compose() returns a function composed of two functions", {
  expect_equal(lu(c(1:10, 5:15, 20:25)), 21)
})

III <- Compose(Identity, Identity, Identity)
test_that("Compose() returns a function", {
  expect_is(III, "function")
})
