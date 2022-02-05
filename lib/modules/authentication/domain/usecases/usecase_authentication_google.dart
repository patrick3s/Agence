import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationGoogleUsecase {
  Future<Either<Failure, UserEntity>> call();
}

class AuthenticationGoogleUsecaseImpl extends AuthenticationGoogleUsecase {
  final AuthenticationRepository _repository;
  AuthenticationGoogleUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await _repository.loginGoogle();
  }
}
