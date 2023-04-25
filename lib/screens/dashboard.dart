import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/widgets/dashboard_user_display.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';
import 'package:serve_to_be_free/widgets/ui/dashboard_post.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:serve_to_be_free/users/providers/user_provider.dart';

import '../users/providers/user_provider.dart';
import '../widgets/ui/my_scaffold.dart';
import '../widgets/ui/project_post.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final List<Widget> myWidgets = [
  DashboardPost(),
  DashboardPost(),
  DashboardPost(),
  DashboardPost(),
  DashboardPost(),
  DashboardPost(),
];

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> posts = [];

  Future<List<dynamic>> getPosts() async {
    var url = Uri.parse(
        'http://10.0.2.2:3000/users/${Provider.of<UserProvider>(context, listen: false).id}/myPosts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  void initState() {
    super.initState();
    getPosts().then((data) {
      setState(() {
        print("this is the new data $data");

        posts = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Dashboard'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 28, 72, 1.0),
                  Color.fromRGBO(35, 107, 140, 1.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          )),
      extendBody: false,
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 3.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    child: DashboardUserDisplay(
                      dimension: 80.0,
                      name: "Shannon",
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   width: 2, // Set the width of the divider
                  //   height: 100, // Set the height of the divider
                  //   color: Colors.grey,
                  // ),
                  Container(
                      child: Expanded(
                          child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // LIST OF USERS
                        DashboardUserDisplay(
                          dimension: 60.0,
                          name: "Stephanie",
                        ),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                      ],
                    ),
                  ))),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 28, 72, 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Inkwell
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.menu_open_rounded, color: Colors.white),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Friends",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Inkewell
                  Container(
                    padding: EdgeInsets.all(12),
                    color: Color.fromRGBO(35, 107, 140, 1.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                        Container(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () {
                              context.go('/dashboard/createapost');
                            },
                            child: Container(
                                child: Text(
                              "Create a Post",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: -.5),
                            ))),
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  // compute the index of the reversed list
                  return ProjectPost(
                    name: posts[index]['name'],
                    postText: posts[index]['text'],
                    profURL: posts[index]['imageUrl'] ?? '',
                  );
                  // return DashboardUserDisplay(
                  //     dimension: 60.0,
                  //     name: projectData['posts']?[index]['text']);
                },
              ),
            ),
          ),
          // Column(
          //   children: [
          //     DashboardPost(),
          //     DashboardPost(),
          //     DashboardPost(),
          //     DashboardPost(),
          //     DashboardPost(),
          //     DashboardPost(),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
