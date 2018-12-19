import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            new Text("itemmmmmm"),
            const Text("FSFSFSFS"),
            new Text("1")
          ],
        ));
        /*child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Item 1",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 12),
            ),
            new Text(
              "Item 1",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 12),
            ),
            const Expanded(child: const Text("Item 3333"))
          ],
        ));*/
    /*child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("First Item",
                textDirection: TextDirection.ltr,
                style: new TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.3)),
            new Text("Second Item",
                textDirection: TextDirection.ltr,
                style: new TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.3)),
            new Container(
              color: Colors.deepOrange.shade500,
              child: new Text("Hello Container",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.3)),
            )
          ],
        ));*/
  }
}
