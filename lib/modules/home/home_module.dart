import 'package:agence/modules/home/presenter/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (ctx, args) => const HomePage())];
}
