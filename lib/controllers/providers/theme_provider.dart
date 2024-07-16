import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_persistent/models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isDark: false);

  ThemeProvider() {
    loadPrefs();
    log("1. Constructor===========");
  }

  void changeTheme() {
    themeModel.isDark = !themeModel.isDark;
    savePrefs();
    notifyListeners();
  }

  Future<void> loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeModel.isDark = prefs.getBool("isDark") ?? false;
    log("2. themeModel.isDark =========== ${themeModel.isDark}");
    notifyListeners();
  }

  Future<void> savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isDark", themeModel.isDark);

    log("3. themeModel.isDark =========== ${themeModel.isDark}");
  }
}
