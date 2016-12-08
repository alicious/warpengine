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
      [ text "CHROMATIC JUDGE-O-MATIC" ]
  , if not ( List.isEmpty model.undecided ) then
      div [ class "section" ] 
      [ div [ class "section-title" ] [ text "undecided" ]
      , div [ class "entries" ]
        ( List.map ( buildEntry "undecided" ) model.undecided )
      ] else
    text ""
  , if not ( List.isEmpty model.yes ) then
      div [ class "section" ] 
      [ div [ class "section-title" ] [ text "yes" ]
      , div [ class "entries" ]
        ( List.map ( buildEntry "yes" ) model.yes)
      , div [ class "yes-list" ] 
        [ div [ class "yes-list-label" ] [ text "list of YES" ]
        , pre []
          [ text ( String.join "\n" model.yes ) ]
        ]
      ] else
    text ""
  , if not ( List.isEmpty model.no ) then
      div [ class "section" ] 
      [ div [ class "section-title" ] [ text "no" ]
      , div [ class "entries" ]
        ( List.map ( buildEntry "no" ) model.no)
      ] else
    text ""
  ]

buildEntry : String -> String -> Html Msg
buildEntry category link =
  div [ class "entry" ]
  [ iframe 
      [ src link
      , class "entry-iframe"
      , attribute "scrolling" "no"
      ] [] 
  , div [ class "actions" ] 
    [ entryButtons category link
    , a [ href link 
        , target "_blank" ] 
        [ text "view full design" ]
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
      [ button [ onClick ( No link ) ] [ text "move to no" ] 
      , button [ onClick ( UpRank link ) ] [ text "up in ranks" ] 
      ]
    "no" ->
      div [ class "sort-buttons" ]
      [ button [ onClick ( Yes link ) ] [ text "move to yes" ] ]
    _ -> div [ class "sort-buttons" ] []
       


-- UPDATE  

type Msg 
  = Yes String 
  | No String
  | UpRank String

update : Msg -> Model -> Model
update msg model = 
  case msg of 
    No entry ->
      { model  
      | undecided = remove entry model.undecided
      , yes = remove entry model.yes
      , no = ( entry :: model.no )
      } 
    Yes entry -> 
      { model  
      | undecided = remove entry model.undecided
      , yes = ( entry :: model.yes )
      , no = remove entry model.no
      } 
    UpRank entry ->
      { model | yes = ( moveUp entry model.yes ) }

remove : a -> List a -> List a
remove element list = 
  List.filter ( \e -> e /= element ) list

moveUp : a -> List a -> List a
moveUp entry list = 
  case list of
    [] -> list
    [ x ] -> list
    head::( sub::tail ) -> 
      if sub == entry then 
        sub::( head::tail )
      else
        head::( moveUp entry ( sub::tail ) )

