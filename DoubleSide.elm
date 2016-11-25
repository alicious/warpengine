module DoubleSide exposing (..)

warp = 
  { warpColors =
    "[0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,1,0,3,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,3,2,1,0,1,0,3,0,1,2,1,0,1,0,1,0,1,0,3,0,1,2,1,0,1,0,1,2,3,0,1,0,1,2,3,0,5,2,1,2,3,0,1,2,1,0,3,2,3,0,1,0,1,0,1,2,5,2,3,0,1,2,3,2,5,0,1,0,3,2,1,0,1,2,3,2,5,0,1,2,5,2,3,2,5,0,1,2,3,4,3,2,5,2,5,0,5,2,1,2,3,0,1,2,5,2,3,2,5,4,3,2,5,4,3,2,5,2,5,0,5,2,1,2,3,4,3,2,5,2,5,4,5,2,3,2,5,2,3,2,5,4,5,2,5,4,7,4,5,4,3,2,5,2,5,4,3,2,5,2,5,4,5,2,5,4,7,4,7,2,5,4,5,2,3,2,5,4,5,2,5,4,7,4,5,4,5,2,5,4,7,4,5,2,5,4,7,6,7,4,5,4,7,4,7,2,5,4,5,4,7,2,5,4,5,4,7,4,5,6,7,6,7,4,5,4,7,2,7,4,5,4,5,6,7,4,5,4,7,6,7,4,5,4,7,4,7,6,5,4,7,2,7,4,5,4,5,6,5,4,7,4,7,6,7,4,5,4,7,4,7,2,5,4,5,2,5,4,7,4,5,4,7,4,5,6,7,2,5,4,5,4,7,4,7,2,5,4,5,2,5,4,7,4,5,4,3,2,5,2,5,4,5,2,7,4,5,4,7,2,5,4,5,2,3,4,5,2,5,4,5,2,3,2,5,4,7,2,5,4,5,4,5,2,3,2,5,2,5,2,3,4,5,2,3,4,5,2,5,0,5,2,1,2,3,4,3,2,5,2,5,4,5,2,3,2,5,0,5,2,1,2,3,0,5,2,1,2,3,4,5,2,3,2,5,0,1,2,5,2,3,0,1,2,5,2,3,2,1,0,5,2,3,2,1,0,3,0,1,2,1,0,5,2,3,0,5,2,1,2,3,2,1,0,1,0,3,2,1,0,3,0,1,2,5,0,1,2,3,2,3,0,1,0,1,0,1,2,1,0,3,2,1,0,3,0,1,0,1,0,1,0,1,2,3,0,1,0,1,0,3,0,1,2,1,0,1,0,1,0,1,0,1,0,1,0,1,2,3,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]"

  , threading = 
    "[1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8]"

  , treadling =
    "[1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,3,1,3,2,4,1,3,2,4,1,3,2,4,1,5,2,4,1,5,2,4,1,5,2,6,1,5,2,6,1,5,2,6,1,7,2,6,1,7,2,6,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7,1,7,2,7]"

  , weftColors = 
    "[9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]"

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

