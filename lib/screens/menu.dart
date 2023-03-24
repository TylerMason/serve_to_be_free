import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serve_to_be_free/widgets/buttons/menu_button.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

class MenuPage extends StatelessWidget {
  final myProfilePath;
  final myAccountPath;
  //final String favoritesPath;
  final howItWorksPath;
  final aboutPath;

  // Is having the const here necessary? I feel it improves performance since we are not changing it after instantiation.
  const MenuPage({
    this.myProfilePath,
    this.myAccountPath,
    //required this.favoritesPath,
    this.howItWorksPath,
    this.aboutPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0), // Set the height of the AppBar
          child: AppBar(
            title: Text("SERVE TO BE FREE"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(255, 54, 87, 197),
                      Color.fromARGB(255, 1, 64, 112)
                    ]),
              ),
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10, right: 20),
            child: Column(
              children: [
                MenuButton(
                    ProfilePicture(Colors.amberAccent, 45,
                        XFile("assets/images/curious_lemur.jpeg"),
                        borderRadius: 7),
                    "My Profile",
                    myProfilePath),

                MenuButton(
                    Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.lightBlue[900],
                    ),
                    "My Account",
                    myAccountPath),
                // MenuButton(
                //     Icon(
                //       Icons.favorite_border_rounded,
                //       size: 25,
                //       color: Colors.lightBlue[900],
                //     ),
                //     "Favorites",
                //     "Path"),
                MenuButton(
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      size: 25,
                      color: Colors.lightBlue[900],
                    ),
                    "How It Works",
                    howItWorksPath),
                MenuButton(
                    Icon(
                      Icons.info_outline_rounded,
                      size: 25,
                      color: Colors.lightBlue[900],
                    ),
                    "About Serve To Be Free",
                    aboutPath),
              ],
            )));
  }
}
