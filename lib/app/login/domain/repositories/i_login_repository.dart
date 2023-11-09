import 'package:dartz/dartz.dart';
import 'package:prova/app/shared/errors/failure.dart';

abstract class ILoginRepository {
  Future<Either<Failure, bool>> login(String user, String password);
}
