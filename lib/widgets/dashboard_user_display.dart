import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

class DashboardUserDisplay extends StatelessWidget {
  // for now
  final name;
  final dimension;
  const DashboardUserDisplay({super.key, this.dimension, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
            child: Column(children: [
      ProfilePicture(
        Colors.blueAccent,
        dimension,
        File(''),
        borderRadius: 7,
      ),
      Container(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: -1),
          ))
    ])));
  }
}
