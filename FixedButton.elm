module FixedButton (Model, init, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

type alias Model = String

init : String -> Model
init label = label

-- VIEW

view : Signal.Address () -> Model -> Html
view address model =
    div [ class "container" ]
    [ div
        [ class "fixed-action-btn",
          style btnPosition,
          onClick address  ()
        ]
        [ a [ class "btn-floating btn-large red" ]
            [ i [ class "large material-icons" ] [ text model ] ]
        ]
    ]

btnPosition : List (String, String)
btnPosition =
    [ ("bottom", "45px")
    , ("right", "24px")
    ]
