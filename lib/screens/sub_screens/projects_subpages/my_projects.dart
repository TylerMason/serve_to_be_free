import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:serve_to_be_free/data/users/models/user_class.dart';
import '../../../widgets/find_project_card.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  late Future<List<dynamic>> _futureProjects;
  @override
  void initState() {
    super.initState();
    _futureProjects = getMyProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureProjects,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic>? projects = snapshot.data;
            return ListView.builder(
              itemCount: projects!.length,
              itemBuilder: (context, index) {
                return ProjectCard.fromJson(projects[index]);
                // print(projects[index]['members'].length.toString());
                // return ProjectCard(
                //   title: projects[index]['name'],
                //   num_members: projects[index]['members'].length.toString(),
                // );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Failed to load projects."),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> getMyProjects() async {
    var url = Uri.parse('http://44.203.120.103:3000/projects');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var myprojs = [];
      for (var proj in jsonResponse) {
        for (var member in proj['members']) {
          if (member == Provider.of<UserClass>(context, listen: false).id) {
            myprojs.add(proj);
          }
        }
      }
      // print(jsonResponse);
      return myprojs;
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
