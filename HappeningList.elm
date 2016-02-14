module HappeningList where

import FixedButton
import Happening
import Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

-- MODEL

type alias Model =
    { happenings : List (ID, Happening.Model)
    , nextID : ID
    , addBtn : FixedButton.Model
    }

type alias ID = Int

init : Model
init =
    { happenings = []
    , nextID = 0
    , addBtn = FixedButton.init "+"
    }


-- UPDATE

type Action
    = Insert
    | Modify ID Happening.Action

update : Action -> Model -> Model
update action model =
    case action of
        Insert ->
            let newHappening = (model.nextID, (Happening.init "The title" "A pretty big description for such a small event"))
                newHappenings = newHappening :: model.happenings
            in
                { model |
                    happenings = newHappenings,
                    nextID = model.nextID +1
                }
        Modify id happeningAct ->
            let updateHappening (happeningId, happeningModel) =
                if id == happeningId
                then (happeningId, Happening.update happeningAct happeningModel)
                else (happeningId, happeningModel)
            in
                { model | happenings = List.map updateHappening model.happenings }

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
    let items = List.map (viewHappening address) model.happenings
        addBtn = FixedButton.view (Signal.forwardTo address (always Insert)) model.addBtn
    in
        div []
        [ (div [ class "container" ] [ (div [ class "row" ] items) ]),
          addBtn
        ]

viewHappening : Signal.Address Action -> (ID, Happening.Model) -> Html
viewHappening address (id, model) =
    Happening.view (Signal.forwardTo address (Modify id)) model
