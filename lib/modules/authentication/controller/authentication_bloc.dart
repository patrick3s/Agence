import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authentication.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authentication_google.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authenticaton_facebook.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

class AuthenticationBloc extends Disposable {
  final BehaviorSubject<AuthenticationState> _controller =
      BehaviorSubject.seeded(AuthenticationIdle());
  final AuthenticationUsecase _authenticationUsecase;
  final AuthenticationFacebookUsecase _authenticationFacebookUsecase;
  final AuthenticationGoogleUsecase _authenticationGoogleUsecase;
  AuthenticationBloc(this._authenticationUsecase,
      this._authenticationFacebookUsecase, this._authenticationGoogleUsecase);

  Map<String, dynamic> userData = {};

  Future<AuthenticationState> login() async {
    _controller.add(AuthenticationLoading());
    final result = await _authenticationUsecase(userData);
    final state = result.fold(
        (l) => AuthenticationFailed(l), (r) => AuthenticationSuccess());
    _controller.add(state);
    return state;
  }

  Future<AuthenticationState> loginFacebook() async {
    _controller.add(AuthenticationLoading());
    final result = await _authenticationFacebookUsecase();
    final state = result.fold(
        (l) => AuthenticationFailed(l), (r) => AuthenticationSuccess());
    _controller.add(state);
    return state;
  }

  Future<AuthenticationState> loginGoogle() async {
    _controller.add(AuthenticationLoading());
    final result = await _authenticationGoogleUsecase();
    final state = result.fold(
        (l) => AuthenticationFailed(l), (r) => AuthenticationSuccess());
    _controller.add(state);
    return state;
  }

  @override
  void dispose() {
    _controller.close();
  }
}

abstract class AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserEntity? user;
  AuthenticationSuccess({this.user});
}

class AuthenticationIdle extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {
  final Failure failure;
  AuthenticationFailed(this.failure);
}
