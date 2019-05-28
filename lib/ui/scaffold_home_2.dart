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

      /// other properties of scaffold .. :)
      backgroundColor: Colors.lightGreen.shade500,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bonni",
                style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87)),
            InkWell(
              child: Text("Button!!"),
              onTap: () => debugPrint("TABBBB!!!"),
            )
          ],
        ),
      ),

      /// other properties of scaffold .. :)
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("HEY")),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("HEY")),
        ],
        onTap: (i) => debugPrint("TAB JEY $i"),
      ),

      /// other properties of scaffold .. :)
      floatingActionButton:
          FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              child: Icon(Icons.adb),
              tooltip: "ADB ICON",
              onPressed: () => debugPrint("Float Clicked")),
    );
  }
}
