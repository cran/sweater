// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// raw_cosine
double raw_cosine(const NumericVector& x1, const NumericVector& x2);
RcppExport SEXP _sweater_raw_cosine(SEXP x1SEXP, SEXP x2SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector& >::type x1(x1SEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type x2(x2SEXP);
    rcpp_result_gen = Rcpp::wrap(raw_cosine(x1, x2));
    return rcpp_result_gen;
END_RCPP
}
// cpp_g
double cpp_g(const String& c, CharacterVector& A, CharacterVector& B, NumericMatrix& glove_mat);
RcppExport SEXP _sweater_cpp_g(SEXP cSEXP, SEXP ASEXP, SEXP BSEXP, SEXP glove_matSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const String& >::type c(cSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type A(ASEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type B(BSEXP);
    Rcpp::traits::input_parameter< NumericMatrix& >::type glove_mat(glove_matSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_g(c, A, B, glove_mat));
    return rcpp_result_gen;
END_RCPP
}
// cpp_bweat
NumericVector cpp_bweat(CharacterVector& C, CharacterVector& A, CharacterVector& B, NumericMatrix& glove_mat);
RcppExport SEXP _sweater_cpp_bweat(SEXP CSEXP, SEXP ASEXP, SEXP BSEXP, SEXP glove_matSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< CharacterVector& >::type C(CSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type A(ASEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type B(BSEXP);
    Rcpp::traits::input_parameter< NumericMatrix& >::type glove_mat(glove_matSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_bweat(C, A, B, glove_mat));
    return rcpp_result_gen;
END_RCPP
}
// cpp_mac
NumericVector cpp_mac(CharacterVector& C, CharacterVector& A, NumericMatrix& glove_mat);
RcppExport SEXP _sweater_cpp_mac(SEXP CSEXP, SEXP ASEXP, SEXP glove_matSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< CharacterVector& >::type C(CSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type A(ASEXP);
    Rcpp::traits::input_parameter< NumericMatrix& >::type glove_mat(glove_matSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_mac(C, A, glove_mat));
    return rcpp_result_gen;
END_RCPP
}
// cpp_nas
NumericVector cpp_nas(String& c, CharacterVector& A, NumericMatrix& glove_mat);
RcppExport SEXP _sweater_cpp_nas(SEXP cSEXP, SEXP ASEXP, SEXP glove_matSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< String& >::type c(cSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type A(ASEXP);
    Rcpp::traits::input_parameter< NumericMatrix& >::type glove_mat(glove_matSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_nas(c, A, glove_mat));
    return rcpp_result_gen;
END_RCPP
}
// cpp_exact
double cpp_exact(NumericVector union_diff, double test_stat, int s_length);
RcppExport SEXP _sweater_cpp_exact(SEXP union_diffSEXP, SEXP test_statSEXP, SEXP s_lengthSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type union_diff(union_diffSEXP);
    Rcpp::traits::input_parameter< double >::type test_stat(test_statSEXP);
    Rcpp::traits::input_parameter< int >::type s_length(s_lengthSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_exact(union_diff, test_stat, s_length));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_sweater_raw_cosine", (DL_FUNC) &_sweater_raw_cosine, 2},
    {"_sweater_cpp_g", (DL_FUNC) &_sweater_cpp_g, 4},
    {"_sweater_cpp_bweat", (DL_FUNC) &_sweater_cpp_bweat, 4},
    {"_sweater_cpp_mac", (DL_FUNC) &_sweater_cpp_mac, 3},
    {"_sweater_cpp_nas", (DL_FUNC) &_sweater_cpp_nas, 3},
    {"_sweater_cpp_exact", (DL_FUNC) &_sweater_cpp_exact, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_sweater(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}