import 'package:first_flutter_app/models/user.dart';
import 'package:first_flutter_app/utils/database_helper.dart';
import 'package:flutter/material.dart';

class DatabaseHome extends StatelessWidget {
  List _users;

  void provideDatabase() async {
    var db = DatabaseHelper();
    int savedUser = await db.saveUser(User("fasfos", "123"));
    print("SAVED: $savedUser");

    _users = await db.getAllUsers();
    for (var i = 0; i < _users.length; i++) {
      User user = User.map(_users[i]);
      print(_users[i]);
    }

    print("Count ${await db.getCount()}");

    //User mina = await db.getUser(1);
    //print("MINA: ${mina.username}, ${mina.password}");
    print("DELETED: ${await db.deleteUser(1)}");

    /// update user
    User fsfs = await db.getUser(7);
    fsfs.username = "updatedFsfs";
    print("UPDATED: ${await db.updateUser(fsfs)}");

    _users = await db.getAllUsers();
    for (var i = 0; i < _users.length; i++) {
      print(_users[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    provideDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
    );
  }
}
