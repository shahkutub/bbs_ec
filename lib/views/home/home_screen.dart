import 'package:bbs_ec/data/model/global.dart';
import 'package:bbs_ec/views/custom/scroll_behavior.dart';
import 'package:bbs_ec/views/home/widgets/custom_header_text.dart';
import 'package:bbs_ec/views/home/widgets/custom_menu_button.dart';
import 'package:bbs_ec/views/offline_data/offline_data_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIPad = true;

  @override
  void initState() {
    super.initState();
    isIPad = Global.isIPad;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double btnWidth = width / 3 - 24;
    double btnHeight = btnWidth * 1.2;

    // double addWidth = isIPad ? (btnWidth / 1.9) : (btnWidth / 1.7);
    // double reduceHeight = isIPad ? 50 : 0;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ListBehavior(),
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: isIPad ? 200 : 120,
            width: isIPad ? 200 : 120,
            child: Image.asset('assets/bdseal.png'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: CustomHeaderText(
              title: 'গণপ্রজাতন্ত্রী বাংলাদেশ সরকার',
              fontSize: isIPad ? 34 : 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: CustomHeaderText(
              title: 'বাংলাদেশ পরিসংখ্যান ব্যুরো',
              fontSize: isIPad ? 42 : 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
            child: CustomHeaderText(
              title: 'অর্থনৈতিক শুমারি ২০২৩ প্রকল্প',
              fontSize: isIPad ? 48 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Row(
              children: [
                CustomMenuButton(
                  btnWidth: btnWidth,
                  btnHeight: btnHeight,
                  counter: '123',
                  title: 'সর্বমোট জমা \nদেওয়া উপাত্ত্ব',
                  isIPad: isIPad,
                  onTap: () {},
                ),
                CustomMenuButton(
                  btnWidth: btnWidth,
                  btnHeight: btnHeight,
                  counter: '23',
                  isIPad: isIPad,
                  title: 'অফলাইনে জমা\nদেওয়া উপাত্ত্ব',
                  onTap: () {
                    Get.to(() => const OfflineDataListScreen());
                  },
                ),
                CustomMenuButton(
                  btnWidth: btnWidth,
                  btnHeight: btnHeight,
                  isIPad: isIPad,
                  title: 'নতুন উপাত্ত্ব\nসংযোজন',
                  onTap: () {},
                )
                /*Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: btnWidth,
                  height: btnWidth * 1.6 - reduceHeight,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: btnWidth,
                      height: btnHeight - reduceHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8CC63F),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: isIPad ? 160 : 44,
                            width: isIPad ? 160 : 44,
                            child: Text('12'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'পেন্ডিং রিপোর্ট',
                                style: TextStyle(
                                    fontFamily: 'Nikosh',
                                    fontSize: isIPad ? 36 : 18,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  width: btnWidth,
                  height: btnWidth * 1.6 - reduceHeight,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: btnWidth,
                      height: btnHeight - reduceHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8981C),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: isIPad ? 160 : 44,
                            width: isIPad ? 160 : 44,
                            child: Text('12'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 5),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'অ্যাসাইনকৃত\nরিপোর্ট',
                                style: TextStyle(
                                    fontFamily: 'Nikosh',
                                    fontSize: isIPad ? 36 : 18,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    width: btnWidth,
                    height: btnWidth * 1.6 - reduceHeight,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: btnWidth,
                        height: btnHeight - reduceHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFF92278F),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              height: isIPad ? 160 : 44,
                              width: isIPad ? 160 : 44,
                              child: Text('12'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 5),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  'সর্বশেষ জমা\nদেওয়া রিপোর্ট',
                                  style: TextStyle(
                                      fontFamily: 'Nikosh',
                                      fontSize: isIPad ? 36 : 18,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),),*/
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
