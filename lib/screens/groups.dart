import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello! i am Groups!", style: TextStyle(fontSize: 20)),
    );
  }
}
