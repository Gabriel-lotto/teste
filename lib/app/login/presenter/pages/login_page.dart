import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/app/shared/utils/responsiveness.dart';
import 'package:prova/app/shared/widgets/body_widget.dart';
import 'package:prova/app/shared/widgets/primary_button_widget.dart';
import 'package:prova/app/shared/widgets/text_field_widget.dart';

import '../stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _store = Modular.get<LoginStore>();
  final _formKey = GlobalKey<FormState>();

  void _onPressLogin() {
    if (_formKey.currentState!.validate()) {
      _store.login().then((loggedIn) => loggedIn ? Modular.to.navigate('/home/') : null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Text(
                  'Usuário',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Observer(
              builder: (_) {
                return CustomTextFieldWidget(
                  controller: _store.userController,
                  prefixIcon: Icons.person,
                  errorText: _store.userError,
                  onChanged: (user) => _store.onChangeUser(user),
                  enabled: !_store.loading,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Text(
                  'Senha',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Observer(
              builder: (_) {
                return CustomTextFieldWidget(
                  prefixIcon: Icons.lock,
                  controller: _store.passwordController,
                  obscure: !_store.passwordVisible,
                  errorText: _store.passwordError,
                  onChanged: (value) => _store.onChangePassword(value),
                  enabled: !_store.loading,
                  suffixIcon: _store.passwordVisible ? Icons.visibility_off : Icons.visibility,
                  onTapSuffixIcon: _store.togglePasswordVisibility,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.w),
              child: Observer(
                builder: (_) {
                  return PrimaryButtonWidget(
                    loading: _store.loading,
                    label: 'Entrar',
                    onTap: _onPressLogin,
                    enabled: _store.userError == null && _store.passwordError == null && _store.buttonState,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
