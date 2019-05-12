let Callback = ./Callback.dhall  
let CallbackEntry = ./CallbackEntry.dhall
let ExternalDocumentation = ./ExternalDocumentation.dhall
let ParameterOrReference = ./ParameterOrReference.dhall
let RequestBodyOrReference = ./RequestBodyOrReference.dhall
let ResponseEntry = ./ResponseEntry.dhall
let SecurityRequirement = ./SecurityRequirement.dhall
let Server = ./Server.dhall
 
in { tags : List Text
   , summary : Optional Text 
   , description : Optional Text  
   , externalDocs : Optional ExternalDocumentation 
   , operationId : Optional Text
   , parameters : List ParameterOrReference
   , requestBody : Optional RequestBodyOrReference 
   , responses : List ResponseEntry
   , callbacks : List CallbackEntry 
   , deprecated : Optional Bool
   , security : List SecurityRequirement 
   , servers : List Server }