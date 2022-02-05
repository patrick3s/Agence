import 'dart:convert';

import 'package:agence/commons/preferences.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/datasource/authentication_datasource.dart';

import '../../domain/entities/user_entity.dart';
import '../dto/user_dto.dart';

class AuthenticationDatasourceImpl extends AuthenticationDatasource {
  @override
  Future<UserEntity> call(Map<String, dynamic> data) async {
    final user = UserEntity('Email', DateTime.now().toString());
    await StorageHelper.set(StorageKeys.user, jsonEncode(user.toMap()));
    return user;
  }

  @override
  Future<UserEntity> loginFacebook() async {
    final FacebookAuth _facebookAuth = FacebookAuth.instance;
    final LoginResult result =
        await _facebookAuth.login(permissions: ["email"]);
    if (result.status == LoginStatus.success) {
      final user = UserEntity('Facebook', DateTime.now().toString());
      await StorageHelper.set(StorageKeys.user, jsonEncode(user.toMap()));
      return user;
    }
    throw Failure(message: "Falha ao realizar login com facebook");
  }

  @override
  Future<UserEntity> loginGoogle() async {
    final _google = GoogleSignIn();
    final result = await _google.signIn();
    if (result == null) {
      throw Failure(message: 'Falha ao realizar login com o google');
    }
    final user = UserEntity('Google', DateTime.now().toString());
    await StorageHelper.set(StorageKeys.user, jsonEncode(user.toMap()));
    return user;
  }
}
