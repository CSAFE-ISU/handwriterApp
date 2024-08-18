# Welcome


Handwriter is designed to assist forensic examiners by analyzing
handwritten documents against a *closed set* of potential writers. It
determines the probability that each writer wrote the document. Whether
you are a forensic document examiner, legal professional, academic, or
simply curious about how statistics are applied to handwriting,
handwriter provides an automated way to evaluate handwriting samples.

# Quick Start

## View a Demo

View a demo of handwriter on handwritten documents from the CSAFE
Handwriting Database. Go to
[demo](https://csafe.shinyapps.io/handwriterAppDemo/).

## Simulate Casework with Example Documents

### Installation

Handwriter requires R, RStudio IDE, and JAGS.

-   Install R and RStudio from
    [POSIT](https://posit.co/download/rstudio-desktop/)
-   Install JAGS from
    [SourceForge](https://sourceforge.net/projects/mcmc-jags/files/)

### Launch the App

Open RStudio, navigate to the console window, and type:

``` r
install.packages("devtools")
devtools::install_github("CSAFE-ISU/handwriterApp")
library(handwriterApp)
handwriterApp()
```

In the pop-up window, click **Open in Browser**. If you use the app in
the pop-up window instead of in a browser, some links will not work.

Click **Simulate Casework** and follow the instructions in the app.
