import 'package:first_flutter_app/ui/layout_home.dart';
import 'package:first_flutter_app/ui/scaffold_home.dart';
import 'package:first_flutter_app/ui/welcome_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //color: Colors.greenAccent,
    title: "Welcome App",
    //home: new Welcome(),
    //home: new Home(),
    home: new HomeScaffold(),
  ));
}
