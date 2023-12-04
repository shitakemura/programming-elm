module Picshare exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


type alias Model =
    { url : String
    , caption : String
    , liked : Bool
    }


baseUrl : String
baseUrl =
    "https://programming-elm.com/"


initialModel : Model
initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "Surfing"
    , liked = False
    }



-- viewDetailedPhoto : String -> String -> Html msg
-- viewDetailedPhoto url caption =
--     div [ class "detailed-photo" ]
--         [ img [ src url ] []
--         , div [ class "photo-info" ]
--             [ h2 [ class "caption" ] [ text caption ] ]
--         ]
-- main : Html msg
-- main =
--     div []
--     [ div [ class "header" ]
--             [ h1 [] [ text "Picshare" ] ]
--     , div [ class "content-flow" ]
--         [ viewDetailedPhoto (baseUrl ++ "1.jpg") "Surfing"
--         , viewDetailedPhoto (baseUrl ++ "2.jpg") "The Fox"
--         , viewDetailedPhoto (baseUrl ++ "3.jpg") "Evening"
--         ]
--     ]


viewDetailedPhoto : Model -> Html Msg
viewDetailedPhoto model =
    let
        buttonClass =
            if model.liked then
                "fa-heart"

            else
                "fa-heart-o"

        msg =
            if model.liked then
                Unlike

            else
                Like
    in
    div [ class "detailed-photo" ]
        [ img [ src model.url ] []
        , div [ class "photo-info" ]
            [ div [ class "like-button" ]
                [ i
                    [ class "fa fa-2x"
                    , class buttonClass
                    , onClick msg
                    ]
                    []
                ]
            , h2 [ class "caption" ] [ text model.caption ]
            ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto model ]
        ]


type Msg
    = Like
    | Unlike


update : Msg -> Model -> Model
update msg model =
    case msg of
        Like ->
            { model | liked = True }

        Unlike ->
            { model | liked = False }



-- main : Html Msg
-- main =
--     view initialModel


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
