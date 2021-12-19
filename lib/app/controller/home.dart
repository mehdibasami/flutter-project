import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_loader/app/data/models/phone.dart';
import 'package:web_loader/app/data/providers/api.dart';
import 'package:web_loader/app/enums/api_status.dart';
import 'package:web_loader/app/static/urls.dart';

class HomeController extends GetxController {
  //
  RxInt page = 1.obs;
  RxInt currentPage = 1.obs;
  RxBool isMoreLoadnig = false.obs;
  Rx<ApiStatus> status = ApiStatus.loading.obs;
  RxList<PhoneModel> phones = <PhoneModel>[].obs;
  ScrollController scrollController = ScrollController();
  //
  Future<List<PhoneModel>> fetch(int page) async {
    List<PhoneModel> list = <PhoneModel>[];
    try {
      status(ApiStatus.loading);
      update();
      final response = await ApiProvider().get('${StaticUrls.baseUrl}$page');
      if (response.statusCode == 200) {
        list = (response.data as List).map((phone) => PhoneModel.fromJson(phone)).toList();
        list.removeLast();
        list.removeLast();
        phones.addAll(list);
        status(ApiStatus.complete);
        if (page > 1) {
          currentPage++;
        }
        update();
      }
    } catch (e) {
      log(e.toString());
      status(ApiStatus.error);
      update();
    }
    return list;
  }

  //
  void fetchNextPage() async {
    // if (status.value != ApiStatus.error) {
    isMoreLoadnig(true);
    page++;
    log(page.value.toString());
    update();
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    await fetch(page.value);
    isMoreLoadnig(false);
    update();
    // }
  }

  //
  void reload() async {
    page(1);
    isMoreLoadnig(false);
    update();
    fetch(page.value);
  }

  //
  @override
  void onInit() {
    super.onInit();
    fetch(1);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
