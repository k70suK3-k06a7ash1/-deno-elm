module Main exposing (main)

import Browser
import Counter
import Counter2
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


-- MAIN

main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
-- アプリケーション全体のモデル
-- 複数のカウンターの状態を保持する

type alias Model =
  { counter1 : Counter.Model
  , counter2 : Counter2.Model
  }

-- 初期状態は両方のカウンターモジュールの init を使う
init : Model
init =
  { counter1 = Counter.init
  , counter2 = Counter2.init
  }

-- UPDATE
-- アプリケーション全体のメッセージ。各カウンターからのメッセージを区別する

type Msg
  = Counter1Msg Counter.Msg
  | Counter2Msg Counter2.Msg

-- メッセージを受け取り、対応するモデルを更新する
update : Msg -> Model -> Model
update msg model =
  case msg of
    Counter1Msg counter1Msg ->
      { model | counter1 = Counter.update counter1Msg model.counter1 }

    Counter2Msg counter2Msg ->
      { model | counter2 = Counter2.update counter2Msg model.counter2 }

-- VIEW
-- アプリケーション全体のビュー。両方のカウンターのビューを表示する

view : Model -> Html Msg
view model =
  div [ class "p-5" ]
    [
      div [ class "hover:bg-sky-500 mb-4 text-center text-lg" ]
        [ text "Hello World!" ]
    , -- Counter モジュールのビューを表示し、メッセージを Counter1Msg でラップする
      Html.map Counter1Msg (Counter.view model.counter1)
    , -- Counter2 モジュールのビューを表示し、メッセージを Counter2Msg でラップする
      Html.map Counter2Msg (Counter2.view model.counter2)
    ]