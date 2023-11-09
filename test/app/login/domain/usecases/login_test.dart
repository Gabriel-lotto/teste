import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/app/login/domain/usecases/login.dart';
import 'package:prova/app/login/infra/data_source/i_login_ds.dart';
import 'package:prova/app/login/infra/repositories/login_repository.dart';
import 'package:prova/app/shared/errors/failure.dart';

class MockDS extends Mock implements ILoginDS {}

void main() {
  final ds = MockDS();
  final rep = LoginRepository(ds);
  final usecase = Login(rep);

  group('login', () {
    test("Deve retornar true caso consiga fazer login", () async {
      when(() => ds.login('user123', 'senha123')).thenAnswer((_) async => const Right(true));
      var result = await usecase('user123', 'senha123');

      expect(result, const Right(true));
    });
    test("Deve retornar um Failure caso não consiga fazer login", () async {
      when(() => ds.login('', '')).thenAnswer((_) async => left(UnexpectedError()));
      var result = await usecase('', '');

      expect((result as Left<Failure, bool>).value, isA<UnexpectedError>());
    });
    test("Deve retornar um Failure do tipo ConnectionError caso não tenha acesso a internet", () async {
      when(() => ds.login('', '')).thenAnswer((_) async => left(ConnectionError()));
      var result = await usecase('', '');

      expect((result as Left<Failure, bool>).value, isA<ConnectionError>());
    });
  });
}
