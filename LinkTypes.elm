module LinkTypes exposing (Link, Tag, emptyLink)


type alias Link =
    { url : String
    , title : String
    , tags : List Tag
    }


type alias Tag =
    { name : String
    , color : String
    }


emptyLink : Link
emptyLink =
    { url = ""
    , title = ""
    , tags = []
    }
