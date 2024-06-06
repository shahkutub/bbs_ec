import 'package:bbs_ec/data/model/global.dart';
import 'package:flutter/material.dart';

class OfflineDataListScreen extends StatefulWidget {
  const OfflineDataListScreen({super.key});

  @override
  State<OfflineDataListScreen> createState() => _OfflineDataListScreenState();
}

class _OfflineDataListScreenState extends State<OfflineDataListScreen> {
  @override
  void initState() {
    super.initState();
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 2.0,
            child: ListTile(
              title: Text(
                'প্রতিষ্ঠানের নাম',
                style: TextStyle(
                    fontSize: (Global.isIPad ? 30 : 18),
                    color: Theme.of(context).primaryColor),
              ),
              trailing: Visibility(
                visible: true,
                child: Icon(
                  Icons.done,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
