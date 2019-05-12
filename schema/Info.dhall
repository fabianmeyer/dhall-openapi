let Contact = ./Contact.dhall
let License = ./License.dhall
in { title : Text
   , description : Optional Text
   , termsOfService : Optional Text
   , contact : Optional Contact
   , license : Optional License
   , version : Text } 