import 'package:bson/bson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/screens/sub_screens/login_subpages/choose_profile_picture.dart';
import 'package:serve_to_be_free/utilities/auth.dart';
import 'package:serve_to_be_free/utilities/constants.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../users/providers/user_provider.dart';
import 'package:serve_to_be_free/users/models/user_class.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccountScreen> {
  bool? _rememberMe = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Widget _buildTF(String field, TextEditingController controller) {
    InputDecoration decoration = InputDecoration(
      border: InputBorder.none,
      hintText: ' Enter $field',
      hintStyle: kHintTextStyle,
    );

    if (field == 'Confirm Password') {
      decoration = decoration.copyWith(
        hintText: ' $field',
        hintStyle: kHintTextStyle,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$field',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: decoration,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => {tryCreate()},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          backgroundColor: Color(0xff256C8D),
        ),
        child: Text(
          'Choose Profile Picture',
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
      backgroundColor: Color(0xff001B48),
      appBar: AppBar(
        title: const Text('Create an Account'),
        flexibleSpace: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff001B48)),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'There\'s just a few things we need from you',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildTF('First Name', firstNameController),
                      SizedBox(height: 20.0),
                      _buildTF('Last Name', lastNameController),
                      SizedBox(height: 20.0),
                      _buildTF('Email', emailController),
                      SizedBox(height: 20.0),
                      _buildTF('Password', passwordController),
                      SizedBox(height: 20.0),
                      _buildTF('Confirm Password', confirmPasswordController),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildCreateAccBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Account not found"),
      content: Text("Username and Password did not match any results"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> tryCreate() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPass = confirmPasswordController.text;
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;

    try {
      if (password != confirmPass) {
        throw (Exception('Passwords must match'));
      }
      if (email == null || email.isEmpty) {
        throw (Exception('Please enter a valid email'));
      }
      if (password == null || password.isEmpty) {
        throw (Exception('Please enter a valid password'));
      }
      if (firstName == null ||
          firstName.isEmpty ||
          lastName == null ||
          lastName.isEmpty) {
        throw (Exception('Please enter a valid name'));
      }

      UserClass user = UserClass(
          email: email,
          password: hashPassword(password),
          firstName: firstName,
          lastName: lastName,
          projects: [],
          bio: '',
          profilePictureUrl: '',
          coverPictureUrl: '',
          isLeader: false,
          friends: [],
          friendRequests: [],
          posts: []);

      //print(user.toJson());

      ChooseProfilePicture.setUser(user);

      context.go(
        '/login/createaccountscreen/chooseprofilepicture',
      );
      // // If all inputs are valid, make the HTTP request
      // final url = Uri.parse('http://44.203.120.103:3000/users');
      // final headers = <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // };
      // final response = await http.post(
      //   url,
      //   headers: headers,
      //   body: jsonEncode(<String, String>{
      //     'email': email,
      //     'password': password,
      //     'firstName': firstName,
      //     'lastName': lastName,
      //   }),
      // );
      // //Check the response status code
      // if (response.statusCode == 201) {
      //   // Success
      //   final res = json.decode(response.body);
      //   print(res);
      //   Provider.of<User>(context, listen: false).email = res['email'];
      //   Provider.of<User>(context, listen: false).id = res['_id'];
      //   Provider.of<User>(context, listen: false).firstName = res['firstName'];
      //   Provider.of<User>(context, listen: false).lastName = res['lastName'];
      //   print('User created successfully');
      //   // context.go('/dashboard');
      // } else {
      //   // Failure
      //   throw Exception('Failed to create user: ${response.reasonPhrase}');
      // }
    } catch (err) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(err.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
