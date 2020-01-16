test_that("test str2regex", {
  expect_equal(str2regex("this,is,an,apple"), "^this|^is|^an|^apple")
  expect_equal(str2regex("this,is,an,apple", start = "", end = ""), "this|is|an|apple")
  expect_equal(str2regex("123456,234567,345678,456789", sub = 4), "^1234|^2345|^3456|^4567")
  expect_equal(str2regex("a,  b,  c,  d,  e"), "^a|^b|^c|^d|^e")
  expect_equal(str2regex("a&b&c&d&e", sep = "&"), "^a|^b|^c|^d|^e")
})
