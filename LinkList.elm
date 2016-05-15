module Main exposing (..)

import Link
import LinkInsert
import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
  App.beginnerProgram
    { model = init
    , update = update
    , view = view
    }


-- MODEL

type alias Model =
  { links : List (ID, Link.Model )
  , nextID: ID
  , nextLink: Link.Model 
  }
  
type alias ID = Int

init : Model
init =
  { links = []
  , nextID = 0
  , nextLink = LinkInsert.init
  }
  
  
-- UPDATE

type Msg
  = Add Link.Model
  | Change LinkInsert.Msg

  
update : Msg -> Model -> Model
update msg model =
  case msg of
    Add link ->
      let
        newLink =
          ( model.nextID, link )
        newLinks =
          model.links ++ [ newLink ]
      
      in
        Model newLinks (model.nextID + 1)
    Change insertMsg ->
      { model | nextLink = LinkInsert.update insertMsg model.nextLink }
        
-- VIEW

view : Model -> Html Msg
view model =
  let  
    linkToItem (id, link) =
      Html.li []
        [ text link.url ]
        
    items = List.map linkToItem model.links
    
  in 
    div []
      [ Html.ul [] items 
      ]
    
  