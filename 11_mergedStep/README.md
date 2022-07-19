# 11_mergedStep
- 試行した手順をまとめる。

## 実行環境
- この手順では、`jq`、`gawk`、`csvtool`のコマンドを利用してます
- 各コマンドの版数
```shell
$ jq --version
jq-1.5-1-a5b5cbe
$ gawk -V | head -1
GNU Awk 4.2.1, API: 2.0 (GNU MPFR 4.0.2, GNU MP 6.1.2)
$
$ apt list csvtool
csvtool/oldstable,now 1.5-1+b1 armhf [インストール済み]
$
```

- 各コマンドがなければインストールしましょう
```
sudo apt update
sudo apt install -y jq
sudo apt install -y gawk
sudo apt install -y csvtool
```


## 手順
0. JSONファイルを準備する
  - 1アイテムのJSONファイルを準備する
  - 変換できるのは、最上位のtypeがobjectのJSONデータのみ
  - 最上位がarray typeのJSONデータはサポートしていない
    - ステップ1.でエラーとなる

1. JSONをCSVデータ変換
  - ステップ3.で利用するマッピングファイルを作成する
```shell
sh 11_gen_mappingFile.sh　<JSONファイル> | tee <JQスクリプト1>
```
  - ヘッダ付きで正確にkeyとvalueをCSVファイルに整理する
```shell
sh 12_jsonItem_to_csv.sh　<JSONファイル> | tee <CSVファイル1>
```

2. CSVデータを編集
  - ステップ1.のCSVファイルを（編集・復元用に）転置する
```shell
sh 21_transpose_csv.sh <CSVファイル1> | tee <CSVファイル2>
```
  - CSVファイルを編集（実際は、Excel利用が実現的とおもいます）
```shell
cp <CSVファイル2> <CSVファイル3>
nano <CSVファイル3> # example
```

3. 変数済みCSVデータをJSONへ変換
  - 編集したCSVファイルとマッピングファイルからJSONファイル作成
```shell
sh 31_csv2json.sh <JQスクリプト1> <CSVファイル3>
```

## 実行例

### 0. JSONを準備する
- 今回使用するファイルを確認
```shell
$ cat test01.json
{
  "a": "123",
  "b": {
    "bbb": "456",
    "bcc": "789"
  }
}
$
```

### 1. JSONをCSVデータ変換
- ステップ3.で利用するマッピングファイルを作成する
```shell
$ sh 11_gen_mappingFile.sh samples/test01.json | tee working/test01_map.jq
split("\n")| map(split(",")) | map(
{
"a": .[0],
  "b": {
"bbb": .[1],
"bcc": .[2]
  }
}
)
$
```

- ヘッダ付きで正確にkeyとvalueをCSVファイルに整理する
```shell
$ sh 12_jsonItem_to_csv.sh samples/test01.json > working/test
01_items.csv
$
$ column -t -s, working/test01_items.csv
"a"      "123"
"b.bbb"  "456"
"b.bcc"  "789"
$
```


### 2. CSVデータを編集
- ステップ1.のCSVファイルを（編集・復元用に）転置する
```shell
$ sh 21_transpose_csv.sh working/test01_items.csv > working/test01.csv
$
$ column -t -s, working/test01.csv
a    b.bbb  b.bcc
123  456    789
$
```

- CSVファイルを編集（実際は、Excel利用が実現的とおもいます）
  - ここでは差分のみを確認してます
```shell
$ diff -c working/test01.csv  working/test01_mod.csv
*** working/test01.csv  2022-07-20 00:40:19.458807900 +0900
--- working/test01_mod.csv      2022-07-20 00:42:10.653016200 +0900
***************
*** 1,2 ****
--- 1,3 ----
  a,b.bbb,b.bcc
+ 456,789,123
  123,456,789
$
```


### 3. 変数済みCSVデータをJSONへ変換
- 編集したCSVファイルとマッピングファイルからJSONファイル作成
```shell
$ sh 31_csv2json.sh working/test01_map.jq working/test01_mod.csv
[
  {
    "a": "a",
    "b": {
      "bbb": "b.bbb",
      "bcc": "b.bcc"
    }
  },
  {
    "a": "456",
    "b": {
      "bbb": "789",
      "bcc": "123"
    }
  },
  {
    "a": "123",
    "b": {
      "bbb": "456",
      "bcc": "789"
    }
  },
  {
    "a": null,
    "b": {
      "bbb": null,
      "bcc": null
    }
  }
]
$
```


