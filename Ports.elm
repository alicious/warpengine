port module Ports exposing (..)
import Array exposing ( Array )
import Dict exposing ( Dict )

import Modle exposing (..)

port paletteChange : PaletteMsg -> Cmd msg
port warpChange    : Warp       -> Cmd msg


type alias PaletteMsgEntry =
  { index : Int, hex : String, name : String }

type alias PaletteMsg =
  List PaletteMsgEntry


      
paletteToMsg : Palette -> PaletteMsg
paletteToMsg palette =
  palette
  |> Dict.toList 
  |> List.map entryMapper

entryMapper : (Int, PaletteColor) -> PaletteMsgEntry
entryMapper (index, color) =
  PaletteMsgEntry index color.hex color.name
