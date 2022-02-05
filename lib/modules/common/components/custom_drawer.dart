import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/preferences.dart';
import 'package:agence/commons/routes_app.dart';
import 'package:agence/commons/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = theme.themeMode == ThemeMode.dark;
    return Drawer(
      backgroundColor: isDark == true ? Colors.black : Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .25,
              child: Image.asset(
                isDark == true ? AssetsApp.logoBlack : AssetsApp.logoWhite,
                fit: BoxFit.contain,
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            _row("Perfil", Icons.person, isDark == true,
                path: RoutesApp.profile),
            const Divider(
              color: Colors.grey,
            ),
            _row("Meus Produtos", Icons.add_box, isDark == true,
                path: RoutesApp.home),
            const Divider(
              color: Colors.grey,
            ),
            _row("Configuração", Icons.settings, isDark == true,
                path: RoutesApp.settings),
            const Divider(
              color: Colors.grey,
            ),
            _row("Sair", Icons.exit_to_app, isDark == true, onTap: () {
              StorageHelper.logout();
            })
          ],
        ),
      ),
    );
  }

  _row(String text, IconData icon, bool isDark,
      {Function()? onTap, String path = ""}) {
    final isSelect = Modular.to.path == path;
    return InkWell(
      onTap: onTap ??
          () {
            Modular.to.pushReplacementNamed(path);
          },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelect
                  ? Colors.brown
                  : isDark
                      ? Colors.white70
                      : Colors.black54,
              size: isSelect ? 32 : 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: isSelect
                      ? Colors.brown
                      : isDark
                          ? Colors.white70
                          : Colors.black54,
                  fontSize: isSelect ? 15 : 12,
                  fontWeight: isSelect ? FontWeight.bold : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
