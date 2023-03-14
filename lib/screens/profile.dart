import 'package:flutter/material.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';
import 'package:serve_to_be_free/widgets/ui/my_tab_bar.dart';

// class Profile extends StatelessWidget {
//   Profile({Key? key}) : super(key: key);

//   final TabController _tabController = TabController(length: 2, vsync: this);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/profile_background.jpeg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             width: double.infinity,
//             height: 220,
//           ),
//           Container(
//             transform: Matrix4.translationValues(0.0, -70.0, 0.0),
//             child: ProfilePicture(
//               Colors.pinkAccent,
//               120,
//               "assets/images/girl_fake.jpg",
//               borderRadius: 10,
//             ),
//           ),
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 2,
//                   child: Center(
//                     child: Text("Profile"),
//                   ),
//                   color: Colors.blue,
//                 ),
//                 TabBar(
//                   unselectedLabelColor: Colors.black,
//                   labelColor: Colors.red,
//                   tabs: [
//                     Tab(
//                       icon: Icon(Icons.people),
//                     ),
//                     Tab(
//                       icon: Icon(Icons.person),
//                     )
//                   ],
//                   //controller: _tabController,
//                   indicatorSize: TabBarIndicatorSize.tab,
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [Text('people'), Text('Person')],
//                     //controller: _tabController,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 220,
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -70.0, 0.0),
              child: ProfilePicture(
                Colors.pinkAccent,
                120,
                "assets/images/girl_fake.jpg",
                borderRadius: 10,
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  icon: Icon(Icons.people),
                ),
                Tab(
                  icon: Icon(Icons.person),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [Text('people'), Text('Person')],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
