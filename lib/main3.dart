import 'package:first_flutter_app/read_write/database_home.dart';
import 'package:first_flutter_app/read_write/io_home.dart';
import 'package:first_flutter_app/ui/ab_screens.dart';
import 'package:first_flutter_app/ui/klimatic_app.dart';
import 'package:first_flutter_app/ui/quakes_app.dart';
import 'package:flutter/material.dart';

import 'animation/anim_app.dart';
import 'auth/auth_home.dart';
import 'firebase/firebase_home.dart';
import 'not_to_do_app/ui/no_to_do.dart';

/*void main() {
  runApp(new MaterialApp(
    home: QuakesApp(),
  ));
}*/

//////// Klimatic weather application
/*
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Klimatic(),
      //home: ScreenA(),
      //home: IOHome(),
      //home: DatabaseHome(),
      home: NoToDoHome()));
}
*/

/////////////// firebase ...
//void main() => runApp(MyApp());

////////////// auth .. google singin ,firebase .....fina
//void main() => runApp(AuthApp());


////////////// flutter animation lesson 31 ..
void main() => runApp(AnimationApp());
