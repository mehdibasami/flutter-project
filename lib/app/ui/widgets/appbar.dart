import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_loader/app/controller/home.dart';
import 'package:web_loader/app/enums/api_status.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      leading: const Icon(Icons.mobile_friendly_rounded),
      title: const Text('آخرین قیمت گوشی های موبایل'),
      titleSpacing: 0,
      actions: [
        Obx(
          () => Center(
            child: Visibility(
              visible: Get.find<HomeController>().status.value == ApiStatus.complete,
              child: IconButton(
                onPressed: () => Get.find<HomeController>().reload(),
                icon: const Icon(Icons.refresh_rounded),
                splashRadius: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Obx(
          () => Center(
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'صفحه : ' + Get.find<HomeController>().page.value.toString(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
