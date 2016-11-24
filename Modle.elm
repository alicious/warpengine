module Modle exposing (..)

import Dict exposing ( Dict, fromList, insert )
import Array exposing ( Array )


type alias Model = 
  { warp : Warp
  , palette : Palette
  , selectedPalette : Int 
  , warpTemplates : Dict Int Warp
  , selectedTemplate : Int
  }

type alias Palette = Dict Int PaletteColor 

type alias PaletteColor = { hex : String, name : String }

type alias Warp = { warpColors : Array Int
                  , threading : Array Int
                  , treadling : Array Int
                  , weftColors : Array Int
                  , tieup : List ( List Int )
                  } 

                  
