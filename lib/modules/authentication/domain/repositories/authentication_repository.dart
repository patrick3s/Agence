import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> data);
  Future<Either<Failure, UserEntity>> loginFacebook();
  Future<Either<Failure, UserEntity>> loginGoogle();
}
