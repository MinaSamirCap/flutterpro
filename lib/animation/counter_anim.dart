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
    //animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addListener(() {
        //print("Animation Tween: ${animation.value}");
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 5);
        } else if (status == AnimationStatus.reverse) {
          this.setState(() {
            counter = counter - 400;
            print("=============> reverse value =======> $counter");
          });
        }
      });

    _controller.addListener(() {
      this.setState(() {
        counter++;
        //print("Print: $counter");
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
            fontSize: _controller.isAnimating ? 24.0 * animation.value : 20.0),
      ),
      onTap: () => {startAnimation()},
    );
  }

  startAnimation() {
    print("TAPPED");
    _controller.forward();
  }
}
