port module Ports exposing (colorChange, warpChange, modelToChange, modelToColorChange)
import Array exposing ( Array )
import Dict exposing ( Dict )

import Model exposing (..)

port warpChange  : ( Warp, PaletteMsg      ) -> Cmd msg
port colorChange : ( Warp, PaletteMsg, Int ) -> Cmd msg

type alias PaletteMsgEntry =
  { index : Int, hex : String, name : String }

type alias PaletteMsg =
  List PaletteMsgEntry

modelToColorChange : Model -> ( Warp, PaletteMsg, Int )
modelToColorChange model =
    ( model.warp, paletteToMsg model.palette, model.selectedPalette )

modelToChange : Model -> ( Warp, PaletteMsg )
modelToChange model =
    ( model.warp, paletteToMsg model.palette )
      
paletteToMsg : Palette -> PaletteMsg
paletteToMsg palette =
  palette
  |> Dict.toList 
  |> List.map entryMapper

entryMapper : (Int, PaletteColor) -> PaletteMsgEntry
entryMapper (index, color) =
  PaletteMsgEntry index color.hex color.name
