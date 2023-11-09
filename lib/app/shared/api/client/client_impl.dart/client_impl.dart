import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:prova/app/shared/errors/failure.dart';

import '../client_interface/i_client_api.dart';

class ClientApiImpl implements ClientApi {
  final DioAdapter _adapter;
  ClientApiImpl(this._adapter);

  @override
  Future<Either<Failure, Response<T>>> mock<T extends dynamic>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _adapter.dio
        .post<T>(url, data: data)
        .then<Either<Failure, Response<T>>>(right)
        .whenComplete(() => _adapter.reset());
  }
}
