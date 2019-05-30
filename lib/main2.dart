import 'package:first_flutter_app/ui/gestures_home_2.dart';
import 'package:first_flutter_app/ui/make_it_rain_home_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Gestures",
    //home: GesturesHome2(title: "GES",),
    //home: GesturesHome2("Gestures2", ""),
    home: MakeItRain(),
  ));
}
