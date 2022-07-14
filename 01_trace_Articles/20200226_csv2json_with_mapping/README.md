# Qiita「jqコマンドでCSVをJSONに変換してElasticSearchに登録する」

- 3.1.使用するCSV
```
$ cat test.csv
id,name,age,address
01,taro,12,tokyo
02,hanako,13,kyoto
03,ichiro,16,osaka
```


- 3.2.Mappingファイル作成
```
$ cat mapping.jq
split("\n")|map(split(","))|
   map({"id":.[0],
        "name":.[1],
        "age":.[2],
        "address":.[3],
})
```


- 3.3.CSVをJSONに変換
```shell
# jq -R -s -f <mappingファイル> <CSVファイル>
jq -R -s -f mapping.jq test.csv
```
