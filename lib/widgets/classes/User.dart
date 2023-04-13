// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class User {
//   int? userId;
//   int? id;
//   String name;
//   String? blurb;
//   File? profilePicture;
//   File? coverPhoto;
//   List projects;
//   List<String> tasks;
//   List posts;
//   List skills;
//   List hobbies;
//   List<XFile> photos;
//   MaterialAccentColor color;
//   bool isLeader;
//   String? gender;

//   User({
//     // Given a unique ID
//     this.userId,
//     this.id,
//     required this.name,
//     this.blurb,
//     this.profilePicture,
//     this.coverPhoto,
//     this.projects = const [],
//     this.tasks = const [],
//     this.posts = const [],
//     this.skills = const [],
//     this.hobbies = const [],
//     this.photos = const [],
//     this.color = Colors.amberAccent,
//     this.isLeader = false,
//     this.gender,
//   });
// }

import 'package:bson/bson.dart';

class User {
  ObjectId id;
  String name;
  List<ObjectId> projectIds;
  String bio;
  String profilePictureUrl;
  bool isLeader;
  List<ObjectId> postIds;

  User({
    required this.id,
    required this.name,
    required this.projectIds,
    required this.bio,
    required this.profilePictureUrl,
    required this.isLeader,
    required this.postIds,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<ObjectId> projectIds = [];
    for (var projectId in json['projectIds']) {
      projectIds.add(ObjectId.parse(projectId));
    }

    List<ObjectId> postIds = [];
    for (var postId in json['postIds']) {
      postIds.add(ObjectId.parse(postId));
    }

    return User(
      id: ObjectId.parse(json['_id']),
      name: json['name'],
      projectIds: projectIds,
      bio: json['bio'],
      profilePictureUrl: json['profilePictureUrl'],
      isLeader: json['isLeader'],
      postIds: postIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'projectIds': projectIds.map((id) => id.toHexString()).toList(),
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
      'isLeader': isLeader,
      'postIds': postIds.map((id) => id.toHexString()).toList(),
    };
  }
}
