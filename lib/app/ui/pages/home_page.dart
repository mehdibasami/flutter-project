import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_loader/app/controller/home.dart';
import 'package:web_loader/app/enums/api_status.dart';
import 'package:web_loader/app/ui/widgets/appbar.dart';
import 'package:web_loader/app/ui/widgets/custom_error.dart';
import 'package:web_loader/app/ui/widgets/grid_view.dart';
import 'package:web_loader/app/ui/widgets/load_more.dart';
import 'package:web_loader/app/ui/widgets/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetBuilder<HomeController>(
        builder: (_) {
          if (_.status.value == ApiStatus.loading && _.page.value == 1) {
            return const LoadingWidget();
          }
          if (_.status.value == ApiStatus.error && _.page.value == 1) {
            return CustomErrorWidget(controller: _);
          }
          return Column(
            children: [LoadMoreGridView(controller: _), LoadMoreWidget(controller: _)],
          );
        },
      ),
    );
  }
}
