module LinkInsert exposing (..)

import Link
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

  
  
-- UPDATE

type Msg
  = Url String
  | Title String
  | Reset
  

update : Msg -> Link.Model -> Link.Model
update action model = 
  case action of
    Url url ->
      { model | url = url }
    
    Title title ->
      { model | title = title }
      
    Reset ->
      Link.init
      
      
-- VIEW

view : Link.Model -> Html Msg
view model =
  div []
    [ input [ placeholder "URL", onInput Url, content model.url] []
    , input [ placeholder "Title", onInput Title, content model.title ] [] 
    ]