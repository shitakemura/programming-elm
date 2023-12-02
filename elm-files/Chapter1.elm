-- 1章 Elmをはじめよう

-- 1.1 関数の基礎

-- ElmのREPLでいろいろ試してみる

-- 最初の関数を書いてみよう
sayHello name = "Hello, " ++ name ++ "."

sayHello greeting name = greeting ++ ", " ++ name ++ "."

-- 真偽値に応じて分岐させる
woodchuck canChunk = if canChunk then "Chucking wood!" else "No chucking!"

tribllesStatus howMany =
    if howMany == 1 then
        "It's trilling seems to have a tranquilizing effect ..."
    else if howMany > 1 then
        "They're consuming our supplies and returning nothing."
    else
        "I gave 'em to the Kiligons, sir."
