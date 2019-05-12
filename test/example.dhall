let OpenAPI = ../schema/OpenAPI.dhall 
let Contact = ../schema/Contact.dhall
let License = ../schema/License.dhall
let Server = ../schema/Server.dhall
let ServerVariable = ../schema/ServerVariable.dhall
let api = {
  openapi = "3.0.0"
, info = { 
    title =	"My Cool API"
  , description =	Some "This is a pretty cool API"
  , termsOfService = None Text
  , contact = None Contact
  , license = None License
  , version =	"1.0.0" }
, servers = [{
    url = "https://api.test.net/"
  , description = None Text
  , variables = [{
      mapKey = "Bla"
    , mapValue = { 
        enum = [] : List Text 
      , default = "Hello"
      , description = None Text }}]
  }]
} : OpenAPI
in api