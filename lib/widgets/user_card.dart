import 'package:flutter/material.dart';

import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/config/fonts.dart';
import 'package:suitmedia_test/models/user.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel userModel;
  final Function(String) onCallback;
  const UserCardWidget({
    Key? key,
    required this.userModel,
    required this.onCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //full name of the user
    String fullname = "${userModel.firstName} ${userModel.lastName}";
    return GestureDetector(
      onTap: () {
        onCallback(fullname);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userModel.avatar),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: mediumFont(blackColor, 16),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  userModel.email.toUpperCase(),
                  style: mediumFont(greyColor, 10),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
