## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(sweater)
S1 <- c("math", "algebra", "geometry", "calculus", "equations",
 "computation", "numbers", "addition")
T1 <- c("poetry", "art", "dance", "literature", "novel", "symphony", "drama", "sculpture")
A1 <- c("male", "man", "boy", "brother", "he", "him", "his", "son")
B1 <- c("female", "woman", "girl", "sister", "she", "her", "hers", "daughter")

do_exact_weat <- function(n = 4) {
    sw <- weat(glove_math, S1[1:n], T1[1:n], A1[1:n], B1[1:n])
    weat_exact(sw)
}

require(bench)
benchmark_res <- bench::mark(do_exact_weat(2),
                             do_exact_weat(3),
                             do_exact_weat(4),
                             relative = TRUE)
benchmark_res

## -----------------------------------------------------------------------------
set.seed(11111)
S1 <- c("math", "algebra", "geometry", "calculus", "equations", "computation", "numbers", "addition")
T1 <- c("poetry", "art", "dance", "literature", "novel", "symphony", "drama", "sculpture")
A1 <- c("male", "man", "boy", "brother", "he", "him", "his", "son")
B1 <- c("female", "woman", "girl", "sister", "she", "her", "hers", "daughter")

sw <- weat(glove_math, S1, T1, A1, B1)
weat_resampling(sw)

