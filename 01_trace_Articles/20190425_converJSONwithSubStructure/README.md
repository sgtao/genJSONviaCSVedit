# 20190425_converJSONwithSubStructure
- Qiita記事「jqで階層構造を持つオブジェクトをCSVにマップする」
  - refer : https://qiita.com/ma2saka/items/210ad80d36a49a1dd694


## 手順
- JSONファイル
```
{
  "a": "123",
  "b": {
    "bbb": "456",
    "bcc": "789"
  }
}
```

- 変換コマンド
```shell
jq -c -r \
   'def walk(k): k as $k | \
        to_entries | \
        .[] | \
        {key: ($k + .key), value: .value} | \
        .key as $key | \
        ( select(.value | type | .=="string") // (.value | walk($key + ".")) ); \
    walk("") |\
    [ .key, .value ] |\
    @csv'
```

### 実際
```
$ jq -r '.' test.json | jq -c -r 'def walk(k): k as $k |  to_entries |  .[] |  {key: ($k + .key), value: .value} |  .key as $key |  ( select(.value | type | .=="string") // (.value | walk($key + ".")) ); walk("") | [.key, .value] | @csv'
"a","123"
"b.bbb","456"
"b.bcc","789"
```

