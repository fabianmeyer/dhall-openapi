let Callback = ./Callback.dhall
let Reference = ./Reference.dhall

in { mapKey : Text, mapValue : <Callback | Reference> } 