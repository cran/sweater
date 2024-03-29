#' Embedding Coherence Test
#'
#' This function estimate the Embedding Coherence Test (ECT) of word embeddings (Dev & Philips, 2019). If possible, please use [query()] instead.
#'
#' @inheritParams weat
#' @return A list with class `"ect"` containing the following components:
#' * `$A_words` the input A_words
#' * `$B_words` the input B_words
#' * `$S_words` the input S_words
#' * `$u_a` Cosine similarity between each word vector of S_words and average vector of A_words
#' * `$u_b` Cosine similarity between each word vector of S_words and average vector of B_words
#' @seealso
#' [ect_es()] can be used to obtain the effect size of the test.
#' [plot_ect()] can be used to visualize the result.
#' @examples
#' data(googlenews)
#' S1 <- c("janitor", "statistician", "midwife", "bailiff", "auctioneer",
#' "photographer", "geologist", "shoemaker", "athlete", "cashier", "dancer",
#' "housekeeper", "accountant", "physicist", "gardener", "dentist", "weaver",
#' "blacksmith", "psychologist", "supervisor", "mathematician", "surveyor",
#' "tailor", "designer", "economist", "mechanic", "laborer", "postmaster",
#' "broker", "chemist", "librarian", "attendant", "clerical", "musician",
#' "porter", "scientist", "carpenter", "sailor", "instructor", "sheriff",
#' "pilot", "inspector", "mason", "baker", "administrator", "architect",
#' "collector", "operator", "surgeon", "driver", "painter", "conductor",
#' "nurse", "cook", "engineer", "retired", "sales", "lawyer", "clergy",
#' "physician", "farmer", "clerk", "manager", "guard", "artist", "smith",
#' "official", "police", "doctor", "professor", "student", "judge",
#' "teacher", "author", "secretary", "soldier")
#' A1 <- c("he", "son", "his", "him", "father", "man", "boy", "himself",
#' "male", "brother", "sons", "fathers", "men", "boys", "males", "brothers",
#' "uncle", "uncles", "nephew", "nephews")
#' B1 <- c("she", "daughter", "hers", "her", "mother", "woman", "girl",
#' "herself", "female", "sister", "daughters", "mothers", "women", "girls",
#' "females", "sisters", "aunt", "aunts", "niece", "nieces")
#' garg_f1 <- ect(googlenews, S1, A1, B1)
#' plot_ect(garg_f1)
#' @references
#' Dev, S., & Phillips, J. (2019, April). [Attenuating bias in word vectors.](https://proceedings.mlr.press/v89/dev19a.html) In The 22nd International Conference on Artificial Intelligence and Statistics (pp. 879-887). PMLR.
#' @export
ect <- function(w, S_words, A_words, B_words, verbose = FALSE) {
    w_lab <- rownames(w)
    A_cleaned <- .clean(A_words, w_lab, verbose = verbose)
    B_cleaned <- .clean(B_words, w_lab, verbose = verbose)
    S_cleaned <- .clean(S_words, w_lab, verbose = verbose)
    vec_a <- matrix(apply(w[A_cleaned, , drop = FALSE], 2, mean), 1, byrow = TRUE)
    vec_b <- matrix(apply(w[B_cleaned, , drop = FALSE], 2, mean), 1, byrow = TRUE)
    sim_res_a <- as.vector(proxy::simil(y = vec_a, x = w[S_cleaned, , drop = FALSE], method = "cosine"))
    names(sim_res_a) <- S_cleaned
    sim_res_b <- as.vector(proxy::simil(y = vec_b, x = w[S_cleaned, , drop = FALSE], method = "cosine"))
    names(sim_res_b) <- S_cleaned
    P <- matrix(c(sim_res_a, sim_res_b), nrow = 2, ncol = length(S_cleaned), byrow = TRUE)
    colnames(P) <- S_cleaned
    rownames(P) <- c("A_words", "B_words")
    res <- list(P = P, u_a = sim_res_a, u_b = sim_res_b, S_words = S_cleaned, A_words = A_cleaned, B_words = B_cleaned)
    class(res) <- append(c("sweater", "ect"), class(res))
    return(res)
}

#' Calculate the Spearman Coefficient of an ECT result
#'
#' This functions calculates the Spearman Coefficient of an Embedding Coherence Test. The value ranges from -1 to +1 and a larger value indicates less bias. If possible, please use [calculate_es()] instead.
#' @param x an ect object from the [ect()] function.
#' @return Spearman Coefficient
#' @references
#' Dev, S., & Phillips, J. (2019, April). [Attenuating bias in word vectors.](https://proceedings.mlr.press/v89/dev19a.html) In The 22nd International Conference on Artificial Intelligence and Statistics (pp. 879-887). PMLR.
#' @export
ect_es <- function(x) {
    if (!"ect" %in% class(x)) {
        stop("x is not created with ect().", call. = FALSE)
    }
    res <- stats::cor(x$u_a, x$u_b, method = "spearman")
    res
}

#' Plot an ECT result on a two-dimensional plane
#'
#' This functions plot the words in `S_words` on a 2D plane according to their association with the average vectors of `A_words` and `B_words`. A equality line is also added. Words along the equality line have less bias. Words located on the upper side of the equality line have a stronger association with `A_words` and vice versa.
#' @param x an ect object from the [ect] function.
#' @param ... additional parameters to the underlying [plot()] function
#' @return a plot
#' @export
plot_ect <- function(x, ...) {
    if (!"ect" %in% class(x)) {
        stop("x is not created with ect().", call. = FALSE)
    }
    plot(x = rank(x$u_a), y = rank(x$u_b), type = "n", xlab = "Association Ranking: A_words", ylab = "Association ranking: B_words")
    text(x = rank(x$u_a), rank(x$u_b), labels = x$S_words)
    abline(a = 0, b = 1, lty = 2, col = "grey")
}
