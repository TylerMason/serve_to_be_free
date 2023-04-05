import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String numMembers;
  final Map<String, dynamic> project;
  // final String thumbnailUrl;

  ProjectCard({
    required this.title,
    required this.numMembers,
    required this.project,
    // required this.thumbnailUrl,
  });

  // Named constructor that accepts a JSON object
  ProjectCard.fromJson(Map<String, dynamic> json)
      : title = json['name'],
        numMembers = json['members'].length.toString(),
        project = json;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 100.0,
        child: GestureDetector(
          onTap: () {
            // Do something when the container is clicked
            context.goNamed("projectdetails", params: {'id': project['_id']});
          },
          child: Card(
            color: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.4),
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('$numMembers Members'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
