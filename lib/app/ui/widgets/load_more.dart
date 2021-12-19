import 'package:flutter/material.dart';
import 'package:web_loader/app/controller/home.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: controller.isMoreLoadnig.value ? 56 : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: controller.isMoreLoadnig.value ? 1 : 1,
            duration: const Duration(milliseconds: 100),
            child: const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
