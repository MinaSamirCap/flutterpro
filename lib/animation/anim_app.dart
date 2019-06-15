import 'package:flutter/material.dart';

import 'counter_anim.dart';

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: AnimationHome(title: "Animations In Flutter"),
    );
  }
}

class AnimationHome extends StatefulWidget {
  final String title;

  AnimationHome({Key key, this.title}) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with SingleTickerProviderStateMixin {
  AnimationController controller; // to control the animation.
  Animation<double>
      animation; // to identify the animation it self like type .. etc

  @override
  void initState() {
    super.initState();
    // vsync is to tell the system you are responsible for handling this animation ..
    controller = AnimationController(
        duration: const Duration(milliseconds: 1800), vsync: this);

    // initialize the animation and add the controller to the animation using parent param
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
      ..addListener(() {
        setState(() {
          print("RUNNING ${animation.value}");
        });
      });
    /* the .. is a cascade operation
    * so, instead of write animation.addListener I use it as ..addListener */

    // go a head to start animation.
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Text(
              "Hello World!!",
              style: TextStyle(fontSize: 19.0 * animation.value),
            ),
            Center(child: CounterAnimation())
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    /// to free up all needed resources to create that animation
    controller.dispose();
    super.dispose();
  }
}
