module Judge exposing (..)
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
  { undecided : List String
  , yes : List String
  , no : List String
  }

model =
  { undecided = ContestEntries.entries
  , yes = []
  , no = []
  }



-- VIEW

view : Model -> Html Msg
view model =
  div [ class "judgificator" ]
  [ div [ class "page-title" ]
      [ text "CHROMATIC CONTEST JUDGE-O-MATIC" ]
  , if not ( List.isEmpty model.undecided ) then
      div [ class "undecided" ] 
      [ div [ class "title" ] [ text "undecided" ]
      , div [ class "entries" ]
        ( List.map ( buildEntry "undecided" ) model.undecided )
      ] else
    text ""
  , div [ class "yes" ] 
    [ div [ class "title" ] [ text "yes" ]
    , div [ class "entries" ]
      ( List.map ( buildEntry "yes" ) model.yes)
    , pre [ class "yes-list" ]
      ( List.map ( \y -> text ( y ++ "\n" ) ) model.yes )
    ]
  , div [ class "no" ] 
    [ div [ class "title" ] [ text "no" ]
    , div [ class "entries" ]
      ( List.map ( buildEntry "no" ) model.no)
    ]
  ]

yesList : String -> Html Msg
yesList link = 
  pre [] [ text link ]

buildEntry : String -> String -> Html Msg
buildEntry category link =
  div [ class "entry" ]
  [ iframe 
      [ src link
      , class "entry-iframe"
      ] [] 
  , div [ class "actions" ] 
    [ a [ href link 
        , target "_blank" ] 
        [ text "view full design" ]
    , entryButtons category link
    ]
  ]

entryButtons : String -> String -> Html Msg
entryButtons category link =
  case category of 
    "undecided" -> 
      div [ class "sort-buttons" ]
      [ button [ onClick ( No link ) ] [ text "nope" ]
      , button [ onClick ( Yes link ) ] [ text "yep" ]
      ]
    "yes" ->
      div [ class "sort-buttons" ]
      [ button [ onClick ( No link ) ] [ text "move to no" ] ]
    "no" ->
      div [ class "sort-buttons" ]
      [ button [ onClick ( Yes link ) ] [ text "move to yes" ] ]
    _ -> div [ class "sort-buttons" ] []
       


-- UPDATE  

type Msg 
  = Yes String 
  | No String

update : Msg -> Model -> Model
update msg model = 
  case msg of 
    No entry ->
      { model  
      | undecided = ( List.filter ( \e -> e /= entry ) model.undecided )
      , yes = ( List.filter ( \e -> e /= entry ) model.yes )
      , no = ( entry :: model.no )
      } 
    Yes entry -> 
      { model  
      | undecided = ( List.filter ( \e -> e /= entry ) model.undecided )
      , yes = ( entry :: model.yes )
      , no = ( List.filter ( \e -> e /= entry ) model.no )
      } 
