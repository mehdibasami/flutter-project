import 'package:flutter/material.dart';
import 'package:web_loader/app/controller/home.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 64),
        const SizedBox(height: 8),
        const Text('اینترنت خود را چک کنید!'),
        ElevatedButton(
          onPressed: () => controller.reload(),
          child: const Text('تلاش دوباره'),
        )
      ],
    );
  }
}
