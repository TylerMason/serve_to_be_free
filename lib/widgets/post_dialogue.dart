import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serve_to_be_free/utilities/user_model.dart';
import 'package:http/http.dart' as http;

class JoinProjectDialog extends StatefulWidget {
  final String projectId;

  JoinProjectDialog({required this.projectId});
  @override
  _JoinProjectDialogState createState() => _JoinProjectDialogState();
}

class _JoinProjectDialogState extends State<JoinProjectDialog> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: "Enter text to post"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            print(widget.projectId);
            final String text = _textController.text;
            if (text != '') {
              addPost(text);
            }
            Navigator.of(context).pop();

            // context.goNamed("projectdetails", params: {'id': widget.projectId});
          },
          child: Text("Post"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> addPost(text) async {
    final url = Uri.parse(
        'http://44.203.120.103:3000/projects/${widget.projectId}/post');

    final Map<String, dynamic> data = {
      'member': Provider.of<User>(context, listen: false).id,
      'name':
          "${Provider.of<User>(context, listen: false).firstName} ${Provider.of<User>(context, listen: false).lastName}",
      'text': text
    };
    print(data);
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print(response.toString());

    if (response.statusCode == 200) {
      // API call successful\
      // setState(() {
      //   projectData['members'] = projectData['members'] != null
      //       ? [...projectData['members'], data['memberId']]
      //       : [data['memberId']];
      // });
    } else {
      // API call unsuccessful
      print('Failed to fetch data');
    }
  }
}