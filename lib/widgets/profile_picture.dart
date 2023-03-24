import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  // possible function to be clicked and redirect to profile, but if not can maybe just pass "null"?

  // final VoidCallback selectHandler; redirect or null?
  // and an overlay icon for the person like the "M" title thing for project leaders?

  // possible passed in value here for making sure the border thickness is different dependent on size
  final MaterialAccentColor borderColor;
  final double dimension; // ?

  // This needs to be change
  final XFile image;
  final double borderRadius;

  File displayImage(XFile inputImage) {
    if (image != null) {
      var newImage = File(inputImage.path);
      return newImage;
    }
    return File('assets/images/shark_fake.jpeg');
  }

  // constructor
  const ProfilePicture(this.borderColor, this.dimension, this.image,
      {this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      clipBehavior: Clip.hardEdge,
      // This could be dynamic just in case because we dont want hard margins on this.
      // margin: EdgeInsets.all(10),
      // not sure why it was throwing an error but it works now.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 4),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        child: FittedBox(
          child: image != null
              ? Image.file(
                  displayImage(image),
                  fit: BoxFit.cover,
                )
              : Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey[500],
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
