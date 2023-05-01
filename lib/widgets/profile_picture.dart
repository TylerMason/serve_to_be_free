import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final MaterialAccentColor borderColor;
  final double dimension;
  final String url;
  final double borderRadius;
  final String userId;

  const ProfilePicture(
    this.borderColor,
    this.dimension,
    this.url,
    this.userId, {
    this.borderRadius = 10,
  });

  void _handleTap() {
    // Define your function logic here
    print('Profile picture tapped');
    // Add your desired functionality
    //ProfilePage()
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: dimension,
        height: dimension,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          child: FittedBox(
            child: Image.network(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
