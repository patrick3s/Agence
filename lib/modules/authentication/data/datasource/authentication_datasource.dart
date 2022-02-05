import 'package:agence/modules/authentication/domain/entities/user_entity.dart';

abstract class AuthenticationDatasource {
  Future<UserEntity> call(Map<String, dynamic> data);
  Future<UserEntity> loginFacebook();
  Future<UserEntity> loginGoogle();
}
