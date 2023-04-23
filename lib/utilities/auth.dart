import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../users/providers/user_provider.dart';
import 'package:serve_to_be_free/users/models/user_class.dart';

/// Hashes a password using the SHA256 algorithm.
String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

/// Verifies that a password matches a hash.
bool verifyPassword(String password, String hash) {
  var hashedPassword = hashPassword(password);
  return hash == hashedPassword;
}

/// Authenticates a user with the given email and password.
///
/// Returns the authenticated user object, or null if authentication fails.
Future<UserClass?> authenticateUser(String email, String password) async {
  final userProvider = UserProvider();
  final user = await userProvider.getUserByEmail(email);
  if (user != null) {
    if (verifyPassword(password, user.password)) {
      return user;
    }
  }

  return null;
}