import 'package:agence/modules/authentication/data/datasource/authentication_datasource.dart';
import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:agence/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:agence/modules/common/domain/error/failure.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDatasource _datasource;
  AuthenticationRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, UserEntity>> call(Map<String, dynamic> data) async {
    try {
      return Right(await _datasource(data));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginFacebook() async {
    try {
      return Right(await _datasource.loginFacebook());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginGoogle() async {
    try {
      return Right(await _datasource.loginGoogle());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
