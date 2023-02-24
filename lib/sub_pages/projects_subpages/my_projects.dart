import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/main.dart';
import 'package:serve_to_be_free/widgets/project_preview.dart';

class MyProjects extends StatelessWidget {
  //List

  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Projects Demo'),
        ),
        body: Container(child: Text("My Projects") //ProjectPreview(),
            ));
  }
}
