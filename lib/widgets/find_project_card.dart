import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String numMembers;
  final Map<String, dynamic> project;
  final List<dynamic> sponsors;

  ProjectCard({
    required this.title,
    required this.numMembers,
    required this.project,
    required this.sponsors,
  });

  // Named constructor that accepts a JSON object
  ProjectCard.fromJson(Map<String, dynamic> json)
      : title = json['name'],
        numMembers = json['members'].length.toString(),
        sponsors = json['sponsors'],
        project = json;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 140.0,
        child: GestureDetector(
          onTap: () {
            print(project['projectPicture']);
            // Do something when the container is clicked
            context.pushNamed("projectdetails", params: {'id': project['_id']});
          },
          child: Card(
            color: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.4),
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                        if (project.containsKey('city'))
                          Text('${project['city']}, ${project['state']}'),
                        if (project.containsKey('date'))
                          Text('${project['date']}'),
                        SizedBox(height: 8.0),
                        Text('$numMembers Members'),
                      ],
                    ),
                    if (project.containsKey('projectPicture') &&
                        project['projectPicture'].isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          project['projectPicture'],
                          fit: BoxFit
                              .cover, // Adjust the image to fit the widget
                          width: 120, // Set the width of the widget
                          height: 120, // Set the height of the widget
                        ),
                      ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
