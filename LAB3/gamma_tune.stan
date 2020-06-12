functions {
  vector tail_delta(vector y,       //unknowns
                    vector tq,   //parameters
                    real[] x_r,     
                    int[] x_i) {
    vector[2] deltas;
    // distribution from 5 to 10 with 98% probability
    deltas[1] = gamma_cdf(tq[1], y[1], y[2]) - 0.99;
    deltas[2] = gamma_cdf(tq[2], y[1], y[2]) - 0.01;
    return deltas;
  }
}

data {
  vector<lower=0>[2] y_guess; // Initial guess of gamma standard deviation
  vector<lower=0>[2] tq;   // Target quantile
}

transformed data {
  vector[2] y;
  real x_r[0];
  int x_i[0];

  // Find gamma parameters that ensure 98% probabilty from 5 to 10
  y = algebra_solver(tail_delta, y_guess, tq, x_r, x_i, 1e-10, 1e-3, 1e3);

  print("Alpha  = ", y[1]);
  print("Theta = ", y[2]);
}

generated quantities {
  real alpha = y[1];
  real theta = y[2];
}