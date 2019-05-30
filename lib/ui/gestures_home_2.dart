import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GesturesHome2 extends StatelessWidget {
  String title;

  GesturesHome2({Key key, this.title}) : super(key: key);

  /*GesturesHome2(String title1, String title2){
    this.title = title1;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(this.title != null ? title : "mina"),
        ),
        body: Center(
          child: CustomButton(),
        ));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        final snackbar = SnackBar(
          content: new Text(
            "MINA",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 30.5,
                fontWeight: FontWeight.w900),
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      onTap: () {
        final snackbar = SnackBar(
          content: Text("MON"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: Duration(milliseconds: 500),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(5.5),
        ),
        child: Text("First Button"),
      ),
    );
  }
}
