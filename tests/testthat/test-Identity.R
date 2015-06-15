library(functools)
context("Identity()")

test_that("Identity() returns itself", {
  expect_equal(Identity(Identity), Identity) # meta!
})
