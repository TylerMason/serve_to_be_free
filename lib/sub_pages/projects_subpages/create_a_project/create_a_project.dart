import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../widgets/project_preview.dart';

class CreateAProject extends StatefulWidget {
  const CreateAProject({super.key});

  @override
  State<CreateAProject> createState() => _CreateAProjectState();
}

class _CreateAProjectState extends State<CreateAProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Creat a Project Demo'),
        ),
        body: Container(
            child: Column(children: [
          Container(
            child: Image.asset("assets/images/19219.jpg"),
          )
        ])));
  }
}
