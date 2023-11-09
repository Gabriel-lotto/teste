import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:prova/app/login/infra/data_source/i_login_ds.dart';
import 'package:prova/app/shared/api/client/client_interface/i_client_api.dart';
import 'package:prova/app/shared/errors/failure.dart';

class LoginDS extends ILoginDS {
  final ClientApi _api;

  LoginDS(this._api);

  @override
  Future<Either<Failure, bool>> login(String user, String password) async {
    try {
      var adapter = Modular.get<DioAdapter>();
      Map<String, dynamic> userInfo = {
        "user": user,
        "password": password,
      };
      const url = 'backend/login';

      adapter.onPost(
        url,
        data: userInfo,
        (server) => server.reply(
          200,
          userInfo,
          delay: const Duration(seconds: 2),
        ),
      );
      var response = await _api.mock(url);

      return response.fold(
        (l) => throw l,
        (r) => const Right(true),
      );
    } on DioException catch (e) {
      switch (e.error.runtimeType) {
        case UnexpectedError:
          return left(
            UnexpectedError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
        case ConnectionError:
          return left(
            ConnectionError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
        default:
          return left(
            UnexpectedError(
              message: e.message.toString(),
              label: '',
              exception: e,
              stacktrace: e.stackTrace,
            ),
          );
      }
    }
  }
}
