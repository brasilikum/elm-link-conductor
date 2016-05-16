module LinkForm exposing (..)

import LinkTypes
import Html exposing (div, h2, text, input, Html)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)


-- MODEL


type alias Model =
    LinkTypes.Link


init : Model
init =
    LinkTypes.emptyLink



-- UPDATE


type Msg
    = SetUrl String
    | SetTitle String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetUrl url ->
            { model | url = url }

        SetTitle title ->
            { model | title = title }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "URL", onInput SetUrl, value model.url ] []
        , input [ placeholder "Title", onInput SetTitle, value model.title ] []
        ]
