import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldHome2 extends StatelessWidget {
  void _onPressed() {
    debugPrint("Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        title: Text("Fency App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () => debugPrint("Send Tapped!!"),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () => debugPrint("Send Tapped!!"),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () => debugPrint("Send Tapped!!"),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () => debugPrint("Send Tapped!!"),
          ),
          IconButton(
            icon: Icon(
              Icons.receipt,
            ),
            onPressed: _onPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.public,
            ),
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
