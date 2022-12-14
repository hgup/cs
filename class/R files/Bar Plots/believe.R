#options(device = "RStudioGD")
pdf_file <- "pdf/believe.pdf"
cairo_pdf(pdf_file, bg = "grey98", width = 9, height = 6.5)

par(omi = c(0.65, 0.25, 0.75, 0.75)+0.2,
    mai = c(0.3,2,0.35,0),
    mgp = c(3,3,0),
    family = "Inter Light",
    las = 1)

# install.packages("gdata", dependencies = TRUE, repos = "http://cran.studio.com")
# library(gdata)

# Import data and prepare chart
library(readxl)
ipsos <- read_excel("data_files/ipsos.xlsx")
sort.ipsos <- ipsos[order(ipsos$Percent),]

attach(sort.ipsos) #Attach the database to use `Country` instead of `ipsos$Country`


# Create Chart
x <- barplot( Percent, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "grey", axes = F)

# Label Chart
POI <- c("USA", "Brazil","India")
for (i in 1: length(Country))
{
  if (Country[i] %in% POI)
  {myFont <- "Inter Black"} else {myFont <- "Inter Light"}
  text(-8.5, x[i], Country[i], xpd = NA, adj = 1, cex = 0.85, family= myFont)
  text(-3.5, x[i], Percent[i], xpd = NA, adj = 1, cex = 0.85, family= myFont)
}

# Other Elements

rect(0,-0.5,20,28, col = rgb(249,219,189,80, maxColorValue = 255), border = NA)
rect(20,-0.5,40,28, col = rgb(249,219,189,120, maxColorValue = 255), border = NA)
rect(50,-0.5,60,28, col = rgb(249,219,189,80, maxColorValue = 255), border = NA)
rect(60,-0.5,80,28, col = rgb(249,219,189,120, maxColorValue = 255), border = NA)
rect(80,-0.5,100,28, col = rgb(249,219,189,80, maxColorValue = 255), border = NA)

myValue2 <- c()
for (i in 1: length(Country)){
  if (Country[i] %in% POI)
  {myValue2 <- c(myValue2,Percent[i])} else {myValue2 <- c(myValue2,0)}
}
myColour2 <- rgb(3,29,68, maxColorValue = 255)
x2 <- barplot(myValue2, name.arg = F, horiz = T, border = NA, xlim = c(0,100),
              col = myColour2, cex.names = 0.85, axes = F, add = T)

arrows(45, -0.5, 45, 20.5, lwd = 1.5, length = 0, xpd = T, col = "skyblue3")
arrows(45, -0.5, 45, -0.75, lwd = 3, length = 0, xpd = T)
arrows(45, 20.5, 45, 20.75, lwd = 3, length = 0, xpd = T)
text(41, 20.5, "Average", adj= 1, xpd = T, cex = 0.65, font = 3)
text(44, 20.5, "45", adj = 1, xpd = T, cex = 0.65, family = "Inter", font = 4)
text( 100, 20.5, "All values in percent", adj = 1, xpd = T, cex = 0.65, font =3)

mtext(c(0,20,40,60,80,100), at = c(0,20,40,60,80,100), 1, line = 0, cex = 0.80)

# Tilting

mtext("`I definitely Believe in God or a Supreme Being`", 3, line = 1.3,
      adj = 0, cex = 1.2, family = "Inter Black", outer = T)
mtext("was said in 2010 in :", 3, line = -0.4, adj = 0, outer = T, family = "Inter Light", font = 4)
mtext("Source: www.ipsos-na.com, Desigh: Stefan Fichtel, ixtract", 1, line =1,
       adj = 1.0, cex = 0.65, outer = T, font = 3)

detach(sort.ipsos)
dev.off()




