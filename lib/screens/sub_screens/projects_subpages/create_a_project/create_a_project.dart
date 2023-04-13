import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/buttons/solid_rounded_button.dart';

import '../../../../widgets/project_preview.dart';

class CreateAProject extends StatelessWidget {
  final projectFormPath;
  const CreateAProject(this.projectFormPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Creat a Project Demo'),
        ),
        body: Container(
            child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.asset("assets/images/19219.jpg"),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                  style: TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  "Anybody can create a project! Projects are a great way to connect with the people around you.")),
          Container(
              padding: EdgeInsets.only(top: 40),
              child: SolidRoundedButton("Start", path: projectFormPath))
        ])));
  }
}
