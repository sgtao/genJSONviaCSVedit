split("\n")|map(split(","))|
   map({"id":.[0],
        "name":.[1],
        "profile" : {
            "age":.[2],
            "address":.[3],
        },
})
