import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countryclass.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  static const kstyleCountry =
      TextStyle(fontWeight: FontWeight.normal, fontSize: 24,letterSpacing: 3);
  static const kstyleOther =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16,letterSpacing: 2);
  List<CountryClass> countriesList = [];
  List<CountryClass> filteredCountriesList = [];
  Future _future;

  @override
  void initState() {
    super.initState();
    _future = getDataCountry();
  }

  Future getDataCountry() async {
    countriesList.clear();
    http.Response response =
        await http.get('https://coronavirus-19-api.herokuapp.com/countries');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      for (var country in data) {
        CountryClass countryClass = CountryClass(
            country["country"],
            country["cases"],
            country["todayCases"],
            country['deaths'],
            country['todayDeaths'],
            country['recovered'],
            country['active'],
            country['critical']);
        if (country["country"] == "World") {
        } else {
          countriesList.add(countryClass);
        }
        filteredCountriesList = countriesList;
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Enter Country Name',
                  ),
                  onChanged: (string) {
                    setState(() {
                      filteredCountriesList = countriesList.where(
                        //Where Function Takes An Anonymous Functions as an Argument To Compare Each Country Name
                        //And returns a collection which gets saved to the filteredCountriesList
                        (countriesName) {
                          return (countriesName.country.toLowerCase().contains(
                                string.toLowerCase(),
                              ));
                        },
                      ).toList();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: filteredCountriesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      filteredCountriesList[index]
                                          .country
                                          .toString(),
                                      style: kstyleCountry,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Today Cases',
                                                style: kstyleOther,
                                              ),
                                              Text(filteredCountriesList[index]
                                                  .todayCases
                                                  .toString()),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Today Death',
                                                style: kstyleOther,
                                              ),
                                              Text(filteredCountriesList[index]
                                                  .todayDeaths
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  'Active',
                                                  style: kstyleOther,
                                                ),
                                                Text(
                                                    filteredCountriesList[index]
                                                        .active
                                                        .toString()),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  'Cases',
                                                  style: kstyleOther,
                                                ),
                                                Text(
                                                    filteredCountriesList[index]
                                                        .cases
                                                        .toString()),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                  'Deaths',
                                                  style: kstyleOther,
                                                ),
                                                Text(
                                                    filteredCountriesList[index]
                                                        .deaths
                                                        .toString()),
                                              ],
                                            ),
                                          ]),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Recovered',
                                                style: kstyleOther,
                                              ),
                                              Text(filteredCountriesList[index]
                                                  .recovered
                                                  .toString()),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'Critical',
                                                style: kstyleOther,
                                              ),
                                              Text(filteredCountriesList[index]
                                                  .critical
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: new CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
