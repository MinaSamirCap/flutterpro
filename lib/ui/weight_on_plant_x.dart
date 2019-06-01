import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var radioValue = 0;
  var _finalResult = 0.0;
  var _formattedText = "";
  final _weightController = TextEditingController();

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (value) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "Your Weight On Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your Weight On Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
              "Your Weight On Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
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
                    controller: _weightController,
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
                      _weightController.text.isEmpty
                          ? "Plese Enter Your Weight"
                          : "$_formattedText lbs",
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

double calculateWeight(String weight, double multiplier) {
  if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
    return int.parse(weight) * multiplier;
  } else {
    print("Wrong!!!!");
    return int.parse("180") * 0.38;
  }
}
