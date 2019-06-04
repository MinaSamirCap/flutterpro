import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Klimatic",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red,
            ),
            onPressed: () => print("pressed"),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              "images/umbrella.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
            child: Text(
              "Spokane!!",
              style: cityStyle(),
            ),
          )
        ],
      ),
    );
  }

  cityStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        fontSize: 25);
  }
}
