import 'package:agence/modules/authentication/controller/authentication_bloc.dart';

abstract class AuthenticationPageContract {
  void failed({String? text});
  void success();
}

class AuthenticationPresenterPage {
  final AuthenticationPageContract _contract;
  final AuthenticationBloc _bloc;
  AuthenticationPresenterPage(this._contract, this._bloc);
  login() async {
    final state = await _bloc.login();
    if (state is AuthenticationFailed) {
      return _contract.failed(text: state.failure.message);
    }
    _contract.success();
  }

  loginFacebook() async {
    final state = await _bloc.loginFacebook();
    if (state is AuthenticationFailed) {
      return _contract.failed(text: state.failure.message);
    }
    _contract.success();
  }

  loginGoogle() async {
    final state = await _bloc.loginGoogle();
    if (state is AuthenticationFailed) {
      return _contract.failed(text: state.failure.message);
    }
    _contract.success();
  }
}
