import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
              "GET RICH !!!",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 30.5),
            )),
            Expanded(
              child: Center(
                child: Text("000000",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.w900,
                        fontSize: 50.5)),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                    onPressed: ()=> debugPrint("HEY"),
                    color: Colors.lightBlue,
                    child: Text("Let it rain",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.5))),
              )
            )
          ],
        ),
      ),
    );
  }
}
