import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/utils/util.dart' as util;
import 'package:http/http.dart' as http;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  void showStuff() async {
    Map data = await getWeather(util.appId2, "Cairo");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Klimatic",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red,
            ),
            onPressed: () => showStuff(),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              "images/umbrella.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
            child: Text(
              "Spokane!!",
              style: cityStyle(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("images/light_rain.png"),
          ),

          ////// weather data
          Container(
            margin: const EdgeInsetsDirectional.fromSTEB(30, 320, 0, 0),
            child: updateWeatherWidget("San+Fransisco"),
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=$city&"
        "appid=${appId}&unit=metric";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateWeatherWidget(String city) {
    return FutureBuilder(
      future: getWeather(util.appId2, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        // here we will get all the data from JSON .. api ..
        // draw the widget .. in both cases if snapshot is empty or not
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "${content["main"]["temp"]}",
                    style: tempStyle(),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            child: Text(
              "Loading ...",
              style: tempStyle(),
            ),
          );
        }
      },
    );
  }
}

cityStyle() {
  return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontSize: 25);
}

tempStyle() {
  return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      fontSize: 25);
}
