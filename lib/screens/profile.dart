import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serve_to_be_free/users/models/user_class.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<UserClass> fetchUser(String userId) async {
    final response =
        await http.get(Uri.parse('<YOUR_MONGODB_API_URL>/users/$userId'));

    if (response.statusCode == 200) {
      return UserClass.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data from MongoDB');
    }
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      Stack(
          //crossAxisAlignment: CrossAxisAlignment.center,

          alignment: Alignment.center,
          children: [
            Container(
              // This margin is just enough to show the profile picture. Not sure if this is going to be a permanent solution.
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 180,
            ),
            Positioned(
                top: 110,
                right: null,
                left: null,
                child: InkWell(
                  onTap: () => {print("Profilel pic tapped")},
                  child: Container(
                    //transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                    //margin: EdgeInsets.only(bottom: 50),
                    child: ProfilePicture(
                      Colors.pinkAccent,
                      120,
                      '',
                      borderRadius: 10,
                    ),
                  ),
                ))
          ]),
      Container(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Placeholder",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
            // Not sure if this is the best way to do it but we will see.
            SizedBox(
              width: 10,
            ),
            Text("Salt Lake City, UT", style: TextStyle(color: Colors.grey))
          ],
        ),
      ),
      Container(
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       //color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 2,
        //       blurRadius: 7,
        //       offset: Offset(0, 3),
        //     ),
        //   ],
        // ),
        child: TabBar(
          unselectedLabelColor: Colors.grey.withOpacity(1),
          labelColor: Colors.blue[900],
          tabs: [
            Tab(
              text: "Projects",
            ),
            Tab(
              text: "About Me",
            )
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      Expanded(
        child: TabBarView(
          children: [
            Container(
              color: Colors.redAccent,
            ),
            Container(
              color: Colors.greenAccent,
            ),
          ],
          controller: _tabController,
        ),
      ),
    ])));
  }
}
