
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme() {
    themeMode == ThemeMode.dark ? themeMode=ThemeMode.light : themeMode=ThemeMode.dark;
    notifyListeners();
  }
}

class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF02327D),
    backgroundColor: Color(0xFF02327D),
    indicatorColor: Color(0xFF02327D),
    primaryColor: Color(0xFF002359),
    iconTheme: IconThemeData(color: Colors.lightBlueAccent, opacity: 0.8),
    primaryColorDark: Colors.white, colorScheme: ColorScheme.dark().copyWith(secondary: Colors.blueAccent,primary: Color(0xFF02327D)),
  );
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      indicatorColor: Colors.green,
      primaryColor: Color(0xFFE3EEFF),
      focusColor: Colors.green,
      iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
      primaryColorDark: Color(0xFF002359), colorScheme: ColorScheme.light().copyWith(secondary: Color(0xFFE3EEFF),primary: Color(0xFFE3EEFF)));
}