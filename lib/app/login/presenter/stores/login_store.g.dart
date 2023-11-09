// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$passwordVisibleAtom =
      Atom(name: 'LoginStoreBase.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'LoginStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$buttonStateAtom =
      Atom(name: 'LoginStoreBase.buttonState', context: context);

  @override
  bool get buttonState {
    _$buttonStateAtom.reportRead();
    return super.buttonState;
  }

  @override
  set buttonState(bool value) {
    _$buttonStateAtom.reportWrite(value, super.buttonState, () {
      super.buttonState = value;
    });
  }

  late final _$userErrorAtom =
      Atom(name: 'LoginStoreBase.userError', context: context);

  @override
  String? get userError {
    _$userErrorAtom.reportRead();
    return super.userError;
  }

  @override
  set userError(String? value) {
    _$userErrorAtom.reportWrite(value, super.userError, () {
      super.userError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: 'LoginStoreBase.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginStoreBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordVisible: ${passwordVisible},
loading: ${loading},
buttonState: ${buttonState},
userError: ${userError},
passwordError: ${passwordError}
    ''';
  }
}
