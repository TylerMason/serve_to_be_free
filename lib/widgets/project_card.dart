import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  /*
  This shouldnt change at all. Just displays... but it should be clickable? If
  we need to add clickability to a container then we should use Inkwell?
  */

  /*
  So far this is only being used at the bottom of projects to display a small amount
  of projects that the user is currently part of. Possible WAS part of as well...
  or can display nothing if they are not part of any projects... (Conditional Rendering?)
  */

  // going to take an image?
  // going to take a sponsor logo image as well?
  // going to take a title?
  // should be pointing at the main project page... (ID?)?

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text("picture"),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text("data"),
              )
            ],
          )),
    );
  }
}
