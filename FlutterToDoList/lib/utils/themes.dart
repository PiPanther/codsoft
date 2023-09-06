import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: black,
    primary: darkerGray,
    secondary: white,
  ),
  useMaterial3: true,
);

var lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: bgWhite,
    primary: white,
    secondary: black,
  ),
  useMaterial3: true,
);
