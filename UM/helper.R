round_df <- function(x, digits) {
  # round all numeric variables
  # x: data frame 
  # digits: number of digits to round
  numeric_columns <- sapply(x, class) == 'numeric'
  x[numeric_columns] <-  round(x[numeric_columns], digits)
  x
}

karta<- function(x){
  
  y<-switch(x,
            "Parker & grönområden" = c("Area","X1a","X1b","X1c","X1d","X1e"),
            "Mångfald i bostadsutbudet" =list("Bostadsområde",X2a,X2b,X2c,X2d,X2e)
            )
  
  print(y)
   y<-subset(cleanRound,select=y)
 y$favorit = names(y)[-1][apply(y[-1],1,which.max)]
 print(y)
  y
}