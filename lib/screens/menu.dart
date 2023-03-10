import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/buttons/menu_button.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                    ProfilePicture(Colors.amberAccent, 40,
                        "assets/images/curious_lemur.jpeg",
                        borderRadius: 2),
                    "My Profile"),
                // I really only added this container so I could add padding to the other icons and not the profile picture

                MenuButton(
                    Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.lightBlue[900],
                    ),
                    "My Account"),
                MenuButton(
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 25,
                      color: Colors.lightBlue[900],
                    ),
                    "Favorites"),
                MenuButton(
                    Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.lightBlue[900],
                    ),
                    "How It Works"),
                MenuButton(
                    Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.lightBlue[900],
                    ),
                    "About Server To Be Free"),
              ],
            )));
  }
}
