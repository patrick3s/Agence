import 'package:agence/modules/authentication/controller/authentication_bloc.dart';
import 'package:agence/modules/authentication/data/datasource/authentication_datasource_impl.dart';
import 'package:agence/modules/authentication/data/repositories/authentication_repository.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authentication.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authentication_google.dart';
import 'package:agence/modules/authentication/domain/usecases/usecase_authenticaton_facebook.dart';
import 'package:agence/modules/authentication/presenter/authentication_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Controllers
        Bind.lazySingleton((i) => AuthenticationBloc(i(), i(), i())),
        // Datasources
        Bind.lazySingleton((i) => AuthenticationDatasourceImpl()),
        // Repositories
        Bind.lazySingleton((i) => AuthenticationRepositoryImpl(i())),
        // Usecases
        Bind.lazySingleton((i) => AuthenticationUsecaseImpl(i())),
        Bind.lazySingleton((i) => AuthenticationFacebookUsecaseImpl(i())),
        Bind.lazySingleton((i) => AuthenticationGoogleUsecaseImpl(i()))
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (ctx, args) => const AuthenticationPage())];
}
