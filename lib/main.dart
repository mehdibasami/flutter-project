import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'app/data/services/loading_remover.dart';

void main() {
  //
  if (kIsWeb) {
    setPathUrlStrategy();
    LoadingRemoverService.remove(name: '.lds-roller');
  }

  //
  runApp(const App());
}
