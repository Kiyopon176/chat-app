import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.lightGreen,
    tertiary: Color(0xffEDF2F6),
    onTertiary: Color(0xff9DB7CB),
  )
);
ThemeData darkmode = ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade400,
      secondary: Colors.purpleAccent.shade700,
      tertiary: Colors.black,
    )
);