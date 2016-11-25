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


palette = 
  [ ( "overflow", "hidden" )
  , ( "margin-top", "10px" )
  ]

paletteInput = 
  [ ( "height", "14px" )
  , ( "float", "left" )
  , ( "margin-left", "2px" )
  ]

paletteEntry = 
  [ ( "float", "left" )
  , ( "margin", "20px" )
  , ( "overflow", "hidden" )
  , ( "font-size", "11px" )
  ]

swatch : String -> Bool -> List ( String, String )
swatch color selected = 
  let borderColor =
    if selected then "#000000" else color
  in
    [ ( "border", "2px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "width", "28px" )
    , ( "height", "28px" )
    , ( "float", "left" )
    ]

shareAndImport = 
  [ ( "margin-top", "30px" )
  ]
