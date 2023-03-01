import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/project_preview.dart';

class FindAProject extends StatefulWidget {
  const FindAProject({super.key});

  @override
  State<FindAProject> createState() => _FindAProjectState();
}

class _FindAProjectState extends State<FindAProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Find A Project Demo'),
        ),
        body: Container(child: Text("Find a project") //ProjectPreview(),
            ));
  }
}
