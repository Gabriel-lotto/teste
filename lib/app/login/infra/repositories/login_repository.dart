import 'package:dartz/dartz.dart';
import 'package:prova/app/shared/errors/failure.dart';

import '../../domain/repositories/i_login_repository.dart';
import '../data_source/i_login_ds.dart';

class LoginRepository extends ILoginRepository {
  final ILoginDS _ds;

  LoginRepository(this._ds);

  @override
  Future<Either<Failure, bool>> login(String user, String password) async {
    try {
      var result = await _ds.login(user, password);
      return result;
    } on Failure catch (e) {
      return Left(e);
    } on Exception {
      return Left(UnexpectedError());
    }
  }
}
