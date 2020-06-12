data {
    real N;
    real p;
}

generated quantities {
    int<lower=0>nbinomial_fam=binomial_rng(N,p);
}