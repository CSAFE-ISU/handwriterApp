
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Quick Start

<!-- badges: start -->
<!-- badges: end -->

Handwriter is designed to assist forensic examiners by analyzing
handwritten documents against a closed set of potential writers. It
determines the probability that each writer wrote the document. Whether
you are a forensic document examiner, legal professional, academic, or
simply curious about how statistics are applied to handwriting,
handwriter provides an automated way to evaluate handwriting samples.

## Installation

Handwriter requires devtools, R, RStudio IDE, and JAGS.

- Install R from [CRAN](https://cran.r-project.org/)
- Install RStudio IDE from
  [POSIT](https://posit.co/download/rstudio-desktop/). Click Download
  RStudio.
- Install JAGS from
  [SourceForge](https://sourceforge.net/projects/mcmc-jags/files). Click
  Download.

Install the handwriterApp R package. Open RStudio and navigate to the
console window and type

``` r
install.packages("handwriterApp")
```

## Lauch the App

In the RStudio console, type

``` r
library(handwriterApp)
handwriterApp()
```

In the pop-up window, click Open in Browser. If you use the app in the
pop-up window instead of in a browser, some of the links will not work.

Follow the instructions in the app to view a demo or simulate casework
with real handwriting samples.
