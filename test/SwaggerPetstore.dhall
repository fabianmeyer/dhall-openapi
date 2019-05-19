let Defaults = ./schema/Defaults.dhall
let OpenAPI = ./schema/OpenAPI.dhall 
let RequestBodyOrReference = ./schema/RequestBodyOrReference.dhall
let SchemaOrReference = ./schema/SchemaOrReference.dhall
let ResponseOrReference = ./schema/ResponseOrReference.dhall
let MediaType = ./schema/MediaType.dhall

{-- Info --}
let apacheLicence = 
  { name = "Apache 2.0"
  , url = Some "http://www.apache.org/licenses/LICENSE-2.0.html" }

let swaggerContact = Defaults.Contact // 
  { email = Some "apiteam@swagger.io" }

let swaggerDocs = { url = "http://swagger.io" }

let info = Defaults.Info //
  { title =	"Swagger Petstore"
  , description =	Some ''
    This is a sample server Petstore server.  You can find out more about Swagger
    at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/). For
    this sample, you can use the api key `special-key` to test the authorization filters. ''
  , termsOfService = Some "http://swagger.io/terms/"
  , contact = Some swaggerContact
  , license = Some apacheLicence
  , version = "1.0.0" }

{-- Servers --}
let httpsServer = Defaults.Server // 
  { url = "https://petstore.swagger.io/v2" }

let httpServer = Defaults.Server // 
  { url = "http://petstore.swagger.io/v2" }

let servers = [ httpsServer, httpServer ]

{-- Tags --}
let petTag = 
  { name = "pet"
  , description = Some "Everything about your Pets"
  , externalDocs = Some (swaggerDocs /\ { description = Some "Find out more"}) }

let storeTag = Defaults.Tag // 
  { name = "store"
  , description = Some "Access to Petstore orders" }

let userTag = 
  { name = "user"
  , description = Some "Operations about user"
  , externalDocs = Some (swaggerDocs /\ { description = Some "Find out more about our store" }) }

let tags = [ petTag, storeTag, userTag ]

{-- Paths --}
let mime = 
  { json = "application/json" 
  , xml = "application/xml" }

let invalidIdResponse = { mapKey = "400", mapValue = ResponseOrReference.Response (Defaults.Response /\ { description = "Invalid ID supplied" } )}
let petNotFoundResponse = { mapKey = "404", mapValue = ResponseOrReference.Response (Defaults.Response /\ { description = "Pet not found" } )}
let validationExceptionResponse = { mapKey = "405", mapValue = ResponseOrReference.Response (Defaults.Response /\ { description = "Validation exception" } )}
let invalidInputResponse = { mapKey = "405", mapValue = ResponseOrReference.Response (Defaults.Response /\ { description = "Invalid input" } )}

let petSchema = (Defaults.MediaType // { schema = Some (SchemaOrReference.Reference {`$ref` = "#/components/schemas/Pet" }) })
let petSchemaFor = \(mime : Text) -> { mapKey = mime, mapValue = petSchema }
let petSchemaAccFn = \(mime : Text) -> \(acc : List  { mapKey : Text, mapValue: MediaType }) -> acc # [petSchemaFor mime]
let petSchemasFor = \(mimes : List Text) -> List/fold Text mimes (List  { mapKey : Text, mapValue: MediaType }) petSchemaAccFn ([] : List  { mapKey : Text, mapValue: MediaType }) 


let petstoreAuth = [ {mapKey = "petstore_auth", mapValue = ["write:pets", "read:pets"] } ]

{-- Update Pet --}
let updatePetReqBody = 
  { description = Some "Pet object that needs to be added to the store"
    , content = petSchemasFor [mime.json, mime.xml]
    , required = Some True }

let updatePet = Defaults.Operation // 
  { tags = [ petTag.name ]
  , summary = Some "Update an existing pet" 
  , operationId = Some "updatePet"
  , requestBody = Some (RequestBodyOrReference.RequestBody updatePetReqBody)
  , responses = 
    [ invalidIdResponse
    , petNotFoundResponse
    , validationExceptionResponse ]
  , security = petstoreAuth
  }

{-- Add Pet --}
let addPetReqBody = updatePetReqBody

let addPet = Defaults.Operation // 
  { tags = [ petTag.name ]
  , summary = Some "Add a new pet to the store" 
  , operationId = Some "addPet"
  , requestBody = Some (RequestBodyOrReference.RequestBody addPetReqBody)
  , responses = [ invalidInputResponse ]
  , security = petstoreAuth
  }

let petPath = Defaults.PathItem // 
  { put = Some updatePet
  , post = Some addPet }

let paths = [ 
    { mapKey = "/pet", mapValue = petPath }
  ] 

{-- Components --}
let components = Some Defaults.Components 

{-- API --}
in Defaults.OpenAPI // 
  { openapi = "3.0.1"
  , info = info
  , externalDocs = Some (swaggerDocs /\ { description = Some "Find out more about Swagger"})
  , servers = servers
  , tags = tags
  , paths = paths
  -- , components = components 
  } : OpenAPI