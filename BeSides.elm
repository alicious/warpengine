module BeSides exposing (..)

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
  }

