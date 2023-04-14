import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/classes/User.dart';

class ChooseProfilePicture extends StatefulWidget {
  final User user;

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
