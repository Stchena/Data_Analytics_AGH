data{
    real alpha;
    real beta;
}

generated quantities {
    int<lower=0>gamma_fam=gamma_rng(alpha,beta);
}