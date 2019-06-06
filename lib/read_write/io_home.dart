import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IOHome extends StatefulWidget {
  @override
  _IOHomeState createState() => _IOHomeState();
}

class _IOHomeState extends State<IOHome> {
  final DATA_KEY = "dataKey";
  var _enterDataField = TextEditingController();
  var _saveData = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _saveData = preferences.get(DATA_KEY);
      print(_saveData);
    });
  }

  void _saveDataTo(String text) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(DATA_KEY, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IO"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: TextField(
                controller: _enterDataField,
                decoration: InputDecoration(labelText: "Write Something"),
              ),
              subtitle: FlatButton(
                  onPressed: () {
                    // save data
                    writeMessage(_enterDataField.text);
                  },
                  child: Text("Save To file")),
            ),
            ListTile(
              title: readFromFile(),
              subtitle: FlatButton(
                  onPressed: () {
                    // save data
                    readFile();
                  },
                  child: Text("Read from file")),
            ),
            ListTile(
              title: FlatButton(
                  onPressed: () {
                    // save data
                    _saveDataTo(_enterDataField.text);
                  },
                  child: Text("Write to sharepreference ...")),
            ),
            ListTile(
              title: (_saveData == null || _saveData.isEmpty)
                  ? Text("NO DATA")
                  : Text("$_saveData"),
              subtitle: FlatButton(
                  onPressed: () {
                    // save data
                    setState(() {});
                  },
                  child: Text("Read from sharepreference ...")),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path; //home/directory ..
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/data.txt"); //home/directory/data.txt
  }

  Future<File> writeMessage(String message) async {
    final file = await _localFile;
    return file.writeAsString("$message");
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return "ERROR";
    } finally {
      setState(() {});
    }
  }

  Widget readFromFile() {
    return FutureBuilder(
        future: readFile(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return snapshot != null ? Text("${snapshot.data}") : Text("Loadeing");
        });
  }

/*Widget readFromShared() {
    return FutureBuilder(
        future: _loadSavedData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return snapshot != null ? Text("${snapshot.data}") : Text("Loadeing");
        });
  }*/
}
