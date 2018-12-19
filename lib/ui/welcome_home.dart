
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blue,
        child: new Center(
          child: new Text(
            "Hello Home!!",
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
        ));
  }
}