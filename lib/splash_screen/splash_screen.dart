import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/preferences.dart';
import 'package:agence/commons/routes_app.dart';
import 'package:agence/commons/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, ThemeManager> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final isDark = await StorageHelper.getBool(StorageKeys.theme);
      controller.toggleTheme(isDark);
      final user = await StorageHelper.get(StorageKeys.user);
      Future.delayed(const Duration(seconds: 2)).then((value) {
        if (user != null) {
          Navigator.of(context).pushReplacementNamed(RoutesApp.home);
        } else {
          Navigator.of(context).pushReplacementNamed(RoutesApp.authentication);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        AssetsApp.splashscreen,
        height: size.height,
        width: size.width,
        fit: BoxFit.contain,
      ),
    );
  }
}
