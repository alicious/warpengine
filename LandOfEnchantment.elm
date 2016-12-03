module LandOfEnchantment exposing (..)

warp = 
  { name = "Land of Enchantment"
  , warpColors =
    "[5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,2,5,1,5,2,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,2,5,1,5,1,5,1,5,2,5,1,5,1,5,2,5,1,5,1,5,1,6,2,5,2,5,1,5,1,5,2,5,1,5,1,5,1,5,2,5,1,5,1,6,2,5,2,5,1,5,1,5,1,5,1,5,2,5,2,6,2,5,1,5,1,5,2,5,2,5,1,6,1,5,1,5,1,5,1,5,2,5,1,5,2,5,2,6,1,5,2,6,2,5,1,5,1,5,1,5,1,6,2,5,2,5,1,5,1,5,2,6,2,5,1,6,1,5,2,5,2,5,1,5,2,5,1,6,2,6,2,7,1,5,3,5,2,5,1,5,1,5,2,6,2,5,2,5,2,6,1,5,1,5,2,5,1,6,2,7,3,5,1,6,2,5,1,5,2,5,1,6,2,5,2,7,3,6,2,5,1,7,3,5,2,5,1,5,1,6,2,5,2,6,2,5,1,7,3,5,2,6,1,5,2,5,2,7,3,6,1,7,2,5,3,5,2,6,2,5,3,7,1,5,2,5,2,5,1,6,2,7,3,6,2,5,1,5,3,7,2,5,3,7,2,7,2,6,3,5,1,6,2,5,3,7,2,5,1,5,2,6,2,7,3,5,3,7,2,7,3,6,2,6,2,7,3,5,1,5,2,7,3,7,2,5,2,6,3,7,2,5,2,6,3,7,3,6,1,7,2,5,2,5,3,7,3,7,2,5,2,6,3,5,3,6,2,7,2,7,3,7,3,7,3,5,2,6,2,5,2,7,3,7,3,6,2,7,3,5,3,7,2,6,2,5,3,6,2,7,2,7,3,7,2,8,3,6,4,7,3,7,3,5,3,6,2,7,2,5,3,6,3,7,2,7,2,6,2,7,3,7,3,8,4,5,2,6,3,7,2,7,3,7,3,8,4,6,2,7,3,6,2,7,3,7,4,8,3,7,3,7,3,5,2,6,2,7,3,8,2,6,4,7,3,7,2,8,3,6,4,7,3,7,3,6,4,7,2,8,3,6,3,7,2,7,3,8,4,7,2,6,3,8,4,7,3,6,3,7,2,7,3,8,4,6,4,8,4,7,3,8,3,7,2,8,3,6,4,7,3,6,2,7,3,8,3,7,4,8,3,6,3,8,4,7,4,7,2,8,3,6,3,7,4,6,4,8,3,8,4,7,3,6,4,8,3,8,4,7,3,6,3,7,2,7,3,8,4,6,4,8,3,8,4,7,3,8,4,8,4,6,3,7,3,6,4,7,4,8,3,8,3,6,4,8,4,8,3,7,3,6,4,8,4,8,3,7,3,8,3,6,3,8,4,7,4,7,4,8,4,8,3,8,4,8,3,8,4,6,3,7,4,8,3,6,4,8,3,7,4,7,3,8,4,8,4,8,4,8,3,6,4,8,4,7,3,7,4,8,3,8,4,8,4,8,3,7,4,8,4,8,4,8,3,6,4,8,3,7,4,8,4,7,4,8,3,8,4,7,4,8,4,8,3,8,4,7,3,8,4,8,4,8,4,8,3,8,4,7,4,8,4,8,4,8,4,7,3,8,4]"

  , threading = 
    "[3,7,2,6,1,5,8,4,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,5,1,4,8,3,7,2,6,3,7,4,8,5,1,6,2,5,1,4,8,3,7,4,8,5,1,6,2,7,3,6,2,5,1,4,8,5,1,6,2,7,3,8,4,7,3,6,2,5,1,6,2,7,3,8,4,1,5,8,4,7,3,6,2,7,3,8,4,1,5,2,6,1,5,8,4,7,3,8,4,1,5,2,6,3,7,2,6,1,5,8,4,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,5,1,4,8,3,7,2,6,3,7,4,8,5,1,6,2,5,1,4,8,3,7,4,8,5,1,6,2,7,3,6,2,5,1,4,8,5,1,6,2,7,3,8,4,7,3,6,2,5,1,6,2,7,3,8,4,1,5,8,4,7,3,6,2,5,1,6,2,7,3,8,4,7,3,6,2,5,1,4,8,5,1,6,2,7,3,6,2,5,1,4,8,3,7,4,8,5,1,6,2,5,1,4,8,3,7,2,6,3,7,4,8,5,1,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,8,4,1,5,2,6,3,7,2,6,1,5,8,4,7,3,8,4,1,5,2,6,1,5,8,4,7,3,6,2,7,3,8,4,1,5,8,4,7,3,6,2,5,1,6,2,7,3,8,4,7,3,6,2,5,1,4,8,5,1,6,2,7,3,6,2,5,1,4,8,3,7,4,8,5,1,6,2,5,1,4,8,3,7,2,6,3,7,4,8,5,1,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,8,4,1,5,2,6,3,7,2,6,1,5,8,4,7,3,8,4,1,5,2,6,1,5,8,4,7,3,6,2,7,3,8,4,1,5,8,4,7,3,6,2,5,1,6,2,7,3,8,4,7,3,6,2,5,1,4,8,5,1,6,2,7,3,6,2,5,1,4,8,3,7,4,8,5,1,6,2,5,1,4,8,3,7,2,6,3,7,4,8,5,1,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,8,4,1,5,2,6,3,7,2,6,1,5,8,4,7,3,8,4,1,5,2,6,1,5,8,4,7,3,6,2,7,3,8,4,1,5,8,4,7,3,6,2,5,1,6,2,7,3,8,4,7,3,6,2,5,1,4,8,5,1,6,2,7,3,6,2,5,1,4,8,3,7,4,8,5,1,6,2,5,1,4,8,3,7,2,6,3,7,4,8,5,1,4,8,3,7,2,6,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,5,1,4,8,3,7,2,6,3,7,4,8,5,1,6,2,5,1,4,8,3,7,4,8,5,1,6,2,7,3,6,2,5,1,4,8,5,1,6,2,7,3,8,4,7,3,6,2,5,1,6,2,7,3,8,4,1,5,8,4,7,3,6,2,7,3,8,4,1,5,2,6,1,5,8,4,7,3,8,4,1,5,2,6,3,7,2,6,1,5,8,4,1,5,2,6,3,7,4,8,3,7,2,6,1,5,2,6,3,7,4,8,5,1,4,8,3,7,2,6,3,7,4,8,5,1,6,2,5,1,4,8,3,7,4,8,5,1,6,2,7,3,6,2,5,1,4,8,5,1,6,2,7,3,8,4,7,3,6,2,5,1,6,2,7,3,8,4,1,5,8,4,7,3,6,2,7,3,8,4,1,5,2,6]"

  , treadling =
    "[1,2,3,4,3,2,1,2,3,4,3,2,1,2,3,4,5,4,3,2,3,4,5,4,3,2,3,4,5,6,5,4,3,4,5,6,5,4,3,4,5,6,7,6,5,4,5,6,7,6,5,4,5,6,7,8,7,6,5,6,7,8,7,6,5,6,7,8,1,8,7,6,7,8,1,8,7,6,7,8,1,2,1,8,7,8,1,2,1,8,7,8,1,2,3,2,1,8,1,2,3,2,1,8]"

  , weftColors = 
    "[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"

  , tieup = 
    [ [1,2,4,8]
    , [8,1,3,7]
    , [7,8,2,6]
    , [6,7,1,5]
    , [5,6,8,4]
    , [4,5,7,3]
    , [3,4,6,2]
    , [2,3,5,1]
    ]
  }

