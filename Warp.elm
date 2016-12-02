module Warp exposing (..)

import Html exposing ( Html, button, div, text, select, option, input, span )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick, onInput )
import Navigation
import UrlParser as Url exposing ( (<?>), stringParam )
import Dict exposing ( Dict, fromList, insert )
import Array exposing ( Array )
import Json.Decode as Json 
import Window
import Regex
import Task

import Style 
import MB

import BeSides 
import LandOfEnchantment
import AmethystMary
import CloseToHome
import PWFade

import Ports
import Model exposing (..)

-- MODEL

initWarp : WarpData -> Warp
initWarp warp =
  { name = warp.name
  , warpColors = jsonToArray warp.warpColors
  , threading = jsonToArray warp.threading
  , treadling = jsonToArray warp.treadling
  , weftColors = jsonToArray warp.weftColors
  , tieup = warp.tieup
  }

initPalette : Palette
initPalette =
  fromList
  [ ( 0, { hex = "#928c87", name = "dark grey" } )
  , ( 1, { hex = "#7b5b6b", name = "mauve" } )
  , ( 2, { hex = "#928c87", name = "dark grey" } )
  , ( 3, { hex = "#dbc5a4", name = "flax" } )
  , ( 4, { hex = "#eabc7b", name = "honey" } )
  , ( 5, { hex = "#c8cecc", name = "pale grey" } )
  , ( 6, { hex = "#a5c0b3", name = "seaton" } )
  , ( 7, { hex = "#6f8545", name = "lime" } )
  , ( 8, { hex = "#4d4d33", name = "taupe" } )
  ]

initTemplates : Dict Int Warp
initTemplates = 
  [ BeSides.warp
  , LandOfEnchantment.warp
  , AmethystMary.warp
  , CloseToHome.warp
  , PWFade.warp
  ]
  |> List.map initWarp
  |> List.indexedMap (,)
  |> fromList

initModel : Navigation.Location -> Model
initModel location =
  let ( templateId, palette ) = 
    case Url.parseHash Url.string location of
      Just params -> decodeDesign params
      Nothing -> ( 0, initPalette ) 
  in
    { warp = ( Maybe.withDefault ( initWarp BeSides.warp ) 
              ( Dict.get templateId initTemplates ) )
    , palette = palette
    , selectedPalette = 1
    , warpTemplates = initTemplates 
    , selectedTemplate = templateId
    , debug = "0"
    } 

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let model = initModel location in
    ( model, Ports.warpChange (Ports.modelToChange model) )

jsonToArray : String -> Array Int
jsonToArray string =
  case Json.decodeString ( Json.array Json.int ) string of
  Ok value -> value
  Err _ -> Array.empty

codifyPalette : Palette -> String
codifyPalette palette = 
  palette
  |> Dict.values
  |> List.map .hex
  |> List.map ( String.dropLeft 1 )
  |> String.join "."

decodePalette : String -> Maybe Palette
decodePalette paletteCode =
  let hexList = 
    paletteCode
    |> String.split "."
    |> List.map ( String.cons '#' )
    |> List.filter ( Regex.contains ( Regex.regex "^#[0-9a-f]{6}" ) )
  in
    case ( List.length hexList ) == 9 of
    True -> 
      hexList
      |> List.indexedMap paletteColorFromHex 
      |> fromList
      |> Just
    False -> Nothing
    
decodeDesign : String -> ( Int, Palette )
decodeDesign designCode = 
  let ( index, paletteCode ) =  
    ( String.left 1 designCode, String.dropLeft 2 designCode )
  in 
    ( Result.withDefault 0 ( String.toInt index )
    , Maybe.withDefault initPalette ( decodePalette paletteCode )
    )
  
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
  div []
  {--  BASIC COLORPLAN VIEW
    [ div [ style Style.container ]
        ( model.warp.warpColors
          |> Array.map ( drawThread model )
          |> Array.toList
        )
  --}
      [ div [ class "warp-palette-wrapper" ] 
          [ div [ class "warp-palette" ]
            ( warpPaletteList model.palette
              |> List.map ( makePaletteEntry model.selectedPalette )
            ) 
          ]  
      , div [ class "colorCatalog" ]
          ( List.map ( makeSwatch model ) MB.catalog
          )
      , div [ class "weft-and-template-wrapper" ]
          [ div [ class "weft-and-template" ]
            [ div [ class "warp-template" ] 
              [ select [ class "warp-template-select" 
                , Html.Events.on "change" 
                  ( Json.map ChangeTemplate Html.Events.targetValue )
                ] 
                ( model.warpTemplates
                  |> Dict.toList 
                  |> List.map ( templateOption model.selectedTemplate )
                )

              ]
            , div [ class "weft-color" ]
              [ div [ class "control-label" ] [ text "weft: " ]
              , model.palette
                |> weftPaletteEntry
                |> makePaletteEntry model.selectedPalette
              ]
            ]
          ]
      , div [ class "debug" ] 
        []
      ]


makeEncodedOptions : Model -> String
makeEncodedOptions model =
    toString model.selectedTemplate ++ "."
    ++ codifyPalette model.palette

colorName : Int -> Palette -> String
colorName index palette = 
  case Dict.get index palette of
    Nothing -> "unknown"
    Just paletteEntry -> paletteEntry.name
templateOption : Int -> ( Int, Warp ) -> Html Msg
templateOption selectedTemplate ( index,  warp ) = 
  option [ value ( toString index )
  , selected ( selectedTemplate == index ) ] [ text warp.name ]

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
  div
    [ class ( "paletteButton" ) 
    , onClick ( UpdateSelectedPalette index ) 
    , style ( Style.swatch hexcolor selected )
    ] 
    []

makePaletteEntry : Int -> ( Int, PaletteColor ) -> Html Msg
makePaletteEntry current ( index, color ) =
  let selected = current == index
  in
    div [ class "palette-entry" ]
    [ makePaletteButton index color.hex selected
    , div [ class "selected-color-name" ] 
      [ text ( if selected then color.name else "" ) ]
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
  = ChangePaletteEntry String String
  | UpdateSelectedPalette Int
  | Resize
  | ChangeTemplate String 
  | UrlChange Navigation.Location



-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    ChangePaletteEntry hex name ->
        let newModel =
          { model | palette = 
            insert model.selectedPalette { hex = hex, name = name } model.palette
          }
        in
          ( newModel, Cmd.batch [ Ports.colorChange (Ports.modelToColorChange newModel)
                                , Ports.setUrl (makeEncodedOptions newModel)
                                ] )  
    UpdateSelectedPalette index ->
      ( { model | selectedPalette = index }, Cmd.none )
    Resize ->
      ( model, Ports.warpChange (Ports.modelToChange model) )
    ChangeTemplate index -> 
      let newModel = 
        { model | warp = 
            case Dict.get ( String.toInt index |> Result.withDefault 0 ) model.warpTemplates of
              Nothing -> model.warp
              Just warp -> warp 
        , selectedTemplate = String.toInt index |> Result.withDefault 0
        }
      in
        ( newModel, Cmd.batch [ Ports.warpChange (Ports.modelToChange newModel)
                              , Ports.setUrl (makeEncodedOptions newModel)
                              ])
    UrlChange location ->
      let model = initModel location
      in ( model, Ports.warpChange ( Ports.modelToChange model ) )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Window.resizes ( \{height, width} -> Resize )



-- MAIN

main =
  Navigation.program UrlChange
    { init = init 
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
