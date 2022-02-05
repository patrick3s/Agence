import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:agence/modules/common/domain/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationUsecase {
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> data);
}

class AuthenticationUsecaseImpl extends AuthenticationUsecase {
  final AuthenticationRepository _repository;
  AuthenticationUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> data) async {
    return await _repository(data);
  }
}
