module FixedButton (Model, init, view, update) where

import Html exposing (..)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick)

type alias Model = String

init : String -> Model
init label = label

-- UPDATE

update : x -> Model -> Model
update x model = model


-- VIEW

view : Signal.Address () -> Model -> Html
view address model =
    div [ attribute "class" "container" ]
    [ div
        [(attribute "class" "fixed-action-btn"),
         (attribute "style" "bottom: 45px; right: 24px;"),
         (onClick address ())
        ]
        [ a [ attribute "class" "btn-floating btn-large red" ]
            [ i [ attribute "class" "large material-icons" ] [ text model ] ]
        ]
    ]
