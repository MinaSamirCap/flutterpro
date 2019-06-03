import 'package:first_flutter_app/ui/CustomLoginForm.dart';
import 'package:first_flutter_app/ui/bmi_home.dart';
import 'package:first_flutter_app/ui/gestures_home_2.dart';
import 'package:first_flutter_app/ui/make_it_rain_home_2.dart';
import 'package:first_flutter_app/ui/weight_on_plant_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(MaterialApp(
    title: "Gestures",
    //home: GesturesHome2(title: "GES",),
    //home: GesturesHome2("Gestures2", ""),
    home: MakeItRain(),
  ));
}*/

//void main() => runApp(Login2());

class Login2 extends StatelessWidget {
  final appTitle = "login";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: CustomLoginForm(),
      ),
    );
  }
}

/////////// plants
/*void main(){
  runApp(MaterialApp(
    title: "Weight on plant X",
    home: Home(),
  ));
}*/

///////// BMI -> Body Mass Index
void main() {
  runApp(MaterialApp(
    title: "BMI",
    theme: ThemeData(buttonColor: Colors.redAccent),
    home: BMIHome(),
  ));
}
