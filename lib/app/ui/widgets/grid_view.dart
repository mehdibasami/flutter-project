import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:web_loader/app/controller/home.dart';
import 'package:web_loader/app/data/models/phone.dart';
import 'package:web_loader/app/static/break_point.dart';

class LoadMoreGridView extends StatelessWidget {
  const LoadMoreGridView({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LazyLoadScrollView(
        scrollOffset: 50,
        onEndOfPage: () => controller.fetchNextPage(),
        child: GridView.builder(
          controller: controller.scrollController,
          itemCount: controller.phones.length,
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: StaticBreakPoint.gridCount(context),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            PhoneModel phone = controller.phones[index];
            return Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ExtendedImage.network(
                            phone.thumbnail,
                            fit: BoxFit.fitHeight,
                            cache: true,
                            width: double.maxFinite,
                            clearMemoryCacheIfFailed: true,
                            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                            loadStateChanged: (state) {
                              if (state.extendedImageLoadState == LoadState.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                );
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Tooltip(
                        message: phone.name,
                        preferBelow: true,
                        margin: const EdgeInsets.all(8),
                        verticalOffset: 4,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.mobile_friendly_rounded,
                              size: 20,
                            ),
                            Expanded(
                              child: Text(
                                phone.name,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money_rounded,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          const Text('قیمت : '),
                          Expanded(
                            child: Text(
                              phone.price,
                              maxLines: 1,
                              style: Get.textTheme.subtitle2!.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
