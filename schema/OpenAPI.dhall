let Info = ./Info.dhall
let Server = ./Server.dhall
let PathEntry = ./PathEntry.dhall 
let ExternalDocumentation = ./ExternalDocumentation.dhall 
let Components = ./Components.dhall
let SecurityRequirement = ./SecurityRequirement.dhall
let Tag = ./Tag.dhall 

in 
{ openapi : Text
, info: Info 
, servers : List Server  
, paths : List PathEntry
, components : Optional Components
, security : List SecurityRequirement
, tags : List Tag
, externalDocs : Optional ExternalDocumentation
}