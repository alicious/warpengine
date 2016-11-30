module PWFade exposing (..)

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
  }
