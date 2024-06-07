import 'package:bbs_ec/data/repo/data_repo.dart';
import 'package:bbs_ec/database/database_helper.dart';
import 'package:bbs_ec/database/info_data_table.dart';
import 'package:bbs_ec/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController implements GetxService {
  DataRepo dataRepo;
  DataController({required this.dataRepo});

  List<InfoData> _dataList = [];
  List<InfoData> get dataList => _dataList;

  void storeData(InfoData srdm) async {
    final result = await dataRepo.storeInfoDataToDB(srdm);
    if (result) {
      storeInfoData(
        srdm,
        () {
          Get.back();
        },
      );
    }
  }

  void storeInfoData(InfoData data, VoidCallback onComplete) async {
    Response serverResult = await dataRepo.storeDataToServer(data);
    if (serverResult.statusCode == 200) {
      if (serverResult.body['status'] == true) {
        InfoData infoData = InfoData.fromJson(serverResult.body['data']);
        await dataRepo.updateServerStatusInDB(
            true, infoData.mobile!, infoData.email!);
        update();
        onComplete();
      } else if (serverResult.body['code'] == 401) {
        Get.offAll(() => const SignInScreen());
      }
    }
  }

  void syncInfoData() async {
    for (InfoData data in _dataList) {
      print(data.toJson());
      if ((data.server ?? false) == false) {
        storeInfoData(data, () {
          getInfoDataList();
        });
      }
    }
  }

  void getInfoDataList() async {
    _dataList = await DatabaseHelper.instance.getInfoDataList();
    update();
  }

  Future<int> getTotalDataCount() async {
    int totalDataCount = await dataRepo.getTotalDataCount();
    return totalDataCount;
  }

  Future<int> getOfflineDataCount() async {
    int offlineDataCount = await dataRepo.getOfflineDataCount();
    return offlineDataCount;
  }
}
