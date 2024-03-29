#temp file for conv in prob notes


We saw that the estimator of $p$, $\hat{p}$, from the Binomial example seemed to be observed closer and closer to $p$ for larger sample sizes. Additionally, we saw a good large-sample distribution for $\hat{p}$ is
$$\hat{p}\stackrel{\bullet}\sim N\left(p, \frac{p(1-p)}{n}\right)$$
  As $n$ grows we can see that this distribution concentrates more and more around $p$. 

This is the idea of **convergence in probability to a constant** - the probability our random variable is observed 'close' to that value goes to 1. Let's formally define this idea!

Convergence in Probability
: A sequence of RVs $Y_1,...,Y_n,...$ converges in probability to a RV $Y$ if for every $\epsilon>0$
$$\lim_{n\rightarrow\infty}P(|Y_n-Y|\geq \epsilon)=0 \iff 
\lim_{n\rightarrow\infty}P(|Y_n-Y|<\epsilon)=1$$
This is denoted as 
$$Y_n\stackrel{p}{\rightarrow}Y$$

We'll mostly care about convergence in probability to a constant, call it $c$. We can see the definition in this case can be simplied to the following:
  $$\lim_{n\rightarrow\infty}P(|Y_n-c|< \epsilon)=\lim_{n\rightarrow\infty}P(-\epsilon < Y_n-c<\epsilon) =  \lim_{n\rightarrow\infty}P(c-\epsilon < Y_n<c+\epsilon)=1$$
  The last line emphasizes the interpretation. $Y_n\stackrel{p}\rightarrow c$ if the *probability* we observe $Y_n$ close to $c$ goes to 1 in the limit.

One of the most important results regarding convergence in probability is called the Law of Large Numbers.

(Weak) Law of Large Numbers
: Suppose $Y_i\stackrel{iid}\sim f$ where the mean and variance of $Y_i$ exist. Then $$\bar{Y}=\frac{1}{n}\sum_{i=1}^{n}Y_i\stackrel{p}\rightarrow E(Y)=\mu$$
  
  Also, note that the variance assumption is not needed but will help facilitate an easy proof. We'll prove this shortly, but first let's gain a bit more intuition. 

### Convergence in probability idea

Assume that $Y_i\stackrel{iid}\sim N(0,1)$. Let's investigate the behavior of 
$$X = \frac{1}{n^2}\sum_{i=1}^{n}Y_i$$
To put this in the context of the definition, let's refer to $X$ explicitly as a function of $n$:
  $$X_n = \frac{1}{n^2}\sum_{i=1}^{n}Y_i$$
  We want to understand the behavior of $X_n$ as n grows. We'll see that $X_n\stackrel{p}\rightarrow 0$, which implies that for any $\epsilon>0$ we have
$$\lim_{n\rightarrow\infty}P(-\epsilon < X_n < \epsilon) =0$$

To visualize this, we can consider **sample paths** of $X_n$. That is, we can look at a particular sequence of $y_i$'s that will generate a sequence of $x$ and see how the values change. 

Consider the following 6 values randomly sampled from a $N(0,1)$ and the corresponding sequence of $x_n$ values.
```{r, echo = FALSE}
set.seed(1)
ys <- rnorm(6)
xn <- cumsum(ys)/((1:length(ys))**2)
```

$y$ sequence      | $x$ sequence
------------------|--------------
  $y_1$ = `r ys[1]` | $x_1$ = `r ys[1]`$/1^2$ = `r xn[1]`
$y_2$ = `r ys[2]` | $x_2$ = (`r ys[1]`+`r ys[2]`)$/2^2$ = `r xn[2]`
$y_3$ = `r ys[3]` | $x_3$ = (`r ys[1]`+`r ys[2]`+`r ys[3]`)$/3^2$ = `r xn[3]`
$y_4$ = `r ys[4]` | $x_4$ = (`r ys[1]`+...+`r ys[4]`)$/4^2$ = `r xn[4]`
$y_5$ = `r ys[5]` | $x_5$ = (`r ys[1]`+...+`r ys[5]`)$/5^2$ = `r xn[5]`
$y_6$ = `r ys[6]` | $x_6$ = (`r ys[1]`+...+`r ys[6]`)$/6^2$ = `r xn[6]`

If we consider multiple sample paths, then convergence in probability to 0 of this sequence implies that the proportion of sample paths outside of $\pm \epsilon$ should go to zero.

Let's plot our sample path with an $\epsilon = 0.05$:

