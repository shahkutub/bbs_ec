import 'package:bbs_ec/controllers/data_controller.dart';
import 'package:bbs_ec/data/model/global.dart';
import 'package:bbs_ec/helper/common_method.dart';
import 'package:bbs_ec/views/entry_form/entry_form_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflineDataListScreen extends StatefulWidget {
  const OfflineDataListScreen({super.key});

  @override
  State<OfflineDataListScreen> createState() => _OfflineDataListScreenState();
}

class _OfflineDataListScreenState extends State<OfflineDataListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<DataController>().getOfflineInfoDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'অফলাইন উপাত্ত্ব সমূহ',
          style: TextStyle(fontSize: (Global.isIPad ? 30 : 24)),
        ),
      ),
      body: GetBuilder<DataController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'মোট উপাত্ত্ব: ${CommonMethods.englishToBanglaNumberConverter(controller.total.toString())}',
                        style: TextStyle(
                            fontSize: (Global.isIPad ? 28 : 18),
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        'অফলাইন উপাত্ত্ব: ${CommonMethods.englishToBanglaNumberConverter(controller.offline.toString())}',
                        style: TextStyle(
                            fontSize: (Global.isIPad ? 28 : 18),
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.offlineDataList.length,
                  itemBuilder: (context, index) {
                    final data = controller.offlineDataList[index];
                    return InkWell(
                      onTap: () {
                        Get.to(() => EntryFormEdit(data: data));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 3.0,
                        child: ListTile(
                          title: Text(
                            '${CommonMethods.englishToBanglaNumberConverter('${index + 1}')}. ${data.institutionName ?? ''}',
                            style: TextStyle(
                                fontSize: (Global.isIPad ? 28 : 18),
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            CommonMethods.englishToBanglaNumberConverter(
                                '      ${data.dateTime ?? ''}'),
                            style:
                                TextStyle(fontSize: (Global.isIPad ? 26 : 14)),
                          ),
                          trailing: Visibility(
                            visible: data.server ?? false,
                            child: Icon(
                              Icons.done,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.find<DataController>().syncInfoData();
          },
          backgroundColor: Theme.of(context).primaryColor,
          label: const Text(
            "সিঙ্ক করুন",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
