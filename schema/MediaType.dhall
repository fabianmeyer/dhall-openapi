let ExampleEntry = ./ExampleEntry.dhall
let EncodingEntry = ./EncodingEntry.dhall 
let SchemaOrReference = ./SchemaOrReference.dhall 

in { schema: Optional SchemaOrReference 
 -- , example : Any 
   , examples : List ExampleEntry
   , encoding : List EncodingEntry }