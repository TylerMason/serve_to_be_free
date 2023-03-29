import 'dart:io';

import 'package:flutter/material.dart';
import 'package:serve_to_be_free/widgets/dashboard_user_display.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

import '../widgets/ui/my_scaffold.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
      body: Container(
        child: Column(children: [
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
                          name: "Stephanieson",
                        ),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                        DashboardUserDisplay(
                            dimension: 60.0, name: "Stephanie"),
                      ],
                    ),
                  )))
                ]),
          ),
          Container(
            height: 50,
            color: Color.fromRGBO(0, 28, 72, 1.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        Text(
                          "Create a Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: -.5),
                        ),
                      ],
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
