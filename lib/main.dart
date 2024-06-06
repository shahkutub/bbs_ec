import 'package:bbs_ec/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'EC',
      theme: light,
      home: const HomeScreen(),
    );
  }
}
