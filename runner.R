
### Loading External Support Files [Start] ###
  library("Quandl");
  
### Loading External Support Files [End] ###
### Loading Local Support Files [Start] ###
(function(){
  ##  Setting Loading Queue
  ### Project Files [Start] ###
    MainFileName = "runner.R";
    reqlist = c(
      "functions/plotWithTitle.R",
      "functions/toMiliSeconds.R",
      "program/test.R"
    )
  
  ### Project Files [END] ###
  ##  Default Working directory
  setwd("C:/");
  
  ##  Showing current directory
    print(paste("Current working directory:",
        getwd()
    ));
    ### Shows an appropriate error message
      #
      #@(msg) the message
      #
      #@(return)  a dialog box or line
      #
    errmsg = function(msg,string=FALSE){
      if(Sys.info()["sysname"] == "Windows"){
        if(string){
          winDialogString(msg,'');
        }
        else{
          winDialog('ok',msg);
        } 
      }
      else{
        if(string){
          readline(msg);
        }
        else{
          print(msg)
        }
      }
    }
    
    ### Checks if we have a valid wd
      #
      #@(return)  null
      #
    checkWD = function(MainFileName){
      print(paste('Attempting to load ', getwd(), MainFileName, '...'));
      # Checks if we are in the correct wd
      if(!MainFileName %in% getwd()){
        
        #Show error msg and ask for new file lopasteion
        errmsg('Working directory does not contain main file. Please choose where main file is lopasteed.');
        mainLoc = file.choose();
        
        #Change wd
        wdChange = try(setwd(gsub(MainFileName,'',mainLoc)));
        
        #If an error occurs try again
        if("try-error" %in% class(wdChange)){
          errmsg('Wrong file name.');
          mainLoc = file.choose();
          
          #Change wd
          wdChange = try(setwd(gsub(MainFileName,'',mainLoc)));
          
          #If an error occurs try again
          if("try-error" %in% class(wdChange)){
            MainFileName = errmsg('Please input the correct file name',TRUE);
            
            #Change wd
            wdChange = try(setwd(gsub(MainFileName,'',mainLoc)));
            
            #If an error occurs try again
            if("try-error" %in% class(wdChange)){
              checkWD(MainFileName);
            }
          }
        }
      }
    }
    
  ##  Run the check working directory function
    checkWD(MainFileName);
    
  ##  Load Support Functions
    for(i in 1:length(reqlist)){
      source(reqlist[i]);
    }
})()
### Loading Support Files [End] ###
