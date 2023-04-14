import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

class ProjectPost extends StatefulWidget {
  final String name;
  final String postText;

  const ProjectPost({
    Key? key,
    required this.name,
    required this.postText,
  }) : super(key: key);

  @override
  State<ProjectPost> createState() => _ProjectPostState();
}

class _ProjectPostState extends State<ProjectPost> {
  // How are we going to tie this to different users?
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          //height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.only(),
                  child: ProfilePicture(Colors.deepOrangeAccent, 60, File(''))),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    // FINISH
                    Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "date/time",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        softWrap: true,
                        widget.postText,
                        style: TextStyle(),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            child: Icon(
                              Icons.thumb_up_rounded,
                              color: isLiked ? Colors.amberAccent : Colors.grey,
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                          Icon(
                            Icons.chat_bubble_rounded,
                            color: Colors.grey,
                            size: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Container(
                child: Icon(Icons.more_horiz),
              )
            ],
          ),
        ));
  }
}
