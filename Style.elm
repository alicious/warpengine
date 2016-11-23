module Style exposing (..)

body : List ( String, String )
body = 
  [ ( "margin", "20px" )
  ]

colorPlan : List ( String, String )
colorPlan = 
  [ ( "float", "left" ) 
  , ( "width", "100%" )
  ]

thread : List ( String, String )
thread = 
  [ ( "height", "100px" )
  , ( "width", "1px" )
  , ( "float", "left" )
  ] 

palette : List ( String, String )
palette = 
  [ ( "float", "left" )
  , ( "margin-top", "10px" )
  , ( "width" , "100%" )
  ]

paletteButton : List ( String, String )
paletteButton =
  [ ( "width", "20px" )
  , ( "height", "20px" )
  , ( "border", "1px solid black" )
  , ( "margin-right", "2px" )
  ]

paletteInput = 
  [ ( "height", "14px" )
  ]

paletteEntry = 
  [ ( "margin-top", "2px" )
  ]

shareAndImport = 
  [ ( "float", "left" )
  , ( "margin-top", "30px" )
  ]
