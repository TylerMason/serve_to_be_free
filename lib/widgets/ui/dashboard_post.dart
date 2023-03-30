import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

class DashboardPost extends StatefulWidget {
  const DashboardPost({super.key});

  @override
  State<DashboardPost> createState() => _DashboardPostState();
}

class _DashboardPostState extends State<DashboardPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Container(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  child: ProfilePicture(Colors.deepOrangeAccent, 60,
                      File('/Users/tymason/Desktop/curious_lemur.jpeg'))),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    Container(child: Text("date")),
                    Container(
                      color: Colors.blue,
                      child: Text(
                        'aljhfalsjdhf',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_rounded,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.chat_bubble_rounded,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
