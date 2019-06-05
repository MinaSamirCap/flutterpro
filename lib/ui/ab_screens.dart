import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  var _nameFieldController = TextEditingController();
  Map result;

  Future _goToNextScreen(BuildContext context) async {
    result = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return ScreenB(
        name: _nameFieldController.text,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            controller: _nameFieldController,
            decoration: InputDecoration(labelText: "Enter Name"),
          ),
          ListTile(
            title: RaisedButton(
              child: Text("Send me to second screen"),
              onPressed: () => _goToNextScreen(context),
            ),
          ),
          Text("${result != null ? result["info"] : ""}"),
          Text("${result != null ? result["mina"] : ""}"),
        ],
      ),
    );
  }
}

class ScreenB extends StatefulWidget {
  final name;

  ScreenB({Key key, this.name}) : super(key: key);

  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  var _backTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${widget.name}"),
            ),
            ListTile(
              title: TextField(
                controller: _backTextController,
                decoration: InputDecoration(labelText: "enter text to back"),
              ),
            ),
            ListTile(
              title: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'info': _backTextController.text,
                      'mina': "MinaSamir"
                    });
                  },
                  child: Text("Send Data back")),
            )
          ],
        ),
      )
      /*body: ListTile(
    title: Text("${widget.name}"),)*/
      ,
    );
  }
}
