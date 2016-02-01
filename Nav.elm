module Nav (Model, init, view, update) where

import Html exposing (..)
import Html.Attributes exposing (attribute)


-- MODEL

type alias Model = String

init : Model
init = "It Happened"


-- UPDATE
update : x -> Model -> Model
update x model = model


-- VIEW
view : x -> Model -> Html
view address model =
    nav []
    [ div [ attribute "class" "nav-wrapper" ]
        [ a [ (attribute "href" "#"), (attribute "class" "brand-logo center")]
            [ text model ]
        ]
    ]
