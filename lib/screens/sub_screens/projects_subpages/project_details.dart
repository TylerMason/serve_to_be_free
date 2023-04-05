import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProjectDetails extends StatefulWidget {
  final String? id;

  const ProjectDetails({Key? key, required this.id}) : super(key: key);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  Map<String, dynamic> projectData = {};

  Future<Map<String, dynamic>> getProjects() async {
    var url = Uri.parse('http://44.203.120.103:3000/projects/${widget.id}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  void initState() {
    super.initState();
    getProjects().then((data) {
      setState(() {
        projectData = data;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              projectData['name'] ?? '',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Number of Members: ${projectData['members']?.length ?? ''}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // navigate to about page
              },
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
