module Drafts.AmethystMary exposing (..)

warp = 
  { name = "Amethyst Mary"
  , warpColors =
    "[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,2,1,1,1,2,1,1,2,1,1,1,1,2,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,2,1,2,1,1,1,1,2,1,2,1,2,1,2,2,1,1,1,2,1,1,1,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,2,3,2,1,2,2,1,3,1,1,2,2,1,2,1,2,2,2,1,3,2,3,2,1,2,2,1,3,2,1,2,3,3,4,1,2,1,3,4,2,2,1,2,3,2,1,2,3,3,4,1,2,3,1,2,4,3,4,1,2,3,1,2,4,2,3,4,5,2,3,4,5,1,2,3,4,1,2,3,4,4,2,3,5,4,5,2,3,2,3,4,5,2,4,3,5,5,4,3,4,5,3,4,4,4,2,3,5,2,4,5,3,5,3,4,4,5,4,3,4,5,3,4,4,3,4,5,4,4,5,4,5,4,5,4,5,3,4,5,4,3,4,5,4,4,5,4,5,4,5,4,5,4,5,4,5,4,4,5,5,5,4,5,6,5,5,6,4,4,4,5,5,4,5,4,5,5,5,6,4,5,4,5,6,5,6,5,4,5,5,4,6,4,5,6,5,4,6,5,5,5,4,5,6,5,5,6,4,6,4,5,5,6,4,5,5,4,5,6,5,4,5,6,5,5,6,5,6,5,6,5,6,6,4,5,5,4,5,6,5,5,5,6,6,5,5,6,6,5,5,6,6,5,5,6,6,6,6,5,5,6,6,5,5,5,6,5,6,5,6,5,6,6,5,6,5,6,5,6,5,6,5,6,5,6,5,6,5,5,5,7,6,5,7,5,6,6,6,5,5,6,5,6,5,5,5,7,6,5,5,7,6,5,7,5,6,5,5,7,6,6,5,7,7,6,7,5,7,5,5,7,6,5,5,7,6,7,6,7,5,6,7,7,5,6,7,5,7,6,7,7,5,7,5,8,7,7,8,5,7,6,7,7,5,7,7,6,5,5,7,7,8,5,7,8,7,5,7,8,7,5,7,7,8,8,7,7,8,7,8,8,7,5,7,7,8,7,8,5,7,7,7,8,8,8,7,8,7,8,7,7,8,7,7,8,8,7,8,8,7,8,8,7,7,7,8,7,8,8,8,7,7]"

  , threading = 
    "[1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7,1,2,3,4,6,7,2,5,8,5,2,7,6,4,3,2,1,7,5,3,1,3,5,7]"

  , treadling =
    "[1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8]"

  , weftColors = 
    "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"

  , tieup = 
    [ [2,3,4,5]
    , [3,4,5,6]
    , [4,5,6,7]
    , [5,6,7,8]
    , [6,7,8,1]
    , [7,8,1,2]
    , [8,1,2,3]
    , [1,2,3,4]
    ]

  , defaultPalette = 
    [ ( 0, { hex = "#fcf7e9", name = "natural" } ) --weft
    , ( 1, { hex = "#fcf7e9", name = "natural" } ) 
    , ( 2, { hex = "#ffe7d6", name = "peach" } )
    , ( 3, { hex = "#ffd57a", name = "chamois" } )
    , ( 4, { hex = "#ffd6da", name = "rose" } )
    , ( 5, { hex = "#baaec4", name = "lavender" } )
    , ( 6, { hex = "#7274a2", name = "periwinkle" } )
    , ( 7, { hex = "#4b5b78", name = "denim" } )
    , ( 8, { hex = "#31395d", name = "marine" } )
    ]
  
  , about = "Amethyst Mary is a simple asymmetric grad, woven in an undulating twill. \n\nDesign tip: the first palette swatch will be featured more heavily than the rest, and in the original draft, this first color was the same as the weft color."

  }

