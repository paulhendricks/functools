library(functools)
context("Compact()")

foo <- list(NA_integer_, TRUE, NA_character_, 1, NULL,
            "a", NA_complex_, 4.5, FALSE, NA_real_)
bar <- list(TRUE, 1, "a", 4.5, FALSE)
test_that("Compact removes NULLs and NAs from lists", {
  expect_equal(Compact(bar), bar)
  expect_equal(Compact(foo), bar)
})
