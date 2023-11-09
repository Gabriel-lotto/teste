import 'package:prova/app/shared/errors/failure.dart';

class InvalidUserOrPasswordError extends Failure {
  InvalidUserOrPasswordError({
    super.message = 'Invalid user or password',
    super.label = 'InvalidUsernameOrPasswordError',
    super.exception,
    super.stacktrace,
  });
}
