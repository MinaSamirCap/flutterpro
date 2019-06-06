import 'package:first_flutter_app/read_write/io_home.dart';
import 'package:first_flutter_app/ui/ab_screens.dart';
import 'package:first_flutter_app/ui/klimatic_app.dart';
import 'package:first_flutter_app/ui/quakes_app.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(new MaterialApp(
    home: QuakesApp(),
  ));
}*/

//////// Klimatic weather application
void main() {
  runApp(MaterialApp(
    //home: Klimatic(),
    //home: ScreenA(),
    home: IOHome(),
  ));
}
