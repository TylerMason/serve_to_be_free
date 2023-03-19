import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePicture extends StatelessWidget {
  // possible function to be clicked and redirect to profile, but if not can maybe just pass "null"?

  // final VoidCallback selectHandler; redirect or null?
  // and an overlay icon for the person like the "M" title thing for project leaders?

  // possible passed in value here for making sure the border thickness is different dependent on size
  final MaterialAccentColor borderColor;
  final double dimension; // ?
  final String imageString;
  final double borderRadius;

  // constructor
  const ProfilePicture(this.borderColor, this.dimension, this.imageString,
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
          child: Image.asset(imageString),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
