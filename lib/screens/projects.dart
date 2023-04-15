import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/widgets/projects_appbar_display.dart';
import '../utilities/user_model.dart';
import '../widgets/buttons/wide_border_button.dart';
import '../widgets/sponsor_card.dart';
import '../widgets/my_project_card.dart';

class ProjectsPage extends StatefulWidget {
  final findProjectsPath;
  final createProjectsPath;
  final leadProjectsPath;
  final sponsorProjectsPath;
  final myProjectsPath;
  const ProjectsPage({
    Key? key,
    this.createProjectsPath,
    this.findProjectsPath,
    this.leadProjectsPath,
    this.sponsorProjectsPath,
    this.myProjectsPath,
  }) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<dynamic> projectData = [];

  Future<List<dynamic>> getProjects() async {
    var url = Uri.parse('http://44.203.120.103:3000/projects');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var myProjs = [];
      var counter = 0;
      while (counter < 2) {
        for (var proj in jsonResponse) {
          for (var member in proj['members']) {
            if (Provider.of<User>(context, listen: false).id == member) {
              myProjs.add(proj);
              counter++;
            }
          }
        }
        counter = 2;
      }
      return myProjs;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  void initState() {
    super.initState();
    getProjects().then((data) {
      setState(() {
        if (data.isEmpty) {
          // If no projects are found, update the state with an empty list
          projectData = [];
        } else {
          // Otherwise, update the state with the returned project data
          projectData = data;
        }
      });
    });
  }

  void findAPojectButton(
      /*int index or redirect to other page that grabs projects in area*/) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image:
  //                     AssetImage('assets/images/STBF_logo_horizontal_navy.jpg'),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),

  // decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter,
  //                   colors: <Color>[
  //                     Color.fromARGB(255, 54, 87, 197),
  //                     Color.fromARGB(255, 1, 64, 112)
  //                   ]),
  //             ),

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/19219.jpg"), context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(192.0),
          child: AppBar(
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
              padding: EdgeInsets.only(top: 55),
              // padding: EdgeInsets.only(bottom: 10)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/STBF_logo_horizontal_navy.jpg'),
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProjectAppbarDisplay(subject: "Members", value: "9,812"),
                      ProjectAppbarDisplay(subject: "Projects", value: "287"),
                      ProjectAppbarDisplay(subject: "Hours", value: "10,400"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              wideBorderButton(
                  "Find a Project",
                  Icon(
                    Icons.search,
                    color: Colors.indigo[900],
                    size: 28.0,
                  ),
                  widget.findProjectsPath),
              wideBorderButton(
                  "Create a Project",
                  Icon(
                    Icons.add_outlined,
                    color: Colors.blue[600],
                    size: 28.0,
                  ),
                  widget.createProjectsPath),
              wideBorderButton(
                  "Lead a Project",
                  Icon(
                    Icons.star_border_rounded,
                    color: Colors.amberAccent[400],
                    size: 28.0,
                  ),
                  widget.leadProjectsPath),
              wideBorderButton(
                  "Sponsor a Project",
                  Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.pinkAccent[400],
                    size: 28.0,
                  ),
                  widget.sponsorProjectsPath),
              SponsorCard(),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Row(children: [
                  Text("My Projects",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      context.go(widget.myProjectsPath);
                    },
                    child: const Text('See all'),
                  ),
                ]),
              ),
              if (projectData.isNotEmpty)
                if (projectData.length == 1)
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyProjectCard(
                            projectName: projectData[0]['name'] ?? '',
                            id: projectData[0]['_id']),
                      ],
                    ),
                  )
                else
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyProjectCard(
                            projectName: projectData[0]['name'] ?? '',
                            id: projectData[0]['_id']),
                        MyProjectCard(
                            projectName: projectData[1]['name'] ?? '',
                            id: projectData[1]['_id'])
                      ],
                    ),
                  )
              else
                Center(
                  child: Text('Choose find a project to join!'),
                )

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Container(
              //     width: 200,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage('path/to/image.png'),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        )));

    //);
  }
}
