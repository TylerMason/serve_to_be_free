import 'package:flutter/material.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

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
              height: 220,
            ),
            Positioned(
              top: 150,
              right: null,
              left: null,
              child: Container(
                //transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                //margin: EdgeInsets.only(bottom: 50),
                child: ProfilePicture(
                  Colors.pinkAccent,
                  120,
                  "assets/images/girl_fake.jpg",
                  borderRadius: 10,
                ),
              ),
            )
          ]),
      Container(
        child: Text("Placeholder"),
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
