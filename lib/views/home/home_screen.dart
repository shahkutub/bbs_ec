import 'package:bbs_ec/views/custom/scroll_behavior.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIPad = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double btnWidth = width / 3 - 24;
    double btnHeight = btnWidth * 1.2;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ListBehavior(),
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: isIPad ? 200 : 120,
            width: isIPad ? 200 : 120,
            child: Image.asset('assets/bdseal.jpg'),
          )
        ]),
      ),
    );
  }
}
