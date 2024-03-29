-- 2章 状態を持つElmアプリケーションを作成する

-- 2.1 The Elm Architectureを適用する

-- モデルを作成する

-- レコード型を使ってみる
dog = { name = "Tucker", age = 11 }

-- 新しいレコードを作成する

haveBirthday d = { name = d.name, age = d.age + 1 }

olderDog = haveBirthday dog 

-- レコード更新構文を使う

haveBirthday d = { d | age = d.age + 1 }

-- イミュータブルであることの利点

-- レコード型のモデルを作成する

-- 2.2 ビューを作成する

-- 2.3 状態の変更を扱う

-- 2.4 The Elm Architectureのライフサイクル
