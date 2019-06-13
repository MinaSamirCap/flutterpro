import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

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
  var _imgUrl = "";

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
              onPressed: () => gSignin(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Sign in with mail"),
              color: Colors.greenAccent,
              onPressed: () => singinFirebase(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Create account"),
              color: Colors.amberAccent,
              onPressed: () => _createUser(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("sign out"),
              color: Colors.deepPurpleAccent,
              onPressed: () => _logout(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              getImageUrl() /*"http://imamedicalgroup.com/wp-content/uploads/2017/05/IMA-MEDICAL-GROUP-LOGO-COLOR.jpg"*/,
              height: 120,
              width: 120,
              scale: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Future<FirebaseUser> gSignin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //print("TOKEN: ${googleAuth.accessToken}, ID:${googleAuth.idToken}");

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    print("signed in Profile Photo" + user.photoUrl);
    print("signed in " + user.toString());
    setState(() {
      _imgUrl = user.photoUrl;
    });
    return user;
  }

  Future _createUser() async {
    FirebaseUser user = await _auth
        .createUserWithEmailAndPassword(
            email: "mina.samir@gmail.com", password: "test1234")
        .then((user) {
      print("USER: ${user.displayName}");
      print("Email: ${user.email}");
    });
  }

  String getImageUrl() {
    return (_imgUrl.isNotEmpty)
        ? _imgUrl
        : "http://imamedicalgroup.com/wp-content/uploads/2017/05/IMA-MEDICAL-GROUP-LOGO-COLOR.jpg";
  }

  _logout() {
    setState(() {
      _imgUrl == "";
      _googleSignIn.signOut();

    });
  }

  Future<FirebaseUser> singinFirebase() {
    _auth.signInWithEmailAndPassword(email: "mina.samir@gmail.com", password: "test1234").then((user){
      print(user.email);
    });
  }
}
