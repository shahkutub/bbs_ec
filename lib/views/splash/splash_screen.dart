import 'package:bbs_ec/data/model/global.dart';
import 'package:bbs_ec/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';
import '../../controllers/auth_controller.dart';
import '../../database/database_helper.dart';
import '../../helper/common_method.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  @override
  void initState() {
    databaseHelper.database;
    // setState(() {

    // });
    Future.delayed(const Duration(seconds: 5), () async {
      if (Get.find<AuthController>().isLoggedIn) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => const SignInScreen());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Global.isIPad = width > 430;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFBEFDFF),
                      Color(0xFF51B9BD),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: const SizedBox.shrink(),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bdseal.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'গণপ্রজাতন্ত্রী বাংলাদেশ সরকার',
                    style: TextStyle(
                        fontSize: Global.isIPad ? 22 : 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'বাংলাদেশ পরিসংখ্যান ব্যুরো',
                    style: TextStyle(
                        fontSize: Global.isIPad ? 32 : 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'অর্থনৈতিক শুমারি ২০২৪ প্রকল্প',
                    style: TextStyle(
                        fontSize: Global.isIPad ? 40 : 34,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  JumpingDots(
                    color: Theme.of(context).primaryColor,
                    radius: 6,
                    numberOfDots: 4,
                    verticalOffset: -10,
                    animationDuration: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
