module Main exposing (..)

import Browser exposing (application, Document)
import Browser.Navigation as Nav
import Html exposing (..)
import Return exposing (Return)
import Url

type alias Model =
    String

type Msg =
    NoOp

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    ("Hello from Elm.", Cmd.none)

view : Model -> Document Msg
view model =
    { title = "Note"
    , body = viewMain model
    }

viewMain : Model -> List (Html Msg)
viewMain model =
    [ div []
          [ text model ]
    ]

update : Msg -> Model -> Return Msg Model
update msg model =
    case msg of
        NoOp -> (model, Cmd.none)

main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = \_ -> NoOp
        , onUrlRequest = \_ -> NoOp
        }
