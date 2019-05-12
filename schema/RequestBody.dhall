let ContentEntry = ./ContentEntry.dhall

in { description : Optional Text
   , content : List ContentEntry 
   , required : Optional Bool }