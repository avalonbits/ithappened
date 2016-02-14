module Happening (Model, init, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time)

-- MODEL

type alias Model =
    { title : String
    , description : String
    , count : Int
    , last_time : Time
    }

init : String -> String -> Model
init title description =
    { title = title
    , description = description
    , count = 0
    , last_time = 1400000000
    }


-- VIEW
view : x -> Model -> Html
view address model =
    div [ class "col s12 m12 l6" ]
    [ div [ class "card blue-grey darken-1" ]
        [ div [ class "card-content white-text" ]
            [ span [ class "card-title" ] [ text model.title]
            , p [] [ text model.description ]
            ]
        , div [ class "card-action" ]
            [ a [ href "#"] [ text "Delete" ]
            , a [ href "#"] [ text "Again" ]
            ]
        ]
    ]
