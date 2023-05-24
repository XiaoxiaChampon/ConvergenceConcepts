## Internal Notes

Taking this out of the .Rmd for now

## Example problems (with solution)
- **Basic CLT problem**
- **Norm approx to poisson for large mean parameter (hint about using CLT)**
- **Example Binomial convergence to a Poisson**
- [Reference](https://www.probabilitycourse.com/chapter7/7_2_4_convergence_in_distribution.php): Let $X_1, X_2, X_3, X_4, \cdots$ be a sequence of random variable such that
    $$F_{X_n}(x)=\begin{cases}
      1-(1-\frac{1}{n})^{nx} \ , \  x>0
      \\
      0 \ \ \ \ \ \ \ \ \ \ \ \ \ , \ otherwise
    \end{cases}    $$  
    Show that $X_n$ converges in distribution to Exponential(1).

    <button type="button" class="collapsible">Solution</button>
    <div class="content">
    Solution: Let $X \sim Exponential (1)$. For $x \leq 0$, we have
    $$F_{X_n}(x)=F_x(x)=0,$$ for $n=2,3,4,\cdots$.
    For $x \geq 0$, we have 
    $$ \begin{aligned} lim_{n \rightarrow \infty} F_{X_n}(x)&=lim_{n \rightarrow \infty} (1-(1-\frac{1}{n})^{nx}) \\
    &=1-lim_{n\rightarrow \infty} (1-\frac{1}{n})^{nx} \\
    &=1-e^{-x}\\
    &=F_X(x)\end{aligned}$$, for all $x$.
    Thus, we conclude that $X_n \stackrel {d}{\rightarrow}X$.
    </div>

- **Perhaps the more general app with guidance on what to try?**
```{r  echo=FALSE, eval = FALSE}

#gamma(r,lambda), mu=rlambda,var=rlambda^2, as r goes to infinity, it goesto normal
sidebarPanel(
   selectInput("tabs",
                                  "Distribution",
                                  list('Binormial','Beta','Poisson'),multiple = FALSE),
  
  #clt_n=1000,
# sliderInput("clt_n",
                                  # "n: the nth element in the sequence",
                                  # min = 10,
                                  # max = 1000,
                                  # step=5,
                                  # value = 100,
                                  # animate=animationOptions(
                                  # interval = 1000,
                                  # loop = TRUE,
                                  # playButton = "Play",
                                  # pauseButton = "Stop")),
                      
                      
                      
                      # helpText("As \\(n\\) increases,"),
                      # helpText("\\(\\star\\) More points will be created in each sample path and the density plot will vary"),
                      # 
####
# sliderInput("clt_ns",
#                                     "M: the number of simulations of the sequence",
#                                     min = 1,
#                                     max = 2000,
#                                     step=5,
#                                     value = 50,
#                                   animate=animationOptions(
#                                   interval = 1000,
#                                   loop = TRUE,
#                                   playButton = "Play",
#                                   pauseButton = "Stop")),
                      #clt_ns=1000,
                      # helpText("As \\(M\\) increases,"),
                      # helpText("\\(\\star\\) The 3-D plot of \\(\\widehat l_n(t)=\\lvert \\widehat F_{X_n}(t)-F_X(t) \\rvert\\) will get closer to zero horizontal plane"),
                      # helpText("\\(\\star\\)  \\(X_n \\overset{d} {\\to} X\\sim N(0,1)\\)"),
############
sliderInput("clt_k",
                                     # helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)"),
             helpText("\\(n\\): sample size of \\(X_n\\) "),
                                      min = 1,
                                      max = 1000,
                                      step=1,
                                      value = 10,
                                  animate=animationOptions(
                                  interval = 1000,
                                  loop = TRUE,
                                  playButton = "Play",
                                  pauseButton = "Stop")),
                          helpText("As \\(n\\) increases,"),
                          helpText("\\(\\star\\) Density plot of \\(X_n\\) values will resemble a standard normal curve"),
                          helpText("\\(\\star\\) \\(\\widehat F_{Xn}(t)\\) will approach to \\(F_X(t)\\)"),
#####
sliderInput("clt_alpha",
                                    helpText("\\(\\alpha\\)=shape parameter"),
                                    min = 1,
                                    max = 1000,
                                    step=5,
                                    value = 50,
                                  animate=animationOptions(
                                  interval = 1000,
                                  loop = TRUE,
                                  playButton = "Play",
                                  pauseButton = "Stop")),
                    
                      
                      helpText("\\(\\star\\) As \\(\\alpha\\) increases, the histogram will be more symmetric "),
#######
#clt_beta=1,
 sliderInput("clt_beta",
                                    helpText("\\(\\beta\\)=scale parameter"),
                                    min = 0.0001,
                                    max = 10,
                                     step=0.1,
                                     value = 1,
                                   animate=animationOptions(
                                  interval = 1000,
                                   loop = TRUE,
                                   playButton = "Play",
                                  pauseButton = "Stop")),
                        #helpText("\\(\\star\\) As \\(\\beta\\) increases, the histogram will spread out more  ")
 )
#######
mainPanel(
helpText(h4("This app is designed to visualize \\(X_n=\\frac{\\sqrt{n} ( \\overline Y_i-\\mu)  )}{\\sigma} \\overset {d}{\\to} X\\sim N(0,1) \\; or\\; X_n=\\frac{\\sqrt{n} ( \\overline Y_i-\\mu)  )}{\\sigma} \\overset {L}{\\to} X\\sim N(0,1) \\).")),
                      helpText(h4('Let \\(Y_1, Y_2,....,Y_n\\) be independent random variables \\(Y\\sim Gamma(\\alpha,\\beta)\\) and \\(Xn=\\frac{\\sqrt{n}*(\\overline Y_i-\\alpha*\\beta)}{\\sqrt{\\alpha*\\beta^2}}\\).')),
                      helpText(h4("\\(F_{X_n}(t)\\) is the empirical distribution of \\(X_n\\) and \\(F_X(t)\\) is cdf of \\(X\\). We use \\(\\widehat F_{X_n} (t)\\) to approximate \\(F_{X_n}(t)\\).  ")),



      tabsetPanel(id = "tabs",
        tabPanel("Histogram and CDF", splitLayout(
  #clt_hist <- renderPlot({
    renderPlot({
      set.seed(1)
        #clt_n=input$clt_n
        clt_n=input$clt_k
        #clt_ns=input$clt_ns
        clt_ns=1000
        clt_alpha=input$clt_alpha
        #clt_beta=1
        clt_beta=input$clt_beta
        clt_k=input$clt_k
        clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
        
        clt_data=data.frame()
        
        for (t in 1:clt_ns){
          clt_data=rbind(clt_data,clt_f(clt_n))
        }
        clt_h=hist(data.matrix(clt_data[clt_k]),main=mtext(bquote(bold("Density plot of"~X[n]~"values")),col="darkblue"),xlab="Xn values",col="green",border = "red",xlim = c(-4,4),prob=T)
        
        lines(seq(-4,4,length=length(clt_h$density)),dnorm(seq(-4,4,length=length(clt_h$density))),col="darkblue",lwd=3)
        
        legend('topleft', c(expression(hat(f[X[n]](t))),expression(f[X](t))),
               fill =c("green", "darkblue"))
        
        text(x=4,y=max(clt_h$density),bquote(bold(f[X[n]](t)~"will resemble"~f[X](t))),col="red",adj=1)
        
        
        }),
      renderPlot({ 
      set.seed(1)
      #clt_n=input$clt_n
      clt_n=input$clt_k
      #clt_ns=input$clt_ns
      clt_ns=1000
      clt_alpha=input$clt_alpha
      #clt_beta=1
      clt_beta=input$clt_beta
      clt_k=input$clt_k
      clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
      
      clt_data=data.frame()
      
      for (t in 1:clt_ns){
        clt_data=rbind(clt_data,clt_f(clt_n))
      }
      clt_h=hist(data.matrix(clt_data[clt_k]),main=mtext(bquote(bold("Density plot of"~X[n]~"values")),col="darkblue"),xlab="Xn values",col="green",border = "red",xlim = c(-4,4),prob=T,breaks = clt_ns)
      clt_y=clt_h$density
      clt_x=seq(-4,4,length=length(clt_y))
      
      plot(clt_x,cumsum(clt_y)/max(cumsum(clt_y)),type="l",lwd=2,col="green",main=mtext(bquote(bold(hat(F[X[n]](t))~"and"~F[X](t))),col="darkblue"), xlim=c(-4,4),xlab = "X", ylab = "Cumulative probability")
      lines(clt_x,pnorm(clt_x),col="darkblue")
      legend('topleft', c(expression(hat(F[X[n]](t))),expression(F[X](t))),lty = c(1,1),col = c("green", "darkblue") )
            # fill =c("green", "darkblue"))
      
      text(x=4,y=0.1,bquote(bold(F[X[n]](t)~"will resemble"~F[X](t))),col="red",adj=1)
    })
                      #clt_hist
   
#clt_3D
  
)),
        tabPanel("3D Distance",   #clt_3D <- renderPlot({
       renderPlot({
      set.seed(1)
      clt_n=input$clt_k
      #clt_n=input$clt_n
      #clt_ns=input$clt_ns
      clt_ns=1000
      clt_alpha=input$clt_alpha
      clt_beta=input$clt_beta
      #clt_beta=1
      clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
      
      clt_data_3D=data.frame()
      for (t in 1:clt_ns){
        clt_data_3D=rbind(clt_data_3D,clt_f(clt_n))
      }
      law.plot3dnew(data.matrix(clt_data_3D),pnorm)
    })),
        tabPanel("Sample Path", renderPlot({
      set.seed(1)
      clt_n=input$clt_k
      #clt_n=input$clt_n
      #clt_ns=input$clt_ns
      clt_ns=1000
      clt_alpha=input$clt_alpha
      clt_beta=input$clt_beta
      #clt_beta=1
        #eps3=input$ep3
      clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
        clt_data_3D=data.frame()
        for (t in 1:clt_ns){
          clt_data_3D=rbind(clt_data_3D,clt_f(clt_n))
        }
        visualize.sp(data.matrix(clt_data_3D),nb.sp=clt_ns,epsilon=3,main=mtext(bquote(bold(.(clt_ns)~"sample paths of"~X[n])),col="darkblue"), col="grey")
        
    }))
      )

)
```





Not sure what may be needed from these code chunks below.
```{r, echo=FALSE,message=FALSE, eval = FALSE}
MM=1000 #number of simulation
n500cdfmean=c(0)
for (i in 1:MM){
  n500cdfmean[i]=mean(rbinom(NN,n,p))
}
n500df=data.frame(n500cdfmean)
ggplot(n500df,aes(x=n500cdfmean)) +
     geom_histogram(aes(y = ..density..),col="red",fill="green") + geom_density(alpha=.2)+ theme(text = element_text(size = 15))+theme(plot.title = element_text(hjust = 0.5),plot.subtitle=element_text(hjust=0.5))+
     ggtitle("Distribution of Observed Mean values") +
     ylab("Absolute Frequency out of 1000") + 
     xlab("Observed Mean Value ") 
```

```{r, include=FALSE, eval = FALSE}
#From 501 notes
#Simulate N data sets, each of size n, from an exp(1) distribution
n <- c(3, 30, 300)
N <- 50000

#list to save data values in (this is not an efficient way to create this data!)
data <- list()
for(i in 1:length(n)){ 	
    data[[i]] <- matrix(0, nrow = N, ncol = n[i])  #each row of a matrix will represent a data set
}

#Create the data - loop over sample sizes
for (j in 1:length(n)){	#loop over sample sizes
     for (i in 1:N){  #loop to create many data sets of a given sample size
           data[[j]][i,] <- rexp(n = n[j])	#store the data set in a row of the appropriate matrix
     }
}
#mean and variance for exp(1)
mu<-sigma<-1

#calculate the z statistic for each set of samples.  Apply the z-score transform to each row of values.
means1 <- apply(X = data[[1]], FUN = function(data){(mean(data)-mu)/(sigma/sqrt(n[1]))}, MARGIN = 1)
hist(means1, main = paste("Histogram of z's with n=", n[1], " from exp(1)", sep = ""), 
      xlab = "Means", prob = T)
lines(seq(from = -3, to = 3, by = 0.01), dnorm(seq(from = -3, to = 3, by = 0.01)))
 #Repeat this part for n = 30, n = 300
```

```{r,echo=FALSE,message=FALSE, eval = FALSE}
#histogram by sample size
n20b=c(0)
for (i in 1:M){
  n20b[i]=rbinom(NN,20,p)
}
n50b=c(0)
for (i in 1:M){
  n50b[i]=rbinom(NN,50,p)
}

n100b=c(0)
for (i in 1:M){
  n100b[i]=rbinom(NN,100,p)
}
n500b=c(0)
for (i in 1:M){
  n500b[i]=rbinom(NN,500,p)
}
datamatb=data.frame(cbind(c(rep(c(20,50,100,500),each=M)),c(n20b,n50b,n100b,n500b)))
colnames(datamatb)=c("samplesize","Value")

# create ggplot2 plot
ggplot(datamatb) + 
  geom_histogram(mapping=aes(x=Value,group=samplesize),bins=50,col="red",fill="red")  +  theme(text = element_text(size = 15))+theme(plot.title = element_text(hjust = 0.5),plot.subtitle=element_text(hjust=0.5))+
  ggtitle("Histogram of Observed Values") +
  labs(subtitle=("Sample Size : {closest_state}")) +
  ylab("Absolute Frequency out of 1000") + 
  xlab("Observed Value ") + 
  transition_states(samplesize)
```

```{r,echo=FALSE,message=FALSE, eval = FALSE}
#CDF by sample size
library(EnvStats)
library(transformr)

##n=20
 n20=rbinom(NN,20,p)
 n20norm=rnorm(NN, 20*p, sqrt(20*p*(1-p)))
 # xx20 <- qemp(p = seq(0, 1, len = 100), obs = n20) 
 # y20 <- cumsum(demp(xx20, n20) )
 #y20 <- ecdf( n20)
 
 y20=cumsum(density(n20,n=NN)$y)
 #repn=length(density(n20)$y)
 # 
 # xx20n <- qemp(p = seq(0, 1, len = 100), obs = n20norm) 
 #y20n <- ecdf( n20norm)
 
 
 ##CDF= c(rep("Binormial (20,0.6)",NN), rep("Normal (12, 4.8)",NN)). x=c(n20,n20norm)
 y20n <- cumsum(density(n20norm,n=NN)$y)
ecdf20 <- data.frame(
   x=c(n20,n20norm),
   y = c(y20, y20n),
  
   
   CDF= c(rep("Binormial (20,0.6)",NN), rep("Normal (12, 4.8)",NN))
)

##n=50
 n50=rbinom(NN,50,p)
 n50norm=rnorm(NN, 50*p, sqrt(50*p*(1-p)))
 #xx50 <- qemp(p = seq(0, 1, len = 100), obs = n50) 
 #y50 <- ecdf(n50 )
 y50=cumsum(density(n50,n=NN)$y)
 
 #xx50n <- qemp(p = seq(0, 1, len = 100), obs = n50norm) 
 #y50n <- ecdf(n50norm)
 
 y50n <- cumsum(density(n50norm,n=NN)$y)
ecdf50 <- data.frame(
   x=c(n50,n50norm),
   y = c(y50, y50n),
  
   CDF= c(rep("Binormial (50,0.6)",NN), rep("Normal (30, 12)",NN))
)

##n=100
 n100=rbinom(NN,100,p)
 n100norm=rnorm(NN, 100*p, sqrt(100*p*(1-p)))
 #xx100 <- qemp(p = seq(0, 1, len = 100), obs = n100) 
 #y100 <- ecdf(n100 )
 y100=cumsum(density(n100,n=NN)$y)
 
 #xx100n <- qemp(p = seq(0, 1, len = 100), obs = n100norm) 
# y100n <- ecdf(n100norm)
 y100n <- cumsum(density(n100norm,n=NN)$y)
ecdf100 <- data.frame(
   x=c(n100,n100norm),
   y = c(y100, y100n),
  
   CDF= c(rep("Binormial (100,0.6)",NN), rep("Normal (60, 24)",NN))
)

##n=500
 n500=rbinom(NN,500,p)
 n500norm=rnorm(NN, 500*p, sqrt(500*p*(1-p)))
 #xx500 <- qemp(p = seq(0, 1, len = 100), obs = n500) 
 #y500 <- ecdf( n500) 
  y500=cumsum(density(n500,n=NN)$y)
 
 #xx500n <- qemp(p = seq(0, 1, len = 100), obs = n500norm) 
 #y500n <- ecdf( n500norm)
 y500n <- cumsum(density(n500norm,n=NN)$y)
ecdf500 <- data.frame(
   x=c(n500,n500norm),
   y = c(y500, y500n),
  
   CDF= c(rep("Binormial (500,0.6)",NN), rep("Normal (300, 120)",NN))
)


ecdfall=rbind(ecdf20,ecdf50,ecdf100,ecdf500)
ecdfall$samplesize=rep(c(20,50,100,500),each=2*NN)

#+stat_ecdf() +stat_ecdf(aes(color=CDF))+
#color=CDF,
ggplot(ecdfall, aes(x,group=samplesize,color=CDF)) +stat_ecdf()+
  theme(text = element_text(size = 15))+theme(plot.title = element_text(hjust = 0.5),plot.subtitle=element_text(hjust=0.5))+theme(legend.text = element_text(size=15))+ theme(legend.position = c(0.8, 0.1))+
  ggtitle("Emprical Cumulative Distribution Function") + labs(subtitle=("Sample Size : {closest_state}"))+
  ylab("Cumulative Distribution Function") + 
  xlab("Observed Value ")+transition_states(samplesize)

```

```{r,echo=FALSE,message=FALSE, eval = FALSE}
#3D plot by sample size
library(EnvStats)
library(transformr)
library(viridis)
library(ggridges)

# ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = Month, fill = stat(x))) +
#   geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
#   scale_fill_viridis_c(name = "Temp. [F]", option = "C") +
#   labs(title = 'Temperatures in Lincoln NE in 2016')

#+stat_ecdf()
#color=CDF,

yall=c(y20,y50,y100,y500)
yalln=c(y20n,y50n,y100n,y500n)
yd=data.frame(cbind(yall,yalln))
colnames(yd)=c("yall","yalln")
yd$samplesize=rep(c(20,50,100,500),each=NN)

#ggplot(iris, aes(x = Sepal.Length, y = Species)) + geom_density_ridges(scale = 0.9)


ggplot(yd, aes(x=yalln-yall,y=samplesize,fill=stat(x),group=samplesize)) +geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01)+
  theme(text = element_text(size = 15))+theme(plot.title = element_text(hjust = 0.5),plot.subtitle=element_text(hjust=0.5))+theme(legend.text = element_text(size=15))+ theme(legend.position = c(0.9, 0.8))+scale_fill_viridis_c(name = "Differences", option = "C")+
  ggtitle("Distance Between binormial ECDF and normal CDF ") + 
  ylab("Sample Size") + 
  xlab("Observed Differences ")

```

```{r ,echo=FALSE,message=FALSE, eval = FALSE}
library(tidyverse)
library(plotly)

#https://stackoverflow.com/questions/72590265/3d-plot-of-monthly-temperature-in-r
# temp %>% 
#   pivot_longer(starts_with('Hour'), 
#                names_to = 'Hour',
#                values_to = 'Temperature') %>%
#   group_by(Year, Month) %>%
#   summarise(Temperature = mean(Temperature, na.rm = TRUE)) %>%
#   pivot_wider(names_from = Month, values_from = Temperature) %>%
#   ungroup() %>%
#   select(-1) %>%
#   as.matrix() %>%
#   plot_ly(x = month.name, y = unique(temp$Year), z = .) %>%
#   add_surface()
yd$obs=rep(c(1:1000),4)
yd$ydiff=yd$yall-yd$yalln
ydsub=yd[,c(3,4,5)]
 ydsub%>% 
  group_by(ydsub$samplesize, ydsub$obs) %>%
  ungroup() %>%
  #select(-1) %>%
  as.matrix() %>%
  plot_ly(x = ydsub$obs, y = unique(ydsub$samplesize), z = .) %>%
  add_surface()
```






### To do for next meeting:

- Convert 'notes' pptx to a markdown document ([cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)) (HTML output) with shiny runtime (template .Rmd file in repo)
    - Start with Convergence in distribution and build toward more complicated convergence topics
    - Add some 'play buttons'
    - Example that the instructor would walk through followed by an example the students would work through for each 'topic' we have these visuals for
    - Later convert those to HTML slides (Justin will provide template)
- Develop a version for more intro stat crowd that just cares about convergence in distribution
- Develop homework problems that could be used with the app (may require modification/generalization)
- Need to give more credit to the original authors of the package as inspiration. If we rewrote the code then we just give them credit for the inspiration up front.




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
