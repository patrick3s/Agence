import 'dart:convert';

import 'package:agence/commons/routes_app.dart';
import 'package:agence/modules/authentication/data/dto/user_dto.dart';
import 'package:agence/modules/authentication/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const String user = "USER";
  static const String theme = "THEME";
}

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await _getInstance();
    return _prefs!.getString(key);
  }

  static Future<void> set(String key, dynamic value) async {
    await _getInstance();
    _prefs!.setString(key, value);
  }

  static Future<bool> getBool(String key) async {
    await _getInstance();
    return _prefs!.getBool(key) == true;
  }

  static Future<bool> setBool(String key, bool value) async {
    await _getInstance();
    return _prefs!.setBool(key, value);
  }

  static Future<void> remove(String key) async {
    await _getInstance();
    _prefs!.remove(key);
  }

  static Future<bool> userIsLogged() async {
    await _getInstance();
    String? user = _prefs!.getString(StorageKeys.user);

    if (user != null) {
      return true;
    }

    return false;
  }

  static Future<UserEntity?> fecthUser() async {
    await _getInstance();
    String? user = _prefs!.getString(StorageKeys.user);

    if (user != null) {
      return UserDTO.fromMap(jsonDecode(user));
    }

    return null;
  }

  static Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await _getInstance();
    await _prefs!.remove(StorageKeys.user);
    Modular.to.popUntil(ModalRoute.withName(RoutesApp.splashscreen));
    Modular.to.pushReplacementNamed(RoutesApp.authentication);
  }
}