```{r, echo = FALSE}
epsilon <- 0.05
n <- 6
plot_data <- data.frame(n = 1:n, xn = xn)
ggplot(plot_data, aes(x = n, y = xn)) + 
  geom_line() + 
  ylim(c(-0.75,0.75)) + 
  ggtitle("A sample path of Xn") + 
  geom_abline(intercept = -epsilon, slope = 0, color = "red") + 
  geom_abline(intercept = epsilon, slope = 0, color = "red") + 
  theme(legend.position = "none") +
  scale_x_continuous("n", breaks = 1:n, labels = as.character(1:n))
#plot(x = 1:n, 
#     y = xn, 
#     type = "l", 
#     main = "A sample path of X_n", 
#     ylim = c(-1, 1),
#     xlab = "n",
#     lwd = 2)
#abline(h = c(-epsilon, epsilon), col = "red", lwd = 2)
```

Now let's add 9 more sample paths:
  
  ```{r, echo = FALSE, warning = FALSE}
#gen sample path function
get_path <- function(n){
  xn <- cumsum(rnorm(n))/((1:n)^2)
}
M <- 10
set.seed(1)
paths <- replicate(M, get_path(n))
plot_data <- data.frame(xn = c(paths), n = rep(1:n, times = M), path = as.factor(rep(1:M, each = n)))

ggplot(plot_data, aes(x = n, y = xn, color = path)) + 
  geom_line()  + 
  ggtitle("A sample path of Xn") + 
  geom_abline(intercept = -epsilon, slope = 0, color = "red", size = 1.1, lty = "dashed") + 
  geom_abline(intercept = epsilon, slope = 0, color = "red", size = 1.1, lty = "dashed") + 
  annotate("rect", xmin = 3.75, xmax = 4.25, ymin = -0.75, ymax = 0.75, alpha = .2) +
  annotate("text", x = 4, y = 0.8, label = "7/10 fall within\nepsilon bounds", col = "darkblue") + 
  theme(legend.position = "none") +
  scale_x_continuous("n", breaks = 1:n, labels = as.character(1:n))

##add what xiaoxia has below with the bars and proportion business and ggploty this bitch 


# plot(x = 1:n, 
#      y = xn, 
#      type = "l", 
#      main = "A sample path of X_n", 
#      ylim = c(-1, 1),
#      xlab = "n", 
#      lwd = 2)
# for (i in 1:9){
#   lines(x = 1:n, y = paths[,i], lwd = 2)
# }
# abline(h = c(-epsilon, epsilon), col = "red")

```

What we hope to see is that the proportion of lines falling outside of the $\epsilon$ bars goes to 0!
  
  
  ```{r, echo = FALSE, message = FALSE, warning = FALSE}
#get matrix of probabilities for each n
probability <- t(rowSums(abs(paths) > epsilon)/M)
colnames(probability) <- paste0("X", 1:n)
#produce data table and combind probability dataset
table_data <- rbind(t(paths), probability)
rownames(table_data) <- c(paste("Sample Path", 1:M), "Probability")
round(table_data, 2) %>% 
  as.data.frame() %>%
  mutate_if(is.numeric, 
            function(x){
              x = cell_spec(x, 
                            color = ifelse(x >= 0.05, "red", "black"))
            }) %>%
  kable(escape = F, 
        row.names = T, 
        caption = "<center> Probability for 10 Simuations 
                  with sample size 6 </center>", 
        align = "l" ) %>%
  kable_styling(bootstrap_options = c("striped", "hover"), 
                full_width = T) %>%
  row_spec(11, bold = T, color = "black", background = "lightblue")
```

### Convergence in Probabilty Exploration

Suppose we have a random sample from a Normal distribution with mean 10 and standard deviation 1. What do you think $W = (\bar{Y})^2$ converges to in probability? Consider the application of the Law of Large Numbers and some educated guess work to use the app below to explore!
  
  - Select the value c that you guess $W$ converges to in probability.
