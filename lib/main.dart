import 'package:first_flutter_app/ui/geusters_home.dart';
import 'package:first_flutter_app/ui/layout_home.dart';
import 'package:first_flutter_app/ui/layout_home_2.dart';
import 'package:first_flutter_app/ui/login_home.dart';
import 'package:first_flutter_app/ui/makeitrain_home.dart';
import 'package:first_flutter_app/ui/scaffold_home.dart';
import 'package:first_flutter_app/ui/welcome_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //color: Colors.greenAccent,
    title: "Welcome App",
    //home: new Welcome(),
    home: new HomeLayout(),
    //home: new HomeScaffold(),
    //home: new GeustersHome(title: "Gestures..."),

    //////// make it rain
    //title: "Make it rain",
    //home: new MakeItRain(),

    //////// login application
    //title: "Log in",
    //home: new LoginHome(),
  ));
}

