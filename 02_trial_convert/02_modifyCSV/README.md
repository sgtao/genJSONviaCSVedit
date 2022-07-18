# 02_modifyCSV
- CSVファイルを編集する
  - 前のステップで変換したCSVデータを使って、目的のデータを編集する
  - 次ステップの処理のために、まず転置して、そのあとに編集する

## 実行サンプル
- `csvtool transpose`を利用して、CSVデータを転置する
```shell
$ cat test01.csv
"a","123"
"b.bbb","456"
"b.bcc","789"
$ # 整形した表示
$ cat test01.csv | column -t -s,
"a"      "123"
"b.bbb"  "456"
"b.bcc"  "789"
$
$ cat test01.csv | csvtool transpose -
a,b.bbb,b.bcc
123,456,789
$ 
$ # 整形した表示
$ cat test01.csv | csvtool transpose - | column -t -s,
a    b.bbb  b.bcc
123  456    789
$
```
  - 変換したデータを編集する
