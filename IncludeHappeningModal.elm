module IncludeHappeningModal where

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL

type alias Model =
    { modalTitle : String
    , title : String
    , description : String
    }

init : Model
init =
    { modalTitle = "What happened?"
    , title = ""
    , description = ""
    }


-- VIEW

view : Signal.Address () -> Model -> Html
view x model =
    div [ id "whatHappened", class "modal modal-fixed-footer" ]
    [ div [ class "modal-content" ]
          [ h4 [] [ text model.modalTitle ] ],
      div [ class "modal-footer" ] [ text "Omega" ]
    ]
