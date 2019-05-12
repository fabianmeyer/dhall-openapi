let ExternalDocumentation = ./ExternalDocumentation.dhall
in { name : Text
   , description : Optional Text
   , externalDocs : Optional ExternalDocumentation }