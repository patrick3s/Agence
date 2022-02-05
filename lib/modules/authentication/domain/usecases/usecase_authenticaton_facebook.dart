import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationFacebookUsecase {
  Future<Either<Failure, UserEntity>> call();
}

class AuthenticationFacebookUsecaseImpl extends AuthenticationFacebookUsecase {
  final AuthenticationRepository _repository;

  AuthenticationFacebookUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await _repository.loginFacebook();
  }
}
