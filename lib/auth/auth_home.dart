import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthHome(),
    );
  }
}

class AuthHome extends StatefulWidget {
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Google Sign in"),
              color: Colors.redAccent,
              onPressed: ()=> gSignin(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Sign in with mail"),
              color: Colors.greenAccent,
              onPressed: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Create account"),
              color: Colors.amberAccent,
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }

  Future<FirebaseUser> gSignin()async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  }
}

