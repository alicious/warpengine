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
  , loves : List String
  }

model =
  { undecided = ContestEntries.entries
  , loves = []
  }



-- VIEW

view : Model -> Html Msg
view model =
  div [ class "judgificator" ]
  [ div [ class "page-title" ]
      [ text "CHROMATIC JUDGE-O-MATIC" ]
  , snapJudgeDiv model.undecided
  , if not ( List.isEmpty model.loves ) then
      div [ class "loves" ] 
      [ div [ class "section-title" ] [ text "loves" ]
      , div [ class "entries" ]
        ( List.map ( buildEntry "love" ) model.loves )
      , div [ class "yes-list" ] 
        [ div [ class "yes-list-label" ] [ text "list of YES" ]
        , pre []
          [ text ( String.join "\n" model.loves) ]
        ]
      ] else
    text ""
  ]

snapJudgeDiv : List String -> Html Msg
snapJudgeDiv undecided =
  case undecided of 
    [] -> text ""
    entry::entries ->
      div [ class "snap-judge" ] 
      [ div [ class "section-title" ] [ text "snap judge this" ]
      , buildEntry "snap-judge" entry
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
    "snap-judge" -> 
      div [ class "sort-buttons" ]
      [ button [ onClick ( Love link ) ] [ text "love it" ]
      , button [ onClick ( Reject link ) ] [ text "next" ]
      ]
    "love" ->
      div [ class "sort-buttons" ]
      [ button [ onClick ( LetGo link ) ] [ text "let it go" ] 
      , button [ onClick ( UpRank link ) ] [ text "up in ranks" ] 
      ]
    _ -> text ""
       


-- UPDATE  

type Msg 
  = Love String 
  | Reject String
  | LetGo String
  | UpRank String

update : Msg -> Model -> Model
update msg model = 
  case msg of 
    Love entry -> 
      { model  
      | undecided = Maybe.withDefault [] ( List.tail model.undecided )
      , loves = ( model.loves ++ [ entry ] )
      } 
    Reject entry ->
      { model | undecided = Maybe.withDefault [] ( List.tail model.undecided ) }
    LetGo entry ->
      { model | loves = remove entry model.loves }
    UpRank entry ->
      { model | loves = ( moveUp entry model.loves ) }

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

