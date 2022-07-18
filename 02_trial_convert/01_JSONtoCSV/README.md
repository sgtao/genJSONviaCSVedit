# 01_JSONtoCSV
- JSONファイルからCSVに変換する。この処理で生成するファイルは２つ。
  1. CSVファイル：JSONファイルの前半から後半にかけてのvalueとkeyの対応をまとめたCSVファイル
  2. JSONファイル：オリジナルJSONファイルを復元する(mappingする)JSONファイル

## CSVファイルへの変換

### 実験：試行（JSONオブジェクトファイル（配列なし）をCSVへ変換する）
- Qiita記事「[jqで階層構造を持つオブジェクトをCSVにマップする](https://qiita.com/ma2saka/items/210ad80d36a49a1dd694)」に習い、JSONオブジェクトを変換してみる

```
def walk(k):
  k as $k
  | to_entries
  | .[]
  | { key: ($k + .key), value: .value}
  | .key as $key
  | select(.value | type | .== "string" or.== "number") // (
    .value | 
    walk($key + ".")
  )
  ;
walk("")
| [.key, .value] 
| @csv
```

```JSON
{
  "a": "123",
  "b": {
    "bbb": "456",
    "bcc": "789",
    "fff": {
      "dddddd": "456",
      "eeeeee": "789"
    }
  },
  "c": {
  "ddd": "456",
  "eee": "789"
  }
}
```

```CSV
"a","123"
"b.bbb","456"
"b.bcc","789"
"b.fff.dddddd","456"
"b.fff.eeeeee","789"
"c.ddd","456"
"c.eee","789"
```

- ⇒　ただしこのフィルタでは配列を含むとエラーする

### 実験．
― 
```
. | ( keys | .[]  ) as $itemNo | { "_item\( $itemNo)" : .[$itemNo] } 
```

```JSON
[
  {
    "name": "Penfolds Bin 389",
    "region": "South Austraria"
  },
  {
    "name": "Chateau Cantenac Brown",
    "region": "Margaux"
  },
  {
    "name": "Tenuta San Guido Le Difese",
    "region": "Bolgheri"
  }
]
```

```JSON
{
  "_item0": {
    "name": "Penfolds Bin 389",
    "region": "South Austraria"
  }
}
{
  "_item1": {
    "name": "Chateau Cantenac Brown",
    "region": "Margaux"
  }
}
{
  "_item2": {
    "name": "Tenuta San Guido Le Difese",
    "region": "Bolgheri"
  }
}
```
