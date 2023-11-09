import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/app_module.dart';

import 'presenter/pages/home_page.dart';
import 'presenter/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.rightToLeft,
      child: (context) => const HomePage(),
    );
  }
}
