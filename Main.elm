import Happening exposing (init, update, view)
import StartApp.Simple exposing (start)

main = start
    { model =
        init "Card Title"
             """I am a very simple card. I am good at containing small bits of information.
             I am convenient because I require little markup to use effectively."""
    , update = update
    , view = view
    }
