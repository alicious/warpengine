module Warp exposing (..)
import Html exposing (Html, button, div, text, select, option, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Dict exposing (Dict, fromList, insert)



-- MODEL

type alias Model = 
  { colorPlan : List Int
  , palette : Dict Int String
  }

initModel : Model
initModel =
  { colorPlan = [ ]
  , palette = fromList 
    [ (1, "Red")
    , (2, "Green")
    , (3, "Blue")
    ]
  } 

init : (Model, Cmd Msg)
init =
  (initModel, Cmd.none)



-- MESSAGES

type Msg 
  = Add Int 
  | Change Int String



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



-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    Add color ->
      ( { model | colorPlan = color :: model.colorPlan }, Cmd.none )
    Change index hex ->
      ( { model | palette = insert index hex model.palette }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- MAIN

main : Program Never Model Msg
main =
  Html.program
    { init = init 
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
