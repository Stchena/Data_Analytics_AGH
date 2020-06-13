generated quantities {
    // using wide deviation since PD numbers are scattered between <223,1066>
    real lambda = normal_rng(692,180);
    int deaths = poisson_rng(lambda);
}