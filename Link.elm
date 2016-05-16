module Link exposing (..)

import Tag
import Html exposing (div, h2, text, input, Html)
import Html.Attributes exposing (placeholder, style, type')


-- MODEL


type alias Model =
    { url : String
    , title : String
    , tags : List Tag.Tag
    }


init : Model
init =
    { url = ""
    , title = ""
    , tags = []
    }



-- UPDATE


type Msg
    = Link String
    | Title String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Link url ->
            { model | url = url }

        Title title ->
            { model | title = title }



-- VIEW


view : Model -> Html msg
view model =
    div [ style [ ( "background-color", "grey" ) ] ]
        [ h2 [] [ text model.title ]
        , div [] [ text model.url ]
        ]
