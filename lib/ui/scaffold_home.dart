import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  void _sendPressed() => debugPrint("Send Tapped");

  void _buttonPressed() => debugPrint("button Tapped");

  void _snackBar(BuildContext context) {
    final scaffoldId = Scaffold.of(context);
    scaffoldId.showSnackBar(new SnackBar(
      content: new Text("Button Clicked :) :)"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange.shade700,
        title: new Text("Fency Day"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint("Icon Tapped")),
          new IconButton(icon: new Icon(Icons.send), onPressed: _sendPressed)
        ],
      ),

      ///////////// other properties
      backgroundColor: Colors.grey.shade200,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Bonni",
              style: new TextStyle(
                  fontSize: 20.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.red),
            ),
            new InkWell(
              child: new Text("Button!!!"),
              onTap: () => debugPrint("ButtonTAP"),
            )
          ],
        ),
      ),

      //////////// we still have the ability to add other views
    );
  }
}
