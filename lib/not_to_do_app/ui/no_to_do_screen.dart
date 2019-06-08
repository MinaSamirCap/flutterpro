import 'package:first_flutter_app/not_to_do_app/model/no_do_item.dart';
import 'package:first_flutter_app/not_to_do_app/util/database_helper.dart';
import 'package:flutter/material.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {
  var db = DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  @override
  void initState() {
    super.initState();
    _readItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
          tooltip: "add item",
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
          onPressed: _showFormDialog),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                reverse: false,
                itemCount: _itemList.length,
                itemBuilder: (_, int position) {
                  return Card(
                    color: Colors.white10,
                    elevation: 3,
                    child: ListTile(
                      title: _itemList[position],
                      onLongPress: () =>
                          _updateItem(_itemList[position], position),
                      trailing: Listener(
                        key: Key(_itemList[position].itemName),
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.redAccent,
                        ),
                        onPointerDown: (pointerEvent) => {deleteItem(position)},
                      ),
                    ),
                  );
                }),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }

  void _showFormDialog() {
    var _textController = TextEditingController();
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Item",
                  hintText: "eg. do not buy stuff",
                  icon: Icon(Icons.note_add)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _handleSubmit(_textController.text);
            _textController.clear();
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  void _handleSubmit(String text) async {
    NoDoItem item = NoDoItem(text, DateTime.now().toIso8601String());
    var res = await db.saveItem(item);
    print("SAVED ITEM ID: $res");

    NoDoItem addedItem = await db.getItem(res);
    setState(() {
      _itemList.insert(0, addedItem);
    });
  }

  _readItems() async {
    _itemList.clear();
    List items = await db.getItems();
    items.forEach((item) {
      //NoDoItem noDoItem = NoDoItem.map(item);
      //print(noDoItem.itemName);
      setState(() {
        _itemList.add(NoDoItem.map(item));
      });
    });
  }

  deleteItem(int position) async {
    var res = await db.deleteItem(_itemList[position].id);
    print("REVOMED: $res");
    _itemList.removeAt(position);
    setState(() {});
  }

  _updateItem(NoDoItem itemList, int position) {
    var _textController = TextEditingController();
    _textController.text = itemList.itemName;
    var alert = AlertDialog(
      title: Text("Update"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Item",
                  hintText: "eg. do not buy stuff",
                  icon: Icon(Icons.update)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            itemList.itemName = _textController.text;
            _handleUpdate(itemList, position);
            Navigator.pop(context);
          },
          child: Text("Update"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _handleUpdate(NoDoItem item, int position) async {
    var res = await db.updateItem(item);
    print("UPDATE ITEM ID: $res");

    _itemList.removeAt(position);

    setState(() {
      _readItems();
    });
  }
}
