module Warp exposing (..)

import Html exposing ( Html, button, div, text, select, option, input )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick, onInput )
import Dict exposing ( Dict, fromList, insert )
import Array exposing ( Array )
import Json.Decode as Json 
import Window
import Regex
import Task

import Style 
import MB
import DoubleSide 
import LandOfEnchantment
import AmethystMary

import Ports
import Model exposing (..)

-- MODEL

initWarp : { a
              | threading : String
              , tieup : List (List Int)
              , treadling : String
              , warpColors : String
              , weftColors : String
            } 
            -> Warp
initWarp warp =
  { warpColors = jsonToArray warp.warpColors
  , threading = jsonToArray warp.threading
  , treadling = jsonToArray warp.treadling
  , weftColors = jsonToArray warp.weftColors
  , tieup = warp.tieup
  }

initPalette : Palette
initPalette =
  fromList
  [ ( 0, { hex = "#928c87", name = "dark grey" } )
  , ( 1, { hex = "#7b5b6b", name = "plum" } )
  , ( 2, { hex = "#928c87", name = "dark grey" } )
  , ( 3, { hex = "#dbc5a4", name = "flax" } )
  , ( 4, { hex = "#eabc7b", name = "honey" } )
  , ( 5, { hex = "#4d4d33", name = "taupe" } )
  , ( 6, { hex = "#6f8545", name = "lime" } )
  , ( 7, { hex = "#a5c0b3", name = "seaton" } )
  , ( 8, { hex = "#d5ddda", name = "pale grey" } )
  ]


jsonToArray : String -> Array Int
jsonToArray string =
  case Json.decodeString ( Json.array Json.int ) string of
  Ok value -> value
  Err _ -> Array.empty

initModel : Model
initModel =
  let ( warpA, warpB, warpC ) = 
    ( initWarp DoubleSide.warp
    , initWarp LandOfEnchantment.warp 
    , initWarp AmethystMary.warp )
  in
    { warp = warpA
    , palette = initPalette
    , selectedPalette = 1
    , warpTemplates = fromList ( List.indexedMap (,) [ warpA, warpB, warpC ] )
    , selectedTemplate = 0
    } 

init : ( Model, Cmd Msg )
init =
    let model = initModel in
    ( model, Ports.warpChange (Ports.modelToChange model) )

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

hexMatches : String -> ( String, String ) -> Bool
hexMatches target ( hex, name ) =
  if target == hex then True else False
  


-- VIEW

view : Model -> Html Msg
view model =
  div [ style Style.body ]
  {--  BASIC COLORPLAN VIEW
    [ div [ style Style.container ]
        ( model.warp.warpColors
          |> Array.map ( drawThread model )
          |> Array.toList
        )
  --}
    [ div [ style Style.container ]
      [ div [ class "palette-controls" ]
        [ div [ class "palette-control-right" ]
          [ div [ class "weft-label" ] [ text "weft color: " ]
          , model.palette
            |> weftPaletteEntry
            |> makePaletteEntry model.selectedPalette
          , select [ class "warp-template-select" 
                   , Html.Events.on "change" 
                   ( Json.map ChangeTemplate Html.Events.targetValue )
                   ] 
                     [ option [ value "0" ] [ text "BeSides (cowl)" ]
                     , option [ value "1" ] [ text "Land of Enchantment" ]
                     , option [ value "2" ] [ text "Undulating Twill" ]
                     ]
          ]
        , div [ class "warp-palette" ]
          ( warpPaletteList model.palette
            |> List.map ( makePaletteEntry model.selectedPalette )
          ) 
        ]
      , div [ class "colorCatalog" ]
          ( List.map ( makeSwatch model ) MB.catalog )
      ]
    , div [] 
          [ input [ class "shareAndImport"
                  , onInput ( UpdatePalette ) 
                  , value ( codifyPalette model.palette )
                  , size 88 
                  ]
                  []
          ]
    ]

weftPaletteEntry : Palette -> ( Int, PaletteColor )
weftPaletteEntry palette =
  case List.head ( Dict.toList palette ) of
    Just entry -> entry
    Nothing -> ( 0, { hex = "#666666", name = "default weft" } )
 
warpPaletteList : Palette -> List ( Int, PaletteColor )
warpPaletteList palette =
  case List.tail ( Dict.toList palette ) of
    Just list -> list
    Nothing -> [] 
threadSize : Model -> Float
threadSize model = 
  100 / ( toFloat ( Array.length model.warp.warpColors ) )
  
drawThread : Model -> Int -> Html Msg
drawThread model colorIndex =
    let color = 
        case Dict.get colorIndex model.palette of
            Nothing -> "#FFFFFF"
            Just paletteEntry -> paletteEntry.hex
    in
        div [ style ( Style.thread ( threadSize model ) color ) ]
        []

makePaletteButton : Int -> String -> Bool -> Html Msg 
makePaletteButton index hexcolor selected =
  button 
    [ class ( "paletteButton" ) 
    , onClick ( UpdateSelectedPalette index ) 
    , style ( Style.swatch hexcolor selected )
    ] 
    []

makePaletteEntry : Int -> ( Int, PaletteColor ) -> Html Msg
makePaletteEntry current ( index, color ) =
  let selected = current == index
  in
    div [ style Style.paletteEntry ]
    [ makePaletteButton index color.hex selected
    ]

makeSwatch : Model -> ( String, String ) -> Html Msg
makeSwatch model ( hexcolor, name ) =
  let selected =
    case Dict.get model.selectedPalette model.palette of
      Nothing -> False
      Just paletteEntry -> hexcolor == paletteEntry.hex
  in
    div [ style ( Style.swatch hexcolor selected ) 
        , onClick ( ChangePaletteEntry hexcolor name )
        ]
      []
 

-- MESSAGES

type Msg 
  = UpdatePalette String
  | ChangePaletteEntry String String
  | UpdateSelectedPalette Int
  | Resize
  | ChangeTemplate String 



-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    UpdatePalette paletteCode ->
        let newModel = updatePalette paletteCode model in        
          ( newModel, Ports.warpChange (Ports.modelToChange newModel) )
    ChangePaletteEntry hex name ->
        let newModel =
          { model | palette = 
            insert model.selectedPalette { hex = hex, name = name } model.palette
          }
        in
          ( newModel, Ports.colorChange (Ports.modelToColorChange newModel) )  
    UpdateSelectedPalette index ->
      ( { model | selectedPalette = index }, Cmd.none )
    Resize ->
      ( model, Ports.warpChange (Ports.modelToChange model) )
    ChangeTemplate index -> 
      let newModel = 
        { model | warp = 
            case Dict.get ( String.toInt index |> Result.toMaybe |> Maybe.withDefault 0 ) model.warpTemplates of
              Nothing -> model.warp
              Just warp -> warp 
        }
      in
        ( newModel, Ports.warpChange (Ports.modelToChange newModel) )

updatePalette : String -> Model -> Model
updatePalette paletteCode model =
  let newPalette = decodePalette paletteCode in 
    case newPalette of
      Just palette ->
        { model | palette = palette }
      Nothing ->
        model
    

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Window.resizes ( \{height, width} -> Resize )



-- MAIN

main : Program Never Model Msg
main =
  Html.program
    { init = init 
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
