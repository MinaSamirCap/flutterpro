import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
    );
  }
}
