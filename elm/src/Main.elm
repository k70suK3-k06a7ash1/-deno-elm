module Main exposing (main)

import Browser
import Counter
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


-- MAIN

main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
-- アプリケーション全体のモデル

type alias Model =
  Counter.Model

-- 初期状態は Counter モジュールの init を使う
init : Model
init =
  Counter.init

-- UPDATE
-- アプリケーション全体のメッセージ。カウンターからのメッセージをラップする

type Msg
  = CounterMsg Counter.Msg -- Counter からのメッセージを受け取るためのタグ

-- メッセージを受け取り、モデルを更新する
update : Msg -> Model -> Model
update msg model =
  case msg of
    -- CounterMsg タグが付いたメッセージが来たら、
    -- Counter モジュールの update 関数にメッセージと現在の Counter モデルを渡す
    CounterMsg counterMsg ->
      Counter.update counterMsg model

-- VIEW
-- アプリケーション全体のビュー

view : Model -> Html Msg
view model =
  div [ class "p-5" ] -- 全体を囲む div に少しパディングを追加
    [
      div [ class "hover:bg-sky-500 mb-4 text-center text-lg" ] -- マージンと中央揃え、テキストサイズを追加
        [ text "Hello World!" ]
    , -- Counter モジュールのビューを表示
      -- Counter.view は Html Counter.Msg を返すので、Html.map で Html Msg に変換する
      Html.map CounterMsg (Counter.view model)
    ]
