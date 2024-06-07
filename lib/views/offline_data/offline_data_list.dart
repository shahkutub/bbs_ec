import 'package:bbs_ec/controllers/data_controller.dart';
import 'package:bbs_ec/data/model/global.dart';
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
    Get.find<DataController>().getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'অফলাইন উপাত্ত্ব সমূহ',
          style: TextStyle(fontSize: (Global.isIPad ? 30 : 16)),
        ),
      ),
      body: GetBuilder<DataController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, index) {
              final data = controller.dataList[index];
              return InkWell(
                onTap: (){
                  Get.to(() =>  EntryFormEdit(data:data));
                },
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 3.0,
                  child: ListTile(
                    title: Text(
                      '${index + 1}. ${data.institutionName ?? ''}',
                      style: TextStyle(
                          fontSize: (Global.isIPad ? 28 : 18),
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                      '      ${data.dateTime ?? ''}',
                      style: TextStyle(fontSize: (Global.isIPad ? 22 : 14)),
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
          );
        },
      ),
    );
  }
}
