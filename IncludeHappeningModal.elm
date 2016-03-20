module IncludeHappeningModal where

import Html as H
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
    { modalTitle = "It happened"
    , title = ""
    , description = ""
    }


-- VIEW

view : Signal.Address () -> Model -> Html
view x model =
    div [ id "whatHappened", class "modal modal-fixed-footer" ]
        [ div [ class "modal-content" ]
              [ h4 [] [ text model.modalTitle ]
              , H.form [ class "col s12" ]
                     [ div [ class "row"  ]
                           [ div [ class "input-field col s12"]
                                  [ input [ placeholder "What happened?"
                                          , id "what_happened"
                                          ] []
                                  ]
                           ]
                    ]
             ]
        , div [ class "modal-footer" ]
              [ a [ href "#!", class "modal-action modal-close waves-effect waves-red btn-flat" ]
                  [ text "Cancel" ]
              , a [ href "#!", class "modal-action modal-close waves-effect waves-red btn-flat" ]
                  [ text "OK" ]
              ]
        ]
