import 'package:attendance_app/features/stores/data/model/paginate_stores_response.dart';
import 'package:attendance_app/features/stores/data/model/store.dart';
import 'package:attendance_app/features/stores/data/use_case/get_stores.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoreController extends GetxController{

  final GetStores _getStores;
  StoreController(this._getStores);

  static const _pageSize = 10;
  final PagingController<int, Store> pagingController = PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _getStoresByPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void _getStoresByPage(int pageKey) async {
    try {

      //add delay for show loading
      //attention:Remove in production
      await Future.delayed(const Duration(seconds: 3));


      //api call
      final response = await _getStores.call(pageKey);

      //convert to model object
      final items = PaginateStoresResponse.fromJson(response).data ?? [];

      final isLastPage = items.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }


}