- Choose a sample size to go up to (start smaller and then get larger once you have a good idea).
- Select an $\epsilon$ range.
- Look for the proportion of lines (50 sample paths are generated) falling outside of the $\epsilon$ bars to go to 0!
  
  ```{r, echo=FALSE,message=FALSE, eval = TRUE}
#path for data
get_path <- function(n){
  xn <- (cumsum(rnorm(n, mean = 10, sd = 1))/(1:n))^2
}
M <- 50
shinyApp(
  ui <- fluidPage(
    #inputs on the side for n, p, and generating data
    sidebarPanel(
      numericInput("c",
                   "c: Value to converge to",
                   value = 0,
                   min = -500, 
                   max = 500),
      numericInput("n",
                   "n: Sample Size (1 to 1000)",
                   min = 1,
                   max = 1000,
                   step= 1,
                   value = 5),
      sliderInput("epsilon",
                  "epsilon: range",
                  min = 1,
                  max = 10,
                  step= 0.5,
                  value = 10),
      actionButton("create",
                   "Create/Update graph")
    ),
    mainPanel(
      plotlyOutput("convergence")
    )
  ),
  server <- function(input, output, session){
    ps <- reactiveValues(p = c())
    
    observeEvent(input$create, 
                 {
                   n <- input$n
                   #gen sample path function
                   paths <- replicate(M, get_path(n))
                   plot_data <- data.frame(xn = c(paths), 
                                           n = rep(1:n, times = M), 
                                           path = as.factor(rep(1:M, each = n)))
                   
                   ps$p <- plot_data
                 }
    )
    
    output$convergence <- renderPlotly({
      plot_data <- ps$p
      c <- isolate(input$c)
      n <- isolate(input$n)
      epsilon <- isolate(input$epsilon)
      
      if(length(plot_data) == 0) {
        NULL
      } else {
        #add proportion in bounds to data frame
        hover_data <- plot_data %>% 
          group_by(n) %>% 
          summarize(proportion = mean(abs(xn-c) < epsilon))
        if(n < 50){
          p <- ggplot(plot_data, aes(x = n, y = xn)) +
            geom_line(aes(color = path, group = path)) + 
            geom_hline(yintercept = c+epsilon, size = 1, col = "purple") + 
            geom_hline(yintercept = c-epsilon, size = 1, col = "purple") +
            theme_classic() + 
            theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.position = "none") +
            ggtitle("50 Sample Paths Visualized as the Sample Size Increases") + 
            ylab("Path Values") + 
            scale_x_continuous("n", breaks = 1:n, labels = as.character(1:n))
          p2 <- ggplotly(p)
          for (i in 1:n){
            p2 <- p2 %>% add_polygons(x = c(hover_data$n[i]-0.5, 
                                            hover_data$n[i]-0.5, 
                                            hover_data$n[i]+0.5,
                                            hover_data$n[i]+0.5), 
                                      y = c(-1000, 1000, 1000, -1000), 
                                      line = list(width = 0), 
                                      fillcolor = 'rgba(0, 0, 0, 0)', 
                                      inherit = FALSE, 
                                      name = paste0("Proportion of Sample Paths\n within epsilon bounds (n = ", i, "): ", hover_data$proportion[i]))
          }
        } else {
          p <- ggplot(plot_data, aes(x = n, y = xn)) +
            geom_line(aes(color = path, group = path)) + 
            geom_hline(yintercept = c+epsilon, size = 1, col = "purple") + 
            geom_hline(yintercept = c-epsilon, size = 1, col = "purple") +
            theme_classic() + 
            theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.position = "none") +
            ggtitle("50 Sample Paths Visualized as the Sample Size Increases") + 
            ylab("Path Values")
          p2 <- ggplotly(p)
          for (i in c(seq(5, n, by = 10), n)){
            p2 <- p2 %>% add_polygons(x = c(hover_data$n[i]-5, 
                                            hover_data$n[i]-5, 
                                            hover_data$n[i]+5,
                                            hover_data$n[i]+5), 
                                      y = c(-500, 500, 500, -500), 
                                      line = list(width = 0), 
                                      fillcolor = 'rgba(0, 0, 0, 0)', 
                                      inherit = FALSE, 
                                      name = paste0("Proportion of Sample Paths\n within epsilon bounds (n = ", i, "): ", hover_data$proportion[i]))
          }
        }
        p2
      }
    })
  }
)


```

### How do we prove convergence in probability?

Markov's Inequality
: If $X$ is a nonnegative RV (support has no negative values) for which $E(X)$ exists, then for $t>0$
$$P(X\geq t)\leq \frac{E(X)}{t}$$

Example: If $X\sim exp(1)$ then $P(X\geq t)=e^{-t}$ and $E(X)/t=1/t$.

```{r, echo = FALSE, fig.align = 'center', out.width = "550px"}
x <- 1:120/20
plot(x, y = 1/x, type = "l", ylim = c(0,1), col = "blue", lwd = 2)
lines(x, y = exp(-x), type = "l", col = "green", lwd = 2)
legend("topright", legend = c("1/t", "exp(-t)"), col = c("blue", "green"), lwd = 2)
```


