module Nav (Action, Model, init, view, update) where

import Html exposing (..)
import Html.Attributes exposing (attribute)


-- MODEL

type alias Model = String

init : Model
init = "It Happened"


-- UPDATE

type Action = Nothing

update : Action -> Model -> Model
update x model = model


-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
    nav []
    [ div [ attribute "class" "nav-wrapper" ]
        [ a [ (attribute "href" "#"), (attribute "class" "brand-logo center")]
            [ text model ]
        ]
    ]
