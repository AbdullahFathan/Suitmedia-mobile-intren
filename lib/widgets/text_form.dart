import 'package:flutter/material.dart';

import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/config/fonts.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const TextFormWidget({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 16,
            bottom: 16,
            top: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: mediumFont(hintColor, 16)),
    );
  }
}
