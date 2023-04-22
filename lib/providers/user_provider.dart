import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:serve_to_be_free/models/user_class.dart';

class UserProvider extends ChangeNotifier {
  final String _baseUrl = 'http://yourserver.com/api/Users';

  String? id;
  String? email;
  String? firstName;
  String? lastName;

  void updateUser(String email, String firstName, String lastName) {
    firstName = firstName;
    lastName = lastName;
    email = email;

    notifyListeners();
  }

  Future<UserClass?> getUserByEmail(String email) async {
    final response = await http.get(Uri.parse('$_baseUrl?email=$email'));

    if (response.statusCode == 200) {
      final UserJson = jsonDecode(response.body);
      return UserClass.fromJson(UserJson);
    } else {
      throw Exception('Failed to get User');
    }
  }

  Future<void> uploadImageToS3(
      File imageFile, String bucketName, String userId, String imageFileName,
      {String region = 'us-east-1'}) async {
    final key = 'ServeToBeFree/ProfilePictures/$userId/$imageFileName';
    final url =
        'https://$bucketName.s3.amazonaws.com/$key'.replaceAll('+', '%20');
    final response = await http.put(Uri.parse(url),
        headers: {'Content-Type': 'image/jpeg'},
        body: await imageFile.readAsBytes());
    if (response.statusCode != 200) {
      throw Exception('Failed to upload image to S3');
    }
  }

  // add additional methods as needed
  // Future<void> updateUser(UserClass User) async {
  // var url = Uri.parse('https://example.com/api/Users/${User.id}');
  // var response = await http.put(url, body: User.toJson());
  // if (response.statusCode != 200) {
  //   throw Exception('Failed to update User');
  // }
  //   notifyListeners();
  // }
}
