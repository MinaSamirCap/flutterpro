import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

////// data class ...
class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // add image
          Center(
            child: Image.asset("images/google.png",
                width: 90, height: 90, color: Colors.white),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.verified_user),
                  labelText: "Name",
                  border: OutlineInputBorder(
                      gapPadding: 4, borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                if (value.isEmpty) {
                  _data.name = "";
                  return "please enter name";
                } else {
                  _data.name = value;
                  debugPrint("All is Good $value");
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 4, borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter password";
                } else {
                  _data.password = value;
                  debugPrint("all is good $value");
                }
              },
            ),
          ),

          //// adding buttons ... :)
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("GOOOOD!!!")));

                      } else {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("BAAAAAAAAAD!!!")));
                      }

                      setState(() {
                        //_data.name = _data.name;
                      });
                    },
                    child: Text("Submit"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      _formKey.currentState.reset();
                      setState(() {
                        _data.name = "";
                      });
                    },
                    child: Text("Clear"),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: _data.name.isEmpty
                    ? Text("")
                    : Text(
                        "Hello, ${_data.name}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
          )
        ],
      ),
    );
  }
}
