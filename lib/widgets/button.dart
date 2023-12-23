import 'package:flutter/material.dart';

import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/config/fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const ButtonWidget({
    Key? key,
    required this.textButton,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: greenBlueColor,
            fixedSize: const Size(double.infinity, 41),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Text(
          textButton,
          style: mediumFont(
            whiteColor,
            14,
          ),
        ),
      ),
    );
  }
}
