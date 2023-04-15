import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../widgets/classes/UserClass.dart';

class ChooseProfilePicture extends StatefulWidget {
  final UserClass user;

  const ChooseProfilePicture({Key? key, required this.user}) : super(key: key);

  @override
  _ChooseProfilePictureState createState() => _ChooseProfilePictureState();
}

class _ChooseProfilePictureState extends State<ChooseProfilePicture> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  Future<void> createUser(
    BuildContext context, {
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final url = Uri.parse('http://44.203.120.103:3000/users');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );
    //Check the response status code
    if (response.statusCode == 201) {
      // Success
      final res = json.decode(response.body);
      print(res);
      Provider.of<UserClass>(context, listen: false).email = res['email'];
      //Provider.of<UserClass>(context, listen: false).id = res['_id'];
      Provider.of<UserClass>(context, listen: false).firstName =
          res['firstName'];
      Provider.of<UserClass>(context, listen: false).lastName = res['lastName'];
      print('User created successfully');
      // context.go('/dashboard');
    } else {
      // Failure
      throw Exception('Failed to create user: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Profile Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image(image: FileImage(_image!)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Choose Image'),
            ),
          ],
        ),
      ),
    );
  }
}
