import 'package:flutter/material.dart';
import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/config/fonts.dart';

PreferredSizeWidget appBarWidget(
  String titleText,
  BuildContext context, {
  String? result,
  Function(String)? onBackButtonPressed,
}) =>
    AppBar(
      backgroundColor: whiteColor,
      elevation: 0.5,
      centerTitle: true,
      title: Text(
        titleText,
        style: semiBoldFont(blackColor, 18),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context, result),
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: strongBlueColor,
        ),
      ),
    );
