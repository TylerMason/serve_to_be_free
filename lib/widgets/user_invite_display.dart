import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serve_to_be_free/widgets/classes/User.dart';
import 'package:serve_to_be_free/widgets/profile_picture.dart';
import 'package:image_picker/image_picker.dart';

class UserInviteDisplay extends StatelessWidget {
  const UserInviteDisplay({
    super.key,
    required User user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          /*
        user.borderColor
        user.profileImage
        */

          Row(children: [
        ProfilePicture(
            Colors.pinkAccent, 10, XFile("assets/images/curious_lemur.jpeg"))
      ]),
    );
  }
}
