## Coverts Time to Miliseconds
  #
  #@(time)  time input
  #
  #@(return)  time converted to Miliseconds
  #
  toMiliSeconds = function (time) {
    as.numeric(as.POSIXct(time));
  };