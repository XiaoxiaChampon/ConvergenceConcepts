# To do

## 1/19/2023

### Abstract 
- Focus on same thing as the paper but perhaps with more application/focus on convergence in distribution.
- Sent on 25, chat about on the 26th, submit by the 29th


### What do we want to create/produce (bigger picture here)

- A set of notes with apps embedded created using R Markdown with shiny running in the background. 
    + I'd expect most people teaching these courses have experience in R and would have no issue modifying the notes as needed
    + We would also have our version available for use on our shiny server
- Add functionality to create sample paths one at a time to further visualize things (where applicable)
- Add sections on comparisons of exact and approximate distributions via PDF/PMF overlays (in addition to the comparisons of the CDFs)
    + Perhaps allow comparison of tail probabilities between these distributions as that is often what we find with CI/HT
- Generally, try to frame things with more application when we can
- Create video explanations using the notes/apps
- Get the package on CRAN
- Perhaps add more Monte Carlo simulation type things
    + Could make it a bit more general and look at things like confidence interval comparisons and alpha/power control via simulation
- Provide example projects/homework problems (but with more context if we can)
- Framework for infusing computing throughout the sequence (starting with basic probability calculation through simulation studies)

## 1/12/2023

- For next week: Read through things and determine what we want to add knowledge-wise

Original paper: https://www.tandfonline.com/doi/epdf/10.1198/tas.2009.0032?needAccess=true&role=button
Resources: 
- http://www.biostatisticien.eu/ConvergenceConcepts/
- https://ww2.amstat.org/meetings/jsm/2022/onlineprogram/ActivityDetails.cfm?SessionID=220799

Thoughts/Ideas:
- Share activities/R projects around these topics
- Put notes into a .Rmd file that can produce slides (also a version that is just a pdf or html output too)
- Example videos going through the apps
- Package on CRAN
- Shiny app
    - Add in better descriptions of what we should/will see in the shiny apps
    - Maybe hit a button after setting things up that show the sequences being generated and what you see
- HTML page with shiny apps running


# Shiny App for ConvergenceConcepts
This is a Shiny app for visualizing convergence almost surely, in probability and in distribution. It is based on R-packages ConvergenceConcepts. You will need to have the following packages installed:

```
install.packages(c("shiny", "ConvergenceConcepts","shinydashboard"))
```

After installing these, you can run the app from the R console using:

```
library("shinydashboard")
library("shiny") 
library("ConvergenceConcepts")
runGitHub("XiaoxiaChampon/ConvergenceConcepts")   
```
