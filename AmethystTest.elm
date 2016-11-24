module AmethystTest exposing (..)

import Array

main = 
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias Model = 
  { ends : Array }

model : Model
model = 
  { ends = AmethystMary.warpColors }



-- VIEW

view : Model -> Html Msg
view model = 
  div []
    --Array.map drawThread model.ends



-- UPDATE
 
update : Msg -> Model -> Model
update msg model = 
  model
