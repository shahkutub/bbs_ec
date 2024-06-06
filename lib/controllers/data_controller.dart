import 'package:bbs_ec/data/model/store_request_data_model.dart';
import 'package:bbs_ec/data/repo/data_repo.dart';
import 'package:get/get.dart';

class DataController extends GetxController implements GetxService {
  DataRepo dataRepo;
  DataController({required this.dataRepo});

  List<StoreRequestDataModel> _dataList = [];
  List<StoreRequestDataModel> get dataList => _dataList;

  int _offlineDataCount = 0;
  int get offlineDataCount => _offlineDataCount;

  void storeData(StoreRequestDataModel srdm) async {
    final result = await dataRepo.storeDataToLocalServer(srdm);
    if (result) {
      Response serverResult = await dataRepo.storeDataToServer(srdm);
      if (serverResult.statusCode == 200) {
        if (serverResult.body['status'] == true) {
          srdm.server = true;
          srdm.id = serverResult.body['data']['id'];
          await dataRepo.storeDataToLocalServer(srdm);
          update();
          Get.back();
        }
      }
    }
  }

  void getDataList() {
    StoreLocalData storeLocalData = dataRepo.getDataFromLocalServer();
    _dataList = storeLocalData.data ?? [];
    update();
  }

  void getDataCount() {
    StoreLocalData storeLocalData = dataRepo.getDataFromLocalServer();
    _dataList = storeLocalData.data ?? [];
    _offlineDataCount = _dataList.length;
    update();
  }
}
