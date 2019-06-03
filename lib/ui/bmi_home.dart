import 'package:flutter/material.dart';

class BMIHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIHomeState();
  }
}

class BMIHomeState extends State<BMIHome> {
  var ageBool = true;
  final _ageController = TextEditingController();
  final _weightFeedController = TextEditingController();
  final _weightLbController = TextEditingController();

  var bmi = 0.0;
  var bmiMessage = "";

  String _validateMessage() {
    if (bmiMessage.isEmpty) {
      return "Can not Calculate";
    } else {
      return bmiMessage;
    }
  }

  void _calculateBMI() {
    setState(() {
      bmi = 0.0;
      bmiMessage = "";
      if (_validateController(_ageController)) {
        /// show error message
        ageBool = true;
        return;
      }
      ageBool = false;

      if (_validateController(_weightFeedController)) {
        /// show error message
        return;
      }
      if (_validateController(_weightLbController)) {
        /// show error message
        return;
      }
      bmi = double.parse(_ageController.text) *
          double.parse(_weightFeedController.text) *
          double.parse(_weightLbController.text);

      if (bmi > 500) {
        bmiMessage = "OVERWEIGHT";
      } else if (bmi > 300) {
        bmiMessage = "Average Joy";
      } else if (bmi > 100) {
        bmiMessage = "GOOOOOOOD";
      } else {
        bmiMessage = "Too Small";
      }
    });
  }

  bool _validateController(TextEditingController controller) {
    return controller.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/bmilogo.png",
                width: 200,
                height: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "In Years",
                          errorText: ageBool ? "Enter Value" : null,
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _weightFeedController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight in feet",
                          hintText: "In Feet",
                          icon: Icon(Icons.confirmation_number)),
                    ),
                    TextField(
                      controller: _weightLbController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight in Lb",
                          hintText: "In lb",
                          icon: Icon(Icons.drag_handle)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RaisedButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            _calculateBMI();
                          },
                          textColor: Colors.white,
                          child: Text("Calculate"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Your BMI Is: $bmi",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                    fontSize: 25),
              ),
            ),
            Center(
              child: Text(
                _validateMessage(),
                style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
