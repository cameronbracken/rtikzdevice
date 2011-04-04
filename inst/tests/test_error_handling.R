context('Test tikzDevice error and warning messages')

test_that('Device produces an error for unescaped characters',{

  expect_that(
    getLatexStrWidth('_'),
    throws_error('TeX was unable to calculate metrics')
  )

})

test_that('Device warns about the lower bound of the ASCII table',{

  expect_that(
    getLatexCharMetrics(31),
    gives_warning('only accepts numbers between 32 and 126!')
  )

})

test_that('Device warns about the upper bound of the ASCII table',{

  expect_that(
    getLatexCharMetrics(127),
    gives_warning('only accepts numbers between 32 and 126!')
  )

})

test_that("Device won't accept non-numeric ASCII codes",{

  expect_that(
    getLatexCharMetrics('a'),
    gives_warning('only accepts numbers')
  )

})

test_that('Device throws error when a path cannot be opened',{

  expect_that(
    tikz('/why/would/you/have/a/path/like/this.tex'),
    throws_error('path does not exist!')
  )

})

test_that('tikzAnnotate refuses to work with a non-tikzDevice',{

  expect_that(
    tikzAnnotate('test'),
    throws_error('The active device is not a tikz device')
  )
})