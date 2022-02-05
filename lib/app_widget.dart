import 'package:agence/commons/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'commons/theme/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    theme.addListener(themeListener);
    super.initState();
  }

  @override
  dispose() {
    theme.removeListener(themeListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agence',
      darkTheme: darkTheme,
      themeMode: theme.themeMode,
      theme: lightTheme,
    ).modular();
  }
}
