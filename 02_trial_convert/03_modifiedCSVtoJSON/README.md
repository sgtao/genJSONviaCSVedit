# 03_modifiedCSVtoJSON
- CSVファイルからJSONデータを復元する
  - CSVの編集を経過しているので、オブジェクト配列として出力する

## 手順
- 編集済みのCSVファイルを読み込む
```shell
jq -R -s -f mapping.jq test01_mod.csv
```

- `mapping.jq`ファイル：整形後のjqファイルです
```
split("\n")
| map(split(","))
| map(
    {
        "a": .[0],
        "b": {
            "bbb": .[1],
            "bcc": .[2]
        }
    }
)
```

- 実行サンプル
```shell
$ cat test01_mod.csv | column -t -s,
a    b.bbb  b.bcc
123  456    789
890  123    456
$
$ jq -R -s -f mapping.jq test01_mod.csv
[
  {
    "a": "a",
    "b": {
      "bbb": "b.bbb",
      "bcc": "b.bcc"
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
    "a": "890",
    "b": {
      "bbb": "123",
      "bcc": "456"
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
  - 1stアイテムで確認できる。
