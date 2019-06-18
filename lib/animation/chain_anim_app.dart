import 'package:flutter/material.dart';

import 'chain_animation.dart';

class ChainAnimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: ChainAnimHome(title: "Animations In Flutter"),
    );
  }
}

class ChainAnimHome extends StatefulWidget {
  final String title;

  ChainAnimHome({Key key, this.title}) : super(key: key);

  @override
  _ChainAnimHomeState createState() => _ChainAnimHomeState();
}

class _ChainAnimHomeState extends State<ChainAnimHome>
    with SingleTickerProviderStateMixin {
  AnimationController controller; // to control the animation.
  Animation<double> animation; // to identify the animation type .. etc

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        controller.reverse();
      } else if (state == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChainAnimation(
        animation: animation,
      ),
    );
  }
}
