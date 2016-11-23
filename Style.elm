module Style exposing (..)

body = 
  [ ( "margin", "20px" )
  , ( "display", "inline-block" )
  ]

container = 
  [ ( "overflow", "hidden" )
  ]

thread = 
  [ ( "height", "100px" )
  , ( "width", "1px" )
  , ( "float", "left" )
  ] 


palette = 
  [ ( "float", "left" )
  , ( "margin-top", "10px" )
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
  , ( "overflow", "hidden" )
  ]

colorCatalog =
  [ ( "width", "420px" )
  , ( "float", "right" )
  , ( "margin-top", "84px" )
  ]

colorSwatch : String -> Bool -> List ( String, String )
colorSwatch color selected = 
  let borderColor =
    if selected then "#000000" else color
  in
    [ ( "width", "17px" )
    , ( "height", "17px" )
    , ( "border", "2px solid " ++ borderColor )
    , ( "background-color", color )
    , ( "float", "left" )
    ]

shareAndImport = 
  [ ( "margin-top", "30px" )
  ]
