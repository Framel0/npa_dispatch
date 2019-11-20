import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.new_releases),
          title: Text("Newsletter"),
        ),
        Divider(
          thickness: 1.5,
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Email"),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
