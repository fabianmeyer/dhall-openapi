let ServerVariable = ./ServerVariable.dhall
let VariableEntry = ./VariableEntry.dhall

in { url : Text
   , description : Optional Text
   , variables : List VariableEntry }  