import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String? email;
  String? firstName;
  String? lastName;
  String? id;

  void updateUser(String email, String firstName, String lastName) {
    firstName = firstName;
    lastName = lastName;
    email = email;

    notifyListeners();
  }
}
