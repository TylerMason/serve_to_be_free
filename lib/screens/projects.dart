import 'package:flutter/material.dart';
import './widgets/wideBorderButton.dart';
import './widgets/sponsorCard.dart';
import './widgets/projectCard.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
              findAPojectButton),
          wideBorderButton(
              "Create a Project",
              Icon(
                Icons.add_outlined,
                color: Colors.blue[600],
                size: 28.0,
              ),
              findAPojectButton),
          wideBorderButton(
              "Adopt a Project",
              Icon(
                Icons.favorite_border_rounded,
                color: Colors.pinkAccent[400],
                size: 28.0,
              ),
              findAPojectButton),
          wideBorderButton(
              "Lead a Project",
              Icon(
                Icons.star_border_rounded,
                color: Colors.amberAccent[400],
                size: 28.0,
              ),
              findAPojectButton),
          sponsorCard(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(children: [
              Text("My Projects",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('See all'),
              ),
            ]),
          ),
          Container(
              child: Row(
            children: [ProjectCard(), ProjectCard()],
          ))
        ],
      ),
    );
  }
}
