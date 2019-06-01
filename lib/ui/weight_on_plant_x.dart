import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Plant X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              "images/planet.png",
              width: 133,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.all(3),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your weight on earth",
                        hintText: "In pounds",
                        icon: Icon(Icons.person_outline)),
                  ),

                  ///// the three radio button ...
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          activeColor: Colors.orange,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                        Text(
                          "Pluto",
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<int>(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                        Text(
                          "Mars",
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio<int>(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged,
                        ),
                        Text(
                          "Venus",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  ///// text result
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hellow .... ... ",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25.0,
                          color: Colors.redAccent),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
