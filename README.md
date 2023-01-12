# To do

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
