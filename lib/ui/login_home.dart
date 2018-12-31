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
    // controller property is in need to do operations on the entered text in the text field ...
    final TextEditingController _userController = new TextEditingController();
    final TextEditingController _passwordController =
        new TextEditingController();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            // image profile
            new Image.asset(
              "images/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.deepOrange,
            ),

            // form
            new Container(
                width: 380.0,
                height: 180.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _userController,
                      // controller property is in need to do operations on the entered text in the text field ...
                      decoration: new InputDecoration(
                          hintText: "user name", icon: new Icon(Icons.person)),
                    ),
                    new TextField(
                      controller: _passwordController,
                      // controller property is in need to do operations on the entered text in the text field ...
                      decoration: new InputDecoration(
                          hintText: "password", icon: new Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    new Padding(padding: new EdgeInsets.all(10.5)),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(left: 38.0),
                            child: new RaisedButton(
                              onPressed: () => debugPrint("Login"),
                              color: Colors.redAccent,
                              child: new Text(
                                "Login",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.9),
                              ),
                            ),
                          ),
                          new Container(
                            margin: const EdgeInsets.only(left: 120.0),
                            child: new RaisedButton(
                              onPressed: () => debugPrint("clear"),
                              color: Colors.redAccent,
                              child: new Text(
                                "Clear",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.9),
                              ),
                            ),
                          )
                          /* new FlatButton(onPressed: () => debugPrint("Button1"),
                            child: new Text("Button1"),
                            color: Colors.deepOrange,),
                          new FlatButton(onPressed: () => debugPrint("Button2"),
                            child: new Text("Button2"),
                            color: Colors.deepOrange,),*/
                        ],
                      ),
                    )
                  ],
                )), // end of form

            new Padding(padding: const EdgeInsets.all(14.0)),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 100.0)),
                new Text(
                  "Welcome, Bonni",
                  style: new TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
