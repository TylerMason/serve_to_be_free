import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyProjectCard extends StatelessWidget {
  const MyProjectCard({super.key});

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
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        child: Container(
          height: 100,
          child: Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Container(
                  width: 70,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/project_example_1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Container(
              //     //margin: EdgeInsets.all(20),
              //     height: 100,
              //     width: 70,
              //     child: Container(
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image:
              //               AssetImage('assets/images/project_example_1.jpeg'),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     )),
              Container(
                margin: EdgeInsets.all(20),
                child: Text("data"),
              )
            ],
          )),
        ));
  }
}
