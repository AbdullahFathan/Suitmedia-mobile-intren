import 'package:flutter/material.dart';

TextStyle regulerFont(
  Color color,
  double size,
) =>
    TextStyle(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: size,
    );

TextStyle mediumFont(
  Color color,
  double size,
) =>
    TextStyle(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: size,
    );

TextStyle semiBoldFont(
  Color color,
  double size,
) =>
    TextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: size,
    );
