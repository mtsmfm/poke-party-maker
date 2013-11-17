# language: ja
フィーチャ: 楽に相性のいいパーティが作れる
  ポケモントレーナーとして
  相性のいいパーティを労せず作りたい

  なぜなら、相性補完まで考えたパーティを作るのは大変だからだ

  背景:
    前提 使用可能なポケモンは以下のポケモンだけである:
      |   名前     | タイプ1  | タイプ2 |
      | コラッタ   | ノーマル |         |
      | ラッタ     | ノーマル |         |
      | ポリゴン   | ノーマル |         |
      | ポリゴン2  | ノーマル |         |
      | ポリゴンZ  | ノーマル |         |
      | ケンタロス | ノーマル |         |
      | ムウマ     | ゴースト |         |
    かつ パーティ作成画面を表示している

  シナリオ: 最初に選んだ3匹のポケモンを含んだ6匹のパーティになっている
    もし "ポケモン1"に"コラッタ"を入力する
    かつ "ポケモン2"に"ラッタ"を入力する
    かつ "ポケモン3"に"ポリゴン"を入力する
    かつ "決定"ボタンをクリックする

    ならば 以下のポケモンがパーティに含まれていること:
      | コラッタ |
      | ラッタ   |
      | ポリゴン |
    かつ 以下のポケモンのうち"2匹"がパーティに含まれていること:
      | ポリゴン2  |
      | ポリゴンZ  |
      | ケンタロス |
    かつ 以下のポケモンのうち"1匹"がパーティに含まれていること:
      | ムウマ     |
