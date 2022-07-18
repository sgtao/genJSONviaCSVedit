split("\n")
| map(split(",")) 
| map({
"updated": .[0],
"country": .[1],
  "countryInfo": {
"_id": .[2],
"iso2": .[3],
"iso3": .[4],
"lat": .[5],
"long": .[6],
"flag": .[7]
  },
"cases": .[8],
"todayCases": .[9],
"deaths": .[10],
"todayDeaths": .[11],
"recovered": .[12],
"todayRecovered": .[13],
"active": .[14],
"critical": .[15],
"casesPerOneMillion": .[16],
"deathsPerOneMillion": .[17],
"tests": .[18],
"testsPerOneMillion": .[19],
"population": .[20],
"continent": .[21],
"oneCasePerPeople": .[22],
"oneDeathPerPeople": .[23],
"oneTestPerPeople": .[24],
"activePerOneMillion": .[25],
"recoveredPerOneMillion": .[26],
"criticalPerOneMillion": .[27],
"confirmed": .[28],
"countryCode": .[29]
})
