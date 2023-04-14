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
  String email;
  String firstName;
  String lastName;
  List<ObjectId> projects;
  String bio;
  String profilePictureUrl;
  String coverPictureUrl;
  bool isLeader;
  List<ObjectId> posts;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.projects,
    required this.bio,
    required this.profilePictureUrl,
    required this.coverPictureUrl,
    required this.isLeader,
    required this.posts,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<ObjectId> projects = [];
    for (var projectId in json['projects']) {
      projects.add(ObjectId.parse(projectId));
    }

    List<ObjectId> postIds = [];
    for (var postId in json['postIds']) {
      postIds.add(ObjectId.parse(postId));
    }

    return User(
      id: ObjectId.parse(json['_id']),
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      projects: projects,
      bio: json['bio'],
      profilePictureUrl: json['profilePictureUrl'],
      coverPictureUrl: json['coverPictureUrl'],
      isLeader: json['isLeader'],
      posts: postIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'projects': projects.map((id) => id.toHexString()).toList(),
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
      'isLeader': isLeader,
      'postIds': posts.map((id) => id.toHexString()).toList(),
    };
  }
}

// password: { type: String, required: true },
//     email: { type: String, required: true },
//     firstName: { type: String, required: true },
//     lastName: { type: String, required: true },
//     projects: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Project' }],
//     friends: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],