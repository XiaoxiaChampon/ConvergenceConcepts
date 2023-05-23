# Title

Teaching and Student Exploration of Convergence Concepts Using Interactive Shiny Applications

## Abstract:

Convergence of random variables is a notoriously difficult concept for students to understand and for teachers to explain. We demonstrate three commonly taught convergence concepts: in distribution/law, in probability, and almost surely through the use of interactive Shiny Applications. After many years of teaching with static illustrations, these tools, which provide dynamic visuals of the concepts, were developed to help students better understand the intuition behind which characteristics of a random sequence are important for convergence properties. These tools allow for multiple random sequences with known features to be simulated and the behavior changes of the random sequences to be explored through visual representations. While convergence in probability is generally only taught in the theoretical courses for statistics majors, the convergence in distribution/law topic is taught in most introductory statistics courses (via the central limit theorem). These applications should be useful for both the introductory audience and the statistics focused audience, although the latter may find them more beneficial. We advocate the use of these tools and other visuals as a hands-on activity that can improve the conceptual understanding of these difficult topics by allowing the teacher and students to visually inspect the underlying attributes associated with the theoretical concepts.

## Goals:

The motivation of this activity is to encourage communicating these abstract topics with an interactive investigation focused on visuals that enhance intuition and understanding. 

Participants will see a demonstration of the tools and walk away with a number of examples they can use in their class as an activity or as homework assignments (with included walk-throughs highlighting ways to effectively use the tools). The application is freely hosted on our website so participants will be able to take advantage of this visualization tool without needing knowledge of any programming language. They can share this app with their students and peers that teach these topics. 


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
