port module Ports exposing ( colorChange
                           , warpChange
                           , setUrl
                           , modelToChange
                           , modelToColorChange
                           )

import Array exposing ( Array )
import Dict exposing ( Dict )

import Model exposing (..)

port warpChange  : ( WarpMsg, PaletteMsg ) -> Cmd msg
port colorChange : PaletteMsg              -> Cmd msg
port setUrl      : String                  -> Cmd msg

type alias WarpMsg = 
  { name : String
  , warpColors : Array Int
  , threading : Array Int
  , treadling : Array Int
  , weftColors : Array Int
  , tieup : List ( List Int )
  } 

type alias PaletteMsgEntry =
  { index : Int, hex : String, name : String }

type alias PaletteMsg =
  List PaletteMsgEntry

modelToColorChange : Model -> PaletteMsg
modelToColorChange model = paletteToMsg model.palette

modelToChange : Model -> ( WarpMsg, PaletteMsg )
modelToChange model =
    ( warpToMsg model.warp, paletteToMsg model.palette )
        
warpToMsg : Warp -> WarpMsg
warpToMsg warp = 
  { name = warp.name 
  , warpColors = warp.warpColors 
  , threading = warp.threading 
  , treadling = warp.treadling 
  , weftColors = warp.weftColors 
  , tieup = warp.tieup
  } 
 
paletteToMsg : Palette -> PaletteMsg
paletteToMsg palette =
  palette
  |> Dict.toList 
  |> List.map entryMapper

entryMapper : (Int, PaletteColor) -> PaletteMsgEntry
entryMapper (index, color) =
  PaletteMsgEntry index color.hex color.name
