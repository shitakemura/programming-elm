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
