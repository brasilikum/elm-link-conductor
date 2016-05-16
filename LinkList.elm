module Main exposing (..)

import Link
import LinkInsert
import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)


main =
    App.beginnerProgram
        { model = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { links : List Link.Model
    , nextID : ID
    , nextLink : Link.Model
    }


type alias ID =
    Int


init : Model
init =
    { links = []
    , nextID = 0
    , nextLink = Link.init
    }



-- UPDATE


type Msg
    = Add
    | Change LinkInsert.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model | links = model.nextLink :: model.links, nextLink = LinkInsert.update LinkInsert.Reset model.nextLink }

        Change insertMsg ->
            { model | nextLink = LinkInsert.update insertMsg model.nextLink }



-- VIEW


view : Model -> Html Msg
view model =
    let
        linkToItem link =
            Html.li []
                [ text link.url ]

        items =
            List.map linkToItem model.links
    in
        div []
            [ App.map Change (LinkInsert.view model.nextLink)
            , button [ onClick Add ] [ text "Add" ]
            , Html.ul [] items
            ]
