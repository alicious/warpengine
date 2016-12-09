module Warp exposing (..)

import Html exposing ( Html, button, div, text, select, option, input, span, img )
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick, onInput )
import Navigation
import UrlParser as Url exposing ( stringParam )
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
import Labyrinth

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
  , defaultPalette = fromList warp.defaultPalette
  }

initPalette : Palette
initPalette =
  let warp = BeSides.warp in fromList warp.defaultPalette

initTemplates : Dict Int Warp
initTemplates = 
  [ BeSides.warp
  , LandOfEnchantment.warp
  , AmethystMary.warp
  , CloseToHome.warp
  , PWFade.warp
  , Labyrinth.warp
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
    , history = (History [] [])                            
    } 

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let model = initModel location in
    ( model, Cmd.batch [ Ports.warpChange ( Ports.modelToChange model )
                       , Ports.setUrl ( makeEncodedOptions model)
                       ] )

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
              |> List.map ( makeWarpPaletteEntry model.selectedPalette )
            ) 
          ]  
      , div [ class "colorCatalog" ]
          ( List.map ( makeSwatch model ) MB.catalog
          )
      , div [ class "warp-controls-wrapper" ]
          [ div [ class "warp-controls" ]
            [ div [ class "warp-template" ] 
              [ select [ class "warp-template-select" 
                , Html.Events.on "change" 
                  ( Json.map ChangeTemplate Html.Events.targetValue )
                ] 
                ( model.warpTemplates
                  |> Dict.toList 
                  |> List.map ( templateOption model.selectedTemplate )
                )
              , div [ class "default-colors" ]
                [ button [ onClick SetDefaultColors ] [ text "use cat's cradle colors" ] ]
              ]
            , div [ class "weft-color" ]
              [ model.palette
                |> weftPaletteEntry
                |> makeWeftPaletteEntry model.selectedPalette
              ]
            ]
          ]
      , div [ class "undo-redo" ]
        [ div [ class "undo-redo-buttons" ] 
          [ div 
            [ class "undo-button" 
            , onClick Undo 
            ] 
            [ img [ src "assets/undo.png", width 30 ] [] ]
          , div 
            [ class "redo-button" 
            , onClick Redo 
            ] 
            [ img [ src "assets/redo.png", width 30 ] [] ]
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

makeWarpPaletteEntry : Int -> ( Int, PaletteColor ) -> Html Msg
makeWarpPaletteEntry current ( index, color ) =
  let selected = current == index
  in
    div [ class "palette-entry" ]
    [ makePaletteButton index color.hex selected
    , div [ class "selected-color-name" ] 
      [ text ( if selected then color.name else "" ) ]
    ]

makeWeftPaletteEntry : Int -> ( Int, PaletteColor ) -> Html Msg
makeWeftPaletteEntry current ( index, color ) = 
  let selected = current == index
  in
    div [ class "palette-entry" ] 
    [ makePaletteButton index color.hex selected
    , div [ class "weft-color-name" ]
      [ text ( color.name ++ " weft" ) ]
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
  | SetDefaultColors 
  | Resize
  | ChangeTemplate String 
  | UrlChange Navigation.Location
  | Undo
  | Redo 


-- HISTORY

pushHistory : Model -> Model -> Model
pushHistory oldModel newModel =
  let ( History undoHistory redoHistory ) = newModel.history 
  in { newModel | history = History ( oldModel :: undoHistory ) [] }

undo : Model -> Model
undo model =
  let ( History undoHistory redoHistory ) = model.history in 
    case List.head undoHistory of
      Just newModel -> 
        { newModel | history = 
          History ( Maybe.withDefault [] ( List.tail undoHistory ) ) 
                  ( model :: redoHistory ) 
        }
      Nothing -> model

redo : Model -> Model
redo model =
  let ( History undoHistory redoHistory ) = model.history in 
    case List.head redoHistory of
      Just newModel -> 
        { newModel | history = 
          History ( model :: undoHistory ) 
                  ( Maybe.withDefault [] ( List.tail redoHistory ) ) 
        }
      Nothing -> model


-- UPDATE

        
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    ChangePaletteEntry hex name ->
        let newModel =
          pushHistory model { model | palette = 
            insert model.selectedPalette { hex = hex, name = name } model.palette
          }
        in
          ( newModel, Cmd.batch [ Ports.colorChange (Ports.modelToColorChange newModel)
                                , Ports.setUrl (makeEncodedOptions newModel)
                                ] )  
    UpdateSelectedPalette index ->
      ( pushHistory model { model | selectedPalette = index }, Cmd.none )
    SetDefaultColors ->
      let newModel =
        ( pushHistory model { model | palette = model.warp.defaultPalette } )
      in
        ( newModel, Cmd.batch [ Ports.colorChange (Ports.modelToColorChange newModel)
                              , Ports.setUrl (makeEncodedOptions newModel)
                              ] )  
    Resize ->
      ( model, Ports.warpChange (Ports.modelToChange model) )
    ChangeTemplate index -> 
      let newModel = 
        pushHistory model { model | warp = 
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
        if location.hash == ("#" ++ makeEncodedOptions model) then
            ( model, Cmd.none )
        else
            let newModel = initModel location in
            ( pushHistory model { newModel | selectedPalette = model.selectedPalette },
                  Ports.warpChange (Ports.modelToChange newModel) )
    Undo ->
      let newModel = undo model in
      ( newModel, Cmd.batch [ Ports.warpChange (Ports.modelToChange newModel)
                            , Ports.setUrl (makeEncodedOptions newModel)
                            ])
    Redo -> 
      let newModel = redo model in
      ( newModel, Cmd.batch [ Ports.warpChange (Ports.modelToChange newModel)
                            , Ports.setUrl (makeEncodedOptions newModel)
                            ])

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
