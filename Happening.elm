module Happening (Model, Action, init, view, update) where

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


-- UPDATE

type Action
    = NoOp
    | Modify String String

update : Action -> Model -> Model
update action model =
    case action of
        NoOp ->
            model
        Modify title description ->
            { model |
                title = title,
                description = description
            }

-- VIEW
view : Signal.Address Action -> Model -> Html
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
