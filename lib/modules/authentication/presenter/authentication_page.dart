import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/preferences.dart';
import 'package:agence/commons/routes_app.dart';
import 'package:agence/commons/snackbar/warning.dart';

import 'package:agence/modules/authentication/controller/authentication_bloc.dart';
import 'package:agence/modules/authentication/controller/presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState
    extends ModularState<AuthenticationPage, AuthenticationBloc>
    implements AuthenticationPageContract {
  late AuthenticationPresenterPage presenter;
  @override
  void initState() {
    super.initState();
    presenter = AuthenticationPresenterPage(this, bloc);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                FutureBuilder<bool>(
                    future: StorageHelper.getBool(StorageKeys.theme),
                    builder: (context, snap) {
                      if (!snap.hasData) return Container();
                      return Center(
                        child: Image.asset(snap.data == true
                            ? AssetsApp.logoBlack
                            : AssetsApp.logoWhite),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      _input("Email", icon: const Icon(Icons.email)),
                      const SizedBox(
                        height: 15,
                      ),
                      FormField<bool>(
                          initialValue: false,
                          builder: (state) {
                            return _input("Password",
                                icon: IconButton(
                                    onPressed: () {
                                      state.didChange(!state.value!);
                                    },
                                    icon: Icon(state.value == true
                                        ? Icons.lock_open
                                        : Icons.lock)),
                                obscure: state.value!);
                          }),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {},
                            child: const Text('Esqueci minha senha')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ElevatedButton.icon(
                            onPressed: presenter.login,
                            icon: const Icon(Icons.email),
                            label: const Text('Entrar com email')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  SignInButton(
                    Buttons.GoogleDark,
                    text: "Entrar com o Google",
                    onPressed: presenter.loginGoogle,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    text: "Entrar com o Facebook",
                    onPressed: presenter.loginFacebook,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void failed({String? text}) {
    if (text != null) warningSnackBar(text, context);
  }

  @override
  void success() {
    Modular.to.pushReplacementNamed(RoutesApp.home);
  }

  _input(String label,
      {Widget? icon, Function(String)? onChange, bool obscure = false}) {
    return TextFormField(
      onChanged: onChange,
      obscureText: obscure,
      decoration: InputDecoration(label: Text(label), suffixIcon: icon),
    );
  }
}
