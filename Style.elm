module Style exposing (..)

body = 
  [ ( "margin", "20px" )
  , ( "display", "inline-block" )
  , ( "font-family", " 'Courier New', Courier, monospace " )
  ]

container = 
  [ ( "overflow", "hidden" )
  ]

thread : ( Float, Float ) -> String -> List ( String, String )
thread ( height, width ) color = 
  [ ( "height", ( toString height ) ++ "px" )
  , ( "width", ( toString width ) ++ "px" )
  , ( "background-color", color )
  , ( "float", "left" )
  ] 


palette = 
  [ ( "float", "left" )
  , ( "margin-top", "10px" )
  , ( "width", "200px" )
  ]

paletteButton =
  [ ( "margin-right", "2px" )
  ]

paletteInput = 
  [ ( "height", "14px" )
  , ( "float", "left" )
  ]

paletteEntry = 
  [ ( "margin-top", "2px" )
  , ( "float", "left" )
  , ( "overflow", "hidden" )
  , ( "font-size", "11px" )
  , ( "width", "100px" )
  ]

colorCatalog =
  [ ( "width", "198px" )
  , ( "float", "right" )
  , ( "margin-top", "84px" )
  , ( "border", "1px solid #aaaaaa" )
  ]

colorSwatch : String -> Bool -> List ( String, String )
colorSwatch color selected = 
  let borderColor =
    if selected then "#000000" else color
  in
    [ ( "width", "18px" )
    , ( "height", "18px" )
    , ( "border", "2px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "float", "left" )
    ]

shareAndImport = 
  [ ( "margin-top", "30px" )
  ]
