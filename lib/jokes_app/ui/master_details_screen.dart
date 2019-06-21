import 'package:first_flutter_app/jokes_app/model/Joke.dart';
import 'package:flutter/material.dart';

import 'joke_details.dart';
import 'joke_listing.dart';

class MasterDetailsScreen extends StatefulWidget {
  @override
  _MasterDetailsScreenState createState() => _MasterDetailsScreenState();
}

class _MasterDetailsScreenState extends State<MasterDetailsScreen> {
  static const int tabletBreakPoint = 600;
  Joke _jokeSelected;

  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (jokeSelected) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext cotext) {
              return JokeDetails(
                joke: jokeSelected,
                inTabletLayout: false,
              );
            }));
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
              elevation: 13.0,
              child: JokeListing(
                jokeSelectedCallback: (joke) {
                  setState(() {
                    _jokeSelected = joke;
                  });
                },
                selectedJoke: _jokeSelected,
              )),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(inTabletLayout: true, joke: _jokeSelected),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery
        .of(context)
        .size
        .shortestSide;
    var orientation = MediaQuery
        .of(context)
        .orientation;

    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakPoint) {
      /// mobile view
      content = _buildMobileLayout();
    } else {
      /// tablet layout
      content = _buildTabletLayout();
    }


    return Scaffold(
      appBar: AppBar(
          title: Text("Jokes")),
      body: content,
    );
  }
}
