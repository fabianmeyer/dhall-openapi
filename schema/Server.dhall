let ServerVariable = ./ServerVariable.dhall
in { url : Text
   , description : Optional Text
   , variables : List {mapKey : Text, mapValue : ServerVariable} } 