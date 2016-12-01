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
  let borderColor =
    if selected && ( color /= "#000000" ) then "#000000" 
    else if selected then "#666666"
    else color
  in
    [ ( "border", "2px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "width", "24px" )
    , ( "height", "24px" )
    , ( "float", "left" )
    ]
