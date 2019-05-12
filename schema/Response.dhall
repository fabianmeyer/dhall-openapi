let ContentEntry = ./ContentEntry.dhall
let HeaderEntry = ./HeaderEntry.dhall
let LinkEntry = ./LinkEntry.dhall

in { description : Text
   , headers : List HeaderEntry
   , content : List ContentEntry 
   , links : List LinkEntry }