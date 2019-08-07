easy_function <- function(a,b,c){
  result = 24
  for(x in a){
    result = result+x
  }
  if(b != 0){
    return(result/b)
  }
  else{
    if(c == TRUE){
      return(result)
    }
    else{
      return(result*2)
      }
  }
}

result = easy_function(c(1,2,3,4),6,TRUE)


x = c(1:100)
y = c(c(1:100)*5)
df = c(x,y)
y
hist(x,y)
lm1 = lm(x~y)
summary(lm1)
