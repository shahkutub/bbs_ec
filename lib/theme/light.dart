/* created by - Aqib
created at -26/09/23

updated by Aqib @ 26/09/23 4.34 (added scaffoldBackgroundColor)

This file has been created to manage and centralize the visual design and styling of the application. 
It helps in organizing and maintaining a consistent look and feel throughout the application
 */

import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Nikosh',
  primaryColor: const Color(0xff2d6951),
  primaryColorDark: const Color(0xff2d6951),
  disabledColor: const Color(0xFF7DAEB0),
  backgroundColor: const Color(0xFFF3F3F3),
  errorColor: const Color(0xFFFF3C11),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  brightness: Brightness.light,
  hintColor: const Color(0xFFBBBBBB),
  cardColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF428F92))),
  colorScheme: const ColorScheme.light(
      primary: Color(0xff2d6951), secondary: Color(0xff91f9d0)),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff2d6951),
      titleTextStyle: TextStyle(
          fontFamily: 'Nikosh',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.white)),
  // colorScheme: const ColorScheme.light(
  //         primary: Color(0xFF428F92), secondary: Color(0xFF00A1A1))
  //     .copyWith(background: const Color(0xFFF3F3F3))
  //     .copyWith(error: const Color(0xFFFF3C11)),
);
