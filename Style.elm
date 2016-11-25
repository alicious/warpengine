module Style exposing (..)

body = 
  [ ( "font-family", " 'Courier New', Courier, monospace " )
  ]

container = 
  [ ( "overflow", "hidden" )
  ]

thread : Float -> String -> List ( String, String )
thread width color = 
  [ ( "height", "100px" )
  , ( "width", ( toString width ) ++ "%" )
  , ( "background-color", color )
  , ( "float", "left" )
  ] 

paletteInput = 
  [ ( "height", "14px" )
  , ( "float", "left" )
  , ( "margin-left", "2px" )
  ]

paletteEntry = 
  [ ( "float", "left" )
  , ( "margin", "10px" )
  , ( "overflow", "hidden" )
  , ( "font-size", "11px" )
  ]

swatch : String -> Bool -> List ( String, String )
swatch color selected = 
  let borderColor =
    if selected then "#000000" 
    else  color
  in
    [ ( "border", "2px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "width", "26px" )
    , ( "height", "26px" )
    , ( "float", "left" )
    ]
