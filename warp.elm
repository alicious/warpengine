module Warp exposing (..)
import Html exposing (Html, button, div, text, select, option, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Dict exposing (Dict, fromList, insert)



main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias Model = 
  { colorPlan : List Int
  , palette : Dict Int String
  }

model : Model
model =
  { colorPlan = [ ]
  , palette = fromList 
    [ (1, "Red")
    , (2, "Green")
    , (3, "Blue")
    ]
  } 



-- UPDATE

type Msg 
  = Add Int 
  | Change Int String

update : Msg -> Model -> Model
update msg model =
  case msg of 
    Add color ->
      { model | colorPlan = color :: model.colorPlan }
    Change index hex ->
      { model | palette = insert index hex model.palette } 



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [ class "color-buttons" ] 
      ( model.palette
        |> Dict.toList
        |> List.map makeColorButton 
      )
    , div [] [ text (toString model.colorPlan) ]
    , div [ class "edit-palette" ] 
      ( model.palette
        |> Dict.toList
        |> List.map makePaletteInput 
      )
    ]

makeColorButton : (Int, String) -> Html Msg 
makeColorButton (index, color) =
  button 
    [ onClick (Add index), 
      style [ ("border", "3px solid " ++ color ) ] 
    ] 
    [ text color ]

makePaletteInput : (Int, String) -> Html Msg 
makePaletteInput (index, hex) =
    input [ placeholder (toString hex), onInput (Change index) ] []
