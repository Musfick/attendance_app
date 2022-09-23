import 'package:attendance_app/core/network/dio_client.dart';
import 'package:attendance_app/features/stores/data/repository/store_interface.dart';

class StoreRepository extends IStoreInterface {
  final DioClient _client;
  StoreRepository(this._client);

  @override
  Future getStores(int page) {
    return _client.get("/api/stores?page=$page");
  }

}