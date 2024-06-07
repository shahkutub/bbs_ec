import 'package:bbs_ec/data/model/store_request_data_model.dart';
import 'package:bbs_ec/data/repo/data_repo.dart';
import 'package:bbs_ec/database/database_helper.dart';
import 'package:bbs_ec/database/info_data_table.dart';
import 'package:get/get.dart';

class DataController extends GetxController implements GetxService {
  DataRepo dataRepo;
  DataController({required this.dataRepo});

  List<InfoData> _dataList = [];
  List<InfoData> get dataList => _dataList;

  int _offlineDataCount = 0;
  int get offlineDataCount => _offlineDataCount;

  void storeData(InfoData srdm) async {
    final result = await dataRepo.storeInfoDataToDB(srdm);
    if (result) {
      Response serverResult = await dataRepo.storeDataToServer(srdm);
      if (serverResult.statusCode == 200) {
        if (serverResult.body['status'] == true) {
          InfoData infoData = InfoData.fromJson(serverResult.body['data']);
          await dataRepo.updateServerStatusInDB(
              true, infoData.mobile!, infoData.email!);
          update();
          Get.back();
        }
      }
    }
  }

  void getInfoDataList() async {
    _dataList = await DatabaseHelper.instance.getInfoDataList();
    update();
  }

  void getDataList() {
    StoreLocalData storeLocalData = dataRepo.getDataFromLocalServer();
    // _dataList = storeLocalData.data ?? [];
    update();
  }

  void getDataCount() {
    StoreLocalData storeLocalData = dataRepo.getDataFromLocalServer();
    // _dataList = storeLocalData.data ?? [];
    _offlineDataCount = _dataList.length;
    update();
  }
}
