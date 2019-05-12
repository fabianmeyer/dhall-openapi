let Info = ./Info.dhall
let Server = ./Server.dhall
in 
{ openapi :	Text
, info: Info 
, servers :	List Server 
-- , paths	: ./Paths.dhall
-- , components : Optional ./Components.dhall
-- , security : Optional List ./SecurityRequirement.dhall
-- , tags : Optional List ./Tag.dhall
-- , externalDocs : Optional ./ExternalDocumentation.dhall
}