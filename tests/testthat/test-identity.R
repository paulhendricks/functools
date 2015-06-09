library(functools)
context("Testing Identity() function")

test_that("Identity() returns itself", {
  expect_equal(Identity(Identity), Identity) # meta!
})
