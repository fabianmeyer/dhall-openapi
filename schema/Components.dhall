let SchemaEntry = ./SchemaEntry.dhall
let ResponseEntry = ./ResponseEntry.dhall
let ParameterEntry = ./ParameterEntry.dhall
let ExampleEntry = ./ExampleEntry.dhall
let RequestBodyEntry = ./RequestBodyEntry.dhall
let HeaderEntry = ./HeaderEntry.dhall
let SecuritySchemeEntry = ./SecuritySchemeEntry.dhall
let LinkEntry = ./LinkEntry.dhall
let CallbackEntry = ./CallbackEntry.dhall

in { schemas : List SchemaEntry 
   , responses : List ResponseEntry 
   , parameters : List ParameterEntry 
   , examples : List ExampleEntry
   , requestBodies : List RequestBodyEntry
   , headers : List HeaderEntry
   , securitySchemes : List SecuritySchemeEntry
   , links : List LinkEntry
   , callbacks : List CallbackEntry }