\name{GenerateToyData}
\alias{GenerateToyData}
\title{Generate toy data for ensemble verification.}
\description{
Generate synthetic ensemble and observation data, using a latent variable model. See Details.
}
\usage{
GenerateToyData(N = 20, mu.y = 0, s.s = 7, s.eps = 6, 
mu.x = 0, beta = 0.2, s.eta = 8, K = 10, 
mu.x.ref = NA, beta.ref = NA, s.eta.ref = NA, K.ref = NA)
}
\arguments{
  \item{N}{number of forecasts and observations}
  \item{mu.y}{expectation value of the observations}
  \item{s.s}{standard deviation of the predictable signal}
  \item{s.eps}{standard deviation of the unpredictable noise}
  \item{mu.x}{expectation value of the ensemble}
  \item{beta}{weighting parameter of the signal in the ensemble forecasting system}
  \item{s.eta}{average spread of the ensemble}
  \item{K}{number of members of the ensemble}
  \item{mu.x.ref}{expectation value of the reference ensemble}
  \item{beta.ref}{weighting parameter of the signal in the reference ensemble forecasting system}
  \item{s.eta.ref}{average spread of the reference ensemble}
  \item{K.ref}{number of members of the reference ensemble}
}
\value{
  A list with elements:

  "obs": N-vector of observations

  "ens": N*K matrix of ensemble members

  "ens.ref": N*K.ref matrix of reference ensemble members
}
\details{
  The function simulates data from the latent variable model:

    y_t   = mu_y +     s_t    + eps_t

    x_t,r = mu_x + beta * s_t + eta_t,r

where y_t is the observation at time t, and x_t,r is the r-th ensemble member at time t. The latent variable s_t is to be understood as the "predictable signal" that is generates correlation between observations and ensemble members. If all arguments that end in ".ref" are specified, a reference ensemble is returned.
}
\examples{
  l <- GenerateToyData()
  with(l, EnsCrps(ens, obs))
}

