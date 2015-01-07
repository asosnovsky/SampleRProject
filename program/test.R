### Load Data [START] ###
if(!exists("Oil")) Oil = Quandl("OPEC/ORB");
### Load Data [END] ###

### Program [START] ###

p = try(plot(Oil));
plotWithTitle(p,"OPEC Crude Oil Price");

### Program [END] ###