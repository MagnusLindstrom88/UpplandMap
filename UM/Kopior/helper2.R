round_df <- function(x, digits) {
  # round all numeric variables
  # x: data frame 
  # digits: number of digits to round
  numeric_columns <- sapply(x, class) == 'numeric'
  x[numeric_columns] <-  round(x[numeric_columns], digits)
  return(x)
}

karta<- function(x,v){
  
  y<-switch(x,
            "Parker & grönområden" = c("Area","X1a","X1b","X1c","X1d","X1e"),
            "Mångfald i bostadsutbudet" =c("Area","X2a","X2b","X2c","X2d","X2e"),
            "Levandegöra gemensamma platser" =c("Area","X3a","X3b","X3c","X3d","X3e"),
            "Kommunikationer" = c("Area","X4a","X4b","X4c","X4d","X4e"),
            "Kultur & fritid" = c("Area","X5a","X5b","X5c","X5d","X5e"),
            "Utbildning" = c("Area","X6a","X6b","X6c","X6d","X6e"),
            "Omsorg" = c("Area","X7a","X7b","X7c","X7d","X7e"),
            "Skolan" = c("Area","X8a","X8b","X8c","X8d","X8e"),
            "Trygghet" = c("Area","X9a","X9b","X9c","X9d","X9e"),
            "Hållbar utveckling" = c("Area","X10a","X10b","X10c","X10d","X10e")
  )
  if(is.null(v)){
  y<-subset(clean4,select=y)
  y<-internal_popup(x,y)
  y$favorit = names(y)[-1][apply(y[-1],1,which.max)]
  return(y)
 } else{
   y<-subset(v,select=y)
   y<-internal_popup(x,y)
   y$favorit = names(y)[-1][apply(y[-1],1,which.max)]
   return(y)
  }
  
}

popup<-function(x){
  
  z<-switch(x,
            "Parker & grönområden" = c("F1"),
            "Mångfald i bostadsutbudet" =c("F2"),
            "Levandegöra gemensamma platser" =c("F3"),
            "Kommunikationer" = c("F4"),
            "Kultur & fritid" = c("F5"),
            "Utbildning" = c("F6"),
            "Omsorg" = c("F7"),
            "Skolan" = c("F8"),
            "Trygghet" = c("F9"),
            "Hållbar utveckling" = c("F10")
  )
  
  
  z<-subset(fragor,select=z)

  return(z)        
  
}
internal_popup<-function(x,y){
  
  z<-switch(x,
            "Parker & grönområden" = c("F1"),
            "Mångfald i bostadsutbudet" =c("F2"),
            "Levandegöra gemensamma platser" =c("F3"),
            "Kommunikationer" = c("F4"),
            "Kultur & fritid" = c("F5"),
            "Utbildning" = c("F6"),
            "Omsorg" = c("F7"),
            "Skolan" = c("F8"),
            "Trygghet" = c("F9"),
            "Hållbar utveckling" = c("F10")
  )
  
  z<-subset(fragor,select=z)
  names(y)<-c("Bostadsområde",t(z))
  return(y)        
  
}

