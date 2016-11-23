module Warp exposing (..)

import Html exposing (Html, button, div, text, select, option, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Dict exposing (Dict, fromList, insert)
import Regex

import Style 
import MB
import DoubleSide


-- MODEL

type alias Model = 
  { warpColors : List Int
  , palette : Palette
  , selectedPalette : Int 
  }

type alias Palette = Dict Int PaletteColor 

type alias PaletteColor = { hex : String, name : String }

initModel : Model
initModel =
  { warpColors = DoubleSide.warpColors
  , palette = fromList DoubleSide.palette
  , selectedPalette = 0
  } 

init : ( Model, Cmd Msg )
init =
  ( initModel, Cmd.none )

hexMatches : String -> ( String, String ) -> Bool
hexMatches target ( hex, name ) =
  if target == hex then True else False
  
codifyPalette : Palette -> String
codifyPalette palette = 
  palette
  |> Dict.values
  |> List.map .hex
  |> String.join "&"

decodePalette : String -> Maybe Palette
decodePalette paletteCode =
  let hexList = 
    paletteCode
    |> String.split "&"
    |> List.filter ( Regex.contains ( Regex.regex "^#[0-9a-f]{6}" ) )
  in
    case ( List.length hexList ) == 8 of
    True -> 
      hexList
      |> List.indexedMap paletteColorFromHex 
      |> fromList
      |> Just
    False -> Nothing
    
  
paletteColorFromHex : Int -> String -> ( Int, PaletteColor )
paletteColorFromHex index hex = 
  let name = 
    case List.head ( List.filter ( hexMatches hex ) MB.catalog ) of
      Nothing -> "unknown"
      Just (hex, name) -> name
  in
    ( index, { hex = hex, name = name } )



-- MESSAGES

type Msg 
  = Add Int 
  | UpdatePalette String
  | ChangePaletteEntry String String
  | UpdateSelectedPalette Int



-- VIEW

view : Model -> Html Msg
view model =
  div [ style Style.body ]
    [ div [ style Style.container ]
          ( List.map ( drawThread model ) model.warpColors )
    , div [ style Style.container ]
      [ div [ style Style.palette ]
        ( model.palette
          |> Dict.toList
          |> List.map ( makePaletteEntry model.selectedPalette )
        )
      , div [ style Style.colorCatalog ]
            ( MB.catalog
              |> List.map ( makeSwatch model )
            )
      ]
    , div [ style Style.shareAndImport ]
          [ input [ onInput ( UpdatePalette ) 
                  , value ( codifyPalette model.palette )
                  , style [ ( "width", "428px" ) ]
                  ]
                  []
          ]
    ]

drawThread : Model -> Int -> Html Msg
drawThread model colorIndex =
    let color = 
        case Dict.get colorIndex model.palette of
            Nothing -> "#FFFFFF"
            Just paletteEntry -> paletteEntry.hex
    in
        div [ style ( ( "background-color", color ) :: Style.thread ) ]
        []

makePaletteButton : Int -> String -> Bool -> Html Msg 
makePaletteButton index hexcolor selected =
  button 
    [ onClick ( UpdateSelectedPalette index ), 
      style ( ( Style.colorSwatch hexcolor selected ) ++ Style.paletteButton )
    ] 
    []

makePaletteEntry : Int -> ( Int, PaletteColor ) -> Html Msg
makePaletteEntry current ( index, color ) =
  let selected = current == index
  in
    div [ style Style.paletteEntry ]
    [ makePaletteButton index color.hex selected
    , text color.name 
    ]

makeSwatch : Model -> ( String, String ) -> Html Msg
makeSwatch model ( hexcolor, name ) =
  let selected =
    case Dict.get model.selectedPalette model.palette of
      Nothing -> False
      Just paletteEntry -> hexcolor == paletteEntry.hex
  in
    div [ style ( Style.colorSwatch hexcolor selected ) 
        , onClick ( ChangePaletteEntry hexcolor name )
        ]
      []
 

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    Add color ->
      ( { model | warpColors = color :: model.warpColors }, Cmd.none )
    UpdatePalette paletteCode ->
      let newPalette = decodePalette paletteCode
      in 
        case newPalette of
          Just palette ->
            ( { model | palette = palette }, Cmd.none )
          Nothing ->
            ( model, Cmd.none )
    ChangePaletteEntry hex name ->
      ( { model | palette = 
        insert model.selectedPalette { hex = hex, name = name } model.palette
        }
      , Cmd.none
      )  
    UpdateSelectedPalette index ->
      ( { model | selectedPalette = index }, Cmd.none )



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
