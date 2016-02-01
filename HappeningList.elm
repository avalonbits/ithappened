module HappeningList where

import Happening
import Nav
import Html exposing (..)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick)

-- MODEL

type alias Model =
    { happenings : List (ID, Happening.Model)
    , nextID : ID
    , nav : Nav.Model
    }

type alias ID = Int

init : Model
init =
    { happenings = []
    , nextID = 0
    , nav = Nav.init
    }


-- UPDATE

type Action = Insert

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


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
    let items = List.map (viewHappening address) model.happenings
        nav = Nav.view  address model.nav
        insert = button [ onClick address Insert ] [ text "Add" ]
    in
        div []
        [ nav,
          (div [ attribute "class" "container" ]
            [  insert, (div [ attribute "class" "row" ] items) ])
        ]

viewHappening : Signal.Address Action -> (ID, Happening.Model) -> Html
viewHappening address (id, model) =
    Happening.view address model