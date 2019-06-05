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
  var cityName = util.defaultCity;

  /*void showStuff() async {
    Map data = await getWeather(util.appId2, "Cairo");
    print(data);
  }*/

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
            onPressed: () => selectCity(context),
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
              "$cityName!!",
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
            child: updateWeatherWidget(cityName),
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
          Map content = snapshot.data["main"];
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "${content["temp"]}",
                    style: tempStyle(),
                  ),
                ),
                ListTile(
                  title: Text("Humidity: ${content["humidity"]} \n"
                      "Min Temp: ${content["temp_min"]} \n"
                      "Max Temp: ${content["temp_max"]}", style: tempStyle2(),),
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

  Future selectCity(BuildContext context) async {
    Map result = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return ChangeCity();
    }));

    if (result != null && result.containsKey("enter")) {
      cityName = result["enter"];
      //setState(() {});
    } else {}
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

tempStyle2() {
  return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.normal,
      fontSize: 15);
}

class ChangeCity extends StatelessWidget {
  var _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change City",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              "images/white_snow.png",
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  controller: _cityTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Enter city", hintText: "ex: cairo"),
                ),
              ),
              ListTile(
                title: RaisedButton(
                    color: Colors.red,
                    child: Text("Get Temp"),
                    onPressed: () {
                      Navigator.pop(
                          context, {"enter": _cityTextController.text});
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
