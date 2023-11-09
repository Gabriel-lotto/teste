import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/app/login/domain/repositories/i_login_repository.dart';
import 'package:prova/app/login/domain/usecases/login.dart';
import 'package:prova/app/login/external/data_source/login_ds.dart';
import 'package:prova/app/login/infra/data_source/i_login_ds.dart';
import 'package:prova/app/login/infra/repositories/login_repository.dart';
import 'package:prova/app/shared/api/client/client_interface/i_client_api.dart';
import 'package:prova/app_module.dart';

import '../shared/api/client/client_impl.dart/client_impl.dart';
import 'presenter/pages/login_page.dart';
import 'presenter/stores/login_store.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    // Store
    i.addLazySingleton(LoginStore.new);

    //Usecases
    i.addLazySingleton(Login.new);

    // Repository
    i.addLazySingleton<ILoginRepository>(LoginRepository.new);

    // External
    i.addLazySingleton<ILoginDS>(LoginDS.new);

    // Api
    i.add<ClientApi>(ClientApiImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
