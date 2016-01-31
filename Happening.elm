module Happening (Action,  Model, init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (attribute)
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


-- UPDATE

type Action = Nothing

update : x -> Model -> Model
update action model = model


-- VIEW
view : x -> Model -> Html
view address model =
    div [ attribute "class" "col s12 m12 l6" ]
    [ div [ attribute "class" "card blue-grey darken-1" ]
        [ div [ attribute "class" "card-content white-text" ]
            [ span [ attribute "class" "card-title" ] [ text model.title]
            , p [] [ text model.description ]
            ]
        , div [ attribute "class" "card-action" ]
            [ a [ attribute "href" "#"] [ text "Delete" ]
            , a [ attribute "href" "#"] [ text "Again" ]
            ]
        ]
    ]
