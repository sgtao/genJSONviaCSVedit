# genJSONviaCSVedit
- JSONデータ生成環境を作りたい
  - JSON to CSV, edit CSV, CSV to JSONの流れで処理する環境を作る
  - 参考サイト：JQサイト（マニュアル）：
    - 本家サイト：https://stedolan.github.io/jq/
    - 日本語版　：https://yujiorama.github.io/unofficial-translations/jq/l10n/jp/manual/
    - jqplay(jq on web) : https://jqplay.org/
  - 参考サイト：https://www.convertcsv.com/csv-to-json.htm （JSONのマッピングを定義できる）

## 方法
1. JSONをCSVデータ変換
   - ヘッダ付きで正確にkeyとvalueを整列させる
2. CSVデータを編集
3. 変数済みCSVデータをJSONへ変換
   - マッピングファイルを準備（正確に元のフォーマットに戻す）
   - マッピングファイルはオリジナルJSONから生成できそう

## 練習
- Qiita記事「jqコマンドでCSVをJSONに変換してElasticSearchに登録する」
  - refer : https://qiita.com/mj69/items/80a3a18210a4fa28ff44
- Qiita記事「jqで階層構造を持つオブジェクトをCSVにマップする」
  - refer : https://qiita.com/ma2saka/items/210ad80d36a49a1dd694

## LICENSE
MIT License

Copyright (c) 2022 sgtao

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

