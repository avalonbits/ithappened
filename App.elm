module App (Model, init, view, update) where

import HappeningList
import Nav
import Html exposing (..)
import Html.Attributes exposing (attribute)


-- MODEL

type alias Model =
    { nav : Nav.Model
    , items : HappeningList.Model
    }

init : Model
init =
    { nav = Nav.init
    , items = HappeningList.init
    }


-- UPDATE

type Action
    = Nothing
        | NavElement Nav.Action
        | Items HappeningList.Action

update : Action -> Model -> Model
update act model =
    case act of
        Nothing ->
            init

        NavElement act ->
            { model | nav = Nav.update act model.nav }

        Items act ->
            { model | items = HappeningList.update act model.items }


-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
    let nav = Nav.view (Signal.forwardTo address NavElement) model.nav
        items = HappeningList.view (Signal.forwardTo address Items ) model.items
    in
        div [] [nav,  items]

