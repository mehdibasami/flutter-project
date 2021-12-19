import 'dart:developer';

import "package:universal_html/html.dart" as universal;

class LoadingRemoverService {
  /// Remove Loading Element After Loaded WebApp!
  static void remove({required String name}) {
    try {
      final loader = universal.querySelector(name);
      if (loader != null) {
        loader.children.clear();
        loader.remove();
        log('removed $name');
      }
    } catch (e) {
      log('Error :  \n$e');
    }
  }
}
