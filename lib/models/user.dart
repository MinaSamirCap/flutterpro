class User {
  String _username;
  String _password;
  int _id;

  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
    this._id = obj["id"];
  }

  int get id => _id;
  String get password => _password;
  String get username => _username;

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map["username"] = this._username;
    map["password"] = this._password;

    if (this._id != null) map["id"] = _id;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._username = map["username"];
    this._password = map["password"];
    this._id = map["id"];
  }
}
