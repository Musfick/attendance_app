import 'package:attendance_app/core/network/dio_client.dart';
import 'package:attendance_app/features/stores/data/repository/store_repository.dart';
import 'package:attendance_app/features/stores/data/use_case/get_stores.dart';
import 'package:attendance_app/features/stores/ui/controller/store_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings{

  final DioClient _dioClient = DioClient.instance;

  @override
  void dependencies() {
    //Repository
    final storeRepo = StoreRepository(_dioClient);

    //Use Case
    final getStores = GetStores(storeRepo);

    Get.put(StoreController(getStores));
  }
}