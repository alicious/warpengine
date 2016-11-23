module Warp exposing (..)

import Html exposing (Html, button, div, text, select, option, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Dict exposing (Dict, fromList, insert)
import Style 


-- MODEL

type alias Model = 
  { colorPlan : List Int
  , palette : Palette
  }

type alias Palette = Dict Int String

initModel : Model
initModel =
  { colorPlan = [ 
      0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,1,5,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,1,5,0,4,0,4,1,5,0,4,0,4,0,4,0,4,0,4,1,5,0,4,0,4,1,5,0,4,0,4,1,5,0,4,1,5,1,6,0,4,0,4,1,5,0,4,0,4,1,5,0,4,1,5,1,6,0,4,1,5,1,6,0,4,0,4,1,5,0,4,1,5,1,6,0,4,1,5,1,6,0,4,1,5,1,6,1,5,1,6,2,6,0,4,1,5,1,6,0,4,1,5,1,6,1,5,1,6,2,6,1,5,1,6,2,6,0,4,1,5,1,6,1,5,1,6,2,6,1,5,1,6,2,6,1,5,1,6,2,6,1,6,2,6,2,7,1,5,1,6,2,6,1,5,1,6,2,6,1,6,2,6,2,7,1,6,2,6,2,7,1,5,1,6,2,6,1,6,2,6,2,7,1,6,2,6,2,7,1,6,2,6,2,7,2,6,2,7,3,7,1,6,2,6,2,7,1,6,2,6,2,7,2,6,2,7,3,7,2,6,2,7,3,7,1,6,2,6,2,7,2,6,2,7,3,7,2,6,2,7,3,7,2,6,2,7,3,7,1,6,2,6,2,7,2,6,2,7,3,7,2,6,2,7,3,7,1,6,2,6,2,7,1,6,2,6,2,7,2,6,2,7,3,7,1,6,2,6,2,7,1,6,2,6,2,7,1,6,2,6,2,7,1,5,1,6,2,6,1,6,2,6,2,7,1,6,2,6,2,7,1,5,1,6,2,6,1,5,1,6,2,6,1,6,2,6,2,7,1,5,1,6,2,6,1,5,1,6,2,6,1,5,1,6,2,6,0,4,1,5,1,6,1,5,1,6,2,6,1,5,1,6,2,6,0,4,1,5,1,6,0,4,1,5,1,6,1,5,1,6,2,6,0,4,1,5,1,6,0,4,1,5,1,6,0,4,1,5,1,6,0,4,0,4,1,5,0,4,1,5,1,6,0,4,1,5,1,6,0,4,0,4,1,5,0,4,0,4,1,5,0,4,1,5,1,6,0,4,0,4,1,5,0,4,0,4,1,5,0,4,0,4,1,5,0,4,0,4,0,4,0,4,0,4,1,5,0,4,0,4,1,5,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,1,5,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4,0,4
      ]
  , palette = fromList 
    [ ( 0, "#7b5b6b" )
    , ( 1, "#928c87" )
    , ( 2, "#dbc5a4" )
    , ( 3, "#eabc7b" )
    , ( 4, "#4d4d33" )
    , ( 5, "#6f8545" )
    , ( 6, "#a5c0b3" )
    , ( 7, "#d5ddda" )
    ]
  } 

init : ( Model, Cmd Msg )
init =
  ( initModel, Cmd.none )

codifyPalette : Palette -> String
codifyPalette palette = 
  palette
  |> Dict.values
  |> String.join "&"

decodePalette : String -> Palette
decodePalette paletteCode =
  paletteCode
  |> String.split "&"
  |> List.indexedMap (,)
  |> fromList
  


-- MESSAGES

type Msg 
  = Add Int 
  | Change Int String
  | UpdatePalette String



-- VIEW

view : Model -> Html Msg
view model =
  div [ style Style.body ]
    [ div [ style Style.colorPlan ]
          ( List.map ( drawThread model ) model.colorPlan )
    , div [ style Style.palette ]
      ( model.palette
        |> Dict.toList
        |> List.map makePaletteEntry
      )
    , div [ style Style.shareAndImport ]
          [ input [ onInput ( UpdatePalette ) 
                  , value ( codifyPalette model.palette )
                  ]
                  []
          ]
    ]

drawThread : Model -> Int -> Html Msg
drawThread model colorIndex =
    let color = 
        case Dict.get colorIndex model.palette of
            Nothing -> "#FFFFFF"
            Just color -> color
    in
        div [ style ( ( "background-color", color ) :: Style.thread ) ]
        []

makePaletteButton : Int -> String -> Html Msg 
makePaletteButton index hexcolor =
  button 
    [ -- onClick ( Add index ), 
      style ( ( "background-color", hexcolor ) :: Style.paletteButton )
    ] 
    [ text ( toString index ) ]

makePaletteInput : Int -> String -> Html Msg 
makePaletteInput index hexcolor =
    input [ value hexcolor 
          , onInput ( Change index ) 
          , style Style.paletteInput
          ] 
          []

makePaletteEntry : ( Int, String ) -> Html Msg
makePaletteEntry ( index, hexcolor ) =
    div [ style Style.paletteEntry ]
    [ makePaletteButton index hexcolor 
    , makePaletteInput index hexcolor
    ]


-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    Add color ->
      ( { model | colorPlan = color :: model.colorPlan }, Cmd.none )
    Change index hex ->
      ( { model | palette = insert index hex model.palette }, Cmd.none )
    UpdatePalette paletteCode ->
      ( { model | palette = decodePalette paletteCode }, Cmd.none )



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
