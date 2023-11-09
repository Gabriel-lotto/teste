import 'package:dartz/dartz.dart';
import 'package:prova/app/shared/errors/failure.dart';

abstract class ILoginDS {
  Future<Either<Failure, bool>> login(String user, String password);
}
