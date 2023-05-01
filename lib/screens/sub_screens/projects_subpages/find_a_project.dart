import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/data/projects/project_handlers.dart';

import '../../../widgets/find_project_card.dart';

class FindAProject extends StatefulWidget {
  const FindAProject({super.key});

  @override
  State<FindAProject> createState() => _FindAProjectState();
}

class _FindAProjectState extends State<FindAProject> {
  late Future<List<dynamic>> _futureProjects;

  @override
  void initState() {
    super.initState();
    _futureProjects = ProjectHandlers.getProjectsIncomplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Find a Project'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 28, 72, 1.0),
                  Color.fromRGBO(35, 107, 140, 1.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          )),
      body: FutureBuilder<List<dynamic>>(
        future: _futureProjects,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic>? projects = snapshot.data;
            return ListView.builder(
              itemCount: projects!.length,
              itemBuilder: (context, index) {
                return ProjectCard.fromJson(projects[index]);
                //print(ProjectCard.fromJson(projects[index]));
                // print(projects[index]['members'].length.toString());
                // return ProjectCard(
                //   title: projects[index]['name'],
                //   numMembers: projects[index]['members'].length.toString(),
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

  // Future<List<dynamic>> getProjects() async {
  //   var url = Uri.parse('http://44.203.120.103:3000/projects');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     // print(jsonResponse);
  //     return jsonResponse;
  //   } else {
  //     throw Exception('Failed to load projects');
  //   }
  // }
}
