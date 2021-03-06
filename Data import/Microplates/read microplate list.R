read.microplate.list<-function(file.list="", directory=".", ext="TXT",print=TRUE,...){

  
  if(file.list==""){
  file.list<-list.files(path=directory, pattern=ext)
  }
  
  readings<-NULL
  for(file in file.list){
    if(print){print(file)}
    try({
        readings.temp<-read.microplate(paste(directory,"/",file, sep=""),...)
        readings.temp$file<-file
        readings<-rbind(readings, readings.temp)
        })
  }
  
  return(readings)
}
