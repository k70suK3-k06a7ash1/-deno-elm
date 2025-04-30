module Counter2 exposing (Model, Msg(..), init, update, view)

-- このモジュールはカウンターのロジックとビューを担当します。
-- Model, Msg, init, update, view を公開 (exposing) します。


import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

-- MODEL

type alias Model = Int

init : Model
init =
  0

-- UPDATE

type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "flex items-center justify-center space-x-4 mt-4" ] -- 少し上にマージン追加
    [ button
        [ class "px-4 py-2 bg-gray-200 rounded hover:bg-gray-300 font-bold"
        , onClick Decrement
        ]
        [ text "-" ]
    , div
        [ class "text-2xl font-bold" ]
        [ text (String.fromInt model) ]
    , button
        [ class "px-4 py-2 bg-gray-200 rounded hover:bg-gray-300 font-bold"
        , onClick Increment
        ]
        [ text "+" ]
    ]