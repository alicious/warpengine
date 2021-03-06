module Drafts.BeSides exposing (..)

warp = 
  { name = "BeSides"
  , warpColors =
    "[1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,2,8,1,7,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,7,2,8,1,8,1,8,2,7,1,8,1,8,1,8,1,7,2,8,1,8,1,7,1,8,2,8,1,7,2,8,1,8,2,8,1,6,2,7,2,7,1,8,1,8,2,8,1,8,1,7,1,6,2,8,2,7,1,6,2,8,2,7,1,8,1,7,2,8,2,8,1,7,2,6,1,6,2,8,2,7,1,8,2,7,2,6,3,6,2,7,2,6,2,8,1,6,2,7,2,8,1,7,2,6,3,7,2,6,2,6,2,7,3,6,2,6,2,6,1,8,2,7,2,7,2,6,3,6,3,6,2,7,2,6,2,6,3,7,2,6,3,5,2,6,3,6,3,7,2,6,2,6,2,6,2,7,3,6,2,5,3,6,3,6,3,6,2,6,3,5,2,7,3,6,2,6,3,5,2,6,3,6,2,6,3,5,3,6,3,6,2,5,3,6,3,5,4,6,3,5,2,5,3,6,3,6,3,5,2,6,3,6,4,6,3,5,3,5,4,5,3,6,3,5,2,5,3,6,3,6,4,6,3,5,3,5,4,5,3,6,3,5,3,6,3,5,4,5,3,5,2,6,3,6,4,6,3,5,3,5,3,6,3,5,4,5,3,6,2,6,3,5,2,5,3,6,3,6,3,6,3,5,4,5,2,6,3,6,3,5,2,6,3,5,3,6,3,5,2,6,3,6,2,6,3,7,2,6,2,5,3,6,3,6,3,5,2,6,3,6,3,6,2,7,2,6,3,7,2,6,2,6,2,5,3,6,3,6,2,6,3,7,2,6,3,7,2,6,2,6,2,6,3,7,2,6,2,8,1,6,2,7,3,7,2,6,2,6,3,6,2,7,2,6,1,8,2,7,2,6,2,8,1,6,2,7,2,7,3,6,2,6,1,8,2,6,2,7,1,8,2,6,2,7,1,8,2,7,2,6,2,7,1,8,1,8,1,6,2,8,2,7,1,8,2,7,2,6,1,8,1,7,2,8,1,7,2,8,1,8,1,6,2,8,2,7,1,7,2,8,1,8,1,7,2,8,1,8,1,8,2,8,1,7,1,8,1,8,1,8,1,8,1,7,2,8,1,8,2,8,1,7,1,8,1,8,1,8,1,8,1,8,1,8,2,8,1,8,1,7,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8,1,8]"

  , threading = 
    "[1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8]"

  , treadling =
    "[1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,4,1,3,2,4,1,3,2,4,1,5,2,4,1,5,2,4,1,5,2,6,1,5,2,6,1,5,2,6,1,7,2,6,1,7,2,6,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7]"

  , weftColors = 
    "[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]"

  , tieup = 
    [ [1,3,5,7]
    , [2,4,6,8]
    , [1,2,3,4]
    , [8,1,2,3]
    , [7,8,1,2]
    , [6,7,8,1]
    , [5,6,7,8]
    , [4,5,6,7]
    , [3,4,5,6]
    , [2,3,4,5]
    ]

  , defaultPalette = 
    [ ( 0, { hex = "#928c87", name = "dark grey" } )
    , ( 1, { hex = "#7b5b6b", name = "mauve" } )
    , ( 2, { hex = "#928c87", name = "dark grey" } )
    , ( 3, { hex = "#dbc5a4", name = "flax" } )
    , ( 4, { hex = "#eabc7b", name = "honey" } )
    , ( 5, { hex = "#d2d8dc", name = "pale grey" } )
    , ( 6, { hex = "#a5c0b3", name = "seaton" } )
    , ( 7, { hex = "#5e8929", name = "peridot" } )
    , ( 8, { hex = "#4d4d33", name = "taupe" } )
    ]

  , about = "BeSides is a reversible, two-sided grad in turned taquete. The two gradients are able to swap faces depending on treadling, so that it is possible to weave stripes of one grad into a background of the other, with the inverse colors shown on the opposite side. \n\nDesign tip: use the first four palette swatches for one grad, and the last four for the other."

  }

