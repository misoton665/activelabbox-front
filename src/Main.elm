import MyMod.HaskellLike exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing ( onClick )

-- component import example
import Components.Hello exposing ( hello )


-- APP
main : Program Never
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model = Int
model : Model
model = 0


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


-- VIEW
-- Examples of:
-- 1)  an externally defined component ('hello', takes 'model' as arg)
-- 2a) styling through CSS classes (external stylesheet)
-- 2b) styling using inline style attribute (two variants)
view : Model -> Html Msg
view model =
  div
    [ class "mt-palette-accent", style styles.wrapper ]
    [ hello model
    ,  p [ style [( "color", "#FFF")] ] [ text ( "Elm Webpack Starter" ) ]
    ,  p [] [text "poe"]
    ,  button [ class "mt-button-sm", onClick Increment ] [ text "FTW!" ]
    ,  img [ src "img/suzu.jpg", style [( "display", "block"), ( "margin", "10px auto")] ] []
    ]

type alias Wrapper = List(String, String)

wrapper : Wrapper
wrapper = [ ( "padding-top", "10px" )
          , ( "padding-bottom", "20px" )
          , ( "text-align", "center" )
          ]
          
-- CSS STYLES
styles : {wrapper: Wrapper}
styles = {wrapper = wrapper}
