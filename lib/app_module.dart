import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:prova/app/home/home_module.dart';
import 'package:prova/app/shared/api/interceptors/internet_connection.interceptor.dart';

import 'app/login/login.module.dart';
import 'app/shared/services/shared_preference_service/shared_preference_service.dart';
import 'app/shared/utils/response_log_improvement.dart';
import 'app/splash/view/splash_page.dart';

class AppModule extends Module {
  DioAdapter get _dioAdapter {
    final dioAdapter = DioAdapter(
      dio: Dio(),
      matcher: const UrlRequestMatcher(),
    );
    dioAdapter.dio.interceptors.add(DioLogger());
    dioAdapter.dio.interceptors.add(InternetConnectionInterceptor());
    return dioAdapter;
  }

  @override
  void exportedBinds(Injector i) {
    i.addInstance<DioAdapter>(_dioAdapter);
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton(SharedPreferenceService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
