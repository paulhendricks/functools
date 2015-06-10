library(functools)
context("Testing Compose() function")

lu <- Compose(length, unique)
test_that("Compose() returns a function composed of two functions", {
  expect_equal(lu(c(1:10, 5:15, 20:25)), 21)
})
