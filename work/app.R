# This shiny app is based on R-package ConvergenceConcepts

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ConvergenceConcepts)

ui <- dashboardPage(skin="red",
    dashboardHeader(title="Convergence Concepts", titleWidth=12),
    dashboardSidebar(
        sidebarMenu(
            
          menuItem("About", tabName = "about", icon=icon('archive')),
          menuItem("a.s. implies in probability", tabName ="as", icon = icon("laptop")),
          menuItem("in probability but not a.s.", tabName ="p", icon = icon("laptop"),
                   menuSubItem(withMathJax(helpText("\\(X_n=\\sqrt{n}\\)")),icon = icon("laptop"), tabName = "subMenu1"),
                   menuSubItem(withMathJax(helpText("\\(X_n=n^\\alpha\\)")),icon = icon("laptop"), tabName = "subMenu2")
          ),
          menuItem("in distribution", tabName ="d", icon = icon("laptop")),
          menuItem("CLT", tabName ="clt", icon = icon("laptop"))
        )
    ),
    dashboardBody(
        tabItems(
          tabItem(
            tabName = "about",
            
            column(6,
                 
            h1("Description"),
            box( width=12,
            h4("This app is based on R-package 'ConvergenceConcepts'. It will help you to invistigate interactively the convergence (in probability, almos surely and in distribution) of a sequence of i.i.d. random variables. ")),
    
            br(),
            box(width = 12,
            h4("First three tabs on the left exemplify three different types of convergence. "),
            
            tags$style(HTML("
                    li {
                    font-size: 18px;

                    }
                    li span {
                    font-size: 18px;
                    }
                    ul {
                    list-style-type: square;
                    }

                    ")),
            
            tags$ul(
            tags$li("The first tab demonstrates that convergence almost surely implies convergence in probability. "),
            tags$li("The second tab shows convergence in probability doesn't mean convergence almost surely with two different Xn. "),
            tags$li("The third tab illustrates convergence in distribution.")
            )
            
            ),
            
            br(),
            box(width = 12,
            h4(" The fourth tab displays Central Limit Theorem with Gamma distribution. You can adjust the parameters from a gamma distribution to visualize the standardized gamma average converges to standard normal distribution.")),
            
            br(),
            box(width = 12,
                h4("Contact us:"),
                h4("Dr. Justin Post <jbpost2@ncsu.edu>"),
                h4("Xiaoxia Champon <xzhao17@ncsu.edu>")
              
            )
            ),
            
            column(6,
            
            h1("Details"),
            box(width = 12,
            withMathJax(),
            helpText(h4("A function that generates \\(n\\) results of \\(X_n-X\\) is defined and a data matrix is created by simulating this sample path \\(M\\) times. Visualization of simulated sample paths can be observed from the interractive plots and a horizontal band of \\([-\\varepsilon,+\\varepsilon]\\) is displayed in the sample path graph. "))),
            br(),
            
            box(width = 12,
            helpText(h4("\\(\\star\\)By definition, \\(X_n\\overset{p} {\\to} 0\\) if and only if \\(\\forall \\varepsilon \\gt 0\\) : \\(p_n=P[\\lvert X_n-X \\rvert \\gt \\varepsilon] \\to 0 \\) as \\(n \\to \\infty\\). ")),
            helpText(h4("\\(\\star\\) Convergence in probability requires that the probability that \\(X_n\\) deviates from \\(X\\) by at least \\(\\varepsilon\\) tends to 0 (for every \\(\\varepsilon \\gt 0\\)).")),
            helpText(h4("\\(\\star\\) Criterion \\(p_n\\) is used for convergence in probability and it is approximated by \\(\\hat{p_n}\\). \\( \\hat{p_n}\\) is the proportion of generated sample paths lying outside \\([-\\varepsilon,+\\varepsilon]\\) at position \\(K\\). ")),
            
            ),
            br(),
            
            box(width = 12,
            helpText(h4("\\(\\star\\) By definition, \\(X_n\\overset{a.s.} {\\to} 0\\) if and only if \\(\\forall \\varepsilon \\gt 0\\) : \\(a_n=P[\\exists K \\geq n; \\lvert X_n-X \\rvert \\gt \\varepsilon] \\to 0 \\) as \\(n \\to \\infty\\) .  ")),
            helpText(h4("Convergence almost surely requries that the probability that there exists at least a \\(k \\geq n \\) such that \\(X_k\\) deviates from \\(X\\) by at least \\(\\varepsilon\\) tends to 0 as n tends to infinity (for every \\(\\varepsilon \\gt 0\\)). ")),
            helpText(h4("\\(\\star\\) Criterion \\(a_n\\) is used for convergence in probability and it is approximated by \\(\\hat{a_n}\\).\\(\\hat{a_n}\\) is the proportion of generated sample paths beginning at position \\(K\\), ending at position \\(n_{max}\\) that go outside the horizontal band \\([-\\varepsilon,+\\varepsilon]\\).")),
            
            ),
            br(),
            box(width = 12,
                helpText(h4("\\(\\star\\)By definition, \\(X_n \\overset{d} {\\to} X\\) or \\(X_n \\overset{L} {\\to} X\\) if and only if \\(l_n= \\lvert F_{X_n}(t)-F_X(t) \\rvert \\underset{n\\to \\infty} \\rightarrow  0\\) for all \\(t\\) and \\(F_X(x)\\) is continuous. ")),
            helpText(h4("\\(\\star\\) \\(\\widehat l_n(t)=\\lvert \\widehat F_{X_n}(t)-F_X(t) \\rvert\\) is used for convergence in distribution where \\(F_X(t)\\) is the cumulative distribution function of \\(X\\) and \\(\\widehat F_{X_n} (t)\\) is the empirical distribution function of \\(X_n\\).")),
            )
          
          
            )
            
            ),
        tabItem(
            tabName="as",
            fluidPage(
                # Application title
              
                
                
                sidebarLayout(
                    sidebarPanel(
                      box(width = 18,
                          
                          helpText(h3("Visualize \\(X_n\\overset{a.s.} {\\to} 0\\) implies \\(X_n\\overset{p} {\\to} 0\\)"))
                      ),
                      
                      
                      
                      box(width = 18, 
                        sliderInput("number",
                                    "n=Number of points in each sample path",
                                    min = 1,
                                    max = 2000,
                                    step=2,
                                    value = 100),
                        
                        helpText("As \\(n\\) increases,  "),
                        helpText('\\(\\star\\) Most of \\(\\hat{a_n}\\) and \\(\\hat{p_n}\\) will be \\(0\\) in the histogram' ),
                        helpText("\\(\\star\\)  The criterion value \\(\\hat{a_n}\\) and \\(\\hat{p_n}\\) curve will tend to \\(0\\) and stay at this value")
                        
                        ),
                      box(width = 18,
                        sliderInput("numberS",
                                    "M=Number of sample paths simulated",
                                    min = 1,
                                    max = 1000,
                                    step=100,
                                    value = 50),
                      
                        helpText("As \\(M\\) increases, "),
                        helpText("\\(\\star\\) The number of simulations will increase, therefore, more sample paths will be observed out of \\([-\\varepsilon,+\\varepsilon]\\)  ")
                      
                        
                      
                        ),
                      box(width = 18,
                          
                          sliderInput("k",
                                      helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)"),
                                      min = 1,
                                      max = 2000,
                                      step=1,
                                      value = 20),
                          
                          helpText("As \\(K\\) increases,"),
                          helpText("\\(\\star\\) The number of sample paths that are out of \\([-\\varepsilon,+\\varepsilon]\\) decreases"),
                          helpText('\\(\\star\\) \\(\\hat{a_n} \\geq \\hat{p_n}\\) \\(\\Rightarrow\\) Almost surely convergence implies convergence in probability ' )
                          
                          
                      ), 
                      box(width = 18,
                        sliderInput("alpha",
                                    helpText("\\(\\alpha\\)=power of \\(n\\)"),
                                    min=1,
                                    max=3,
                                    step=0.05,
      
                                    value=1.2),
                        
                        helpText("As \\(\\alpha\\) increases, the rate of \\(X_n\\overset{a.s.} {\\to} 0\\) and \\(X_n\\overset{p} {\\to} 0\\) is faster.")
                        
                        
                        ),
                  
                      box(width = 18,
                      sliderInput("ep",
                                  "Epsilon",
                                  min=0.001,
                                  max=4,
                                  step=0.01,
                                  value=0.05),
                      helpText(" As \\(\\varepsilon\\) increases, the rate of \\(\\widehat p_n\\) and \\(\\widehat a_n\\) converges faster. ")
                      )
                    ),
                    # Show a plot of the generated distribution
                    mainPanel(
                      
                      helpText(h4("Let \\(Y_1, Y_2,....,Y_n\\) be independent random variables \\(Y\\sim N(0,1)\\). We define \\(X_n=\\frac{\\sum Y_i}{n^\\alpha}\\),  \\(X=0\\).")),
                      helpText(h4('\\(\\star\\) \\( \\hat{p_n}\\) is the proportion of generated sample paths lying outside \\([-\\varepsilon,+\\varepsilon]\\) at position \\(K\\). ')),
                      helpText(h4('\\(\\star\\) \\(\\hat{a_n}\\) is the proportion of generated sample paths beginning at position \\(K\\), ending at position \\(n_{max}\\) that go outside the horizontal band \\([-\\varepsilon,+\\varepsilon]\\). ')),
                        splitLayout(
                            plotOutput("as_hist_Pn"),
                            plotOutput("as_Pn_curve"),
                            plotOutput("as_sp_Pn")
                            
                        ),
                        splitLayout(
                            plotOutput("as_hist_An"),
                            plotOutput("as_An_curve"),
                            plotOutput("as_sp_An")
                            
                        )
                        
                        
                        
                        
                    )
                )
            )
        ),
    
        tabItem(
            tabName="subMenu1",
            fluidPage(
              
                
                
                # Sidebar with a slider input for number of bins 
                sidebarLayout(
                    sidebarPanel(
                      box(width = 18,
                          helpText(h3("Visualize \\(X_n\\overset{p} {\\to} 0\\)  doesn't imply  \\(X_n\\overset{a.s.} {\\not\\to} 0\\)") )
                        
                      ),
                      
                    
                      box(width = 18,
                      sliderInput("sub1_n",
                                    "n=Number of points in each sample path",
                                    min = 1,
                                    max = 2000,
                                    step=50,
                                    value = 100),
                      
                      helpText("As \\(n\\) increases, "),
                      helpText('\\(\\star\\) Most of\\(\\hat{p_n}\\) will be \\(0\\) in the histogram but not for \\(\\hat{a_n}\\)' ),
                      helpText("\\(\\star\\)  The criterion value \\(\\hat{p_n}\\) curve will stay around 0, but not for \\(\\hat{a_n}\\)")
                      ),
                      
                      box(width = 18,
                        sliderInput("sub1_ns",
                                    "M=Number of sample paths",
                                    min = 1,
                                    max = 1000,
                                    step=50,
                                    value = 100),
                        
                        helpText("As \\(M\\) increases, "),
                        helpText("\\(\\star\\) The number of simulations will increase, therefore, more sample paths will be observed out of \\([-\\varepsilon,+\\varepsilon]\\)  ")
                        ),
                        
                      box(width = 18,
                      sliderInput("sub1_k",
                                  helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)"),
                                  min = 1,
                                  max = 2000,
                                  step=1,
                                  value = 20),
                    
                      helpText("As \\(K\\) increases,"),
                      helpText('\\(\\star\\) \\(\\displaystyle\\lim_{n \\to \\infty} \\hat{p_n} =0\\) , but there \\(\\not\\exists K \\geq n\\) that \\(\\hat{a_n}=0\\)' ),
                      helpText("\\(\\star\\) convergence in probability \\(\\not\\Rightarrow\\) almost sure convergence")
                      ),
                      box(width = 18,
                      sliderInput("sub1_ep",
                                  "Epsilon",
                                  min = 0.001,
                                  max = 4,
                                  step=0.01,
                                  value = 0.5),
                    helpText(" As \\(\\varepsilon\\) changes, the count of histogram of \\(\\hat{p_n}\\) will vary. ")
                      )
                      ),
                    # Show a plot of the generated distribution
                    mainPanel(
                      helpText(h4("Let \\(X_1, X_2,....,X_n\\) be independent random variables such that \\(P[X_n=\\sqrt{n}]=\\frac {1}{n}\\) and \\(P[X_n=0]=1-\\frac {1}{n}\\). We define \\(X=0\\)")),
                      
                      helpText(h4('\\(\\star\\) \\( \\hat{p_n}\\) is the proportion of generated sample paths lying outside \\([-\\varepsilon,+\\varepsilon]\\) at position \\(K\\). ')),
                      helpText(h4('\\(\\star\\) \\(\\hat{a_n}\\) is the proportion of the generated sample paths beginning at position \\(K\\), ending at position \\(n_{max}\\) that go outside the horizontal band \\([-\\varepsilon,+\\varepsilon]\\), ')),
                     
                        splitLayout(
                            plotOutput("subMenu1_hist_Pn"),
                            plotOutput("subMenu1_Pn_curve"),
                            plotOutput("subMenu1_sp_Pn")
                            
                        ),
                        splitLayout(
                            plotOutput("subMenu1_hist_An"),
                            plotOutput("subMenu1_An_curve"),
                            plotOutput("subMenu1_sp_An")
                            
                        )
                      
                        
                        
                        
                    )
                )
            )
        ),
        tabItem(
          tabName = "subMenu2",
          fluidPage(
            
            # Application title
            
            
            # Sidebar with a slider input for number of bins 
            sidebarLayout(
              sidebarPanel(
                box(width = 18,
                  helpText(h3("Visualize \\(X_n\\overset{p} {\\to} 0\\) doesn't imply \\(X_n\\overset{a.s.} {\\not\\to} 0\\)"))
                ),
                
                
                box(width = 18,
                sliderInput("sub2_n",
                            "n=Number of points in each sample path",
                            min = 1,
                            max = 2000,
                            step=50,
                            value = 100),
                
                helpText("As \\(n\\) increases,  "),
                helpText('\\(\\star\\) Most of\\(\\hat{p_n}\\) will be \\(0\\) in the histogram but not for \\(\\hat{a_n}\\)' ),
                helpText("\\(\\star\\)  The criterion value \\(\\hat{p_n}\\) curve will stay around 0, but not for \\(\\hat{a_n}\\)")
                ),
                box(width = 18,
                sliderInput("sub2_ns",
                            "M=Number of sample paths",
                            min = 1,
                            max = 1000,
                            step=100,
                            value = 50),
                
                helpText("As \\(M\\) increases, "),
                helpText("\\(\\star\\) The number of simulations will increase, therefore, more sample paths will be observed out of \\([-\\varepsilon,+\\varepsilon]\\)  ")
                ),
               
                box(width = 18,
                sliderInput("sub2_k",
                            withMathJax(helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)")),
                            min = 1,
                            max = 2000,
                            step=1,
                            value = 20),
                
                helpText("As \\(K\\) increases,"),
                helpText('\\(\\star\\) \\(\\displaystyle\\lim_{n \\to \\infty} \\hat{p_n} =0\\) , but there \\(\\not\\exists K \\geq n\\) that \\(\\hat{a_n}=0\\)' ),
                helpText("\\(\\star\\) convergence in probability \\(\\not\\Rightarrow\\) almost sure convergence")
                ),
                
                box(width = 18,
                    sliderInput("sub2_alpha",
                                withMathJax(helpText("\\(\\alpha\\)=power of \\(n\\)")),
                                min=0.01,
                                max=4,
                                step=0.05,
                                value = 0.5),
                    
                    helpText("As \\(\\alpha\\) increasess, the rate of \\(X_n\\overset{p} {\\to} 0\\) will not change.")
                ),
                
                
                box(width = 18,
                sliderInput("sub2_ep",
                            "Epsilon",
                            min=0.001,
                            max=4,
                            step=0.01,
                            value=0.5),
                helpText(" As \\(\\varepsilon\\) changes, the count of histogram of \\(\\hat{p_n}\\) will vary.")
                )
                
                ),
                
            
              
              # Show a plot of the generated distribution
              mainPanel(
                helpText(h4('Let \\(X_1, X_2,....,X_n\\) be independent random variables such that \\(P[X_n=n^\\alpha]=\\frac {1}{n}\\) and \\(P[X_n=0]=1-\\frac {1}{n}\\). We define \\(X=0\\).')),
                helpText(h4('\\(\\star\\) \\( \\hat{p_n}\\) is the proportion of generated sample paths lying outside \\([-\\varepsilon,+\\varepsilon]\\) at position \\(K\\). ')),
                helpText(h4('\\(\\star\\) \\(\\hat{a_n}\\) is the proportion of the generated sample paths beginning at position \\(K\\), ending at position \\(n_{max}\\) that go outside the horizontal band \\([-\\varepsilon,+\\varepsilon]\\), ')),
                
                splitLayout(
                  plotOutput("subMenu2_hist_Pn"),
                  plotOutput("subMenu2_Pn_curve"),
                  plotOutput("subMenu2_sp_Pn")
                  
                ),
                splitLayout(
                  plotOutput("subMenu2_hist_An"),
                  plotOutput("subMenu2_An_curve"),
                  plotOutput("subMenu2_sp_An")
                  
                ),
                
                
              )
            ))
          
        
        ),
        tabItem(
            tabName="d",
            fluidPage(
              
                
                # Sidebar with a slider input for number of bins 
                sidebarLayout(
                    sidebarPanel(
                     
                      box(width = 18,
                      helpText(h3("Visualize \\(X_n\\overset{d} {\\to} X\\) or \\(X_n\\overset{L} {\\to} X\\)"))
                      
                      ), 
                      
                      box(width = 18,
                      sliderInput("d_n",
                                  "n=Number of points in each path",
                                  min = 1,
                                  max = 1000,
                                  step=50,
                                  value = 100),
                    
                      helpText("As \\(n\\) increases,"),
                      helpText("\\(\\star\\) More points will be created in each sample path and the density plot will vary")
                      
                      
                      ),
                      
                      box(width = 18,
                        sliderInput("d_ns",
                                    "M=Number of sample paths",
                                    min = 1,
                                    max = 2000,
                                    step=30,
                                    value = 50) ,
                      
                        
                        helpText("As \\(M\\) increases,"),
                        helpText("\\(\\star\\) The 3-D plot of \\(\\widehat l_n(t)=\\lvert \\widehat F_{X_n}(t)-F_X(t) \\rvert\\) will get closer to zero horizontal plane "),
                        helpText("\\(\\star\\)  \\(X_n \\overset{d} {\\to} X\\sim N(0,1)\\)")
                        ),
                      box(width = 18,
                          sliderInput("d_k",
                                      helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)"),
                                      min = 1,
                                      max = 1000,
                                      step=1,
                                      value = 10),
                          helpText("As \\(K\\) increases,"),
                          helpText("\\(\\star\\) Density plot of \\(X_n\\) values will resemble a standard normal curve"),
                          helpText("\\(\\star\\) \\(\\widehat F_{X_n}(t)\\) will approach to \\(F_X(t)\\) ")
                      )
                       
                      
                    ),
                    
                    # Show a plot of the generated distribution
                    mainPanel(
                      helpText(h4('Let \\(Y_1, Y_2,....,Y_n\\) be independent random variables \\(Y\\sim \\chi_1^2\\), \\(Xn=\\frac {\\sum Y_i-n}{\\sqrt{2*n}} \\) and \\(X\\sim N(0,1)\\).')),
                      
                      helpText(h4("\\(F_{X_n}(t)\\) is the empirical distribution of \\(X_n\\) and \\(F_X(t)\\) is cdf of \\(X\\). We use \\(\\widehat F_{X_n} (t)\\) to approximate \\(F_{X_n}(t)\\). ")),
                        splitLayout(plotOutput("d_hist"),
                                    plotOutput("d_3D")
                        ),
                        
                        splitLayout(plotOutput("d_F"),
                                    plotOutput("d_sp")
                        )
                        
                        
                    )
                )
            )
        ),
    
        tabItem(
            tabName="clt",
            fluidPage(
                
                
                # Sidebar with a slider input for number of bins 
                sidebarLayout(
                    sidebarPanel(
                      box(width = 18,
                      helpText(h3("Central Limit Theorem"))
                      
                      ),
                      
                      box(width = 18,
                      sliderInput("clt_n",
                                  "n=number of points from each sample path",
                                  min = 10,
                                  max = 1000,
                                  step=5,
                                  value = 100),
                      
                      
                      
                      helpText("As \\(n\\) increases,"),
                      helpText("\\(\\star\\) More points will be created in each sample path and the density plot will vary")
                      
                      
                      
                      ),
                      
                      
                      box(width = 18,
                        sliderInput("clt_ns",
                                    "M=number of sample path",
                                    min = 1,
                                    max = 2000,
                                    step=5,
                                    value = 50),
                      
                      helpText("As \\(M\\) increases,"),
                      
            
                      helpText("\\(\\star\\) The 3-D plot of \\(\\widehat l_n(t)=\\lvert \\widehat F_{X_n}(t)-F_X(t) \\rvert\\) will get closer to zero horizontal plane"),
                      helpText("\\(\\star\\)  \\(X_n \\overset{d} {\\to} X\\sim N(0,1)\\)")
                      ),
                      
                      box(width = 18,
                          sliderInput("clt_k",
                                      helpText("\\(K\\)=position of \\(X_n\\) and \\(K\\leq n_{max}\\)"),
                                      min = 1,
                                      max = 1000,
                                      step=1,
                                      value = 10),
                          helpText("As \\(K\\) increases,"),
                          helpText("\\(\\star\\) Density plot of \\(X_n\\) values will resemble a standard normal curve"),
                          helpText("\\(\\star\\) \\(\\widehat F_{Xn}(t)\\) will approach to \\(F_X(t)\\)")
                          
                          
                          
                      ),
                      
                      box(width = 18,
                      sliderInput("clt_alpha",
                                    helpText("\\(\\alpha\\)=shape parameter"),
                                    min = 0.0001,
                                    max = 10,
                                    step=0.1,
                                    value = 2),
                    
                      
                      helpText("\\(\\star\\) As \\(\\alpha\\) increases, the histogram will be more symmetric ")
                      ),
                      
                      box(width = 18,
                        sliderInput("clt_beta",
                                    helpText("\\(\\beta\\)=scale parameter"),
                                    min = 0.0001,
                                    max = 10,
                                    step=0.1,
                                    value = 1),
                        
                        helpText("\\(\\star\\) As \\(\\beta\\) increases, the histogram will spread out more  ")
                      )
                        
                        
                    ),
                    
                    # Show a plot of the generated distribution
                    mainPanel(
                      helpText(h4("This app is designed to visualize \\(X_n=\\frac{\\sqrt{n} ( \\overline Y_i-\\mu)  )}{\\sigma} \\overset {d}{\\to} X\\sim N(0,1) \\; or\\; X_n=\\frac{\\sqrt{n} ( \\overline Y_i-\\mu)  )}{\\sigma} \\overset {L}{\\to} X\\sim N(0,1) \\).")),
                      helpText(h4('Let \\(Y_1, Y_2,....,Y_n\\) be independent random variables \\(Y\\sim Gamma(\\alpha,\\beta)\\) and \\(Xn=\\frac{\\sqrt{n}*(\\overline Y_i-\\alpha*\\beta)}{\\sqrt{\\alpha*\\beta^2}}\\).')),
                      helpText(h4("\\(F_{X_n}(t)\\) is the empirical distribution of \\(X_n\\) and \\(F_X(t)\\) is cdf of \\(X\\). We use \\(\\widehat F_{X_n} (t)\\) to approximate \\(F_{X_n}(t)\\).  ")),
                        splitLayout(
                      plotOutput("clt_hist"),
                      plotOutput("clt_3D")
                      ),
                        
                        splitLayout(plotOutput("clt_F"),
                                    plotOutput("clt_sp"))
                        
                        )
                )
            )
        )
        
    )))


