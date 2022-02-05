import 'package:agence/commons/assets_app.dart';
import 'package:agence/commons/preferences.dart';
import 'package:agence/commons/theme/theme_manager.dart';
import 'package:agence/modules/common/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Artboard? _artboard;
  RiveAnimationController? _controller;
  bool? isDark;
  @override
  void initState() {
    super.initState();
    _loadRive();
  }

  Future<bool> _loadRive() async {
    final bytes = await rootBundle.load(AssetsApp.smilyRive);
    final file = RiveFile.import(bytes);
    isDark = await StorageHelper.getBool(StorageKeys.theme);
    setState(() {
      _artboard = file.mainArtboard;
      _artboard?.addController(
          _controller = SimpleAnimation(isDark == true ? 'Off' : 'On'));
      _controller?.isActive = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações - Tema'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        child: _artboard != null
            ? InkWell(
                onTap: () async {
                  await theme.toggleTheme(!isDark!);
                  _artboard?.addController(_controller =
                      SimpleAnimation(isDark == true ? 'On' : 'Off'));
                  _controller?.isActive = true;
                  isDark = !isDark!;
                  setState(() {});
                },
                child: Rive(artboard: _artboard!, fit: BoxFit.cover))
            : Container(),
      ),
    );
  }
}
