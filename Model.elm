module Model exposing (..)

import Dict exposing ( Dict, fromList, insert )
import Array exposing ( Array )


type alias Model = 
  { warp : Warp
  , palette : Palette
  , selectedPalette : Int 
  , warpTemplates : Dict Int Warp
  , selectedTemplate : Int
  , debug : String
  }

type alias Warp = { name : String
                  , warpColors : Array Int
                  , threading : Array Int
                  , treadling : Array Int
                  , weftColors : Array Int
                  , tieup : List ( List Int )
                  } 

type alias WarpData =
  { name : String
  , threading : String
  , tieup : List (List Int)
  , treadling : String
  , warpColors : String
  , weftColors : String
  }

type alias Palette = Dict Int PaletteColor 

type alias PaletteColor = { hex : String, name : String }
