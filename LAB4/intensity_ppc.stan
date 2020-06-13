/* Passenger deaths 
Prior predictive checks with rate as product of intensity and miles flown
*/
data {
    real Intensity; //Intensity of deaths per mile flown
}

generated quantities {
    real alpha = normal_rng(692,180); // Previously used distribution of lambda
    real beta = lognormal_rng(0,1);  // Lognormal - more miles flown, more deaths expected
    int deaths = poisson_rng(Intensity*beta+alpha);
}