import 'package:attendance_app/animation/fade_animation.dart';
import 'package:attendance_app/features/stores/data/model/store.dart';
import 'package:attendance_app/features/stores/ui/controller/store_controller.dart';
import 'package:attendance_app/features/stores/ui/single/single_store_screen.dart';
import 'package:attendance_app/widgets/custom_list_loading_widget.dart';
import 'package:attendance_app/widgets/custom_single_list_loading_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:attendance_app/utils/extensition.dart';
import 'package:attendance_app/widgets/custom_error_widget.dart';

class StoresScreen extends GetView<StoreController> {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(FluentIcons.filter_24_regular)),
        title: const Text("STORES"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(FluentIcons.search_24_regular))
        ],
      ),
      body: RefreshIndicator(
        child: PagedListView<int, Store>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Store>(
            firstPageErrorIndicatorBuilder: (context) =>
                CustomErrorWidget(
                  message: "${controller.pagingController.error}", onClick: () {
                  controller.pagingController.refresh();
                },),
            firstPageProgressIndicatorBuilder: (context) =>
            const CustomListLoadingWidget(),
            newPageProgressIndicatorBuilder: (context) =>
            const SingleListLoadingItem(),
            itemBuilder: (context, item, index) =>
                FadeAnimation(
                    delay: (1.0 + index) / 30,
                    child: ListTile(
                      onTap: () {
                        Get.to(() => SingleStoreScreen(store: item));
                      },
                      leading: Card(
                        elevation: 0,
                        color: colorScheme.surfaceVariant,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Icon(
                            FluentIcons.building_shop_16_filled,
                            size: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      title: Text(
                        "${item.name?.toCapitalized()}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            FluentIcons.location_12_filled,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: Text(
                                "${item.address?.toCapitalized()}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ))
                        ],
                      ),
                      trailing: const Icon(FluentIcons.more_vertical_32_filled),
                    )),
          ),
        ),
        onRefresh: () async {
          controller.pagingController.refresh();
        },
      ),
    );
  }
}
