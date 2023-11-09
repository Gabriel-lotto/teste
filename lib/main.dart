import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/app_config.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.navigatorKey = GlobalKey<NavigatorState>();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
