import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prova/app/shared/errors/failure.dart';

abstract interface class ClientApi {
  /// Método que possibilita mockar os dados de retorno
  Future<Either<Failure, Response<T>>> mock<T extends dynamic>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
