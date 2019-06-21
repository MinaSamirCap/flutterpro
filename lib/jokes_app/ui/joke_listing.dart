import 'package:first_flutter_app/jokes_app/model/Joke.dart';
import 'package:flutter/material.dart';

class JokeListing extends StatelessWidget {
  JokeListing({@required this.jokeSelectedCallback, this.selectedJoke});

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke selectedJoke;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => jokeSelectedCallback(joke),
            selected: selectedJoke == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5)
          ),
        );
      }).toList(),
    );
  }
}
