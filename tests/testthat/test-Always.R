library(functools)
context("Always()")

test_that("Always() returns a function.", {
  expect_equal(class(Always(TRUE)), "function")
  expect_equal(typeof(Always(TRUE)), "closure")
})

test_that("Always() does something.", {


})



