import 'package:first_flutter_app/jokes_app/model/Joke.dart';
import 'package:flutter/material.dart';

class JokeDetails extends StatelessWidget {
  JokeDetails({@required this.inTabletLayout, @required this.joke});

  final bool inTabletLayout;
  final Joke joke;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.setup ?? "No joke selected",
            style: textTheme.headline,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.punchline ?? "please select a joke from the left",
            style: textTheme.subhead,
          ),
        )
      ],
    );

    if (inTabletLayout) {
      return Center(
        child: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "No jokes"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: content,
      ),
    );
  }
}
