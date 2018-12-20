import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginHomeState();
  }
}

class LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
