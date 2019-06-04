
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
        title: Text("Klimatic", style: TextStyle(color: Colors.black),),
        actions: <Widget>[

        ],
      ),
    );
  }
}
