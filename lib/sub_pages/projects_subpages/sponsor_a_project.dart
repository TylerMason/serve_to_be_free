import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/project_preview.dart';

class SponsorAProject extends StatelessWidget {
  const SponsorAProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sponsor A Projects Demo'),
        ),
        body: Container(child: Text("Sponsor a project") //ProjectPreview(),
            ));
  }
}
