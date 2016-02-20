module FixedButton (Model, init, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import IncludeHappeningModal

type alias Model =
    { label : String
    , modal : IncludeHappeningModal.Model
    }

init : String -> Model
init label =
    { label = label
    , modal = IncludeHappeningModal.init
    }

-- VIEW

view : Signal.Address () -> Model -> Html
view address model =
    div
      [ class "fixed-action-btn"
      , style btnPosition
      ]
      [ a [ class "modal-trigger waves-effect waves-light btn-floating btn-large red"
          , href "#whatHappened"
          ]
          [ i [ class "large material-icons" ] [ text model.label ] ]
      , IncludeHappeningModal.view address model.modal
      ]

btnPosition : List (String, String)
btnPosition =
    [ ("bottom", "45px")
    , ("right", "24px")
    ]
