import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  MaterialColor _determineColor() {
    return _moneyCounter> 500? Colors.red : Colors.blue;
  }

  void _rainMoney() {

    /// this is so important setState must be called
    /// every time we need to update the UI
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }

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
                child: Text('\$ $_moneyCounter',
                    style: TextStyle(
                        color: _determineColor(),
                        fontWeight: FontWeight.w900,
                        fontSize: 50.5)),
              ),
            ),
            Expanded(
                child: Center(
              child: FlatButton(
                  onPressed: _rainMoney,
                  color: Colors.lightBlue,
                  child: Text("Let it rain",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.5))),
            ))
          ],
        ),
      ),
    );
  }
}
