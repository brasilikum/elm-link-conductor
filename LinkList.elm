module Main exposing (..)

import LinkForm
import LinkTypes exposing (Link)
import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Html.Attributes exposing (style)


main =
    App.beginnerProgram
        { model = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { links : List Link
    , nextID : ID
    , nextLink : LinkForm.Model
    }


type alias ID =
    Int


init : Model
init =
    { links = []
    , nextID = 0
    , nextLink = LinkForm.init
    }



-- UPDATE


type Msg
    = Add
    | ChangeNextLink LinkForm.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model | links = model.nextLink :: model.links, nextLink = LinkForm.init }

        ChangeNextLink linkMsg ->
            { model | nextLink = LinkForm.update linkMsg model.nextLink }



-- VIEW


view : Model -> Html Msg
view model =
    let
        items =
            List.map linkItemView model.links
    in
        div []
            [ App.map ChangeNextLink (LinkForm.view model.nextLink)
            , button [ onClick Add ] [ text "Add" ]
            , Html.ul [] items
            ]


linkItemView : Link -> Html Msg
linkItemView model =
    div [ style [ ( "background-color", "grey" ) ] ]
        [ h2 [] [ text model.title ]
        , div [] [ text model.url ]
        ]
