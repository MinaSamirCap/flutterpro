import 'package:flutter/material.dart';

class NoDoItem extends StatelessWidget {
  String _itemName;
  String _dateCreated;
  int _id;

  NoDoItem(this._itemName, this._dateCreated);

  set itemName(String value) {
    _itemName = value;
  }

  String get itemName => _itemName;

  String get dateCreated => _dateCreated;

  int get id => _id;

  NoDoItem.map(dynamic obj) {
    this._itemName = obj["itemName"];
    this._dateCreated = obj["dateCreated"];
    this._id = obj["id"];
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map["itemName"] = this._itemName;
    map["dateCreated"] = this._dateCreated;
    if (_id != null) map["id"] = this._id;
    return map;
  }

  NoDoItem.fromMap(Map<String, dynamic> map) {
    this._itemName = map["itemName"];
    this._dateCreated = map["dateCreated"];
    this._id = map["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _itemName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                child: Text(
                  "Created At: $_dateCreated",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.5,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
