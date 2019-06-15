import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  int counter = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.addListener(() {
      this.setState(() {
        counter++;
        print("Print: $counter");
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        _controller.isAnimating ? counter.toStringAsFixed(2) : "Let's begin",
        style: TextStyle(
            fontSize:
                _controller.isAnimating ? 24.0 * _controller.value : 20.0),
      ),
      onTap: () => _controller.forward(),
    );
  }
}
