import 'package:attendance_app/features/stores/data/repository/store_repository.dart';

class GetStores {
  final StoreRepository _storeRepository;
  GetStores(this._storeRepository);

  Future<dynamic> call(int page){
    return _storeRepository.getStores(page);
  }
}