import 'package:agence/commons/routes_app.dart';
import 'package:agence/commons/theme/theme_manager.dart';
import 'package:agence/modules/authentication/authentication_module.dart';
import 'package:agence/modules/home/home_module.dart';
import 'package:agence/modules/product/page_product.dart';
import 'package:agence/modules/profile/profile_page.dart';
import 'package:agence/modules/settings/settings_page.dart';
import 'package:agence/splash_screen/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [Bind((i) => ThemeManager())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(RoutesApp.splashscreen,
            child: (ctx, args) => const SplashScreen()),
        ModuleRoute(RoutesApp.authentication, module: AuthenticationModule()),
        ChildRoute(RoutesApp.profile,
            child: (ctx, args) => const ProfilePage()),
        ChildRoute(RoutesApp.settings,
            child: (ctx, args) => const SettingsPage()),
        ChildRoute(RoutesApp.product,
            child: (ctx, args) => PageProduct(
                  position: args.data['position'],
                  product: args.data['product'],
                )),
        ModuleRoute(RoutesApp.home, module: HomeModule())
      ];
}
