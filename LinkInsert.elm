module LinkInsert exposing (..)

import Link
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

  
  
-- UPDATE

type Msg
  = Url String
  | Title String
  

update : Msg -> Link.Model -> Link.Model
update action model = 
  case action of
    Url url ->
      { model | url = url }
    
    Title title ->
      { model | title = title }
      

-- VIEW

view : Link.Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "URL", onInput Url ] []
    , input [ type' "text", placeholder "Title", onInput Title ] [] 
    ]