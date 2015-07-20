library(functools)
context("Always()")

test_that("Always() returns a function.", {
  expect_equal(class(Always(TRUE)), "function")
  expect_equal(typeof(Always(TRUE)), "closure")
})

test_that("Always() creates a function that always returns what was has been passed.", {
  expect_equal(Always(TRUE)(), TRUE)
  expect_equal(Always(FALSE)(), FALSE)
  expect_equal(Always("a")(), "a")
  expect_equal(Always(1L)(), 1L)
  expect_equal(Always(2.6)(), 2.6)
  expect_equal(Always(NULL)(), NULL)
  expect_equal(Always(NA)(), NA)
})