# Define server logic required to draw a histogram
server <- function(input, output, session) {
    ##as     
 
  
  output$as_hist_Pn<- renderPlot({
    set.seed(1)
    as_Pn_n=input$number
    as_Pn_ns=input$numberS
    as_Pn_alp=input$alpha
    as_Pn_eps=input$ep
    as_Pn_f=function(as_Pn_n){cumsum(rnorm(as_Pn_n))/((1:as_Pn_n)**as_Pn_alp)}
    as_Pn_data <- generate(nmax=as_Pn_n,M=as_Pn_ns,as_Pn_f)$data
    as_Pn_critr <- criterion(as_Pn_data,epsilon=as_Pn_eps,mode="p")$crit
    as_y_Pn=max(hist(as_Pn_critr)$counts)+100
    as_hist_Pn=hist(as_Pn_critr,main=mtext(bquote(bold("Histogram of"~hat(p[k]))),col="darkblue"),
                    xlab=expression(hat(p[k])),
                    ylim=c(0,as_y_Pn),
                    border="red",col="purple")
    
    text(as_hist_Pn$mids,as_hist_Pn$counts,labels=as_hist_Pn$counts, adj=c(0.5, -0.5))
    text(x=0.9,y=as_y_Pn,bquote(bold("most"~hat(p[k])~"will be 0")),col="red",adj=1)
    
  })
  
  observe({
    as_Pn_n=input$number
    updateSliderInput(session,"k",max = input$number)
  })
  
  output$as_Pn_curve <- renderPlot({
    set.seed(1)
    as_Pn_n=input$number
    as_Pn_ns=input$numberS
    as_Pn_alp=input$alpha
    as_Pn_eps=input$ep
    as_Pn_k=input$k
    as_Pn_f=function(as_Pn_n){cumsum(rnorm(as_Pn_n))/((1:as_Pn_n)**as_Pn_alp)}
    as_Pn_data <- generate(nmax=as_Pn_n,M=as_Pn_ns,as_Pn_f)$data
    as_Pn_critr <- criterion(as_Pn_data,epsilon=as_Pn_eps,mode="p")$crit
    #as_Pn_Lines <- list(bquote(bold(atop("Criterion Value"~hat(p[n])~"Curve","Converge in p"~"<=>"~hat(p[n])~"tend to and stays at 0"))),bquote(bold(hat(p[n])==.(as_Pn_critr[as_Pn_k])~"at position"~X[.(as_Pn_k)])))
    
   #visualize.crit(as_Pn_critr, main=mtext(do.call(expression, as_Pn_Lines),side=3,line=1:0,col="darkblue"),col="red")  ##visualisation of convergence criterion curvers
    Pn_critr_x=1:as_Pn_n
    as_Pn=data.frame(cbind(Pn_critr_x,as_Pn_critr))
    as_Pn_x=as_Pn_k
    as_Pn_y=round(as_Pn_critr[as_Pn_k],digits=3)
    
    plot(x=Pn_critr_x,y=as_Pn_critr,xlab="n",ylab=bquote(hat(p[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(p[n])~"Curve")),col="darkblue"),col="red",type="l")
    points(x=as_Pn_x,y=as_Pn_y,pch=23,col="darkblue",bg="darkblue",cex=2)
    text(x=as_Pn_x+0.25*(as_Pn_x),y=as_Pn_y,bquote(bold(hat(p[k])==.(as_Pn_y))),cex=1.5,adj=0)
    text(x =as_Pn_n, y = max(as_Pn_critr),bquote(bold(hat(p[k])~"will tend to and stay at 0")),col="red",adj=1)
    
    
  })
  output$as_sp_Pn <- renderPlot({
    set.seed(1)
    as_Pn_n=input$number
    as_Pn_ns=input$numberS
    as_Pn_alp=input$alpha
    as_Pn_eps=input$ep
    as_Pn_k=input$k
    as_Pn_f=function(as_Pn_n){cumsum(rnorm(as_Pn_n))/((1:as_Pn_n)**as_Pn_alp)}
    as_Pn_data <- generate(nmax=as_Pn_n,M=as_Pn_ns,as_Pn_f)$data
    as_Pn_critr <- criterion(as_Pn_data,epsilon=as_Pn_eps,mode="p")$crit
    visualize.sp(as_Pn_data,nb.sp=as_Pn_ns,epsilon=as_Pn_eps,main= mtext(bquote(bold(atop(.(as_Pn_ns)~"sample paths of"~X[n]-X,.(round(as_Pn_ns*as_Pn_critr[as_Pn_k],digits=0))~"are outside"~"["~.(-as_Pn_eps)~","~.(+as_Pn_eps)~"]"))),col="darkblue"), col="grey")     #visualize 10 sample paths
    
    
  })
  
    output$as_hist_An <- renderPlot({
      
        set.seed(1)
        as_An_n=input$number
        as_An_ns=input$numberS
        as_An_alp=input$alpha
        as_An_eps=input$ep
        as_An_f=function(as_An_n){cumsum(rnorm(as_An_n))/((1:as_An_n)**as_An_alp)}
        as_An_data <- generate(nmax=as_An_n,M=as_An_ns,as_An_f)$data
        as_An_critr <- criterion(as_An_data,epsilon=as_An_eps,mode="as")$crit
        as_y_An=max(hist(as_An_critr)$counts)+100
        as_hist_An=hist(as_An_critr,main=mtext(bquote(bold("Histogram of"~hat(a[k]))),col="darkblue"), 
             xlab=expression(hat(a[k])), 
             border="blue", 
             col="green",
             ylim =c(0,as_y_An))
        as_hist_An
        text(as_hist_An$mids,as_hist_An$counts,labels=as_hist_An$counts, adj=c(0.5, -0.5))
        text(x=0.9,y=as_y_An,bquote(bold("most"~hat(a[k])~"will be 0")),col="red",adj=1)
        
    })
    
    observe({
      as_An_n=input$number
      updateSliderInput(session,"k",max = input$number)
    })
    output$as_An_curve <- renderPlot({
      set.seed(1)
      as_An_n=input$number
      as_An_ns=input$numberS
      as_An_alp=input$alpha
      as_An_eps=input$ep
      as_An_k=input$k
      as_An_f=function(as_An_n){cumsum(rnorm(as_An_n))/((1:as_An_n)**as_An_alp)}
      as_An_data <- generate(nmax=as_An_n,M=as_An_ns,as_An_f)$data
      as_An_critr <- criterion(as_An_data,epsilon=as_An_eps,mode="as")$crit
    
      #as_An_Lines <- list(bquote(bold(atop("Criterion Value"~hat(a[n])~"Curve","Converge a.s."~"<=>"~hat(a[n])~"tend to and stays at 0"))),bquote(bold(hat(a[n])==.(as_An_critr[as_An_k])~"at position"~X[.(as_An_k)])))
      
      #visualize.crit(as_An_critr, main=mtext(do.call(expression, as_An_Lines),side=3,line=1:0,col="darkblue"),col="red")  ##visualisation of convergence criterion curvers
      An_critr_x=1:as_An_n
      as_An=data.frame(cbind(An_critr_x,as_An_critr))
      as_An_x=as_An_k
      as_An_y=round(as_An_critr[as_An_k],digits=3)
      
      plot(x=An_critr_x,y=as_An_critr,xlab="n",ylab=bquote(hat(a[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(a[n])~"Curve")),col="darkblue"),col="red",type="l")
      points(x=as_An_x,y=as_An_y,pch=23,col="darkblue",bg="darkblue",cex=2)
      text(x=as_An_x+0.25*(as_An_x),y=as_An_y,bquote(bold(hat(a[k])==.(as_An_y))),cex=1.5,adj=0)
      text(x =as_An_n, y = max(as_An_critr),bquote(bold(hat(a[k])~"will tend to and stay at 0")),col="red",adj=1)
      
      
    })
    output$as_sp_An <- renderPlot({
      set.seed(1)
      as_An_n=input$number
      as_An_ns=input$numberS
      as_An_alp=input$alpha
      as_An_eps=input$ep
      as_An_k=input$k
      as_An_f=function(as_An_n){cumsum(rnorm(as_An_n))/((1:as_An_n)**as_An_alp)}
      as_An_data <- generate(nmax=as_An_n,M=as_An_ns,as_An_f)$data
      as_An_critr <- criterion(as_An_data,epsilon=as_An_eps,mode="as")$crit
      visualize.sp(as_An_data,nb.sp=as_An_ns,epsilon=as_An_eps,main= mtext(bquote(bold(atop(.(as_An_ns)~"sample paths of"~X[n]-X,.(round(as_An_ns*as_An_critr[as_An_k],digits=0))~"are outside"~"["~.(-as_An_eps)~","~.(+as_An_eps)~"]"))),col="darkblue"), col="grey")
        
    })
   
  ##p  sqrt(n)
    output$subMenu1_hist_Pn <- renderPlot({
      set.seed(1)
        sub1_n_Pn=input$sub1_n
        sub1_ns_Pn=input$sub1_ns
        sub1_eps_Pn=input$sub1_ep
        sub1_f_Pn<- function(sub1_n_Pn){rbinom(sub1_n_Pn,1,1/(1:sub1_n_Pn))*sqrt(1:sub1_n_Pn)}
        sub1_data_Pn <- generate(nmax=sub1_n_Pn,M=sub1_ns_Pn,sub1_f_Pn)$data
        sub1_critr_Pn <- criterion(sub1_data_Pn,epsilon=sub1_eps_Pn,mode="p")$crit
        
        
        sub1_y_Pn=max(hist(sub1_critr_Pn)$counts)+100
        sub1_hist_Pn=hist(sub1_critr_Pn,main=mtext(bquote(bold("Histogram of"~hat(p[k]))),col="darkblue"),
                        xlab=expression(hat(p[k])),
                        ylim=c(0,sub1_y_Pn),
                        border="red",col="purple")
        sub1_hist_Pn
        text(sub1_hist_Pn$mids,sub1_hist_Pn$counts,labels=sub1_hist_Pn$counts, adj=c(0.5, -0.5))
        text(x=0.9,y=sub1_y_Pn,bquote(bold("most"~hat(p[k])~"will be 0")),col="red",adj=1)
    })
    
    
    observe({
      sub1_n_Pn=input$sub1_n
      updateSliderInput(session,"sub1_k",max = input$sub1_n)
    })
    
    output$subMenu1_Pn_curve <- renderPlot({
      set.seed(1)
      sub1_n_Pn=input$sub1_n
      sub1_ns_Pn=input$sub1_ns
      sub1_eps_Pn=input$sub1_ep
      sub1_k_Pn=input$sub1_k
      sub1_f_Pn <- function(sub1_n_Pn){rbinom(sub1_n_Pn,1,1/(1:sub1_n_Pn))*sqrt(sub1_n_Pn)}
      sub1_data_Pn <- generate(nmax=sub1_n_Pn,M=sub1_ns_Pn,sub1_f_Pn)$data
      sub1_critr_Pn <- criterion(sub1_data_Pn,epsilon=sub1_eps_Pn,mode="p")$crit
      
      
        
      sub1_Pn_critr_x=1:sub1_n_Pn
      sub1_Pn=data.frame(cbind(sub1_Pn_critr_x,sub1_critr_Pn))
      sub1_Pn_x=sub1_k_Pn
      sub1_Pn_y=round(sub1_critr_Pn[sub1_Pn_x],digits=3)
      
      plot(x=sub1_Pn_critr_x,y=sub1_critr_Pn,xlab="n",ylab=bquote(hat(p[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(p[n])~"Curve")),col="darkblue"),col="red",type="l")
      points(x=sub1_Pn_x,y=sub1_Pn_y,pch=23,col="darkblue",bg="darkblue",cex=2)
      text(x=sub1_Pn_x+0.25*(sub1_Pn_x),y=sub1_Pn_y+0.25*(sub1_Pn_y),bquote(bold(hat(p[k])==.(sub1_Pn_y))),cex=1.5,adj=0)
      text(x =sub1_n_Pn, y = max(sub1_critr_Pn)-0.02,bquote(bold(lim(hat(p[n]),n%->%infinity)~"=0")),col="red",adj=1)
          
    })
    output$subMenu1_sp_Pn <- renderPlot({
      set.seed(1)
      sub1_n_Pn=input$sub1_n
      sub1_ns_Pn=input$sub1_ns
      sub1_eps_Pn=input$sub1_ep
      sub1_k_Pn=input$sub1_k
      sub1_f_Pn <- function(sub1_n_Pn){rbinom(sub1_n_Pn,1,1/(1:sub1_n_Pn))*sqrt(1:sub1_n_Pn)}
      sub1_data_Pn <- generate(nmax=sub1_n_Pn,M=sub1_ns_Pn,sub1_f_Pn)$data
      sub1_critr_Pn <- criterion(sub1_data_Pn,epsilon=sub1_eps_Pn,mode="p")$crit
        visualize.sp(sub1_data_Pn,nb.sp=sub1_ns_Pn,epsilon=sub1_eps_Pn,main= mtext(bquote(bold(atop(.(sub1_ns_Pn)~"sample paths of"~X[n]-X,.(round(sub1_ns_Pn*sub1_critr_Pn[sub1_k_Pn],digits=0))~"are outside"~"["~.(-sub1_eps_Pn)~","~.(+sub1_eps_Pn)~"]"))),col="darkblue"), col="grey")      #visualize 10 sample paths
        
    })
    output$subMenu1_hist_An <- renderPlot({
      set.seed(1)
      sub1_n_An=input$sub1_n
      sub1_ns_An=input$sub1_ns
      sub1_eps_An=input$sub1_ep
      sub1_f_An <- function(sub1_n_An){rbinom(sub1_n_An,1,1/(1:sub1_n_An))*sqrt(1:sub1_n_An)}
      sub1_data_An <- generate(nmax=sub1_n_An,M=sub1_ns_An,sub1_f_An)$data
      sub1_critr_An <- criterion(sub1_data_An,epsilon=sub1_eps_An,mode="as")$crit
        
        
        
        
        sub1_y_An=max(hist(sub1_critr_An)$counts)+100
        sub1_hist_An=hist(sub1_critr_An,main=mtext(bquote(bold("Histogram of"~hat(a[k]))),col="darkblue"), 
                        xlab=expression(hat(a[k])), 
                        border="blue", 
                        col="green",
                        ylim =c(0,sub1_y_An))
        sub1_hist_An
        text(sub1_hist_An$mids,sub1_hist_An$counts,labels=sub1_hist_An$counts, adj=c(0.5, -0.5))
        text(x=1.045,y=sub1_y_An,bquote(bold(hat(a[k])~"will be randomly distributed")),col="red",adj=1)
        
    })
    
    observe({
      sub1_n_An=input$sub1_n
      updateSliderInput(session,"sub1_k",max = input$sub1_n)
    })
    
    output$subMenu1_An_curve <- renderPlot({
      set.seed(1)
      sub1_n_An=input$sub1_n
      sub1_ns_An=input$sub1_ns
      sub1_eps_An=input$sub1_ep
      sub1_k_An=input$sub1_k
      sub1_f_An <- function(sub1_n_An){rbinom(sub1_n_An,1,1/(1:sub1_n_An))*sqrt(1:sub1_n_An)}
      sub1_data_An <- generate(nmax=sub1_n_An,M=sub1_ns_An,sub1_f_An)$data
      sub1_critr_An <- criterion(sub1_data_An,epsilon=sub1_eps_An,mode="as")$crit
      
       
        
      sub1_An_critr_x=1:sub1_n_An
      sub1_An=data.frame(cbind(sub1_An_critr_x,sub1_critr_An))
      sub1_An_x=sub1_k_An
      sub1_An_y=round(sub1_critr_An[sub1_An_x],digits=3)
      
      plot(x=sub1_An_critr_x,y=sub1_critr_An,xlab="n",ylab=bquote(hat(a[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(a[n])~"Curve")),col="darkblue"),col="red",type="l")
      points(x=sub1_An_x,y=sub1_An_y,pch=23,col="darkblue",bg="darkblue",cex=2)
      text(x=sub1_An_x+0.25*(sub1_An_x),y=sub1_An_y,bquote(bold(hat(a[k])==.(sub1_An_y))),cex=1.5,adj=0)
      text(x =sub1_n_An, y = max(sub1_critr_An),bquote(bold(hat(a[k])~"will not stay at 0")),col="red",adj=1) 
        
    })
    output$subMenu1_sp_An <- renderPlot({
       set.seed(1)
      sub1_n_An=input$sub1_n
      sub1_ns_An=input$sub1_ns
      sub1_eps_An=input$sub1_ep
      sub1_k_An=input$sub1_k
      sub1_f_An <- function(sub1_n_An){rbinom(sub1_n_An,1,1/(1:sub1_n_An))*sqrt(1:sub1_n_An)}
      sub1_data_An <- generate(nmax=sub1_n_An,M=sub1_ns_An,sub1_f_An)$data
      sub1_critr_An <- criterion(sub1_data_An,epsilon=sub1_eps_An,mode="as")$crit
        visualize.sp(sub1_data_An,nb.sp=sub1_ns_An,epsilon=sub1_eps_An,main= mtext(bquote(bold(atop(.(sub1_ns_An)~"sample paths of"~X[n]-X,.(round(sub1_ns_An*sub1_critr_An[sub1_k_An],digits=0))~"are outside"~"["~.(-sub1_eps_An)~","~.(+sub1_eps_An)~"]"))),col="darkblue"), col="grey")
        
    })
    
    ## p n**alpha
    output$subMenu2_hist_Pn <- renderPlot({
      set.seed(1)
      sub2_n_Pn=input$sub2_n
      sub2_ns_Pn=input$sub2_ns
      sub2_alp_Pn=input$sub2_alpha
      sub2_eps_Pn=input$sub2_ep
      sub2_f_Pn <- function(sub2_n_Pn){rbinom(sub2_n_Pn,1,1/(1:sub2_n_Pn))*((1:sub2_n_Pn)**sub2_alp_Pn)}
      sub2_data_Pn <- generate(nmax=sub2_n_Pn,M=sub2_ns_Pn,sub2_f_Pn)$data
      sub2_critr_Pn <- criterion(sub2_data_Pn,epsilon=sub2_eps_Pn,mode="p")$crit
      
      sub2_y_Pn=max(hist(sub2_critr_Pn)$counts)+100
      sub2_hist_Pn=hist(sub2_critr_Pn,main=mtext(bquote(bold("Histogram of"~hat(p[k]))),col="darkblue"),
                        xlab=expression(hat(p[k])),
                        ylim=c(0,sub2_y_Pn),
                        border="red",col="purple")
      sub2_hist_Pn
      text(sub2_hist_Pn$mids,sub2_hist_Pn$counts,labels=sub2_hist_Pn$counts, adj=c(0.5, -0.5))
      text(x=0.9,y=sub2_y_Pn,bquote(bold("most"~hat(p[k])~"will be 0")),col="red",adj=1)
      
      
    })
    
    observe({
      sub2_n_Pn=input$sub2_n
      updateSliderInput(session,"sub2_k",max = input$sub2_n)
    })
    
    output$subMenu2_Pn_curve <- renderPlot({
      set.seed(1)
      sub2_n_Pn=input$sub2_n
      sub2_ns_Pn=input$sub2_ns
      sub2_alp_Pn=input$sub2_alpha
      sub2_eps_Pn=input$sub2_ep
      sub2_k_Pn=input$sub2_k
      sub2_f_Pn <- function(sub2_n_Pn){rbinom(sub2_n_Pn,1,1/(1:sub2_n_Pn))*((1:sub2_n_Pn)**sub2_alp_Pn)}
      sub2_data_Pn <- generate(nmax=sub2_n_Pn,M=sub2_ns_Pn,sub2_f_Pn)$data
      sub2_critr_Pn <- criterion(sub2_data_Pn,epsilon=sub2_eps_Pn,mode="p")$crit
      
      sub2_Pn_critr_x=1:sub2_n_Pn
      sub2_Pn=data.frame(cbind(sub2_Pn_critr_x,sub2_critr_Pn))
      sub2_Pn_x=sub2_k_Pn
      sub2_Pn_y=round(sub2_critr_Pn[sub2_Pn_x],digits=3)
      
      plot(x=sub2_Pn_critr_x,y=sub2_critr_Pn,xlab="n",ylab=bquote(hat(p[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(p[n])~"Curve")),col="darkblue"),col="red",type="l")
      points(x=sub2_Pn_x,y=sub2_Pn_y,pch=23,col="darkblue",bg="darkblue",cex=2)
      text(x=sub2_Pn_x+0.25*(sub2_Pn_x),y=sub2_Pn_y+0.25*(sub2_Pn_y),bquote(bold(hat(p[k])==.(sub2_Pn_y))),cex=1.5,adj=0)
      text(x =sub2_n_Pn, y = max(sub2_critr_Pn)-0.02,bquote(bold(lim(hat(p[n]),n%->%infinity)~"=0")),col="red",adj=1)
      
    })
    output$subMenu2_sp_Pn <- renderPlot({
      set.seed(1)
      sub2_n_Pn=input$sub2_n
      sub2_ns_Pn=input$sub2_ns
      sub2_alp_Pn=input$sub2_alpha
      sub2_eps_Pn=input$sub2_ep
      sub2_k_Pn=input$sub2_k
      sub2_f_Pn <- function(sub2_n_Pn){rbinom(sub2_n_Pn,1,1/(1:sub2_n_Pn))*((1:sub2_n_Pn)**sub2_alp_Pn)}
      sub2_data_Pn <- generate(nmax=sub2_n_Pn,M=sub2_ns_Pn,sub2_f_Pn)$data
      sub2_critr_Pn <- criterion(sub2_data_Pn,epsilon=sub2_eps_Pn,mode="p")$crit
      visualize.sp(sub2_data_Pn,nb.sp=sub2_ns_Pn,epsilon=sub2_eps_Pn,main= mtext(bquote(bold(atop(.(sub2_ns_Pn)~"sample paths of"~X[n]-X,.(round(sub2_ns_Pn*sub2_critr_Pn[sub2_k_Pn],digits=0))~"are outside"~"["~.(-sub2_eps_Pn)~","~.(+sub2_eps_Pn)~"]"))),col="darkblue"), col="grey")         #visualize 10 sample paths
      
    })
    output$subMenu2_hist_An <- renderPlot({
      set.seed(1)
      sub2_n_An=input$sub2_n
      sub2_ns_An=input$sub2_ns
      sub2_alp_An=input$sub2_alpha
      sub2_eps_An=input$sub2_ep
      sub2_f_An <- function(sub2_n_An){rbinom(sub2_n_An,1,1/(1:sub2_n_An))*((1:sub2_n_An)**sub2_alp_An)}
      sub2_data_An <- generate(nmax=sub2_n_An,M=sub2_ns_An,sub2_f_An)$data
      sub2_critr_An <- criterion(sub2_data_An,epsilon=sub2_eps_An,mode="as")$crit
      
      
      sub2_y_An=max(hist(sub2_critr_An)$counts)+100
      sub2_hist_An=hist(sub2_critr_An,main=mtext(bquote(bold("Histogram of"~hat(a[k]))),col="darkblue"), 
                        xlab=expression(hat(a[k])), 
                        border="blue", 
                        col="green",
                        ylim =c(0,sub2_y_An))
      sub2_hist_An
      text(sub2_hist_An$mids,sub2_hist_An$counts,labels=sub2_hist_An$counts, adj=c(0.5, -0.5))
      text(x=1.045,y=sub2_y_An,bquote(bold(hat(a[k])~"will be randomly distributed")),col="red",adj=1)
    })
    
    
    observe({
      sub2_n_An=input$sub2_n
      updateSliderInput(session,"sub2_k",max = input$sub2_n)
    })
    
    output$subMenu2_An_curve <- renderPlot({
      set.seed(1)
      sub2_n_An=input$sub2_n
      sub2_ns_An=input$sub2_ns
      sub2_alp_An=input$sub2_alpha
      sub2_eps_An=input$sub2_ep
      sub2_k_An=input$sub2_k
      sub2_f_An <- function(sub2_n_An){rbinom(sub2_n_An,1,1/(1:sub2_n_An))*((1:sub2_n_An)**sub2_alp_An)}
      sub2_data_An <- generate(nmax=sub2_n_An,M=sub2_ns_An,sub2_f_An)$data
      sub2_critr_An <- criterion(sub2_data_An,epsilon=sub2_eps_An,mode="as")$crit
      
      
      sub2_An_critr_x=1:sub2_n_An
      sub2_An=data.frame(cbind(sub2_An_critr_x,sub2_critr_An))
      sub2_An_x=sub2_k_An
      sub2_An_y=round(sub2_critr_An[sub2_An_x],digits=3)
      
      plot(x=sub2_An_critr_x,y=sub2_critr_An,xlab="n",ylab=bquote(hat(a[n])~"value"), main=mtext(bquote(bold("Criterion Value"~hat(a[n])~"Curve")),col="darkblue"),col="red",type="l")
      points(x=sub2_An_x,y=sub2_An_y,pch=23,col="darkblue",bg="darkblue",cex=2)
      text(x=sub2_An_x+0.25*(sub2_An_x),y=sub2_An_y,bquote(bold(hat(a[k])==.(sub2_An_y))),cex=1.5,adj=0)
      text(x =sub2_n_An, y = max(sub2_critr_An),bquote(bold(hat(a[k])~"will not stay at 0")),col="red",adj=1) 
      
    })
    output$subMenu2_sp_An <- renderPlot({
      set.seed(1)
      sub2_n_An=input$sub2_n
      sub2_ns_An=input$sub2_ns
      sub2_alp_An=input$sub2_alpha
      sub2_eps_An=input$sub2_ep
      sub2_k_An=input$sub2_k
      sub2_f_An <- function(sub2_n_An){rbinom(sub2_n_An,1,1/(1:sub2_n_An))*((1:sub2_n_An)**sub2_alp_An)}
      sub2_data_An <- generate(nmax=sub2_n_An,M=sub2_ns_An,sub2_f_An)$data
      sub2_critr_An <- criterion(sub2_data_An,epsilon=sub2_eps_An,mode="as")$crit
      visualize.sp(sub2_data_An,nb.sp=sub2_ns_An,epsilon=sub2_eps_An,main= mtext(bquote(bold(atop(.(sub2_ns_An)~"sample paths of"~X[n]-X,.(round(sub2_ns_An*sub2_critr_An[sub2_k_An],digits=0))~"are outside"~"["~.(-sub2_eps_An)~","~.(+sub2_eps_An)~"]"))),col="darkblue"), col="grey")
      
    })
    ##d
    
   
    
    
    observe({
      d_n=input$d_n
      updateSliderInput(session,"d_k",max = input$d_n)
    })
    
    output$d_hist <- renderPlot({
      set.seed(1)
      d_n=input$d_n
      d_ns=input$d_ns
      d_k=input$d_k
      d_f=function(d_n){(cumsum(rchisq(d_n,df=1))-(1:d_n))/sqrt(2*(1:d_n))}
      d_data=data.frame()
      for (s in 1:d_ns){
        d_data=rbind(d_data,d_f(d_n))
      }
      d_h=hist(data.matrix(d_data[d_k]),main=mtext(bquote(bold("Density plot of"~X[n]~"values")),col="darkblue"),xlab="Xn values",col="green",border = "red",prob = T, xlim = c(-4,4))
     
      lines(seq(-4,4,length=d_ns),dnorm(seq(-4,4,length=d_ns)),col="darkblue",lwd=3)
      
      legend('topleft', c(expression(hat(f[X[n]](t))),expression(f[X](t))),
             fill =c("green", "darkblue"))
      
      text(x=4,y=max(d_h$density),bquote(bold(f[X[n]](t)~"will resemble"~f[X](t))),col="red",adj=1)
    })
    
    output$d_3D <- renderPlot({
      set.seed(1)
      d_n=input$d_n
      d_ns=input$d_ns
        
      d_f=function(d_n){(cumsum(rchisq(d_n,df=1))-(1:d_n))/sqrt(2*(1:d_n))}
        d_data_3D <- generate(randomgen=d_f,nmax=d_n,M=d_ns)$data
        law.plot3d(d_data_3D,pnorm)
    })
    
    
    output$d_F <- renderPlot({
      set.seed(1)
    
      d_n=input$d_n
      d_ns=input$d_ns
      d_k=input$d_k
      d_f=function(d_n){(cumsum(rchisq(d_n,df=1))-(1:d_n))/sqrt(2*(1:d_n))}
      d_data=data.frame()
      for (s in 1:d_ns){
        d_data=rbind(d_data,d_f(d_n))
      }
      d_h=hist(data.matrix(d_data[d_k]),main=mtext(bquote(bold(.(d_ns)~"sample paths of"~X[n]~"values")),col="darkblue"),xlab="Xn values",col="green",border = "red",xlim = c(-4,4),prob=T,breaks = d_ns)
      
      d_y=d_h$density
      d_x=seq(-4,4,length.out =length(d_y))
      
      plot(d_x,cumsum(d_y)/max(cumsum(d_y)),type="l",lwd=2,main=mtext(bquote(bold(hat(F[X[n]](t))~"and"~F[X](t))),col="darkblue"),col="green",xlim=c(-4,4),xlab = "X", ylab = "Cumulative probability" )
      lines(d_x,pnorm(d_x),col="darkblue")
      legend('topleft', c(expression(hat(F[X[n]](t))),expression(F[X](t))),
             fill =c("green", "darkblue"))
      
      text(x=4,y=0.05,bquote(bold(F[X[n]](t)~"will resemble"~F[X](t))),col="red",adj=1)
    })
    
    output$d_sp <- renderPlot({
      set.seed(1)
      d_n=input$d_n
      d_ns=input$d_ns
        #eps2=input$ep2
      d_f=function(d_n){(cumsum(rchisq(d_n,df=1))-(1:d_n))/sqrt(2*(1:d_n))}
      d_data_3D <- generate(randomgen=d_f,nmax=d_n,M=d_ns)$data
        visualize.sp(d_data_3D,nb.sp=d_ns,epsilon=3,main=mtext(bquote(bold(.(d_ns)~"sample paths of"~X[n]~"values")),col="darkblue"), col="grey")
    })
    
    ##clt
    
    observe({
      clt_n=input$clt_n
      updateSliderInput(session,"clt_k",max = input$clt_n)
    })
    
    output$clt_hist <- renderPlot({
      set.seed(1)
        clt_n=input$clt_n
        clt_ns=input$clt_ns
        clt_alpha=input$clt_alpha
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
        
        
        })
    
    output$clt_3D <- renderPlot({
      set.seed(1)
      clt_n=input$clt_n
      clt_ns=input$clt_ns
      clt_alpha=input$clt_alpha
      clt_beta=input$clt_beta
      clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
      
      clt_data_3D=data.frame()
      for (t in 1:clt_ns){
        clt_data_3D=rbind(clt_data_3D,clt_f(clt_n))
      }
      law.plot3d(data.matrix(clt_data_3D),pnorm)
    })
    
    output$clt_F <- renderPlot({ 
      set.seed(1)
      clt_n=input$clt_n
      clt_ns=input$clt_ns
      clt_alpha=input$clt_alpha
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
      legend('topleft', c(expression(hat(F[X[n]](t))),expression(F[X](t))),
             fill =c("green", "darkblue"))
      
      text(x=4,y=0.1,bquote(bold(F[X[n]](t)~"will resemble"~F[X](t))),col="red",adj=1)
    })
    
    output$clt_sp <- renderPlot({
      set.seed(1)
      clt_n=input$clt_n
      clt_ns=input$clt_ns
      clt_alpha=input$clt_alpha
      clt_beta=input$clt_beta
        #eps3=input$ep3
      clt_f=function(clt_n){sqrt(1:clt_n)*(cumsum(rgamma(clt_n,shape=clt_alpha,scale=clt_beta))/(1:clt_n)-clt_alpha*clt_beta)/sqrt(clt_alpha*(clt_beta**2))}
        clt_data_3D=data.frame()
        for (t in 1:clt_ns){
          clt_data_3D=rbind(clt_data_3D,clt_f(clt_n))
        }
        visualize.sp(data.matrix(clt_data_3D),nb.sp=clt_ns,epsilon=3,main=mtext(bquote(bold(.(clt_ns)~"sample paths of"~X[n])),col="darkblue"), col="grey")
        
    })
  
    
}

# Run the application 
shinyApp(ui = ui, server = server)
