#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = "stressless.css",
   
   # Application title
   headerPanel("TEST: Which stress type are you?"),
   
   # Sidebar with a slider input for number of bins 
   navlistPanel(
       
       tabPanel("Take the test", verticalLayout(
           titlePanel("When I am stressed..."),
           wellPanel(
            radioButtons("Triangle_1", "...I start smoking again or more often than before.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
          wellPanel(
               radioButtons("Circle_1", "...my desk quickly starts looking messy.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_1", "...I look stressed too.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_2", "...I don't know whether I'm coming or going.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_2", "...I reduce my sporting activities at once.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_3", "...I don't go to see a doctor despite my physical discomfort.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_2", "...I suffer from head- and/or back ache.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_3", "...I miss appointments or cancel them last-minute.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_3", "...I don't sleep well.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
              radioButtons("Triangle_4", "...I eat more.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)      ),
           wellPanel(
               radioButtons("Circle_4", "...I get the feeling of losing control.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_5", "...I tend to eat less healthy.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_4", "...relaxation exercises don't have any effect on me.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_5", "...I'm troubled by self-doubt.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_6", "...I'm gaining weight.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_5", "...It's difficulte for me to separate important tasks from less important ones.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_6", "...activities make me nervous that usually make me feel relaxed.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_6", "...I kep looking for things I've misplaced.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_7", "...prevention appointment at the doctor's are the first things that I cancel.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_8", "...I drink more alcohol.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_7", "...I tend to work less efficiently.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_7", "...I feel bad when faced with other people's success.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_9", "...I neglect my health.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_8", "...my blood pressure goes up.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_8", "...I turn to petty activities (checking email all the time, many times a day etc).", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_9", "...I suffer from fear of failure or existential fear.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Triangle_10", "...I neglect my personal and dental hygiene.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_9", "...I overdraw my account in order to take comfort in material things.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Square_10", "...I react nervously and testily.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(
               radioButtons("Circle_10", "...I jump from one activity to the next.", c("0: not correct", "1: sometimes correct", "2: often correct", "3: always correct"), inline = T)
           ),
           wellPanel(textOutput("triangleResults"), textOutput("squareResults"), textOutput("circleResults"))
        )
   ),
   tabPanel("Check your type", imageOutput("typeAnswer", width = 10, height = "auto"))
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
    num_triangle_q <- 10
    num_square_q <- 10
    num_circle_q <- 10
    
   output$triangleResults <- reactive({
        tricmd = paste(sprintf("input$Triangle_%s", seq(1:num_triangle_q)), collapse = ",")
        #print(tricmd)
        eval(parse(text=paste0('tri_string = c(',tricmd,')')))
        #print(tri_string)
        paste("Triangle score:", sum(as.numeric(substr(tri_string, start = 1, stop = 1))))
   })
   output$squareResults <- reactive({
       squcmd = paste(sprintf("input$Square_%s", seq(1:num_square_q)), collapse = ",")
       eval(parse(text=paste0('squ_string = c(',squcmd,')')))
       paste("Square score:", sum(as.numeric(substr(squ_string, start = 1, stop = 1))))
   })
   output$circleResults <- reactive({
       circmd = paste(sprintf("input$Circle_%s", seq(1:num_circle_q)), collapse = ",")
       eval(parse(text=paste0('cir_string = c(',circmd,')')))
       paste("Circle score:", sum(as.numeric(substr(cir_string, start = 1, stop = 1))))
   })
   output$typeAnswer <- renderImage({
       list(src = 'www/S__35749986.jpg',width = "1000",height="auto")
   }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

