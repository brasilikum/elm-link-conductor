module Tag exposing (..)

type alias Tag = 
  { name: String
  , color: String
  }
  
  
init : Tag
init =
  { name = ""
  , color = "red" 
  }