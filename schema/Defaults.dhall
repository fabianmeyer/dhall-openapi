let CallbackEntry = ./CallbackEntry.dhall
let Components = ./Components.dhall
let Contact = ./Contact.dhall
let ContentEntry = ./ContentEntry.dhall
let EncodingEntry = ./EncodingEntry.dhall 
let ExampleEntry = ./ExampleEntry.dhall
let ExternalDocumentation = ./ExternalDocumentation.dhall
let HeaderEntry = ./HeaderEntry.dhall
let HeaderEntry = ./HeaderEntry.dhall
let License = ./License.dhall
let LinkEntry = ./LinkEntry.dhall
let Operation = ./Operation.dhall
let ParameterEntry = ./ParameterEntry.dhall 
let ParameterOrReference = ./ParameterOrReference.dhall
let PathEntry = ./PathEntry.dhall
let Reference = ./Reference.dhall
let RequestBodyEntry = ./RequestBodyEntry.dhall
let RequestBodyOrReference = ./RequestBodyOrReference.dhall
let ResponseEntry = ./ResponseEntry.dhall
let ResponseEntry = ./ResponseEntry.dhall 
let Schema = ./Schema.dhall
let SchemaEntry = ./SchemaEntry.dhall 
let SchemaOrReference = ./SchemaOrReference.dhall
let SecurityRequirement = ./SecurityRequirement.dhall
let SecuritySchemeEntry = ./SecuritySchemeEntry.dhall
let Server = ./Server.dhall
let ServerVariable = ./ServerVariable.dhall
let Tag = ./Tag.dhall
let VariableEntry = ./VariableEntry.dhall

in { 
  Contact = { 
    name = None Text
  , url = None Text
  , email = None Text }

, Components = { 
     schemas = [] : List SchemaEntry 
   , responses = [] : List ResponseEntry 
   , parameters = [] : List ParameterEntry 
   , examples = [] : List ExampleEntry
   , requestBodies = [] : List RequestBodyEntry
   , headers = [] : List HeaderEntry
   , securitySchemes = [] : List SecuritySchemeEntry
   , links = [] : List LinkEntry
   , callbacks = [] : List CallbackEntry }
   
, Info = { 
    description = None Text
  , termsOfService = None Text
  , contact = None Contact
  , license = None License } 

, MediaType = { 
     schema = None SchemaOrReference
   , examples = [] : List ExampleEntry
   , encoding = [] : List EncodingEntry }

, OpenAPI = {
    servers = [] : List Server  
  , paths = [] : List PathEntry
  , components = None Components
  , security = [] : List SecurityRequirement
  , tags = [] : List Tag
  , externalDocs = None ExternalDocumentation }

, Operation = { 
    tags = [] : List Text
  , summary = None Text  
  , description = None Text  
  , externalDocs = None ExternalDocumentation
  , operationId = None Text
  , parameters = [] : List ParameterOrReference
  , requestBody = None RequestBodyOrReference
  , responses = [] : List ResponseEntry
  , callbacks = [] : List CallbackEntry
  , deprecated = None Bool
  , security = [] : List SecurityRequirement 
  , servers = [] : List Server }

, Parameter = {
    description = None Text
  , required = None Bool
  , deprecated = None Bool
  , allowEmptyValue = None Bool }

, PathItem = { 
    `$ref` = None Text 
  , summary = None Text
  , description = None Text
  , get = None Operation
  , put = None Operation
  , post = None Operation
  , delete = None Operation
  , options = None Operation
  , head = None Operation
  , patch = None Operation
  , trace = None Operation
  , servers = [] : List Server
  , parameters = [] : List ParameterOrReference 
  }

, Response = { 
    headers = [] : List HeaderEntry
  , content = [] : List ContentEntry 
  , links = [] : List LinkEntry }

, Server = { 
    description = None Text
  , variables = [] : List VariableEntry }

, ServerVariable = { 
    enum = [] : List Text 
  , description = None Text }

, Tag =  { 
    description = None Text
  , externalDocs = None ExternalDocumentation }
}