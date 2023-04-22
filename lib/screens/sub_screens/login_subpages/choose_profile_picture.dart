import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:serve_to_be_free/models/user_class.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';

import 'package:serve_to_be_free/providers/user_provider.dart';

class ChooseProfilePicture extends StatefulWidget {
  const ChooseProfilePicture({Key? key}) : super(key: key);

  @override
  _ChooseProfilePictureState createState() => _ChooseProfilePictureState();

  // passed from the create account.
  static UserClass? _user;

  static UserClass? getUser() {
    return _user;
  }

  static void setUser(UserClass? user) {
    _user = user;
  }
}

class _ChooseProfilePictureState extends State<ChooseProfilePicture> {
  File? _image;
  String? errorText;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        errorText = null; // set errorText to null when _image is not null
      }
    });
  }

  Future<void> createUser(UserClass user) async {
    if (_image == null) {
      setState(() {
        errorText =
            'Error creating an account. Please select an image for your profile.';
      });
      return;
    }

    final url = Uri.parse('http://44.203.120.103:3000/users');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = null; // initialize to null
    // try {
    //   response = await http.post(
    //     url,
    //     headers: headers,
    //     body: jsonEncode(<String, dynamic>{
    //       'email': user.email,
    //       'password': user.password,
    //       'firstName': user.firstName,
    //       'lastName': user.lastName,
    //       'projects': user.projects,
    //       'bio': user.bio,
    //       'profilePictureUrl': user.profilePictureUrl,
    //       'coverPictureUrl': user.coverPictureUrl,
    //       'isLeader': user.isLeader,
    //       'friends':  user.friends,
    //       'friendRequests': user.friendRequests,
    //     }),
    //   );
    // } catch (e) {
    //   // handle error
    //   // Failure
    //   throw Exception('Failed to create user: $response');
    // }

    //   // Check if response is not null before using it
    //   if (response != null && response.statusCode == 201) {
    //     final res = json.decode(response.body);
    //     // Success

    //     print(res);
    //     Provider.of<UserClass>(context, listen: false).email = res['email'];
    //     Provider.of<UserClass>(context, listen: false).id = res['_id'];
    //     Provider.of<UserClass>(context, listen: false).firstName =
    //         res['firstName'];
    //     Provider.of<UserClass>(context, listen: false).lastName = res['lastName'];
    //     Provider.of<UserClass>(context, listen: false).profilePictureUrl =
    //         res['profilePictureUrl'];
    //     Provider.of<UserClass>(context, listen: false).bio = res['bio'];
    //     Provider.of<UserClass>(context, listen: false).coverPictureUrl =
    //         res['coverPictureUrl'];
    //     Provider.of<UserClass>(context, listen: false).isLeader = res['isLeader'];
    //     Provider.of<UserClass>(context, listen: false).password = res['password'];

    //     final userProvider = context.read<UserProvider>();

    //     await userProvider.uploadImageToS3(_image!, 'servetobefree-images',
    //         Provider.of<UserClass>(context).id, 'profilePicture');

    //     print('User created successfully');
    //     // context.go('/dashboard');
    //   } else {
    //     // ...
    //   }
  }

  Widget _buildCreateAccBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          UserClass? user = ChooseProfilePicture._user;
          if (user != null) {
            createUser(user);
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          backgroundColor: Color(0xff256C8D),
        ),
        child: Text(
          'Create Account',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 28, 72, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Choose Profile Picture',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Color.fromRGBO(0, 28, 72, 1.0),
                      ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tap to select a profile picture',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (errorText != null)
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                margin: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            _buildCreateAccBtn()
          ],
        ),
      ),
    );
  }
}
