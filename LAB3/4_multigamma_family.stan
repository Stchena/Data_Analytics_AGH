data {
    real mu;
    real sigma;
}

parameters {
    real y;
}

model {
    y ~ multi_normal(mu,sigma);
}