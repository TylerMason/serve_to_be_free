import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  /*
  This shouldnt change at all. Just displays... but it should be clickable? If
  we need to add clickability to a container then we should use Inkwell.
  */

  // going to take an image
  // going to take a sponsor logo image as well?
  // going to take a title
  // should be pointing at the main project page?

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
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
