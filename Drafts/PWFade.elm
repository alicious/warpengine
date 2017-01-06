module Drafts.PWFade exposing (..)

warp = 
  { name = "Plain Weave Fade" 
  , warpColors =
    "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,2,1,1,1,2,1,2,1,1,1,2,2,1,1,1,2,1,1,1,1,2,2,1,2,1,2,1,1,2,1,1,1,2,2,2,1,1,2,1,1,2,1,1,2,2,2,2,1,2,1,2,2,1,1,1,2,2,2,1,2,2,2,1,2,2,2,2,1,1,1,2,2,2,2,1,2,2,1,2,2,2,2,2,2,3,1,2,2,2,2,1,2,2,2,2,2,3,2,2,2,3,1,2,2,2,2,2,2,3,2,3,2,2,2,2,2,3,3,2,2,3,2,2,2,3,2,2,2,3,3,2,3,2,2,3,2,3,2,2,2,3,2,3,2,3,3,3,2,2,2,3,2,3,3,3,2,3,2,2,3,3,2,3,2,3,2,3,3,3,3,2,3,3,3,3,2,2,3,2,3,3,2,3,3,3,2,3,3,3,3,3,3,4,2,3,3,3,3,3,2,3,3,3,3,4,3,3,4,3,2,3,3,3,3,3,3,4,3,4,3,3,3,3,4,3,4,4,3,3,3,4,3,3,3,3,4,3,3,4,3,4,3,3,4,4,3,3,3,4,3,3,4,4,4,4,3,3,3,3,4,4,4,4,3,4,3,3,4,4,3,3,4,4,3,4,4,4,4,3,4,4,4,3,3,4,3,4,4,4,4,4,3,4,3,4,4,4,4,4,5,4,3,4,4,4,4,3,4,4,4,5,4,4,4,4,5,4,4,3,4,4,4,5,4,4,4,4,4,5,4,4,5,4,5,4,5,4,4,4,4,5,4,4,4,5,5,4,4,5,5,4,5,4,4,4,4,5,5,4,5,4,5,4,5,4,4,5,5,4,4,5,5,5,4,4,5,5,4,4,5,5,4,5,5,5,4,5,5,5,4,4,5,5,4,5,5,5,4,5,5,5,4,5,5,5,5,6,5,5,4,5,5,5,5,4,5,5,5,5,5,6,5,6,5,5,4,5,5,5,5,5,5,6,5,6,5,5,5,5,5,6,6,5,5,6,5,6,5,5,5,6,5,5,6,6,5,5,5,5,6,6,5,5,6,5,5,5,6,6,5,6,5,6,5,6,5,6,6,6,5,6,6,6,5,5,5,6,6,5,6,5,6,6,5,6,6,6,5,6,5,6,5,6,6,6,6,5,6,6,5,6,6,6,6,7,6,6,6,5,6,6,6,6,5,6,6,6,6,7,6,6,7,6,5,6,6,6,6,6,6,7,6,6,6,7,6,7,6,6,7,6,7,6,6,7,6,6,6,6,6,7,7,6,6,7,6,6,7,7,6,6,6,7,6,7,6,7,6,7,7,6,6,7,7,6,7,6,7,7,7,7,6,6,7,7,6,6,7,7,6,7,7,7,6,7,6,7,7,6,7,7,6,7,7,7,6,7,7,7,6,7,7,8,7,7,7,6,7,7,7,6,7,7,7,7,7,8,7,7,7,8,7,6,7,7,7,7,7,8,7,7,7,8,7,8,7,7,7,8,8,7,7,7,7,8,7,7,8,7,8,7,8,7,8,7,8,7,7,8,7,7,7,8,7,8,7,8,8,7,7,8,7,8,7,8,8,8,7,8,7,8,7,8,7,8,8,8,7,8,7,8,8,8,7,8,7,8,7,8,8,8,8,8,7,8,7,8,8,8,8,8,8,8,8,8,7,8,7,8,8,8,8,8,8,8,8,8,8,8,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]"

  , threading = 
    "[1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]"

  , treadling =
    "[1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]"

  , weftColors = 
    "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"

  , tieup = 
    [ [1,3,5,7]
    , [2,4,6,8]
    ]

  , defaultPalette = 
    [ ( 0, { hex = "#8ba6a7", name = "slate" } ) --weft
    , ( 1, { hex = "#fdfff7", name = "cream" } )
    , ( 2, { hex = "#ddeeee", name = "chambray" } )
    , ( 3, { hex = "#b6dbed", name = "pale blue" } )
    , ( 4, { hex = "#92bfdb", name = "sky blue" } )
    , ( 5, { hex = "#36b0d8", name = "aquarius" } )
    , ( 6, { hex = "#009dae", name = "peacock" } )
    , ( 7, { hex = "#1aa49d", name = "aqua marine" } )
    , ( 8, { hex = "#14aa88", name = "sea green" } )
    ]
  
  , about = "This (somewhat) unnamed design is the only one featured in Chromatic which has not already been woven at Cat's Cradle Textiles. Here we have a basic plainweave structure, where the star of the show is the palette itself, rendered in a blended fibonacci gradient." 
  
  }
