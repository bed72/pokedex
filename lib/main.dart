import 'package:flutter/material.dart';

import 'src/app_widget.dart';

import 'src/main/singletons/shared_singleton.dart';

void main() async {
  await _initializer();
  runApp(AppWidget());
}

Future<void> _initializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedSingleton.instance.init();
}
