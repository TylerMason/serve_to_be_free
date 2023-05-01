import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:serve_to_be_free/data/users/models/user_class.dart';
import 'package:serve_to_be_free/utilities/s3_image_utility.dart';

class ProjectHandlers {
  //static const String _baseUrl = 'http://localhost:3000/projects';
  static const String _baseUrl = 'http://44.203.120.103:3000/projects';

  static Future<List<dynamic>> getProjects() async {
    var url = Uri.parse('http://44.203.120.103:3000/projects');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  static Future<List<dynamic>> getProjectsIncomplete() async {
    var url = Uri.parse('$_baseUrl/incomplete'); // Use the new endpoint
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
