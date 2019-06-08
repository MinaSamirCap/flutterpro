import 'package:flutter/material.dart';

import 'no_to_do_screen.dart';

class NoToDoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoToDo"),
        backgroundColor: Colors.black54,
      ),
      body: NoToDoScreen(),
    );
  }
}
