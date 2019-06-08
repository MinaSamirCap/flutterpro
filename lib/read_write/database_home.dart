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
    //provideDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: view(),
    );
  }

  Widget view() {
    return FutureBuilder(
      future: getUsers(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot != null && snapshot.hasData) {
          /// if I want the list of users to provided in other places in application ..
          List users = snapshot.data;
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int position) {
                User user = User.map(users[position]);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      position == 0
                          ? Container()
                          : Divider(
                              height: 1,
                            ),
                      Card(
                        color: Colors.orange,
                        elevation: 3,
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                "${(user.id).toString()}",
                                style: TextStyle(color: Colors.white),
                              )),
                          title: Text(user.username),
                          subtitle: Text(user.password),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else {
          /*return (Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 35, color: Colors.black),
          )));*/
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List> getUsers() async {
    var db = await DatabaseHelper();
    return db.getAllUsers();
  }
}
