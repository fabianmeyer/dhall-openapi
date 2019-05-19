let Operation = ./Operation.dhall
let ParameterOrReference = ./ParameterOrReference.dhall
let Reference = ./Reference.dhall 
let Server = ./Server.dhall

in { `$ref` : Optional Text 
   , summary : Optional Text
   , description : Optional Text
   , get : Optional Operation
   , put : Optional Operation
   , post : Optional Operation
   , delete : Optional Operation
   , options : Optional Operation
   , head : Optional Operation
   , patch : Optional Operation
   , trace : Optional Operation
   , servers : List Server
   , parameters : List ParameterOrReference }