Chebychev's Inequality 
: Let $X$ be a RV with mean = $\mu$ and variance = $\sigma^2$, then for $t>0$ 
  $$P(|X-\mu|\geq t)\leq \frac{\sigma^2}{t^2}$$
  
  Example:  If $t=\sigma k$ for $k>0$, we can apply Chebychev's to get
$$P\left(|X-\mu|\geq k\sigma\right)\leq \frac{\sigma^2}{k^2\sigma^2}=\frac{1}{k^2}$$
For $k=2$ we have $P\left(|X-\mu|\geq 2\sigma\right)\leq 1/4$.

Practically, what can we take home from this?
- At least 75\% of a RVs distribution lies within 2 standard deviations of the mean (if these moments exist)
- Regardless of distribution! (if moments exist)
- If $X\sim N(\mu,\sigma^2)$ we know $P(|X-\mu|\geq 2\sigma)\approx 0.05$. The bound isn't always very tight!
  
  ### Relating the inequalities to convergence in probability
  
  Proving the WLLN: Suppose $Y_i\stackrel{iid}\sim f$ where the mean and variance of $Y_i$ exist. We want to show $$\bar{Y}=\frac{1}{n}\sum_{i=1}^{n}Y_i\stackrel{p}\rightarrow E(Y)=\mu$$
  
  #### Very powerful result!
  
  - Big picture goal is to estimate parameters such as $\mu$
  - If we get a RS we know that $\bar{Y}$ will be a `close' to $\mu$ for `large' samples
- Applies to the average of any independent random variables with the same finite mean

Example: Let $Y_i\stackrel{iid}{\sim}f_Y(y)$ where $E(Y^2)$ exists (that is, $E\left(|Y^2|\right)<\infty$). As the $Y_i$ are independent, we know the $Y_i^2$ are independent. Further, they all have the same expectation!
Thus, the WLLN implies that 
$$\frac{\sum_{i=1}^{n}Y_i^2}{n} \stackrel{p}{\rightarrow} E(Y^2)$$

Continuing the previous example: If $Y_i\stackrel{iid}\sim N(\mu, \sigma^2)$ then $$\frac{\sum_{i=1}^{n}Y_i^2}{n} \stackrel{p}{\rightarrow} E(Y^2) = Var(Y)+\left(E(Y)\right)^2 = \sigma^2+\mu^2$$

### Continuity Theorem (works for convergence in distribution, probability, and almost surely) 
The WLLN is also quite useful when combined with the continuity theorem.

Continuity Theorem
: If $Y_1,Y_2,Y_3,...$ converge to $Y$ and $g()$ is a continuous function then 
$g(Y_1),g(Y_2),g(Y_3)...$ converge to $g(Y)$. 

Example (exploration example proved): 
Suppose we have a random sample from a Normal distribution with mean 10 and standard deviation 1. Consider $W = (\bar{Y})^2$. What does this converge to in probability?

By the WLLN we know that $\bar{Y}\stackrel{p}\rightarrow 10$. Now can apply the continuity theorem and we know that 
$$W = (\bar{Y})^2 \stackrel{p}\rightarrow 10^2 = 100$$

Example: We can also use the continuity theorem with the CLT. Suppose that $Y_i\stackrel{iid}\sim gamma(\alpha, \lambda)$. We have that 
$$\frac{\bar{Y}-\alpha/\lambda}{\frac{\alpha}{\lambda^2\sqrt{n}}}\stackrel{d}\rightarrow Z$$
where $Z\sim N(0,1)$. By the continuity theorem we have that 
$$\left(\frac{\bar{Y}-\alpha/\lambda}{\frac{\alpha}{\lambda^2\sqrt{n}}}\right)^2\stackrel{d}\rightarrow Z^2$$
and recall that a standard Normal squared is distributed as a $\chi^2_1$ or a $gamma(1/2, 1/2)$. 

### Other Standard Limit Results 

Most of the common limit theorem ideas from calculus follow here as well ($\theta$ and $\lambda$ are constants below):

$$\mbox{If }Y\stackrel{p}{\rightarrow}\theta, X\stackrel{p}{\rightarrow}\lambda\mbox{ then }Y\pm X\stackrel{p}{\rightarrow}\theta\pm\lambda$$

### Convergence in Distribution and Probability Relationship



