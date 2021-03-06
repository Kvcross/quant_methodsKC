dat = read.csv('./data/tgpp.csv')
## Programming for repetive tasks ------------------
class(dat[,1])
class(dat[,2])
class(dat[,3])
sapply(dat, class)
## For Loop
# we need to create an iterator that will provide
# an index for the operation we would like to repeat
# this is any variable you wish
# typically i, j, or k and so forth but could just
# as easily be "index" or "my_interator" although
# that is not recommended
for(i in 1:11) {
  print(class(dat[ , i]))
}
## let's capture the ouput in an object
# first we have to define an empty object
# we'll call this dat_classes
dat_classes = NULL
for(i in 1:11) {
  dat_classes[i] = class(dat[ , i])
}
## alternatively you can concatenate
# but the first approach is a bit cleaner
dat_classes = NULL
for(i in 1:11) {
  dat_classes = c(dat_classes, class(dat[ , i]))
}
## make your loops general
# in other words you don't want it to break if the
# number of columns of dat changes
dat_classes = NULL
for(i in 1:ncol(dat)) {
  dat_classes[i] = class(dat[ , i])
}
## if statements
dat_classes = NULL
for(i in 1:ncol(dat)) {
  dat_classes[i] = class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
}
## else if
dat_classes = NULL
for(i in 1:ncol(dat)) {
  dat_classes[i] = class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
  else {
    print('crap')
  }
}
## nested ifs
dat_classes = NULL
for(i in 1:ncol(dat)) {
  dat_classes[i] = class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
  else {
    if(dat_classes[i] == 'factor') {
      print('ok')
    }
    else {
      print('crap')
    }
  }
}
## alternatively
# we can format our nested if as else if statements
# this is a bit easier to read for most folks
dat_classes = NULL
for(i in 1:ncol(dat)) {
  dat_classes[i] = class(dat[ , i])
  if(dat_classes[i] == "integer") {
    print('sweet!')
  }
  else if (dat_classes[i] == 'factor') {
    print('ok')
  }
  else {
    print('crap')
  }
}
# In one liner situations you can also use the
# function ifelse()
x = 1:10
ifelse(x > 5 , 'sweet!', 'crap!')
for(i in x) {
  if(i > 5)
    print('sweet')
  else
    print('crap')
}
## assignment 1
x = 1:10
y = NULL
for(i in 1:length(x)) {
  y[i] = sum(x[1:i])
}
## put this into a function
eval_class = function(x) {
  if (class(x) != 'data.frame'){
    stop('x must be a data.frame()')
  }
  else {
    x_classes = NULL
    for(i in 1:ncol(x)) {
      x_classes[i] = class(x[ , i])
      if(x_classes[i] == "integer") {
        print('sweet!')
      }
      else if (x_classes[i] == 'factor') {
        print('ok')
      }
      else {
        print('crap')
      }
    }
  }
  return(x_classes)
}
sum_numbers = function(x) {
  y = sum(x)
  return(y)
}
## debug functions using
debug(eval_class)
## you have to turn off the debugger when your done
undebug(eval_class)


