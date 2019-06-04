import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class QuakesApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuakesAppState();
  }
}

class QuakesAppState extends State<QuakesApp> {
  var isLoaded = false;
  List _data;

  void getApiData() async {
    var apiUrl =
        "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
    http.Response response = await http.get(apiUrl);
    // http resposne returns map or list object ...
    Map map = (json.decode(response.body));
    _data = map["features"];

    setState(() {
      for (var i = 0; i < _data.length; i++) {
        print(_data[i]["properties"]["place"]);
      }
    });
  }

  String convertDate(int date) {
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(date*1000, isUtc: true);
    print(dateTime);
    return DateFormat.yMMMMEEEEd().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      getApiData();
    } else {
      isLoaded = true;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("QuakesApp"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int position) {
          var itemData = _data[position]["properties"];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                position == 0
                    ? Container()
                    : Divider(
                        height: 1,
                      ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      "${itemData["mag"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "${itemData["time"] != null ? convertDate(itemData["time"]) : "No time"}",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "${itemData["place"]}",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  onTap: () => itemTapped(context, position),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  itemTapped(BuildContext context, int position) {
    var alertDialog = AlertDialog(
      title: Text("Quakes"),
      content: Text("${_data[position]["properties"]["place"]}"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("OK"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Dismiss"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Finish"),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
