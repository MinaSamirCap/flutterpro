import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  void _rainMoney() {
    // IMPORTANT -- set state is called each time we want to update the UI

    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }

  checkColor() {
    if (_moneyCounter > 1000) {
      return Colors.deepOrange;
    } else {
      return Colors.lightGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        title: new Text("Make it rains"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
                child: new Text("Get Rich!!",
                    style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 29.9,
                        fontWeight: FontWeight.w400))),
            new Expanded(
                child: new Center(
              child: new Text(
                "\$ $_moneyCounter",

                /// local variable value
                style: new TextStyle(
                    color: _moneyCounter > 2500 ? Colors.blue : Colors.orange,
                    fontSize: 46.9,
                    fontWeight: FontWeight.w600),
              ),
            )),
            new Expanded(
                child: new Center(
                    child: new FlatButton(
                        color: Colors.lightGreen,
                        onPressed: _rainMoney,
                        child: new Text(
                          "Let it Rains!!!",
                          style: new TextStyle(fontSize: 19.9),
                        ))))
          ],
        ),
      ),
    );
  }
}
