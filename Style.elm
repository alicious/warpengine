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

swatch : String -> Bool -> List ( String, String )
swatch color selected = 
  let ( borderWidth, borderColor ) =
    if selected && ( color /= "#000000" ) then ( 2, "#000000" ) 
    else if selected then (2, "#666666" )
    else if color == "#ffffff" then ( 1, "#cccccc" )
    else ( 1, color )
  in
    [ ( "border", ( toString borderWidth) ++ "px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "width", toString ( 28 - 2*borderWidth ) ++ "px" )
    , ( "height", toString ( 28 - 2*borderWidth ) ++ "px" )
    , ( "float", "left" )
    ]
