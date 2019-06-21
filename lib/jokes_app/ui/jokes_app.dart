import 'package:flutter/material.dart';

import 'master_details_screen.dart';

class JokesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jokes",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MasterDetailsScreen(),
    );
  }
}
