data {
    real<lower=0> n;
    real mu;
    real<lower=0> sigma;
}

parameters {
    real y;
}

model {
    y ~ student_t(n, mu, sigma);
}