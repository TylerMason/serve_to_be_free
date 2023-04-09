import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/widgets/projects_appbar_display.dart';
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
            padding: EdgeInsets.only(top: 60),
            // padding: EdgeInsets.only(bottom: 10)
            child: SingleChildScrollView(
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
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [MyProjectCard(), MyProjectCard()],
                  )),
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
        ),
      ),
    );
  }
}
