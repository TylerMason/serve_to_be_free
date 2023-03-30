import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    _futureProjects = getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find A Project'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureProjects,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic>? projects = snapshot.data;
            return ListView.builder(
              itemCount: projects!.length,
              itemBuilder: (context, index) {
                print(projects[index]);
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
              child: Text("No projects found."),
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

  Future<List<dynamic>> getProjects() async {
    var url = Uri.parse('http://10.0.2.2:3000/projects');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
