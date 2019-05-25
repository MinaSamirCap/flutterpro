import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const Text("Hi"),
          const Text("bye"),
          const Text("FFFFFFFFff"),
          const Text("BUSH"),
        ],

        /*child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello Container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 10.5,
                color: Colors.white,
              ),
            ),
            Text(
              "Hello Container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 10.5,
                color: Colors.white,
              ),
            ),
            const Expanded(
              child: Text(
                "Hello Container",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            )
          ],*/

          /*child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "Hello Container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
            Text(
              "Hello Container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
            Text(
              "Hello Container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          ],*/
        ));
  }
}
