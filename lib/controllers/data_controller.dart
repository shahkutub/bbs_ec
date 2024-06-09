import 'package:bbs_ec/controllers/internet_controller.dart';
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

  List<InfoData> _offlineDataList = [];
  List<InfoData> get offlineDataList => _offlineDataList;

  int _total = 0;
  int get total => _total;

  int _offline = 0;
  int get offline => _offline;

  void storeData(InfoData srdm) async {
    final result = await dataRepo.storeInfoDataToDB(srdm);
    if (result) {
      if (Get.find<InternetController>().connectedToNet) {
        storeInfoData(
          srdm,
          () {},
        );
      }
      Get.back();
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
    for (InfoData data in _offlineDataList) {
      if ((data.server ?? false) == false) {
        storeInfoData(data, () {
          getOfflineInfoDataList();
        });
      }
    }
  }

  void getInfoDataList() async {
    _total = await dataRepo.getTotalDataCount();
    _offline = await dataRepo.getOfflineDataCount();
    _dataList = await DatabaseHelper.instance.getInfoDataList();
    update();
  }

  void getOfflineInfoDataList() async {
    _total = await dataRepo.getTotalDataCount();
    _offline = await dataRepo.getOfflineDataCount();
    _offlineDataList = await DatabaseHelper.instance.getOfflineInfoDataList();
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
