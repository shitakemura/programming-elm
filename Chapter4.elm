-- 4章 サーバーと通信する

-- 4.1 JSONを安全にデコードする

-- 問題を理解する

-- 最初にやること

-- デコーダーで遊んでみよう

import Json.Decode exposing (decodeString, bool, int, string)

decodeString int "42"
decodeString int "\"Elm\""

type Result error value
    = Ok value
    | Err error

-- 
import Json.Decode exposing (decodeString, bool, field, int, list, string)

decodeString bool "true"
decodeString string "\"Elm is Awesome\""
decodeString (list int) "[1, 2, 3]"
decodeString (field "name" string) """{"name": "Tucker"}"""

-- パイプライン演算子を使って関数を合成する
greet name = "Hello, " ++ name 

exclaim phrase = phrase ++ "!"

excitedGreeting name = exclaim (greet (String.toUpper name))

excitedGreeting "Elm"

excitedGreeting name = name |> String.toUpper |> greet |> exclaim

excitedGreeting name =
    name
      |> String.toUpper
      |> greet
      |> exclaim

-- JSONオブジェクトをデコードする

import Json.Decode exposing (decodeString, int, string, succeed)
import Json.Decode.Pipeline exposing (required)

dog name age = { name = name, age = age }

dogDecoder =
    succeed dog
        |> required "name" string
        |> required "age" int

decodeString dogDecoder """{"name": "Tucker", "age": 11}"""

-- 写真データ用のデコーダーを作成する
import Picshare exposing (photoDecoder)
import Json.Decode exposing (decodeString)

decodeString photoDecoder """{ "id": 1, "url": "https://programming-elm.surge.sh/1.jpg", "caption": "Surfing", "liked": false, "comments": ["Cowabunga, dude!"]}"""

-- 4.2 HTTP APIからデータを取得する

-- コマンドを作成する

-- コマンドを送信する
