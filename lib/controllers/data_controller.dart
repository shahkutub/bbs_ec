import 'package:bbs_ec/data/repo/data_repo.dart';
import 'package:get/get.dart';

class DataController extends GetxController implements GetxService {
  DataRepo dataRepo;
  DataController({required this.dataRepo});
}
