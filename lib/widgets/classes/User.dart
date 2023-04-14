import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class User {
  int? userId;
  int? id;
  String name;
  String? blurb;
  XFile? profilePicture;
  XFile? coverPhoto;
  List projects;
  List<String> tasks;
  List posts;
  List skills;
  List hobbies;
  List<XFile> photos;
  MaterialAccentColor color;
  bool isLeader;
  String? gender;

  User({
    // Given a unique ID
    this.userId,
    this.id,
    required this.name,
    this.blurb,
    this.profilePicture,
    this.coverPhoto,
    this.projects = const [],
    this.tasks = const [],
    this.posts = const [],
    this.skills = const [],
    this.hobbies = const [],
    this.photos = const [],
    this.color = Colors.amberAccent,
    this.isLeader = false,
    this.gender,
  });
}
