import 'package:dartz/dartz.dart';
import 'package:prova/app/shared/errors/failure.dart';

import '../repositories/i_login_repository.dart';

class Login {
  final ILoginRepository _repository;

  Login(this._repository);

  Future<Either<Failure, bool>> call(String user, String password) async {
    return await _repository.login(user, password);
  }
}
