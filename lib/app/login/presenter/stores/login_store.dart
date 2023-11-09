import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova/app/shared/errors/failure.dart';
import 'package:prova/app/shared/utils/modal_bottom_sheet.dart';

import '../../domain/usecases/login.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  LoginStoreBase(this._login);

  //***************************** Final variables *****************************//

  final Login _login;

  final TextEditingController userController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //******************************* Observables *******************************//

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool buttonState = false;

  @observable
  String? userError;

  @observable
  String? passwordError;

  //***************************** Common variables *****************************//

  //********************************* Getters *********************************//

  //*************************** Computed properties ***************************//

  //********************************* Actions *********************************//

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<bool> login() async {
    loading = true;

    return await _login(
      userController.text,
      passwordController.text,
    ).then(
      (result) => result.fold(
        (l) {
          if (l.runtimeType == UnexpectedError) {
            ModalBottomSheets.showUnexpectedErrorBottomSheet();
          } else if (l.runtimeType == ConnectionError) {
            ModalBottomSheets.showConnectionErrorBottomSheet();
          }
          loading = false;
          return false;
        },
        (r) {
          loading = false;
          return r;
        },
      ),
    );
  }

  //******************************** Functions ********************************//

  String? validateString(String? value) {
    if (value != null && value.isEmpty) {
      buttonState = false;
    } else if (value!.contains('  ')) {
      return 'Campo não pode conter espaços seguidos';
    } else if (value.endsWith(' ')) {
      return 'Campo não pode terminar com espaço';
    } else {
      value = null;
    }

    return null;
  }

  void onChangeUser(String? value) {
    userError = null;

    if (value!.isNotEmpty && passwordController.text.isNotEmpty) {
      buttonState = true;
    }
    if (validateString(value) != null) {
      userError = validateString(value);
      buttonState = false;
    } else {
      userError = null;
    }
  }

  void onChangePassword(String? value) {
    passwordError = null;

    if (value!.isNotEmpty && userController.text.isNotEmpty) {
      buttonState = true;
    }

    if (validateString(value) != null) {
      passwordError = validateString(value);
      buttonState = false;
    } else if (value.length <= 2) {
      passwordError = 'Senha inválida';
      buttonState = false;
    } else {
      passwordError = null;
    }
  }
}
