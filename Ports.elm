port module Ports exposing (warpChange, modelToChange)
import Array exposing ( Array )
import Dict exposing ( Dict )

import Modle exposing (..)

port warpChange : (Warp, PaletteMsg) -> Cmd msg


type alias PaletteMsgEntry =
  { index : Int, hex : String, name : String }

type alias PaletteMsg =
  List PaletteMsgEntry


modelToChange : Model -> ( Warp, PaletteMsg )
modelToChange modle =
    ( modle.warp, paletteToMsg modle.palette )
      
paletteToMsg : Palette -> PaletteMsg
paletteToMsg palette =
  palette
  |> Dict.toList 
  |> List.map entryMapper

entryMapper : (Int, PaletteColor) -> PaletteMsgEntry
entryMapper (index, color) =
  PaletteMsgEntry index color.hex color.name
