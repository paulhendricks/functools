library(functools)
context("Existy()")


foo <- list(NA_integer_, TRUE, NA_character_, 1, NULL,
            "a", NA_complex_, 4.5, FALSE, NA_real_)
bar <- c(FALSE, TRUE, FALSE, TRUE, FALSE,
         TRUE, FALSE, TRUE, TRUE, FALSE)

test_that("Produces the correct output.", {
  expect_equal(unlist(Lapply(Existy, foo)), bar)
  expect_equal(Existy(NULL), FALSE)
  expect_equal(Existy(NA), FALSE)
  expect_equal(Existy(1), TRUE)
  expect_equal(Existy(2.4), TRUE)
  expect_equal(Existy("hello"), TRUE)
  expect_equal(Existy(FALSE), TRUE)
  expect_equal(Existy(TRUE), TRUE)
})

test_that("Produces the correct output type.", {
  expect_is(unlist(Lapply(Existy, foo)), "logical")
})

test_that("Produces the correct errors.", {
  expect_warning(Existy(Existy), "is.na() applied to non-(list or vector) of type 'closure'", fixed = TRUE)
})
