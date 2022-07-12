# generateJSONthroghCSVedit
- JSONデータ生成環境を作りたい
  - JSON to CSV, edit CSV, CSV to JSONの流れで処理する環境を作る
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
