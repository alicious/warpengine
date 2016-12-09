module Gallery exposing (..)
import Html exposing ( Html, div, text, iframe, a, button, pre )
import Html.Attributes exposing ( .. )
import Html.Events exposing ( onClick )

import ContestEntries

main = Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }

type alias Model = 
  { entries : List ContestEntry }

type alias ContestEntry = 
  { name : String, link : String }

model =
  { entries = ContestEntries.entries }



-- VIEW

view : Model -> Html msg
view model =
  div [ class "page" ]
  [ div [ class "page-title" ]
      [ text "CHROMATIC CONTEST GALLERY" ]
  , div [ class "gallery" ] 
    [ div [ class "section-title" ] [ text "all the pretties" ]
    , div [ class "entries" ]
      ( List.map ( buildEntry ) model.entries )
    ]
  ]

buildEntry : ContestEntry -> Html msg
buildEntry entry =
  div [ class "entry" ]
  [ iframe 
      [ src entry.link
      , class "entry-iframe"
      , attribute "scrolling" "no"
      ] [] 
  , div [ class "designer" ] [ text entry.name ]
  , a [ href entry.link
      , target "_blank" 
      , class "link"
      ]
      [ text "view full design" ]
  ]

-- UPDATE

update : msg -> Model -> Model
update msg model = model
